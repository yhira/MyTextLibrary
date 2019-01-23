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
  Fader ユニットは Windows2000 で使用できる半透明Window機能を利用して
  フェード効果を行うためのルーチン集です。
  動的にAPIをロードするので使用できない場合でプログラムは実行可能です。

  使い方:
  SetLayeredWindow で処理を行いたい Window に WS_EX_LAYERED をセットします。
  フェードインを行いたい場合、SetLayeredWindowAlphaBlend で0をセットし見えなくします。
  Windowをお好きな方法で表示します。表示してもWindowは見えません。
  FadeinEffect でWindowをフェードインさせます。

  SetFadeEffectTerminateProc を使えばフェード終了通知を受け取る事ができます。
  CancelFadeEffect を呼び出せばフェード中の該当するWindowがあった場合処理を中断します。
}

type
  TFETerminateProc = procedure (wnd: THandle; userData: Pointer); stdcall;

{
  WindowにWS_EX_LAYEREDの設定を行う

  wnd
    Windowハンドル
  Layered
    True  WS_EX_LAYERED を設定する
    False WS_EX_LAYERED を解除する
}
procedure SetLayeredWindow(wnd: THandle; Layered: Boolean);

{
  Windowにアルファプレンド値の設定を行う

  wnd
    Windowハンドル
  Alpha
    アルファプレンド値 0:透明 255:不透明
    詳しくは SetLayeredWindowAttributes などを参照
}
procedure SetLayeredWindowAlphaBlend(wnd: THandle; Alpha: Byte);

{
  任意のフェードエフェクトを行う

  wnd
    Windowハンドル
  StartAlpha
    初期アルファプレンド値
  EndAlpha
    最終アルファプレンド値
}
procedure FadeEffect(wnd: THandle; StartAlpha, EndAlpha: Byte);

{
  フェードインエフェクトを行う 0->255

  wnd
    Windowハンドル
}
procedure FadeinEffect(wnd: THandle);

{
  フェードアウトエフェクトを行う 255->0

  wnd
    Windowハンドル
}
procedure FadeoutEffect(wnd: THandle);

{
  処理中のフェードエフェクトをキャンセルする
  終了通知は発生しない。

  wnd
    Windowハンドル
}
procedure CancelFadeEffect(wnd: THandle);

{
  終了通知手続きを登録する
  フェード効果の処理はプライマリスレッドのメッセージループで行われるため
  FadeEffect を呼び出したメッセージループ内で SetFadeEffectTerminateProc を
  呼び出すのが望ましい。

  wnd
    Windowハンドル
  Proc
    通知手続き
  userData
    通知手続きのuserDataに渡されるポインタ
}
procedure SetFadeEffectTerminateProc(wnd: THandle; Proc: TFETerminateProc; userData: Pointer);

{
  フェード効果が使えるかどうか
  Windows2000 ならたぶん使える

  戻り値
    True  使える
    False 使えない
}
function EnabledFadeEffect: Boolean;

{
  フェード終了後に WS_EX_LAYERED を取りたい場合便利な通知手続き
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
    wnd: THandle;      //エフェクト対象Window
    StartAlpha: Byte;  //初期アルファブレンド値
    EndAlpha:   Byte;  //最終アルファブレンド値
    StartTime: DWORD;  //エフェクト開始時間
    TerminateProc: TFETerminateProc; //エフェクト終了通知
    userData: Pointer; //ユーザーデータ
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

        //メッセージを処理
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
 