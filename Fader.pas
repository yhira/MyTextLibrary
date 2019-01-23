{****************************************

  Fade Effect Routine Unit

  Copyright(c) Hayato Sasaki 1995-2000

  E-Mail: QZG01115@nifty.ne.jp

  URL: http://homepage1.nifty.com/wizman/

*****************************************}

unit Fader;

{$D-$L-$Y-}

interface

uses
  Windows, Messages, Classes;

{
  Fader ���j�b�g�� Windows2000 �Ŏg�p�ł��锼����Window�@�\�𗘗p����
  �t�F�[�h���ʂ��s�����߂̃��[�`���W�ł��B
  ���I��API�����[�h����̂Ŏg�p�ł��Ȃ��ꍇ�Ńv���O�����͎��s�\�ł��B

  �g����:
  SetLayeredWindow �ŏ������s������ Window �� WS_EX_LAYERED ���Z�b�g���܂��B
  �t�F�[�h�C�����s�������ꍇ�ASetLayeredWindowAlphaBlend ��0���Z�b�g�������Ȃ����܂��B
  Window�����D���ȕ��@�ŕ\�����܂��B�\�����Ă�Window�͌����܂���B
  FadeinEffect ��Window���t�F�[�h�C�������܂��B

  SetFadeEffectTerminateProc ���g���΃t�F�[�h�I���ʒm���󂯎�鎖���ł��܂��B
  CancelFadeEffect ���Ăяo���΃t�F�[�h���̊Y������Window���������ꍇ�����𒆒f���܂��B
}

type
  TFETerminateProc = procedure (wnd: THandle; userData: Pointer); stdcall;

{
  Window��WS_EX_LAYERED�̐ݒ���s��

  wnd
    Window�n���h��
  Layered
    True  WS_EX_LAYERED ��ݒ肷��
    False WS_EX_LAYERED ����������
}
procedure SetLayeredWindow(wnd: THandle; Layered: Boolean);

{
  Window�ɃA���t�@�v�����h�l�̐ݒ���s��

  wnd
    Window�n���h��
  Alpha
    �A���t�@�v�����h�l 0:���� 255:�s����
    �ڂ����� SetLayeredWindowAttributes �Ȃǂ��Q��
}
procedure SetLayeredWindowAlphaBlend(wnd: THandle; Alpha: Byte);

{
  �C�ӂ̃t�F�[�h�G�t�F�N�g���s��

  wnd
    Window�n���h��
  StartAlpha
    �����A���t�@�v�����h�l
  EndAlpha
    �ŏI�A���t�@�v�����h�l
}
procedure FadeEffect(wnd: THandle; StartAlpha, EndAlpha: Byte);

{
  �t�F�[�h�C���G�t�F�N�g���s�� 0->255

  wnd
    Window�n���h��
}
procedure FadeinEffect(wnd: THandle);

{
  �t�F�[�h�A�E�g�G�t�F�N�g���s�� 255->0

  wnd
    Window�n���h��
}
procedure FadeoutEffect(wnd: THandle);

{
  �������̃t�F�[�h�G�t�F�N�g���L�����Z������
  �I���ʒm�͔������Ȃ��B

  wnd
    Window�n���h��
}
procedure CancelFadeEffect(wnd: THandle);

{
  �I���ʒm�葱����o�^����
  �t�F�[�h���ʂ̏����̓v���C�}���X���b�h�̃��b�Z�[�W���[�v�ōs���邽��
  FadeEffect ���Ăяo�������b�Z�[�W���[�v���� SetFadeEffectTerminateProc ��
  �Ăяo���̂��]�܂����B

  wnd
    Window�n���h��
  Proc
    �ʒm�葱��
  userData
    �ʒm�葱����userData�ɓn�����|�C���^
}
procedure SetFadeEffectTerminateProc(wnd: THandle; Proc: TFETerminateProc; userData: Pointer);

{
  �t�F�[�h���ʂ��g���邩�ǂ���
  Windows2000 �Ȃ炽�Ԃ�g����

  �߂�l
    True  �g����
    False �g���Ȃ�
}
function EnabledFadeEffect: Boolean;

{
  �t�F�[�h�I����� WS_EX_LAYERED ����肽���ꍇ�֗��Ȓʒm�葱��
}
procedure DisableLayeredWindow(wnd: THandle; userData: Pointer); stdcall;

implementation

procedure ResetDelayTime; forward;

const
  //from WinUser.h
  WS_EX_LAYERED = $00080000;
  LWA_ALPHA = $00000002;
  SPI_GETMENUSHOWDELAY = 106;

  WM_EFFECT = WM_USER + 100;

type
  TSetLayeredWindowAttributes = function (hwnd: HWND; crKey: COLORREF; bAlpha: BYTE; dwFlags: DWORD): BOOL; stdcall;

  TAnimateWindow = function (hwnd: HWND; dwTime: DWORD; dwFlags: DWORD): BOOL; stdcall;

  TEffectMode = (fmFadein, fmFadeout);

  PEffectItem = ^TEffectItem;
  TEffectItem = record
    wnd: THandle;      //�G�t�F�N�g�Ώ�Window
    StartAlpha: Byte;  //�����A���t�@�u�����h�l
    EndAlpha:   Byte;  //�ŏI�A���t�@�u�����h�l
    StartTime: DWORD;  //�G�t�F�N�g�J�n����
    TerminateProc: TFETerminateProc; //�G�t�F�N�g�I���ʒm
    userData: Pointer; //���[�U�[�f�[�^
  end;

var
  SetLayeredWindowAttributes: TSetLayeredWindowAttributes = nil;
  Delay: DWORD = 0;
  NotifyWindow: THandle = 0;
  EffectList: TList = nil;

procedure DisableLayeredWindow(wnd: THandle; userData: Pointer);
begin
  SetLayeredWindow(wnd, False);
end;

function WndProc(hWnd: HWND; uMsg: UINT; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  i: Integer;
  Item: PEffectItem;
  CurTime, eTime: DWORD;
  CurAlpha: Byte;

  Msg: TMsg;
begin
  case uMsg of
    WM_SETTINGCHANGE:
      ResetDelayTime;
    WM_EFFECT:
      begin
        CurTime := GetTickCount;

        i := 0;
        with EffectList do
        while i < Count do
        begin
          Item := List[i];

          eTime := CurTime - Item.StartTime;
          if eTime > Delay then
            eTime := Delay;

          if Delay > 0 then
            CurAlpha := DWORD(Item.StartAlpha) + eTime * DWORD(Item.EndAlpha - Item.StartAlpha) div Delay
          else
            CurAlpha := Item.EndAlpha;

          SetLayeredWindowAttributes(Item.wnd, 0, CurAlpha, LWA_ALPHA);

          if eTime = Delay then
            begin
              if @Item.TerminateProc <> nil then
                Item.TerminateProc(Item.wnd, Item.userData);

              Dispose(Item);
              Delete(i);
            end
          else
            Inc(i);
        end;

        //���b�Z�[�W������
        while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do
        if Msg.Message <> WM_QUIT then
          begin
            TranslateMessage(Msg);
            DispatchMessage(Msg);
          end;

        if EffectList.count > 0 then
          PostMessage(NotifyWindow, WM_EFFECT, 0, 0);

        Result := 0;
        Exit;
      end;
  end;
  Result := DefWindowProc(hWnd, uMsg, wParam, lParam);
end;

procedure MakeWindow;
const
  ClassName = 'FadeEffectNotifyWindow';
var
  WindowClass: TWndClass;
begin
  FillChar(WindowClass, SizeOf(TWndClass), 0);
  with WindowClass do
  begin
    lpfnWndProc := @WndProc;
    lpszClassName := ClassName;
  end;
  WindowClass.hInstance := hInstance;
  Windows.RegisterClass(WindowClass);
  NotifyWindow := CreateWindow(ClassName, nil, 0, 0, 0, 0, 0, 0, 0, hInstance, nil);
end;

procedure SetLayeredWindow(wnd: THandle; Layered: Boolean);
var
  dw: DWORD;
begin
  dw := GetWindowLong(wnd, GWL_EXSTYLE);
  if Layered then
    dw := dw or WS_EX_LAYERED
  else
    dw := dw and (not DWORD(WS_EX_LAYERED));
  SetWindowLong(wnd, GWL_EXSTYLE, dw);
end;

procedure SetLayeredWindowAlphaBlend(wnd: THandle; Alpha: Byte);
begin
  if Assigned(SetLayeredWindowAttributes) then
    SetLayeredWindowAttributes(wnd, 0, Alpha, LWA_ALPHA);
end;

function FindEffect(wnd: THandle): PEffectItem;
var
  i: Integer;
begin
  with EffectList do
  for i := 0 to Count - 1 do
    if PEffectItem(List[i]).wnd = wnd then
      begin
        Result := List[i];
        Exit;
      end;
  Result := nil;
end;

procedure FadeEffect(wnd: THandle; StartAlpha, EndAlpha: Byte);
var
  NewItem: PEffectItem;
begin
  if not Assigned(SetLayeredWindowAttributes) then
    Exit;

  NewItem := FindEffect(wnd);

  if NewItem <> nil then
    begin
      NewItem.StartAlpha := StartAlpha;
      NewItem.EndAlpha   := EndAlpha;
    end
  else
    begin
      New(NewItem);

      NewItem.wnd           := wnd;
      NewItem.StartAlpha    := StartAlpha;
      NewItem.EndAlpha      := EndAlpha;
      NewItem.StartTime     := GetTickCount;
      NewItem.TerminateProc := nil;
      NewItem.userData      := nil;

      EffectList.Add(NewItem);

      if EffectList.Count = 1 then
        PostMessage(NotifyWindow, WM_EFFECT, 0, 0);
    end;
end;

procedure FadeinEffect(wnd: THandle);
begin
  FadeEffect(wnd, 0, 255);
end;

procedure FadeoutEffect(wnd: THandle);
begin
  FadeEffect(wnd, 255, 0);
end;

procedure CancelFadeEffect(wnd: THandle);
var
  Item: PEffectItem;
begin
  if not Assigned(SetLayeredWindowAttributes) then
    Exit;

  Item := FindEffect(wnd);
  if Item <> nil then
    begin
      EffectList.Delete(EffectList.IndexOf(Item));
      Dispose(Item);
    end;
end;

procedure SetFadeEffectTerminateProc(wnd: THandle; Proc: TFETerminateProc; userData: Pointer);
var
  Item: PEffectItem;
begin
  if not Assigned(SetLayeredWindowAttributes) then
    Exit;

  Item := FindEffect(wnd);
  if Item <> nil then
    begin
      Item.TerminateProc := Proc;
      Item.userData := userData;
    end;
end;

function EnabledFadeEffect: Boolean;
begin
  Result := Assigned(SetLayeredWindowAttributes);
end;

procedure ResetDelayTime;
begin
  if not SystemParametersInfo(SPI_GETMENUSHOWDELAY, 0, @Delay, 0) then
    Delay := 400;
end;

procedure InitWin2K;
var
  user32DLL: THandle;
begin
  user32DLL := GetModuleHandle(user32);

  if user32DLL <> 0 then
    begin
      SetLayeredWindowAttributes := GetProcAddress(user32DLL, 'SetLayeredWindowAttributes');
      EffectList := TList.Create;
      MakeWindow;
    end;
end;

procedure FreeList;
var
  i: Integer;
begin
  if EffectList = nil then
    Exit;
  with EffectList do
  for i := 0 to Count - 1 do
    Dispose(PEffectItem(List[i]));
  EffectList.Free;
end;

initialization
  InitWin2K;
  ResetDelayTime;
finalization
  DestroyWindow(NotifyWindow);
  FreeList;
end.
 