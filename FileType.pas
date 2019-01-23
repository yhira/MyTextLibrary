unit FileType;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Main, Option, Settings, Contnrs, LibraryItem;


type
  TEditMode = (emContents, emEmphasis);

  TFileTypeDlg = class(TForm)
    CancelBtn: TButton;
    Label1: TLabel;
    ExtensionEdit: TEdit;
    Label2: TLabel;
    OKBtn: TButton;
    Label3: TLabel;
    FiletypeEdit: TEdit;
    NumberContentsCheckBox: TCheckBox;
    BlankDeletionCheckBox: TCheckBox;
    EmphasisDisplayCheckBox: TCheckBox;
    Panel1: TPanel;
    Panel2: TPanel;
    PageControl1: TPageControl;
    ContentsTabSheet: TTabSheet;
    EmphasisTabSheet: TTabSheet;
    ContentsDisplayCheckBox: TCheckBox;
    ContentsGroupBox: TGroupBox;
    EmphasisGroupBox: TGroupBox;
    ContentsListBox: TListBox;
    AddContentsButton: TButton;
    EditContentsButton: TButton;
    EditAllContentsButton: TButton;
    DeleteContentsButton: TButton;
    DeleteAllContentsButton: TButton;
    EmphasisListBox: TListBox;
    AddEmphasisButton: TButton;
    EditEmphasisButton: TButton;
    EditAllEmphasisButton: TButton;
    DeleteEmphasisButton: TButton;
    DeleteAllEmphasisButton: TButton;
    HelpButton: TButton;
    procedure OKBtnClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ExtensionEditKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure ContentsDisplayCheckBoxClick(Sender: TObject);
    procedure EmphasisDisplayCheckBoxClick(Sender: TObject);
    procedure EditAllEmphasisButtonClick(Sender: TObject);
    procedure EditAllContentsButtonClick(Sender: TObject);
    procedure AddContentsButtonClick(Sender: TObject);
    procedure AddEmphasisButtonClick(Sender: TObject);
    procedure EditContentsButtonClick(Sender: TObject);
    procedure EditEmphasisButtonClick(Sender: TObject);
    procedure DeleteContentsButtonClick(Sender: TObject);
    procedure DeleteEmphasisButtonClick(Sender: TObject);
    procedure DeleteAllContentsButtonClick(Sender: TObject);
    procedure DeleteAllEmphasisButtonClick(Sender: TObject);
    procedure FiletypeEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure HelpButtonClick(Sender: TObject);
  private
    { Private 宣言 }
    procedure InputCheck;
    procedure ContentsEnabled;
    procedure EmphasisEnabled;
    procedure AddListBox(AListBox: TListBox);
    procedure EditListBox(AListBox: TListBox);   
    procedure DeleteListBox(AListBox: TListBox);
    procedure DeleteAllListBox(AListBox: TListBox);
//    function AddFileType: Integer;
  public
    { Public 宣言 }
    EditMode: TEditMode;
  end;

var
  FileTypeDlg: TFileTypeDlg;

implementation

{$R *.dfm}

uses ListEdit;

procedure TFileTypeDlg.OKBtnClick(Sender: TObject);
//  sName{, sExtension, sContents, sEmphasis}: String;
//  bContents, bEmphasis, bBlank, bNumber: Boolean;
//  function ExtractExtension(SList: TStringList): String;
//  var
//    i: Integer;
//    sl: TStringList;
//  begin
//    sl := TStringList.Create;
//    try
//      sl.Text := SList.Text;
//      for i := 0 to sl.Count -1 do
//        sl[i] := ExtractFileExt(sl[i]);
//      Result := sl.Text;
//    finally
//      sl.Free;
//    end;
//  end;

//  function ListBoxToStringList(AList: TListBox): String;
//  var
//    i: Integer;
//    sl: TStringList;
//  begin
//    sl := TStringList.Create;
//    try
//      for i := 0 to AList.Items.Count -1 do
//        sl.Add(AList.Items[i]);
//      Result := sl.Text;
//    finally
//      sl.Free;
//    end;
//  end;

  function BoolToListViewStr(ABooi: Boolean): String;
  begin
    if ABooi then
      Result := 'ON'
    else
      Result := 'OFF';
  end;

  procedure DspTypeChenge(OldStr, NewStr: String);
  var
    i: Integer;
  begin
    with MainForm.TreeView do
      for i := 0 to Items.Count -1 do
        if TObject(Items[i].Data) is TTextItem then
          if TTextItem(Items[i].Data).DspType = OldStr then
            TTextItem(Items[i].Data).DspType := NewStr;

  end;

var
  ListItem : TListItem;
  FileType: TFileType;
  txt: String;
begin
  case OptionDlg.EditMode of
    emNew:
    begin
      InputCheck;
      FileType := TFileType.Create;
      FileType.Name := Trim(FiletypeEdit.Text);
      FileType.Extension.CommaText := AnsiLowerCase(Trim(ExtensionEdit.Text));
      //FileType.Extension.Text := {ExtractExtension(}FileType.Extension.Text {)};
      FileType.Contents.Text := ContentsListBox.Items.Text; //ListBoxToStringList(ContentsListBox);
      FileType.Emphasis.Text := EmphasisListBox.Items.Text; //ListBoxToStringList(EmphasisListBox);
      FileType.ContentsDisplay := ContentsDisplayCheckBox.Checked;
      FileType.NumberContents := NumberContentsCheckBox.Checked;
      FileType.BlankDeletion := BlankDeletionCheckBox.Checked;
      FileType.EmphasisDisplay := EmphasisDisplayCheckBox.Checked;
      FileType.Fountain := nil;

      //OptionDlg.TempList.Add(FileType);
      ListItem := OptionDlg.ExtensionListView.Items.Add;
      ListItem.Data := Pointer(FileType);
      ListItem.Caption := FileType.Name;
      ListItem.SubItems.Add(ExtensionEdit.Text);
      ListItem.SubItems.Add(BoolToListViewStr(FileType.ContentsDisplay));
      ListItem.SubItems.Add(BoolToListViewStr(FileType.EmphasisDisplay));
      ListItem.Selected := True;
      //OptionDlg.AddExtensionList;
      MainForm.OptionSetting.FileTypeList.Add(FileType);
    end;
    emEdit:
    begin
      InputCheck;
      ListItem := OptionDlg.ExtensionListView.Selected;
      if TFileType(ListItem.Data).Name <> Trim(FiletypeEdit.Text) then
      begin
        //設定ファイルリネーム
        RenameFile(MainForm.MyFileTypeDataPath + TFileType(ListItem.Data).Name + '.ini',
                   MainForm.MyFileTypeDataPath + Trim(FiletypeEdit.Text) + '.ini');
//        DeleteFile(MainForm.MyFileTypeDataPath +
//                   TFileType(ListItem.Data).Name + '.ini');
        //ツリーノードの表示形式名変換
        DspTypeChenge(TFileType(ListItem.Data).Name,
                      Trim(FiletypeEdit.Text));
      end;


      TFileType(ListItem.Data).Name := Trim(FiletypeEdit.Text);
      TFileType(ListItem.Data).Extension.CommaText := AnsiLowerCase(Trim(ExtensionEdit.Text));
      //TFileType(ListItem.Data).Extension.Text := {ExtractExtension(}TFileType(ListItem.Data).Extension.Text {)};
      TFileType(ListItem.Data).Contents.Text := ContentsListBox.Items.Text;
      TFileType(ListItem.Data).Emphasis.Text := EmphasisListBox.Items.Text;
      TFileType(ListItem.Data).ContentsDisplay := ContentsDisplayCheckBox.Checked;
      TFileType(ListItem.Data).NumberContents := NumberContentsCheckBox.Checked;
      TFileType(ListItem.Data).BlankDeletion := BlankDeletionCheckBox.Checked;
      TFileType(ListItem.Data).EmphasisDisplay := EmphasisDisplayCheckBox.Checked;

      ListItem.Caption := TFileType(ListItem.Data).Name;
      ListItem.SubItems[0] := ExtensionEdit.Text;
      ListItem.SubItems[1] := BoolToListViewStr(TFileType(ListItem.Data).ContentsDisplay);
      ListItem.SubItems[2] := BoolToListViewStr(TFileType(ListItem.Data).EmphasisDisplay);
      ListItem.Selected := True;
      //\f
      txt := TFileType(ListItem.Data).Emphasis.Text;
      if TFileType(ListItem.Data).Fountain <> nil then
        TFileType(ListItem.Data).Fountain.ReserveWordList.Text := txt;

      //OptionDlg.AddExtensionList;
      MainForm.OptionSetting.FileTypeList[ListItem.Index] := TFileType(ListItem.Data);
    end;
  end;

  Self.Close;
end;

procedure TFileTypeDlg.FormActivate(Sender: TObject);
begin
  MainForm.MouseOnButton(OKBtn);
end;

procedure TFileTypeDlg.FormCreate(Sender: TObject);
begin
  //初期設定
  ExtensionEdit.Text := '';
  FiletypeEdit.Text := '';
end;

procedure TFileTypeDlg.ExtensionEditKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (Key in ['A'..'Z','a'..'z','0'..'9','.',',', '*', #08, #16, #09]) then
    Key := #0;         
end;

procedure TFileTypeDlg.InputCheck;
var
  i: Integer;
  s, ss, Msg: String;
  ListItem: TListItem;
const
  ErrorStr = '\/:;*?"<>|';
begin
  if FiletypeEdit.Text = '' then
  begin
    Application.MessageBox('ファイルの種類の蘭が空欄です。',
                           PChar(Application.Title), MB_ICONINFORMATION);
    FiletypeEdit.SetFocus;
    Abort;
  end;

  s := FiletypeEdit.Text;
  for i := 0 to Length(s) do
  begin
    if AnsiPos(s[i], ErrorStr) <> 0 then
    begin
    Application.MessageBox('ファイルの種類に \/:;*?"<>| これらの文字は入力できません' +
                            '名前を変更してください',
                           PChar(Application.Title), MB_ICONINFORMATION);
    FiletypeEdit.SetFocus;
    FiletypeEdit.SelectAll;
    Abort;
    end
  end;

  if OptionDlg.EditMode = emNew then
  begin
    for i := 0 to OptionDlg.ExtensionListView.Items.Count -1 do
    begin
      ListItem := OptionDlg.ExtensionListView.Items[i];
      s := Trim(FiletypeEdit.Text);
      ss := TFileType(ListItem.Data).Name;
      if AnsiLowerCase(s) = AnsiLowerCase(ss) then
      begin
        Msg := '"' + Trim(FiletypeEdit.Text) + '" はすでに登録されています。';
        Application.MessageBox(PChar(Msg),
                               PChar(Application.Title),
                               MB_ICONINFORMATION);
        FiletypeEdit.SetFocus;
        FiletypeEdit.SelectAll;
        Abort;
      end;
    end;
  end;




  if ExtensionEdit.Text = '' then
  begin
    Application.MessageBox('登録拡張子の蘭が空欄です。'+ #13#10 +'登録する拡張子を入力して下さい。',
                           PChar(Application.Title), MB_ICONINFORMATION);
    ExtensionEdit.SetFocus;
    Abort;
  end;

  if AnsiPos('.', ExtensionEdit.Text) = 0 then
  begin
    Application.MessageBox('登録拡張子の蘭に"."（ドット）が入っていません。'+ #13#10 +
                           '"."（ドット）を付けて入力して下さい。',
                           PChar(Application.Title), MB_ICONINFORMATION);
    ExtensionEdit.SetFocus;
    Abort;
  end;

end;

procedure TFileTypeDlg.FormShow(Sender: TObject);

//  procedure AddFileTypeToCombo;
//  var
//    i: Integer;
//    s: String;
//  begin
//    with MainForm.OptionSetting do
//    begin
//      for i := 0 to FileTypeList.Count -1 do
//      begin
//        s := TFileType(FileTypeList[i]).Name;
//        FileTypeComboBox.Items.AddObject(s, FileTypeList[i]);
//      end;
//    end;
//  end;
//
  function StringListToCommaText(SList: TStringList): String;
  var
    i: Integer;
    s: String;
  begin
    s := '';
    for i := 0 to SList.Count -1 do
    begin
      if i <> (SList.Count -1) then
        s := s + '*' + SList[i] + ','
      else
        s := s + '*' + SList[i];
    end;
    Result := s;
  end;


var
  ListItem: TListItem;
  s: String;
//  List: TObjectList;
//  i: Integer;
begin
  PageControl1.ActivePage := ContentsTabSheet;
  ContentsEnabled;
  EmphasisEnabled;

  PageControl1.ActivePage := ContentsTabSheet;


  case OptionDlg.EditMode of
    emNew:
    begin
      Caption := '新しい種類の設定';
      //目次
      ContentsDisplayCheckBox.Checked := True;
      NumberContentsCheckBox.Checked := True;
      BlankDeletionCheckBox.Checked := True;
      ContentsListBox.Items.CommaText := DEFAULT_TEXT_CONTENTS;
      //強調
      EmphasisDisplayCheckBox.Checked := True;
    end;
    emEdit:
    begin
      //List := OptionDlg.TempList; //MainForm.OptionSetting.FileTypeList;  //////
      //i := OptionDlg.ExtensionListView.Selected.Index;
      ListItem := OptionDlg.ExtensionListView.Selected;
      Caption := TFileType(ListItem.Data).Name + 'の設定';
      //種類名
      FiletypeEdit.Text := TFileType(ListItem.Data).Name;
      //拡張子
      ExtensionEdit.Text := TFileType(ListItem.Data).Extension.CommaText;
        //StringListToCommaText(TFileType(ListItem.Data).Emphasis);
      //目次
      ContentsDisplayCheckBox.Checked := TFileType(ListItem.Data).ContentsDisplay;
      NumberContentsCheckBox.Checked := TFileType(ListItem.Data).NumberContents;
      BlankDeletionCheckBox.Checked := TFileType(ListItem.Data).BlankDeletion;
      ContentsListBox.Items.Text := TFileType(ListItem.Data).Contents.Text;
      //強調
      EmphasisDisplayCheckBox.Checked := TFileType(ListItem.Data).EmphasisDisplay;
      EmphasisListBox.Items.Text := TFileType(ListItem.Data).Emphasis.Text;
      //\f
      s := FiletypeEdit.Text;
      if (s = DEFAULT_DELPHI_NAME) or //Delphiファイル
         (s = DEFAULT_HTML_NAME) or   //HTMLファイル
         (s = DEFAULT_PERL_NAME) or   //Perlファイル
         (s = DEFAULT_CPP_NAME) or    //C++ファイル
         (s = DEFAULT_JAVA_NAME) or   //JAVAファイル
         (s = DEFAULT_COBOL_NAME) or  //COBOLファイル
         (s = DEFAULT_JSP_NAME) or    //JSPファイル
         (s = DEFAULT_SQL_NAME) or    //SQLファイル
         (s = DEFAULT_RUBY_NAME)      //Rubyファイル
         then begin
        FiletypeEdit.Color := clInactiveCaptionText;
        FiletypeEdit.ReadOnly := True;
      end;

    end;
  end;

  FiletypeEdit.SetFocus;
  FiletypeEdit.SelectAll;
end;

//function TExtensionDlg.AddFileType: Integer;
//var
//  FileType: TFileType;
//  i: Integer;
//  s, ex, Msg: String;
//  List: TObjectList;
//begin
//  List := MainForm.OptionSetting.FileTypeList;
//  s := FileTypeComboBox.Text;
//  s := Trim(s);
//  ex := ExtensionEdit.Text;
//  ex := Trim(ex);
//  ex := LowerCase(ex);
//  Result := FileTypeComboBox.Items.IndexOf(s);
//  if FileTypeComboBox.Items.IndexOf(s) = -1 then
//  begin
//    //FileTypeComboBox.Items.Add(s);
//    FileType := TFileType.Create;
//    FileType.Name := s;
//    FileType.Extension.Add(ex);
//    FileType.ItemIndex :=  List.Add(FileType);
//    Result := FileType.ItemIndex;
//  end
//  else
//  begin
//    i := FileTypeComboBox.Items.IndexOf(s);
//    if TFileType(List[i]).Extension.IndexOf(ex) = -1 then
//      TFileType(List[i]).Extension.Add(ex)
//    else
//    begin
//      Msg := '拡張子 "' + ex + '" はすでに<' + s + '>に登録されています。';
//      Application.MessageBox(PChar(Msg), PChar(Application.Title), MB_ICONINFORMATION);
//      //ShowMessage(TFileType(List[i]).Extension.Text);
//      Abort;
//    end;
//
//  end;
//
//
//end;

procedure TFileTypeDlg.ContentsDisplayCheckBoxClick(Sender: TObject);
begin
  ContentsEnabled;
end;

procedure TFileTypeDlg.EmphasisDisplayCheckBoxClick(Sender: TObject);
begin
  EmphasisEnabled;
end;

procedure TFileTypeDlg.ContentsEnabled;
begin
  if ContentsDisplayCheckBox.Checked then
  begin
    ContentsGroupBox.Enabled := True;
    AddContentsButton.Enabled := True;
    EditContentsButton.Enabled := True;
    EditAllContentsButton.Enabled := True;
    DeleteContentsButton.Enabled := True;
    DeleteAllContentsButton.Enabled := True;
    NumberContentsCheckBox.Enabled := True;
    BlankDeletionCheckBox.Enabled := True;
    ContentsListBox.Enabled := True;
  end
  else
  begin
    ContentsGroupBox.Enabled := False;
    AddContentsButton.Enabled := False;
    EditContentsButton.Enabled := False;
    EditAllContentsButton.Enabled := False;
    DeleteContentsButton.Enabled := False;
    DeleteAllContentsButton.Enabled := False;
    NumberContentsCheckBox.Enabled := False;
    BlankDeletionCheckBox.Enabled := False;
    ContentsListBox.Enabled := False;
  end;
end;

procedure TFileTypeDlg.EmphasisEnabled;
begin
  if EmphasisDisplayCheckBox.Checked then
  begin
    EmphasisGroupBox.Enabled := True;
    EmphasisListBox.Enabled := True;
    AddEmphasisButton.Enabled := True;
    EditEmphasisButton.Enabled := True;
    EditAllEmphasisButton.Enabled := True;
    DeleteEmphasisButton.Enabled := True;
    DeleteAllEmphasisButton.Enabled := True;
  end
  else
  begin
    EmphasisGroupBox.Enabled := False;
    EmphasisListBox.Enabled := False;
    AddEmphasisButton.Enabled := False;
    EditEmphasisButton.Enabled := False;
    EditAllEmphasisButton.Enabled := False;
    DeleteEmphasisButton.Enabled := False;
    DeleteAllEmphasisButton.Enabled := False;
  end;

end;

procedure TFileTypeDlg.EditAllEmphasisButtonClick(Sender: TObject);
begin
  ListEditDlg := TListEditDlg.Create(Self);
  try
    EditMode := emEmphasis;
    ListEditDlg.ShowModal;
  finally            
    MainForm.MouseOnButton(OKBtn);
    ListEditDlg.Free;
  end;

end;

procedure TFileTypeDlg.EditAllContentsButtonClick(Sender: TObject);
begin
  ListEditDlg := TListEditDlg.Create(Self);
  try
    EditMode := emContents;
    ListEditDlg.ShowModal;
  finally
    MainForm.MouseOnButton(OKBtn);
    ListEditDlg.Free;
  end;

end;

procedure TFileTypeDlg.AddListBox(AListBox: TListBox);
var
  InputStr, Msg: String;
  Idx: Integer;
begin
  InputStr := InputBox('追加', '追加したい文字を入力して下さい。', '');
  InputStr := Trim(InputStr);
  if InputStr <> '' then
  begin
    if AListBox.Items.IndexOf(InputStr) = -1 then
    begin
      Idx := AListBox.Items.Add(InputStr);
      AListBox.Selected[Idx] := True;
    end
    else
    begin
      Msg := '"' + InputStr + '" はすでに登録されています。';
      Application.MessageBox(PChar(Msg), PChar(Application.Title), MB_ICONINFORMATION);
      Idx := AListBox.Items.IndexOf(InputStr);
      AListBox.Selected[Idx] := True;
    end;
  end;
end;

procedure TFileTypeDlg.AddContentsButtonClick(Sender: TObject);
begin
  AddListBox(ContentsListBox);
end;

procedure TFileTypeDlg.AddEmphasisButtonClick(Sender: TObject);
begin
  AddListBox(EmphasisListBox);
end;

procedure TFileTypeDlg.EditListBox(AListBox: TListBox);
var
  InputStr, Msg: String;
  Idx: Integer;
begin
  if AListBox.ItemIndex = -1 then
  begin
    Msg := '編集したい文字をリストボックスから選択して下さい。';
    Application.MessageBox(PChar(Msg), PChar(Application.Title), MB_ICONINFORMATION);
    Abort;
  end;

  Idx := AListBox.ItemIndex;
  InputStr := InputBox('編集', '変更したい文字を入力して下さい。', AListBox.Items[Idx]);
  InputStr := Trim(InputStr);
  if InputStr <> '' then
  begin
    if AListBox.Items.IndexOf(InputStr) = -1 then
    begin
      Idx := AListBox.ItemIndex;
      AListBox.Items[Idx] := InputStr;
      AListBox.Selected[Idx] := True;
    end
    else
    begin
      Msg := '"' + InputStr + '" はすでに登録されています。';
      Application.MessageBox(PChar(Msg), PChar(Application.Title), MB_ICONINFORMATION);
      Idx := AListBox.Items.IndexOf(InputStr);
      AListBox.Selected[Idx] := True;
    end;
  end;

end;

procedure TFileTypeDlg.EditContentsButtonClick(Sender: TObject);
begin
  EditListBox(ContentsListBox);
end;

procedure TFileTypeDlg.EditEmphasisButtonClick(Sender: TObject);
begin
  EditListBox(EmphasisListBox);
end;

procedure TFileTypeDlg.DeleteContentsButtonClick(Sender: TObject);
begin
  DeleteListBox(ContentsListBox);
end;

procedure TFileTypeDlg.DeleteAllListBox(AListBox: TListBox); 
var
  Msg: String;
begin
  Msg := 'リストボックス内を全て削除してしまってよろしいですか？';
  if Application.MessageBox(PChar(Msg), '確認',
                            MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) = IDYES then
  begin
    AListBox.Clear;
  end;

end;

procedure TFileTypeDlg.DeleteListBox(AListBox: TListBox);
var
  Idx: Integer;
  Msg: String;
begin
  if AListBox.ItemIndex = -1 then
  begin
    Msg := '削除したい文字をリストボックスから選択して下さい。';
    Application.MessageBox(PChar(Msg), PChar(Application.Title), MB_ICONINFORMATION);
    Abort;
  end;

  Idx := AListBox.ItemIndex;
  AListBox.Items.Delete(Idx);
end;

procedure TFileTypeDlg.DeleteEmphasisButtonClick(Sender: TObject);
begin
  DeleteListBox(EmphasisListBox);
end;

procedure TFileTypeDlg.DeleteAllContentsButtonClick(Sender: TObject);
begin
  DeleteAllListBox(ContentsListBox);
end;

procedure TFileTypeDlg.DeleteAllEmphasisButtonClick(Sender: TObject);
begin
  DeleteAllListBox(EmphasisListBox);
end;

procedure TFileTypeDlg.FiletypeEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = Windows.VK_RETURN then
    OKBtn.Click;
end;

procedure TFileTypeDlg.HelpButtonClick(Sender: TObject);
begin
  case PageControl1.ActivePageIndex of
    0: MainForm.HelpHelpContextDisplay(000083);
    1: MainForm.HelpHelpContextDisplay(000084);
  end;

end;

end.
