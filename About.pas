unit About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, MAIN, ShellAPI;

type
  TAboutForm = class(TForm)
    Panel1: TPanel;
    AppIconImage: TImage;
    AppNameLabel: TLabel;
    VersionLabel: TLabel;
    CopyrightLabel: TLabel;
    WebPageLabel: TLabel;
    OKButton: TButton;
    procedure FormCreate(Sender: TObject);
    procedure OKButtonClick(Sender: TObject);
    procedure WebPageLabelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure WebPageLabelMouseLeave(Sender: TObject);
    procedure WebPageLabelClick(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  AboutForm: TAboutForm;

implementation

{$R *.dfm}

procedure TAboutForm.FormCreate(Sender: TObject);
begin
  AboutForm.Caption := 'ÉoÅ[ÉWÉáÉìèÓïÒ';
  AppIconImage.Picture := TPicture(Application.Icon);
  AppNameLabel.Caption := Application.Title;
  VersionLabel.Caption := VER_INFO;
  CopyrightLabel.Caption := COPYRIGHT;
//  WebPageLabel.Caption := '';

  Top := (Screen.Height - Height) div 2;
  Left := (Screen.Width - Width) div 2;
end;

procedure TAboutForm.OKButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TAboutForm.WebPageLabelMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  with WebPageLabel do begin
    Font.Style := [fsUnderline];
    Cursor := crHandPoint;
  end;
end;

procedure TAboutForm.WebPageLabelMouseLeave(Sender: TObject);
begin
  with WebPageLabel do begin
    Font.Style := [];
    Cursor := crDefault;
  end;
end;

procedure TAboutForm.WebPageLabelClick(Sender: TObject);
begin
   with WebPageLabel do
   begin
      ShellExecute(Application.Handle,
                   PChar('open'), PChar(WebPageLabel.Caption),
                   PChar(0), nil, SW_NORMAL);
   end;
end;

end.
