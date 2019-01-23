unit TextSet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Main, LibraryItem, Settings;


type
  TTextSetDlg = class(TForm)
    CancelBtn: TButton;
    Bevel1: TBevel;
    NameLabeledEdit: TLabeledEdit;
    PathLabeledEdit: TLabeledEdit;
    CommentLabel: TLabel;
    CommentMemo: TMemo;
    ReadOnlyCheckBox: TCheckBox;
    CreationDayLabel: TLabel;
    OKBtn: TButton;
    UpdateDayLabel: TLabel;
    ExtensionLabel: TLabel;
    Label1: TLabel;
    DspTypeComboBox: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure NameLabeledEditMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure NameLabeledEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private 宣言 }
    OldName: String;
    procedure AddDspType;
  public
    { Public 宣言 }
  end;

var
  TextSetDlg: TTextSetDlg;

implementation

{$R *.dfm}

  function DelimiterCut(s: WideString): WideString;
  var
    i: Integer;
  begin
    i := Length(s);
    Result := Copy(s, 1, i -1);
  end;

procedure TTextSetDlg.FormShow(Sender: TObject);
var
  s, ss: String;
  i, j: Integer;
  SR: TSearchRec;
  NewItem: TTextItem;
begin
  case MainForm.ItemEditMode of
    imNewFile:
    begin
      //初期設定
      //MainForm.RichEdit.Clear;
      //新しいアイテムを作成
      NewItem := TTextItem.Create(MainForm.TreeView.Selected);
      with NewItem do
      begin
        Name :=  MainForm.FileNameCheck(Path, Name, Extension);
        NameLabeledEdit.Text := Name;
        PathLabeledEdit.Text := Path;
        CommentMemo.Text := Comment;
        CreationDayLabel.Caption := '作成日時:';
        UpdateDayLabel.Caption := '更新日時:';
        ExtensionLabel.Caption := Extension;
        ReadOnlyCheckBox.Checked := ReadOnlyBool;
        AddDspType;
        ss := MainForm.OptionSetting.Display.DefaultDspType;
        j :=  DspTypeComboBox.Items.IndexOf(ss);
        if j <> -1 then
          DspTypeComboBox.ItemIndex := j
        else
          DspTypeComboBox.ItemIndex := 0;
      end;
      Caption := '新規ドキュメントの作成';
      NewItem.Free;
    end;
    imPropertyFile:
    begin
      with MainForm.TreeView do
      begin
        OldName := TTextItem(Selected.Data).Path +
          TTextItem(Selected.Data).Name + TTextItem(Selected.Data).Extension;
        NameLabeledEdit.Text := TTextItem(Selected.Data).Name;
        PathLabeledEdit.Text := TTextItem(Selected.Data).Path;
        CommentMemo.Text := TTextItem(Selected.Data).Comment;
        ReadOnlyCheckBox.Checked := TTextItem(Selected.Data).ReadOnlyBool;
        s := '作成日時:     ' + FormatDateTime('(yyyy/mm/dd hh:nn)',
          TTextItem(Selected.Data).CreationDay);
        CreationDayLabel.Caption := s;

        FindFirst(TTextItem(Selected.Data).Path +
          TTextItem(Selected.Data).Name + TTextItem(Selected.Data).Extension, faDirectory, sr);
        try
          TTextItem(Selected.Data).UpdateDay := FileDateToDateTime(sr.Time);
        finally
          SysUtils.FindClose(sr);
        end;
        s := '更新日時:     ' + FormatDateTime('(yyyy/mm/dd hh:nn)',
          TTextItem(Selected.Data).UpdateDay);
        UpdateDayLabel.Caption := s;
        ExtensionLabel.Caption := TTextItem(Selected.Data).Extension;

        AddDspType;
        s := TTextItem(Selected.Data).DspType;
        i := DspTypeComboBox.Items.IndexOf(s);
        ss := MainForm.OptionSetting.Display.DefaultDspType;
        j :=  DspTypeComboBox.Items.IndexOf(ss);
        if i <> -1 then
          DspTypeComboBox.ItemIndex := i
        else
          if j <> -1 then
            DspTypeComboBox.ItemIndex := j
          else
            DspTypeComboBox.ItemIndex := 0;
      end;
      Caption := NameLabeledEdit.Text + 'のプロパティ';
    end;
    imImport:
    begin
      with MainForm do
      begin
        NameLabeledEdit.Text := FileNameCheck(IpPath, IpName, IpExe);
        PathLabeledEdit.Text := IpPath;
        CommentMemo.Text := '';
        ReadOnlyCheckBox.Checked := False;
        s := '作成日時:';
        CreationDayLabel.Caption := s;

        s := '更新日時:';
        UpdateDayLabel.Caption := s;
        ExtensionLabel.Caption := IpExe;

        AddDspType;
        s := IpDspType;
        i := DspTypeComboBox.Items.IndexOf(s);
        ss := MainForm.OptionSetting.Display.DefaultDspType;
        j :=  DspTypeComboBox.Items.IndexOf(ss);
        if i <> -1 then
          DspTypeComboBox.ItemIndex := i
        else
          if j <> -1 then
            DspTypeComboBox.ItemIndex := j
          else
            DspTypeComboBox.ItemIndex := 0;
      end;
      Caption := NameLabeledEdit.Text + 'のプロパティ';
    end;
  end;


end;

procedure TTextSetDlg.FormActivate(Sender: TObject);
begin
  MainForm.MouseOnButton(OKBtn);
  NameLabeledEdit.SetFocus;
  NameLabeledEdit.SelectAll;
end;

procedure TTextSetDlg.OKBtnClick(Sender: TObject);
var
  SR: TSearchRec;
  OName, NName: String;
  Node: TTreeNode;
//  i, idx: Integer;
  NewItem: TTextItem;
begin
  case MainForm.ItemEditMode of
    imNewFile:
    begin
      NewItem := TTextItem.Create(MainForm.TreeView.Selected);
      with NewItem do
      begin
        Name := NameLabeledEdit.Text;
        Name := MainForm.FileNameCheck(IncludeTrailingPathDelimiter(PathLabeledEdit.Text),
          NameLabeledEdit.Text, ExtensionLabel.Caption);
        Path := IncludeTrailingPathDelimiter(PathLabeledEdit.Text);
        Extension := ExtensionLabel.Caption;
        //ShowMessage(Path + Name + Extension);
        Comment := CommentMemo.Text;
        ReadOnlyBool := ReadOnlyCheckBox.Checked;
        MainForm.RichEdit.ReadOnly := ReadOnlyBool;
        CreationDay := Now;
        //ファイル作成
        MainForm.RichEdit.Clear;
        MainForm.RichEdit.Lines.SaveToFile(Path + Name + Extension);
        //作成したフォルダから作成日時を取得
        FindFirst(Path + Name + Extension, faAnyFile, sr);
        try
          CreationDay := FileDateToDateTime(sr.Time);
          UpdateDay := FileDateToDateTime(sr.Time);
        finally
          SysUtils.FindClose(sr);
        end;

        DspType := DspTypeComboBox.Text;

        MainForm.TreeView.Items.AddChildObject(MainForm.TreeView.Selected, Name + Extension, Pointer(NewItem));
        MainForm.SaveTreeItemDataToFile;
        MainForm.RichEdit.SetFocus;
      end;
    end;
    imPropertyFile:
    begin
      with MainForm.TreeView do
      begin
        if NameLabeledEdit.Text <> TTextItem(Selected.Data).Name then
        begin
          NameLabeledEdit.Text :=
            MainForm.FileNameCheck(TTextItem(Selected.Data).Path, NameLabeledEdit.Text,
              TTextItem(Selected.Data).Extension);
          Selected.Text := NameLabeledEdit.Text + ExtensionLabel.Caption;;
          TTextItem(Selected.Data).Name := NameLabeledEdit.Text;

          //リネーム
          OName := OldName;
          NName := TTextItem(Selected.Data).Path + TTextItem(Selected.Data).Name +
            TTextItem(Selected.Data).Extension;
          RenameFile(OName, NName);
        end;
        //Comment
        TTextItem(Selected.Data).Comment := CommentMemo.Text;
        //ReadOnly
        TTextItem(Selected.Data).ReadOnlyBool := ReadOnlyCheckBox.Checked;
        MainForm.RichEdit.ReadOnly := TTextItem(Selected.Data).ReadOnlyBool;
        MainForm.ReadOnlyStatus;
        Selected.ImageIndex := TTextItem(Selected.Data).ImageIndex;
        Selected.SelectedIndex := TTextItem(Selected.Data).ImageIndex;
        //DspType
        TTextItem(Selected.Data).DspType := DspTypeComboBox.Text;
//        MainForm.AddBookMarkToListView(Selected);
//        if MainForm.OptionSetting.Standard.ContentsDsp then
//          MainForm.AddContentsToListView(Selected);

        MainForm.SaveTreeItemDataToFile;
      end;
    end;
    imImport:
    begin
      NewItem := TTextItem.Create(MainForm.TreeView.Selected);
      with NewItem do
      begin
        Name := NameLabeledEdit.Text;
        Name := MainForm.FileNameCheck(IncludeTrailingPathDelimiter(PathLabeledEdit.Text),
          NameLabeledEdit.Text, ExtensionLabel.Caption);
        Path := IncludeTrailingPathDelimiter(PathLabeledEdit.Text);
        Extension := ExtensionLabel.Caption;
        //ShowMessage(Path + Name + Extension);
        Comment := CommentMemo.Text;
        ReadOnlyBool := ReadOnlyCheckBox.Checked;
        MainForm.RichEdit.ReadOnly := ReadOnlyBool;
        CreationDay := Now;
        //ファイル作成
        MainForm.RichEdit.Lines.Text := MainForm.OldSL.Text;
        MainForm.RichEdit.Lines.SaveToFile(Path + Name + Extension);
        //作成したフォルダから作成日時を取得
        FindFirst(Path + Name + Extension, faAnyFile, sr);
        try
          CreationDay := FileDateToDateTime(sr.Time);
          UpdateDay := FileDateToDateTime(sr.Time);
        finally
          SysUtils.FindClose(sr);
        end;

        DspType := DspTypeComboBox.Text;
        
        Node := MainForm.SelectNode;
        MainForm.TreeView.Items.AddChildObject(Node, Name + Extension, Pointer(NewItem));
        MainForm.RichEdit.SetFocus;
        MainForm.SaveTreeItemDataToFile;
      end;
    end;
  end;



  Self.Close;
end;

procedure TTextSetDlg.FormCreate(Sender: TObject);
begin
  NameLabeledEdit.OnDblClick := MainForm.ComponentDblClick;
  CommentMemo.OnDblClick := MainForm.ComponentDblClick;
end;

procedure TTextSetDlg.NameLabeledEditMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Sender is TLabeledEdit then
    TLabeledEdit(Sender).Hint := TLabeledEdit(Sender).Text;
end;

procedure TTextSetDlg.NameLabeledEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN: OKBtn.Click;
  end;

end;

procedure TTextSetDlg.AddDspType;
var
  i: Integer;
  s: String;
begin
  with MainForm.OptionSetting do
  begin
    for i := 0 to FileTypeList.Count -1 do
    begin
      s := TFileType(FileTypeList[i]).Name;
      DspTypeComboBox.Items.Add(s);
    end;
  end;



end;

end.
