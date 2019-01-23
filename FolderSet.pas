unit FolderSet;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, ComCtrls, Main, LibraryItem;


type
  TFolderSetDlg = class(TForm)
    CancelBtn: TButton;
    Bevel1: TBevel;
    NameLabeledEdit: TLabeledEdit;
    PathLabeledEdit: TLabeledEdit;
    CommentLabel: TLabel;
    CommentMemo: TMemo;
    IconLabel: TLabel;
    IconComboBoxEx: TComboBoxEx;
    ReadOnlyCheckBox: TCheckBox;
    CreationDayLabel: TLabel;
    OKBtn: TButton;
    procedure FormShow(Sender: TObject);
    procedure NameLabeledEditChange(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure PathLabeledEditMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure NameLabeledEditMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure NameLabeledEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private 宣言 }
    //NewItem: TFolderItem;
    OldName: String;
  public
    { Public 宣言 }
  end;

var
  FolderSetDlg: TFolderSetDlg;

implementation

{$R *.dfm}

  function DelimiterCut(s: WideString): WideString;
  var
    i: Integer;
  begin
    i := Length(s);
    Result := Copy(s, 1, i -1);
  end;

procedure TFolderSetDlg.FormShow(Sender: TObject);
var
  s: String;
  NewItem: TFolderItem;
begin
  case MainForm.ItemEditMode of
    imNewFolder:
    begin
      //初期設定
      IconComboBoxEx.ItemIndex := 0;
      IconComboBoxEx.Style := csExDropDownList;


      //新しいアイテムを作成
      NewItem := TFolderItem.Create(MainForm.TreeView.Selected);
      with NewItem do
      begin
        //Path := IncludeTrailingPathDelimiter(Path);
        Name :=  MainForm.FolderNameCheck(Path, Name);
        NameLabeledEdit.Text := Name;
        PathLabeledEdit.Text := Path;
        CommentMemo.Text := Comment;
        IconComboBoxEx.ItemIndex := ImageIndex;
        CreationDayLabel.Caption := '';
        ReadOnlyCheckBox.Checked := False;
      end;
      Caption := 'フォルダの新規作成';
      NewItem.Free;
    end;
    imPropertyFolder:
    begin
      with MainForm.TreeView do
      begin
        OldName := TFolderItem(Selected.Data).Path + TFolderItem(Selected.Data).Name;
        NameLabeledEdit.Text := TFolderItem(Selected.Data).Name;
        PathLabeledEdit.Text := TFolderItem(Selected.Data).Path;
        CommentMemo.Text := TFolderItem(Selected.Data).Comment;
        IconComboBoxEx.ItemIndex := TFolderItem(Selected.Data).ImageIndex;
        ReadOnlyCheckBox.Checked := TFolderItem(Selected.Data).ReadOnlyBool;
        s := '作成日時:' + FormatDateTime('(yyyy/mm/dd hh:nn)',
          TFolderItem(Selected.Data).CreationDay);
        CreationDayLabel.Caption := s;
        CreationDayLabel.Left := Bevel1.Width - CreationDayLabel.Width;
      end;
      Caption := NameLabeledEdit.Text + 'のプロパティ';
    end;
    imImport:
    begin
      NameLabeledEdit.Text := MainForm.FolderNameCheck(MainForm.IpPath, MainForm.IpName);
      PathLabeledEdit.Text := MainForm.IpPath;
      CommentMemo.Text := '';
      IconComboBoxEx.ItemIndex := 0;
      CreationDayLabel.Caption := '';
      ReadOnlyCheckBox.Checked := False;
      Caption := NameLabeledEdit.Text + 'のプロパティ';
    end;
  end;


end;

procedure TFolderSetDlg.NameLabeledEditChange(Sender: TObject);
begin
//  case MainForm.ItemEditMode of
//    imNew:
//    begin
//      PathLabeledEdit.Clear;
//      PathLabeledEdit.Text := NewItem.Path +
//        NewItem.ECharToJChar(NameLabeledEdit.Text);
//    end;
//    improperty:
//    begin
//      PathLabeledEdit.Clear;
//      PathLabeledEdit.Text :=
//    end;
//  end;

                   
end;

procedure TFolderSetDlg.FormActivate(Sender: TObject);
begin
  MainForm.MouseOnButton(OKBtn);
  NameLabeledEdit.SetFocus;
  NameLabeledEdit.SelectAll;
end;

procedure TFolderSetDlg.OKBtnClick(Sender: TObject);
var
//  SR: TSearchRec;
  OName, NName: String;
  Node: TTreeNode;
  i, idx: Integer;
  sr: TSearchRec;
//  P: Pointer;
  NewItem: TFolderItem;

begin
  case MainForm.ItemEditMode of
    imNewFolder:
    begin
      NewItem := TFolderItem.Create(MainForm.TreeView.Selected);
      with NewItem do
      begin
        Name := NameLabeledEdit.Text;
        Path := PathLabeledEdit.Text;
        //Name := MainForm.ECharToJChar(Name);
        //Path := IncludeTrailingPathDelimiter(Path);
        Name := MainForm.FolderNameCheck(Path, Name);
        //PathLabeledEdit.Text := Path;
        //Application.ProcessMessages;
        Comment := CommentMemo.Text;
        ImageIndex := IconComboBoxEx.ItemIndex;
        ReadOnlyBool := ReadOnlyCheckBox.Checked;
        CreationDay := Now;
        //FileType := ftFolder;
        //フォルダ作成
        //ShowMessage(Path + Name);
        ForceDirectories(NewItem.Path + NewItem.Name);
        //作成したフォルダから作成日時を取得
        FindFirst(DelimiterCut(Path), faDirectory, sr);
        try
          CreationDay := FileDateToDateTime(sr.Time);
        finally
          SysUtils.FindClose(sr);
        end;
        //NewItem.AddObject(MainForm.TreeView, MainForm.TreeView.Selected, NewItem.Name, Pointer(NewItem));
        MainForm.TreeView.Items.AddChildObject(MainForm.TreeView.Selected, Name, Pointer(NewItem));
        MainForm.SaveTreeItemDataToFile;
      end;
    end;
    imPropertyFolder:
    begin
      with MainForm.TreeView do
      begin
        //ParentPath := TFolderItem(Selected.Parent.Data).Path;
        //IncludeTrailingPathDelimiter(ParentPath);
        if NameLabeledEdit.Text <> TFolderItem(Selected.Data).Name then
        begin
          //MainForm.EmptyChech(NameLabeledEdit.Text);
          //NameLabeledEdit.Text := MainForm.ECharToJChar(NameLabeledEdit.Text);
          NameLabeledEdit.Text :=
            MainForm.FolderNameCheck(TFolderItem(Selected.Data).Path, NameLabeledEdit.Text);
          Selected.Text := NameLabeledEdit.Text;
          TFolderItem(Selected.Data).Name := NameLabeledEdit.Text;
          //TFolderItem(Selected.Data).Path :=
            // IncludeTrailingPathDelimiter(ParentPath + NameLabeledEdit.Text);
          //Application.ProcessMessages;

          //下位アイテムの名前変更
          idx := Selected.AbsoluteIndex;
          for i := idx + 1 to Items.Count -1 do
          begin
            if Items[i] <> nil then
            begin
              Node := Items[i];
              TFolderItem(Node.Data).Path :=
                IncludeTrailingPathDelimiter(TFolderItem(Node.Parent.Data).Path) +
                                                     TFolderItem(Node.Parent.Data).Name;
            end;
          end;
          //リネーム
          OName := OldName;
          NName := TFolderItem(Selected.Data).Path + TFolderItem(Selected.Data).Name;
          //AssignFile(f, OName);
          //ShowMessage(OName + #13#10 + NName);
          RenameFile(OName, NName);
        end;
        TFolderItem(Selected.Data).Comment := CommentMemo.Text;
        TFolderItem(Selected.Data).ImageIndex := IconComboBoxEx.ItemIndex;
        TFolderItem(Selected.Data).ReadOnlyBool := ReadOnlyCheckBox.Checked;

        Selected.ImageIndex := TFolderItem(Selected.Data).ImageIndex;
        Selected.SelectedIndex := TFolderItem(Selected.Data).ImageIndex;
      end;
      
        MainForm.SaveTreeItemDataToFile;
    end;
    imImport:
    begin
      NewItem := TFolderItem.Create(MainForm.TreeView.Selected);
      with NewItem do
      begin
        Path := IncludeTrailingPathDelimiter(PathLabeledEdit.Text) ;
        Name := MainForm.FolderNameCheck(Path, NameLabeledEdit.Text);
        Comment := CommentMemo.Text;
        ImageIndex := IconComboBoxEx.ItemIndex;
        ReadOnlyBool := ReadOnlyCheckBox.Checked;
        CreationDay := Now;
        //フォルダ作成
        ForceDirectories(Path + Name);
        MainForm.IpName := Name;
        //作成したフォルダから作成日時を取得
        FindFirst(DelimiterCut(Path), faDirectory, sr);
        try
          CreationDay := FileDateToDateTime(sr.Time);
        finally
          SysUtils.FindClose(sr);
        end;
        Node := MainForm.SelectNode;
        MainForm.TreeView.Items.AddChildObject(Node, Name, Pointer(NewItem)).Selected := True;
      end;
    end;
  end;

  MainForm.FolderSort;
  Self.Close;
end;

procedure TFolderSetDlg.FormCreate(Sender: TObject);
begin
  NameLabeledEdit.OnDblClick := MainForm.ComponentDblClick;
  CommentMemo.OnDblClick := MainForm.ComponentDblClick;
end;

procedure TFolderSetDlg.CancelBtnClick(Sender: TObject);
begin
//  case MainForm.ItemEditMode of
//    imNewFolder: NewItem.Free;
//  end;
end;

procedure TFolderSetDlg.PathLabeledEditMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  PathLabeledEdit.Hint := PathLabeledEdit.Text;
end;

procedure TFolderSetDlg.NameLabeledEditMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Sender is TLabeledEdit then
    TLabeledEdit(Sender).Hint := TLabeledEdit(Sender).Text;
end;

procedure TFolderSetDlg.NameLabeledEditKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  case Key of
    VK_RETURN: OKBtn.Click;
  end;
end;

end.
