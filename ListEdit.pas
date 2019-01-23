unit ListEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, FileType, Main;


type
  TListEditDlg = class(TForm)
    OKBtn: TButton;
    CancelBtn: TButton;
    Memo1: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
  end;

var
  ListEditDlg: TListEditDlg;

implementation

{$R *.dfm}

procedure TListEditDlg.FormActivate(Sender: TObject);
begin
  MainForm.MouseOnButton(OKBtn);
  Memo1.SelStart := Length(Memo1.Text);
  SendMessage(Memo1.Handle, EM_SCROLLCARET, 0, 0); 
  Memo1.SetFocus;
end;

procedure TListEditDlg.FormShow(Sender: TObject);
var
  i: Integer;
  s: String;
begin
  Memo1.Clear;
  case FileTypeDlg.EditMode of
    emContents:
    begin
      Caption := 'ñ⁄éüëŒè€êÊì™ï∂éöÇÃï“èW';
      Memo1.Lines.BeginUpdate;
      for i := 0 to FileTypeDlg.ContentsListBox.Items.Count -1 do
      begin
        s := FileTypeDlg.ContentsListBox.Items[i];
        Memo1.Lines.Add(s);
      end;
      Memo1.Lines.EndUpdate;
    end;
    emEmphasis:
    begin
      Caption := 'ã≠í≤ï\é¶ï∂éöÇÃï“èW';  
      Memo1.Lines.BeginUpdate;
      for i := 0 to FileTypeDlg.EmphasisListBox.Items.Count -1 do
      begin
        s := FileTypeDlg.EmphasisListBox.Items[i];
        Memo1.Lines.Add(s);
      end;
      Memo1.Lines.EndUpdate;
    end;
  end;
end;

procedure TListEditDlg.OKBtnClick(Sender: TObject);
var
  i: Integer;
  s: String;
begin
  case FileTypeDlg.EditMode of
    emContents:
    begin
      FileTypeDlg.ContentsListBox.Items.BeginUpdate;
      FileTypeDlg.ContentsListBox.Clear;
      for i := 0 to Memo1.Lines.Count -1 do
      begin
        s := Memo1.Lines[i];
        s := Trim(s);
        if s <> '' then
          if FileTypeDlg.ContentsListBox.Items.IndexOf(s) = -1 then
            FileTypeDlg.ContentsListBox.Items.Add(s);
      end;
      FileTypeDlg.ContentsListBox.Items.EndUpdate;
    end;
    emEmphasis:
    begin
      FileTypeDlg.EmphasisListBox.Items.BeginUpdate;
      FileTypeDlg.EmphasisListBox.Clear;
      for i := 0 to Memo1.Lines.Count -1 do
      begin
        s := Memo1.Lines[i];
        s := Trim(s);   
        if s <> '' then    
          if FileTypeDlg.EmphasisListBox.Items.IndexOf(s) = -1 then
            FileTypeDlg.EmphasisListBox.Items.Add(s);
      end;
      FileTypeDlg.EmphasisListBox.Items.EndUpdate;
    end;
  end;

end;

end.
 