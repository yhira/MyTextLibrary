unit BookMarker;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Main, LibraryItem, ImgList, heRaStrings;

type
  TBookMarkForm = class(TForm)
    Panel1: TPanel;
    TreeView1: TTreeView;
    CloseButton: TButton;
    MoveButton: TButton;
    DeleteButton: TButton;
    AllDeleteButton: TButton;
    Panel2: TPanel;
    RichEdit1: TRichEdit;
    ImageList1: TImageList;
    HeaderPanel: TPanel;
    Label1: TLabel;
    FileNameEdit: TEdit;
    Label2: TLabel;
    DsptypeEdit: TEdit;
    Label3: TLabel;
    AddressEdit: TEdit;
    Label4: TLabel;
    CreationDayEdit: TEdit;
    Label5: TLabel;
    UpdateDayEdit: TEdit;
    procedure CloseButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TreeView1Addition(Sender: TObject; Node: TTreeNode);
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure FormPaint(Sender: TObject);
    procedure MoveButtonClick(Sender: TObject);
    procedure TreeView1DblClick(Sender: TObject);
    procedure FileNameEditMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FileNameEditDblClick(Sender: TObject);
    procedure AllDeleteButtonClick(Sender: TObject);
    procedure DeleteButtonClick(Sender: TObject);
    procedure TreeView1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FCreate: Boolean;
    function NodeLevel0Selected(Node: TTreeNode): TTreeNode;
    procedure NodeLevel1Selected(Node: TTreeNode);
    procedure SetEditRect;
    procedure BookMarkDsp;
    procedure SetBtnEnabled(Enabled: Boolean);
    procedure BookMarkDeleteNodeLevel0(Node: TTreeNode; Dialog: Boolean = True);
    procedure BookMarkDeleteNodeLevel1(Node: TTreeNode);
    procedure AllClear;
    { Private 宣言 }
  public
    { Public 宣言 }
  end;

var
  BookMarkForm: TBookMarkForm;

implementation

uses IniFileCompo;

{$R *.dfm}
procedure TBookMarkForm.BookMarkDsp;
var
  i, j: Integer;
  Node: TTreeNode;
  BookSL, ItemSL: TStringList;
  sLine, Bookmark, sName: String;
  iLine: Integer;
  Stream: TStream;
  s: String;
begin
  Screen.Cursor := crHourGlass;
//  TempSL := TStringList.Create;
  BookSL := TStringList.Create;
  try
    with MainForm do begin
      for i := 1 to TreeView.Items.Count -1 do begin
        Node := TreeView.Items[i];
        if TObject(Node.Data) is TTextItem then begin
          ItemSL := TTextItem(Node.Data).Bookmarker;
          if ItemSL.Text <> '' then begin
            sName := TTextItem(Node.Data).Name + TTextItem(Node.Data).Extension;
            BookSL.Add('No.' + IntToStr(Node.AbsoluteIndex) + ':[ ' + sName + ' ]');
            for j := 0 to ItemSL.Count -1 do begin
              s := ItemSL[j];
              iLine := StrToInt(Copy(s, 1, Pos(',', s) -1));
              sLine := IntToStr(iLine + 1);
              Bookmark := #09 + sLine + ':' +  Copy(s, Pos(',', s) + 1, maxint);
              BookSL.Add(Bookmark);
            end;
          end;
        end;
      end;
      TreeView1.Items.BeginUpdate;
      Stream := TStringStream.Create(BookSL.Text);
      TreeView1.LoadFromStream(Stream);
      Stream.Free;
      TreeView1.Items.EndUpdate;
    end;
  finally
//    TempSL.Free;
    BookSL.Free;
    Screen.Cursor := crDefault;
  end;
  MainForm.MouseOnButton(CloseButton);
end;

procedure TBookMarkForm.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TBookMarkForm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with MainForm.FormIniFileCompo do begin
    WriteInt('BookMarker', 'Left', Left);
    WriteInt('BookMarker', 'Top' , Top );
  end;

//  Action := caFree;
end;

procedure TBookMarkForm.TreeView1Addition(Sender: TObject;
  Node: TTreeNode);
begin
  case Node.Level of
    0:
    begin
      Node.ImageIndex := 0;
      Node.SelectedIndex := 0;
    end;
    1:
    begin
      Node.ImageIndex := 1;
      Node.SelectedIndex := 1;
    end;
  end;  
//  TreeView1.Selected := nil;
//  Node.Selected := False;
end;

procedure TBookMarkForm.AllClear;
begin
  FileNameEdit.Clear;
  DsptypeEdit.Clear;
  AddressEdit.Clear;
  CreationDayEdit.Clear;
  UpdateDayEdit.Clear;

  RichEdit1.Clear;
end;

procedure TBookMarkForm.FormCreate(Sender: TObject);
var
  DefLeft, DefTop: Integer;
  WRect: TRect;
begin
  //初期処理
  FCreate := True;

  AllClear;
//  FileNameEdit.Color    := HeaderPanel.Color;
//  DsptypeEdit.Color     := HeaderPanel.Color;
//  AddressEdit.Color     := HeaderPanel.Color;
//  CreationDayEdit.Color := HeaderPanel.Color;
//  UpdateDayEdit.Color   := HeaderPanel.Color;
  RichEdit1.Font.Name := MainForm.RichEdit.Font.Name;

  with MainForm.FormIniFileCompo do begin
    DefLeft := ((Screen.Width - Width) div 5) * 3;
    DefTop  := ((Screen.Height - Height) div 5) * 3;
    Left := ReadInt('BookMarker', 'Left', DefLeft);
    Top  := ReadInt('BookMarker', 'Top' , DefTop );
    SystemParametersInfo(SPI_GETWORKAREA, 0, @WRect, 0);
    if Left > WRect.Right  - Width  then Left := DefLeft;
    if Left < WRect.Left            then Left := DefLeft;
    if Top  > WRect.Bottom - Height then Top  := DefTop;
    if Top  < WRect.Top             then Top  := DefTop;
  end;


  TreeView1.OnChange := nil;
  BookMarkDsp;
  SetBtnEnabled(False);
  if TreeView1.Items.Count = 0 then
    RichEdit1.Text := '現在、しおりは登録されていません。';

end;

function TBookMarkForm.NodeLevel0Selected(Node: TTreeNode): TTreeNode;
var
  s: String;
  iItm: Integer;
  SelNode: TTreeNode;
  FileName, Address, DspType: String;
  CrDay, UpDay: TDateTime;
begin
  MainForm.JumpSeafchTree(Node);
  RichEdit1.Clear;
  s := Node.Text;
  iItm := MainForm.GetTreeItemIndex(s);
  SelNode := MainForm.TreeView.Items[iItm];

  FileName := TTextItem(SelNode.Data).Name + TTextItem(SelNode.Data).Extension;
  Address  := TTextItem(SelNode.Data).FullName;
  DspType  := TTextItem(SelNode.Data).DspType;
  CrDay    := TTextItem(SelNode.Data).CreationDay;
  UpDay    := TTextItem(SelNode.Data).UpdateDay;

  FileNameEdit.Text    := FileName;
  AddressEdit.Text     := Address;
  DsptypeEdit.Text     := DspType;
  CreationDayEdit.Text := DateTimeToStr(CrDay);
  UpdateDayEdit.Text   := DateTimeToStr(UpDay);

  Result := SelNode;
end;

procedure TBookMarkForm.NodeLevel1Selected(Node: TTreeNode);
var
  s: String;
  iLine: Integer;
  TempSL: TStringList;
  Node1: TTreeNode;
  Address: String;
begin
  Node1 := NodeLevel0Selected(Node.Parent);
  s := Node.Text;
  iLine := MainForm.GetLineIndex(s);

  Address := TTextItem(Node1.Data).FullName;
  TempSL := TStringList.Create;
  try
    TempSL.LoadFromFile(Address);
    RichEdit1.Text := TempSL.Text;

    with RichEdit1 do begin
      SelStart := SendMessage(Handle, EM_LINEINDEX, iLine, 0);
      SendMessage(Handle, EM_SCROLLCARET, 0, 0);
//      SendMessage(Handle, WM_VSCROLL, SB_LINEDOWN, 2);
      SelLength := Length(Lines[iLine]);
      SelAttributes.Color := clNavy;
      SelAttributes.Style := [fsBold];
    end;

  finally
    TempSL.Free;
  end;

end;

procedure TBookMarkForm.SetEditRect;
var
  r: TRect;
const
  MARGIN = 10;
begin
  with RichEdit1 do begin
    r := Rect(Margin, 0, ClientWidth - Margin, ClientHeight);
    SendMessage(Handle, EM_SETRECT, 0, Longint(@r));
  end;

end;

procedure TBookMarkForm.SetBtnEnabled(Enabled: Boolean);
begin
  MoveButton.Enabled := Enabled;
  DeleteButton.Enabled := Enabled;
  if TreeView1.Items.Count = 0 then
    AllDeleteButton.Enabled := Enabled;
  Application.ProcessMessages;
end;

procedure TBookMarkForm.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  if Node = nil then begin
    SetBtnEnabled(False);
    Exit;
  end;

  SetBtnEnabled(True);
  case Node.Level of
    0: NodeLevel0Selected(Node);
    1: NodeLevel1Selected(Node);
  end;
end;

procedure TBookMarkForm.FormPaint(Sender: TObject);
begin
  SetEditRect;
  TreeView1.Selected := nil;
  TreeView1.OnChange := TreeView1Change; 
end;

procedure TBookMarkForm.MoveButtonClick(Sender: TObject);
begin
  if TreeView1.Selected = nil then Exit;
//  MainForm.SearchStyle := ssBook;
  MainForm.JumpSeafchTree(TreeView1.Selected);
end;

procedure TBookMarkForm.TreeView1DblClick(Sender: TObject);
var
  P: TPoint;
  Node: TTreeNode;
begin
  //Node取得
  GetCursorPos(P);
  P := TreeView1.ScreenToClient(P);
  Node := TreeView1.GetNodeAt(P.X, P.Y);
  if Node = nil then Exit;
  if Node.Level <> 1 then Exit;

  MainForm.JumpSeafchTree(Node);
end;

procedure TBookMarkForm.FileNameEditMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if Sender is TEdit then begin
    TEdit(Sender).Cursor := crDefault;
    if Canvas.TextWidth(TEdit(Sender).Text) > TEdit(Sender).Width then begin
      TEdit(Sender).Hint := TEdit(Sender).Text;
    end else begin
      TEdit(Sender).Hint := '';
    end;
  end;
end;

procedure TBookMarkForm.FileNameEditDblClick(Sender: TObject);
begin
  if Sender is TEdit then begin
    TEdit(Sender).SelectAll;
  end;
end;

procedure TBookMarkForm.AllDeleteButtonClick(Sender: TObject);
var
  i: Integer;
  Node: TTreeNode;
  Msg: String;
begin
  Msg := Application.Title + 'に登録されているすべてのしおりが削除されますが、削除しますか？';
  if Application.MessageBox(PChar(Msg), '確認',
      MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) = IDYES then begin
    for i := TreeView1.Items.Count -1 downto 0 do begin
      Node := TreeView1.Items[i];
      if Node.Level = 0 then begin
        BookMarkDeleteNodeLevel0(Node, False);
      end;
    end;
    TreeView1.Items.BeginUpdate;
    TreeView1.Items.Clear;
    TreeView1.Items.EndUpdate;
  end;
  MainForm.DeleteAllBookMark;
  AllClear;
  SetBtnEnabled(False);
  if TreeView1.Items.Count = 0 then
    RichEdit1.Text := '現在、しおりは登録されていません。';
end;

procedure TBookMarkForm.DeleteButtonClick(Sender: TObject);
begin
  if TreeView1.Selected = nil then Exit;
  case TreeView1.Selected.Level of
    0:
    begin
      BookMarkDeleteNodeLevel0(TreeView1.Selected);
      AllClear;
      SetBtnEnabled(False);
      if TreeView1.Items.Count = 0 then
        RichEdit1.Text := '現在、しおりは登録されていません。';
    end;
    1: BookMarkDeleteNodeLevel1(TreeView1.Selected);
  end;

end;

procedure TBookMarkForm.BookMarkDeleteNodeLevel0(Node: TTreeNode; Dialog: Boolean);
var
  iItm: Integer;
  SelNode: TTreeNode;
  Msg, s: String;
  i: Integer;
  Item: TListItem;
begin
  with MainForm do begin
    iItm := GetTreeItemIndex(Node.Text);
    SelNode := TreeView.Items[iItm];
    s := TTextItem(SelNode.Data).Name + TTextItem(SelNode.Data).Extension;
    end;
    Msg := 'アイテム "' + s + '" の中のすべてのしおりが削除されますが、削除しますか？';
    if Dialog then
      if Application.MessageBox(PChar(Msg), '確認',
          MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) = IDNO then begin
        Exit;
      end;
    TTextItem(SelNode.Data).Bookmarker.Text := '';
    TreeView1.OnChange := nil;
    Node.Delete;
    TreeView1.Selected := nil;
    TreeView1.OnChange := TreeView1Change;
    
    if SelNode.AbsoluteIndex = iItm then begin
      MainForm.DeleteAllBookMark;

    for i := MainForm.ContentsListView.Items.Count -1 downto 0 do begin
      Item := MainForm.ContentsListView.Items[i];
      if Item.ImageIndex = 0 then begin
        Item.Delete;
      end;


    end;
  end;
end;

procedure TBookMarkForm.BookMarkDeleteNodeLevel1(Node: TTreeNode);
var
  iItm: Integer;
  iLine: Integer;
  i: Integer;
  sLine: String;
  SelNode: TTreeNode;
  BookSL: TStringList;
  Item: TListItem;
begin
  if Node.Parent.Count = 1 then begin
    BookMarkDeleteNodeLevel0(Node.Parent, False);
    if TreeView1.Items.Count = 0 then begin
      AllClear;
      SetBtnEnabled(False);
    end else AllClear;
  end else begin
    with MainForm do begin
      iItm := GetTreeItemIndex(Node.Parent.Text);
      SelNode := TreeView.Items[iItm];
      BookSL := TTextItem(SelNode.Data).Bookmarker;
      iLine := GetLineIndex(Node.Text);
      sLine := IntToStr(iLine);
      for i := BookSL.Count -1 downto 0 do begin
//        ShowMessage(sLine + #13#10 + IntToStr(Pos(sLine, BookSL[i])));
//        ShowMessage(BookSL.Text);
        if Pos(sLine, BookSL[i]) = 1 then begin
          BookSL.Delete(i);
          Node.Delete;
          iLine := RichEdit.LinesToRow(iLine);
          RichEdit.DeleteRowMark(iLine, rm10);
          Break;
        end;
      end;
      for i := ContentsListView.Items.Count -1 downto 0 do begin
        Item := ContentsListView.Items[i];
//        ShowMessage(Item.SubItems[0]+ #13#10 +IntToStr(iLine + 1));
        if (Item.SubItems[0] = IntToStr(iLine + 1)) and (Item.ImageIndex = 0) then begin
          Item.Delete;
          Break;
        end;
      end;
      
    end;
    

  end;
end;
procedure TBookMarkForm.TreeView1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Node: TTreeNode;
begin
  Node := TreeView1.Selected;
  if Node = nil then Exit;
  case Key of
    VK_RETURN:
    begin
      case Node.Level of
        0:
        begin
          if Node.Expanded then begin
            Node.Collapse(True);
          end else begin
            TreeView1.FullCollapse;
            Node.Expand(True);
          end;
        end;
        1: MoveButtonClick(nil);
        else Exit;
      end;
    end;
    VK_BACK, VK_DELETE:
    begin
      DeleteButtonClick(nil);
    end;
  end;

end;

end.
