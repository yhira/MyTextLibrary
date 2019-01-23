//-------------------------------------------------
// Delphi2.0J Object Repository Form
// 透明なスプラッシュウィンドウ
// Version 1.00(^^;)
// Copyright (c)1997 ｆｕｍｉｋａ
// e-mail : YRK00111@niftyserve.or.jp
//-------------------------------------------------
unit Splash;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, jpeg;

type
  TSplashWindow = class(TForm)
    Bevel1: TBevel;
    Image1: TImage;
    Label1: TLabel;
    Shape1: TShape;
    jyoukypLabel: TLabel;
    procedure FormDeactivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private 宣言 }
//    FCount: Integer;
    procedure WMMove(var Msg:TWMMove); message WM_MOVE;
    procedure EraseBackGround(var Msg:TWMEraseBkgnd); message WM_ERASEBKGND;
  public
    { Public 宣言 }
  end;

var
  SplashWindow: TSplashWindow;

implementation

{$R *.DFM}

procedure TSplashWindow.EraseBackGround(var Msg:TWMEraseBkgnd);
begin
  DefWindowProc(Handle, WM_ICONERASEBKGND, Msg.DC, 0);
  Msg.Result := 1;
end;

procedure TSplashWindow.WMMove(var Msg:TWMMove);
begin
  inherited;
  Invalidate;
end;

procedure TSplashWindow.FormDeactivate(Sender: TObject);
begin
  Release;   
end;

procedure TSplashWindow.FormShow(Sender: TObject);
begin
//  Timer1.Enabled := True;
//  FCount := 0;
end;

procedure TSplashWindow.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//  Timer1.Enabled := False;
end;

procedure TSplashWindow.Timer1Timer(Sender: TObject);
begin
//  case FCount of
//    1: jyoukypLabel.Caption := 'MyTextLibrary起動中...';
//  end;
//  if FCount > 10 then begin
//    if( FCount mod 3) = 0 then begin
//      jyoukypLabel.Caption := 'アイテム読み込み中.';
//    end else if ( FCount mod 3) = 1 then begin
//      jyoukypLabel.Caption := 'アイテム読み込み中..';
//    end else if ( FCount mod 3) = 2 then begin
//      jyoukypLabel.Caption := 'アイテム読み込み中...';
//    end;
//  end;
//  Application.ProcessMessages;
end;

initialization
  SplashWindow := TSplashWindow.Create(nil);
  SplashWindow.Show;
  SplashWindow.Update;
end.


