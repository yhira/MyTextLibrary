{****************************************

  TColorPane

  Copyright(c) Hayato Sasaki 1995-2000

  E-Mail: QZG01115@nifty.ne.jp

  URL: http://homepage1.nifty.com/wizman/

*****************************************}

unit CLPane;

{$D-$L-$Y-}

interface

uses
  Windows, Messages, Classes, Controls, Graphics, Forms, Menus, Fader;

type
  {
    TColorPane は色選択のためコントロールです。
    ポップアップWindowに色サンプルを表示するためにスペースをあまり取りません。

    Windows2000でフェード効果が有効な場合、フェード表示を行います。
  }

  TColorPane = class(TCustomControl)
  private
    FAlignment: TPopupAlignment;
    FFloatPanel: TWinControl;
    FOnChange: TNotifyEvent;
    FOnClickOtherBtn: TNotifyEvent;
    procedure CMColorChanged(var Message: TMessage); message CM_COLORCHANGED;
    procedure CMEnabledChanged(var Message: TMessage); message CM_ENABLEDCHANGED;
    procedure WMCaptureChanged(var Message: TMessage); message WM_CAPTURECHANGED;
    procedure WMGetDlgCode(var Message: TWMGetDlgCode); message WM_GETDLGCODE;
    procedure WMKillFocus(var Message: TWMKillFocus); message WM_KILLFOCUS;
    procedure WMSetFocus(var Message: TWMSetFocus); message WM_SETFOCUS;
  protected
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Popup(PressBtn: Boolean);
  published
    property Align;
    property Alignment: TPopupAlignment read FAlignment write FAlignment default paCenter;
    property Anchors;
    property Color;
    property TabOrder;
    property TabStop default True;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnClickOtherBtn: TNotifyEvent read FOnClickOtherBtn write FOnClickOtherBtn;
    property OnKeyDown;
    property OnKeyPress;
    property OnKeyUp;
    property OnMouseDown;
    property OnMouseMove;
    property OnMouseUp;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('CoolCtl', [TColorPane]);
end;

const
  BUTTONWIDTH = 18;
  WINBORDER   = 5;

  COLORTABLE: array[0..39] of TColor = (
    $00000000, $00003399, $00003333, $00003300, $00663300, $00800000, $00993333, $00333333,
    $00000080, $000066FF, $00008080, $00008000, $00808000, $00FF0000, $00996666, $00808080,
    $000000FF, $000099FF, $0000CC99, $00669933, $00CCCC33, $00FF6633, $00800080, $00999999,
    $00FF00FF, $0000CCFF, $0000FFFF, $0000FF00, $00FFFF00, $00FFCC00, $00663399, $00C0C0C0,
    $00CC99FF, $0099CCFF, $0099FFFF, $00CCFFCC, $00FFFFCC, $00FFCC99, $00FF99CC, $00FFFFFF);

  //from WinUser.h
  SPI_GETMENUFADE = $1012;

type
  TColorPaneFloatWindow = class(TCustomControl)
  private
    FFirstAction: Boolean;
    FBtnX: Integer;
    FBtnY: Integer;
    FPress: Boolean;
    FFramedBtn: Boolean;
    FFading: Boolean;
    procedure DrawBtnFrame;
    procedure EraseBtnFrame(BX, BY: Integer);
    procedure UpdateBtn(X, Y: Integer);
    procedure MoveBtn(Key: Integer);
    procedure WMMouseActivate(var Message: TWMMouseActivate); message WM_MOUSEACTIVATE;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure Paint; override;
  public
    constructor Create(AOwner: TComponent); override;
    procedure Popup(X, Y: Integer);
  end;

procedure PaintColorPaneFloatWindow(wnd: THandle; userData: Pointer); stdcall;
begin
  TColorPaneFloatWindow(userData).FFading := False;
end;

constructor TColorPaneFloatWindow.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [];
  Color := clBtnFace;
end;

procedure TColorPaneFloatWindow.DrawBtnFrame;
var
  X, Y: Integer;
  DRect: TRect;
begin
  with Canvas do
  begin
    if FBtnY < 5 then
      begin
        X := WINBORDER + 2 + BUTTONWIDTH * FBtnX;
        Y := WINBORDER + 2 + BUTTONWIDTH * FBtnY;
        DRect := Rect(X, Y, X + BUTTONWIDTH, Y + BUTTONWIDTH);
      end
    else
      begin
        X := WINBORDER + 2;
        Y := WINBORDER + 2 + BUTTONWIDTH * 5;
        if FBtnX < 4 then
          DRect := Rect(X, Y, X + BUTTONWIDTH * 4, Y + BUTTONWIDTH)
        else
          DRect := Rect(X + BUTTONWIDTH * 4, Y, X + BUTTONWIDTH * 8, Y + BUTTONWIDTH);
      end;

    if FPress and (not FFading) then
      DrawEdge(Handle, DRect, BDR_SUNKENOUTER, BF_RECT)
    else
      DrawEdge(Handle, DRect, BDR_RAISEDINNER, BF_RECT);
  end;
end;

procedure TColorPaneFloatWindow.EraseBtnFrame(BX, BY: Integer);
var
  X, Y: Integer;
  DRect: TRect;
begin
  with Canvas do
  begin
    if BY < 5 then
      begin
        X := WINBORDER + 2 + BUTTONWIDTH * BX;
        Y := WINBORDER + 2 + BUTTONWIDTH * BY;
        DRect := Rect(X, Y, X + BUTTONWIDTH, Y + BUTTONWIDTH);
      end
    else
      begin
        X := WINBORDER + 2;
        Y := WINBORDER + 2 + BUTTONWIDTH * 5;
        if BX < 4 then
          DRect := Rect(X, Y, X + BUTTONWIDTH * 4, Y + BUTTONWIDTH)
        else
          DRect := Rect(X + BUTTONWIDTH * 4, Y, X + BUTTONWIDTH * 8, Y + BUTTONWIDTH);
      end;
    Brush.Color := clBtnFace;
    FrameRect(DRect);
  end;
end;

procedure TColorPaneFloatWindow.UpdateBtn(X, Y: Integer);
var
  BX, BY: Integer;
begin
  Dec(X, WINBORDER + 2);
  Dec(Y, WINBORDER + 2);

  if (X >= 0) and (X < BUTTONWIDTH * 8) and (Y >= 0) and (Y < BUTTONWIDTH * 6) then
    begin
      BX := X div BUTTONWIDTH;
      BY := Y div BUTTONWIDTH;

      if BY < 5 then
        begin
          if FFramedBtn then
            begin
              if (FBtnX <> BX) or (FBtnY <> BY) then
                begin
                  EraseBtnFrame(FBtnX, FBtnY);
                  FBtnX := BX;
                  FBtnY := BY;
                  DrawBtnFrame;
                end;
              Exit;
            end;
        end
      else
        if FFramedBtn then
          begin
            if (FBtnY <> BY) or ((FBtnX - 4) * (BX - 4) <= 0) then
              begin
                EraseBtnFrame(FBtnX, FBtnY);
                FBtnX := BX;
                FBtnY := BY;
                DrawBtnFrame;
              end;
            Exit;
          end;

      FFramedBtn := True;
      FBtnX := BX;
      FBtnY := BY;
      DrawBtnFrame;
    end
  else if FFramedBtn then
    begin
      EraseBtnFrame(FBtnX, FBtnY);
      FFramedBtn := False;
    end;
end;

procedure TColorPaneFloatWindow.MoveBtn(Key: Integer);
var
  BX, BY: Integer;
begin
  BX := FBtnX;
  BY := FBtnY;

  case Key of
    VK_LEFT:
      begin
        Dec(FBtnX);
        if FBtnX < 0 then
          FBtnX := 7;
      end;
    VK_UP:
      begin
        Dec(FBtnY);
        if FBtnY < 0 then
          FBtnY := 5;
      end;
    VK_RIGHT:
      begin
        Inc(FBtnX);
        if FBtnX >= 8 then
          FBtnX := 0;
      end;
    VK_DOWN:
      begin
        Inc(FBtnY);
        if FBtnY >= 6 then
          FBtnY := 0;
      end;
  end;


  if FBtnY < 5 then
    begin
      if FFramedBtn then
        begin
          if (FBtnX <> BX) or (FBtnY <> BY) then
            begin
              EraseBtnFrame(BX, BY);
              DrawBtnFrame;
            end;
          Exit;
        end;
    end
  else
    if FFramedBtn then
      begin
        if FBtnY <> BY then
          begin
            EraseBtnFrame(BX, BY);
            DrawBtnFrame;
          end;
        Exit;
      end;

  FFramedBtn := True;
  DrawBtnFrame;
end;

procedure TColorPaneFloatWindow.WMMouseActivate(var Message: TWMMouseActivate);
begin
  Message.Result := MA_NOACTIVATE;
end;

procedure TColorPaneFloatWindow.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := WS_POPUP;
  Params.WndParent := TWinControl(Owner).Handle;
end;

procedure TColorPaneFloatWindow.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  P: TPoint;
  WH: THandle;
  tmp: DWORD;
begin
  inherited MouseDown(Button, Shift, X, Y);
  FPress := True;
  if PtInRect(ClientRect, Point(X, Y)) then
    begin
      FFramedBtn := False;
      UpdateBtn(X, Y);
    end
  else
    begin
      P := ClientToScreen(Point(X, Y));

      ReleaseCapture;

      Application.ProcessMessages;

      WH := WindowFromPoint(P);

      if GetCurrentThreadId = GetWindowThreadProcessId(WH, @tmp) then
        mouse_event(MOUSEEVENTF_LEFTDOWN, P.x, P.y, 0, 0);
    end;
end;

procedure TColorPaneFloatWindow.MouseMove(Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseMove(Shift, X, Y);
  if not FFading then //フェード中は更新しない
    UpdateBtn(X, Y);
end;

procedure TColorPaneFloatWindow.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited MouseUp(Button, Shift, X, Y);

  FPress := False;

  if PtInRect(ClientRect, Point(X, Y)) then
    begin
      with TColorPane(Owner) do
      if FFramedBtn then
        if (FBtnX >= 0) and (FBtnX < 8) then
          if FBtnY = 5 then
            begin
              if (FBtnX > 3) then
                begin
                  if Assigned(FOnClickOtherBtn) then
                   FOnClickOtherBtn(Self.Owner);
                end
              else
                Color := clNone;
            end
          else if (FBtnY >= 0) and (FBtnY < 5) then
            Color := COLORTABLE[FBtnY * 8 + FBtnX];

      ReleaseCapture;
    end
  else
    if not FFirstAction then
      ReleaseCapture
    else
      FFirstAction := False;
end;

procedure TColorPaneFloatWindow.Paint;
const
  BTNTEXT = 'Other Color...';
  BTNNONE = 'None';
var
  DRect, BRect: TRect;
  X, Y, i, j, Index: Integer;
begin
  with Canvas do
  begin
    DRect := ClientRect;
    DrawEdge(Handle, DRect, EDGE_RAISED, BF_RECT	);

    InflateRect(DRect, -2, -2);
    Brush.Color := clBtnFace;
    FillRect(DRect);


    Index := 0;
    Y := DRect.Top + WINBORDER;

    for i := 0 to 4 do
      begin

        X := DRect.Left + WINBORDER;

        for j := 0 to 7 do
          begin
            BRect := Rect(X, Y, X + BUTTONWIDTH, Y + BUTTONWIDTH);
            InflateRect(BRect, -3, -3);
            Brush.Color := clBtnShadow;
            FrameRect(BRect);

            InflateRect(BRect, -1, -1);

            Brush.Color := COLORTABLE[Index];
            Inc(Index);

            FillRect(BRect);

            Inc(X, BUTTONWIDTH);
          end;

        Inc(Y, BUTTONWIDTH);
      end;

    Brush.Style := bsClear;
    X := (DRect.Left + DRect.Right) div 2;
    TextOut((X - TextWidth(BTNNONE)) div 2, Y + (BUTTONWIDTH - TextHeight(BTNNONE)) div 2, BTNNONE);
    TextOut(X + (X - TextWidth(BTNTEXT)) div 2, Y + (BUTTONWIDTH - TextHeight(BTNTEXT)) div 2, BTNTEXT);
  end;

  DrawBtnFrame;
end;

procedure TColorPaneFloatWindow.Popup(X, Y: Integer);
var
  CX, CY: Integer;
  Fade: Boolean;
begin
  CX := WINBORDER + BUTTONWIDTH * 8 + WINBORDER + 4;
  CY := WINBORDER + BUTTONWIDTH * 5 + WINBORDER + 4 + BUTTONWIDTH;

  FFirstAction := True;

  with TColorPane(Owner) do
  case FAlignment of
    paLeft:   Dec(X, CX);
    paCenter: Inc(Y, Height);
    else      Inc(X, Width);
  end;

  Fade := False;
  FFading := False;

  SystemParametersInfo(SPI_GETMENUFADE, 0, @Fade, 0);

  if Fade and EnabledFadeEffect then
    begin
      FFading := True;

      SetLayeredWindow(Handle, True);
      SetLayeredWindowAlphaBlend(Handle, 0);

      SetWindowPos(Handle, HWND_TOP, X, Y, CX, CY, SWP_NOACTIVATE or SWP_SHOWWINDOW);

      FadeinEffect(Handle);

      SetFadeEffectTerminateProc(Handle, PaintColorPaneFloatWindow, Self);
    end
  else
    begin
      SetWindowPos(Handle, HWND_TOP, X, Y, CX, CY, SWP_NOACTIVATE or SWP_SHOWWINDOW);

      if FPress then
        begin
          FPress := False;
          Application.ProcessMessages;
          FPress := True;
        end;
    end;

  FFramedBtn := True;
end;

//TColorPane

constructor TColorPane.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  ControlStyle := [csOpaque, csClickEvents];
  TabStop := True;
  ParentColor := False;
  Color := $00FFFFFF;
  FAlignment := paCenter;
  Width := 16;
  Height := 16;
end;

destructor TColorPane.Destroy;
begin
  if FFloatPanel <> nil then
    begin
      FFloatPanel.Free;
      FFloatPanel := nil;
    end;
  inherited Destroy;
end;

procedure TColorPane.CMColorChanged(var Message: TMessage);
begin
  inherited;
  if Assigned(FOnChange) then
    FOnChange(Self);
end;

procedure TColorPane.CMEnabledChanged(var Message: TMessage);
begin
  inherited;
  Invalidate;
end;

procedure TColorPane.WMCaptureChanged(var Message: TMessage);
begin
  inherited;
  if FFloatPanel <> nil then
    begin
      CancelFadeEffect(FFloatPanel.Handle);
      FFloatPanel.Free;
      FFloatPanel := nil;
    end;
end;

procedure TColorPane.WMGetDlgCode(var Message: TWMGetDlgCode);
begin
  inherited;
  if FFloatPanel <> nil then
    Message.Result := DLGC_WANTALLKEYS or DLGC_WANTARROWS
  else
    Message.Result := DLGC_WANTALLKEYS;
end;

procedure TColorPane.WMKillFocus(var Message: TWMKillFocus);
begin
  inherited;
  if FFloatPanel <> nil then
    ReleaseCapture;
  Invalidate;
end;

procedure TColorPane.WMSetFocus(var Message: TWMSetFocus);
begin
  inherited;
  Invalidate;
end;

procedure TColorPane.KeyDown(var Key: Word; Shift: TShiftState);
begin
  inherited KeyDown(Key, Shift);

  case Key of
    VK_ESCAPE:
      if FFloatPanel <> nil then
        ReleaseCapture;
    VK_SPACE, VK_RETURN:
      Popup(False);
    VK_LEFT..VK_DOWN:
      if FFloatPanel <> nil then
        TColorPaneFloatWindow(FFloatPanel).MoveBtn(Key);
  end;
end;

procedure TColorPane.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  P: TPoint;
begin
  if FFloatPanel <> nil then
    begin
      if PtInRect(ClientRect, Point(X, Y)) then
        ReleaseCapture
      else
        begin
          P := FFloatPanel.ScreenToClient(ClientToScreen(Point(X, Y)));
          TColorPaneFloatWindow(FFloatPanel).MouseDown(Button, Shift, P.x, P.y);
        end;
    end
  else
    begin
      inherited MouseDown(Button, Shift, X, Y);
      SetFocus;
      Popup(True);
    end;
end;

procedure TColorPane.MouseMove(Shift: TShiftState; X, Y: Integer);
var
  P: TPoint;
begin
  if FFloatPanel <> nil then
    begin
      P := FFloatPanel.ScreenToClient(ClientToScreen(Point(X, Y)));
      TColorPaneFloatWindow(FFloatPanel).MouseMove(Shift, P.x, P.y);
    end
  else
    inherited MouseMove(Shift, X, Y);
end;

procedure TColorPane.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  P: TPoint;
begin
  if FFloatPanel <> nil then
    begin
      P := FFloatPanel.ScreenToClient(ClientToScreen(Point(X, Y)));
      TColorPaneFloatWindow(FFloatPanel).MouseUp(Button, Shift, P.x, P.y);
    end
  else
    inherited MouseUp(Button, Shift, X, Y);
end;

procedure TColorPane.Paint;
var
  DRect: TRect;
begin
  with Canvas do
  begin
    DRect := ClientRect;

    if Focused then
      begin
        Brush.Color := cl3DDkShadow;
        FrameRect(DRect);
        InflateRect(DRect, -1, -1);
      end;
      
    Pen.Color := clBtnShadow;
    MoveTo(DRect.Right - 1, DRect.Top);
    LineTo(DRect.Left, DRect.Top);
    LineTo(DRect.Left, DRect.Bottom);

    Pen.Color := clBtnHighlight;
    MoveTo(DRect.Right - 1, DRect.Top + 1);
    LineTo(DRect.Right - 1, DRect.Bottom - 1);
    LineTo(DRect.Left, DRect.Bottom - 1);

    InflateRect(DRect, -1, -1);

    if Enabled then
      Brush.Color := Color
    else
      Brush.Color := clBtnFace;
    FillRect(DRect);
  end;
end;

procedure TColorPane.Popup(PressBtn: Boolean);
var
  P: TPoint;
  i: Integer;
begin
  if FFloatPanel <> nil then
    begin
      with TColorPaneFloatWindow(FFloatPanel) do
      if FFramedBtn then
        if (FBtnX >= 0) and (FBtnX < 8) then
          if (FBtnY = 5) then
            begin
              if (FBtnX > 3) then
                begin
                  if Assigned(FOnClickOtherBtn) then
                   FOnClickOtherBtn(Self);
                end
              else
                Self.Color := clNone;
            end
          else if (FBtnY >= 0) and (FBtnY < 5) then
            Self.Color := COLORTABLE[FBtnY * 8 + FBtnX];

      ReleaseCapture;
    end
  else
    begin
      SetCapture(Handle);

      P := ClientToScreen(Point(0, 0));

      FFloatPanel := TColorPaneFloatWindow.Create(Self);

      with TColorPaneFloatWindow(FFloatPanel) do
      begin
        FPress := PressBtn;

        FBtnY := 5;

        for i := 0 to 79 do
          if Self.Color = COLORTABLE[i] then
            begin
              FBtnY := i div 8;
              FBtnX := i - FBtnY * 8;
              Break;
            end;

        Popup(P.x, P.y);
      end;
    end;
end;

end.
