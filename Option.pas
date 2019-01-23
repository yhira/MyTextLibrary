unit Option;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, Main, Settings, Contnrs, LibraryItem, Spin,
  CLPane, HEditor;


type
  TEditMode = (emNew, emEdit);

  TOptionDlg = class(TForm)
    Panel1: TPanel;
    PageControl: TPageControl;
    FileTypeTabSheet: TTabSheet;
    StandardTabSheet: TTabSheet;
    ExtensionListView: TListView;
    AddExButton: TButton;
    EditExButton: TButton;
    DeleteExButton: TButton;
    FileTypeGroupBox: TGroupBox;
    Panel2: TPanel;
    OKBtn: TButton;
    CancelBtn: TButton;
    DefaultDspComboBox: TComboBox;
    Label1: TLabel;
    ReadOnlyAllCheckBox: TCheckBox;
    FolderInfoCheckBox: TCheckBox;
    ContentsDspCheckBox: TCheckBox;
    EditerTabSheet1: TTabSheet;
    FontGroupBox: TGroupBox;
    FontDspPanel: TPanel;
    Label2: TLabel;
    FontNameComboBox: TComboBox;
    Label3: TLabel;
    FontSizeComboBox: TComboBox;
    MarkGroupBox: TGroupBox;
    NewLineCheckBox: TCheckBox;
    EOFCheckBox: TCheckBox;
    FullSpaceCheckBox: TCheckBox;
    UnderLineCheckBox: TCheckBox;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    AutoIndentCheckBox: TCheckBox;
    Label4: TLabel;
    TabWidthComboBox: TComboBox;
    UndoSpinEdit: TSpinEdit;
    Label5: TLabel;
    RulerCheckBox: TCheckBox;
    LineNoCheckBox: TCheckBox;
    rlBLineCheckBox: TCheckBox;
    ColorDialog1: TColorDialog;
    rlStrLabel: TLabel;
    rlBackLabel: TLabel;
    lnStrLabel: TLabel;
    lnBackLabel: TLabel;
    lnBLineCheckBox: TCheckBox;
    lnZeroLeadCheckBox: TCheckBox;
    lnColumLabel: TLabel;
    lnColumComboBox: TComboBox;
    rlGaugeRangeRadioGroup: TRadioGroup;
    TabCheckBox: TCheckBox;
    WrapCheckBox: TCheckBox;
    HerfSpaceCheckBox: TCheckBox;
    lnDspRadioGroup: TRadioGroup;
    ExpandCheckBox: TCheckBox;
    SearchDspRadioGroup: TRadioGroup;
    HotTrackCheckBox: TCheckBox;
    PopupHintCheckBox: TCheckBox;
    HelpButton: TButton;
    procedure AddExButtonClick(Sender: TObject);
    procedure EditExButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DeleteExButtonClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure OKBtnClick(Sender: TObject);
    procedure CancelBtnClick(Sender: TObject);
    procedure ExtensionListViewDblClick(Sender: TObject);
    procedure ExtensionListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure DisplayTabSheetShow(Sender: TObject);
    procedure FontNameComboBoxChange(Sender: TObject);
    procedure FontSizeComboBoxChange(Sender: TObject);
//    procedure rlStrPanelClick(Sender: TObject);
    procedure RulerCheckBoxClick(Sender: TObject);
    procedure LineNoCheckBoxClick(Sender: TObject);
    procedure rlColorPaneClickOtherBtn(Sender: TObject);
    procedure HelpButtonClick(Sender: TObject);
  private
    procedure AddDspType;
    procedure SelectDspType;
    procedure AddFontName;
    procedure SelectComboBox(Int: Integer; Combo: TComboBox);
    procedure RulerEnabled;
    procedure LineNoEnabled;
    function SetGaugeRange(Index: Integer): Integer;
    function GetGaugeRangeIndex(Gauge: Integer): Integer;
    function ShowNumberModeToInt(SNM: TEditorShowNumberMode): Integer;
//    function IntTo(Int: Integer): TEditorShowNumberMode;
    function IntToShowNumberMode(Int: Integer): TEditorShowNumberMode;
    { Private 宣言 }
  public
    { Public 宣言 }
    EditMode: TEditMode;
    //TempList: TObjectList;
    procedure ExSet(Ex, Kind: String);
    procedure AddExtensionList;
  end;

var
  OptionDlg: TOptionDlg;

implementation

{$R *.dfm}

uses FileType, EditorEx;

procedure TOptionDlg.AddExButtonClick(Sender: TObject);
begin
  FileTypeDlg := TFileTypeDlg.Create(Self);
  try
    EditMode := emNew;
    FileTypeDlg.ShowModal;
  finally
    MainForm.MouseOnButton(OKBtn);
    FileTypeDlg.Free;
  end;

end;

procedure TOptionDlg.EditExButtonClick(Sender: TObject);
var
  Msg: String;
begin
  if ExtensionListView.Selected = nil then
  begin
    Msg := '編集したいファイルの種類を選択して下さい。';
    Application.MessageBox(PChar(Msg), PChar(Application.Title), MB_ICONINFORMATION);
    Abort;
  end;

  FileTypeDlg := TFileTypeDlg.Create(Self);
  try
    EditMode := emEdit;
    FileTypeDlg.ShowModal;
  finally
    MainForm.MouseOnButton(OKBtn);
    FileTypeDlg.Free;
  end;
end;

procedure TOptionDlg.ExSet(Ex, Kind: String);
var
  ListItem : TListItem;
begin
  ListItem := ExtensionListView.Items.Add;
  ListItem.Caption := Ex;
  ListItem.SubItems.Add(Kind);
end;

procedure TOptionDlg.FormCreate(Sender: TObject);
begin
//  UndoSpinEdit.MaxValue := MaxInt;
  //TempList := TObjectList.Create;
  //MainForm.TempList := MainForm.OptionSetting.FileTypeList;
end;

procedure TOptionDlg.FormDestroy(Sender: TObject);
begin
  //TempList.Free;
end;

procedure TOptionDlg.DeleteExButtonClick(Sender: TObject);
var
  Msg, s: String;
  i: Integer;
  ListItem: TListItem;

  procedure DspTypeDelete(DelStr: String);
  var
    i: Integer;
  begin
    with MainForm.TreeView do
      for i := 0 to Items.Count -1 do
        if TObject(Items[i].Data) is TTextItem then
          if TTextItem(Items[i].Data).DspType = DelStr then
            TTextItem(Items[i].Data).DspType :=
              TFileType(ExtensionListView.Items[0].Data).Name;

  end;

begin
  if ExtensionListView.Selected = nil then
  begin
    Msg := '削除したいファイルの種類を選択して下さい。';
    Application.MessageBox(PChar(Msg), PChar(Application.Title), MB_ICONINFORMATION);
    Abort;
  end;

  i := ExtensionListView.Selected.Index;
  ListItem := ExtensionListView.Items[i];
  s := TFileType(ListItem.Data).Name;
  Msg := '"' + s + '" を削除していいですか？';
  if Application.MessageBox(PChar(Msg), '確認',
                            MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) = IDYES then
  begin
//    if DeleteFile(MainForm.MyFileTypeDataPath + s + '.ini') then
//    begin
      DeleteFile(MainForm.MyFileTypeDataPath + s + '.ini');
      MainForm.OptionSetting.FileTypeList.Delete(i);
      ExtensionListView.Selected.Delete;
      DspTypeDelete(s);
      //AddExtensionList;

      Exit;
//    end;
  end;


end;

procedure TOptionDlg.FormActivate(Sender: TObject);
begin
  MainForm.MouseOnButton(OKBtn);
end;

procedure TOptionDlg.FormShow(Sender: TObject);
var
  i: Integer;
  ListItem: TListItem;

  function BoolToListViewStr(ABooi: Boolean): String;
  begin
    if ABooi then
      Result := 'ON'
    else
      Result := 'OFF';
  end;

begin
  PageControl.ActivePage := StandardTabSheet;
  ExtensionListView.Items.BeginUpdate;
  with MainForm.OptionSetting do
  begin
    for i := 0 to FileTypeList.Count -1 do
    begin
      ListItem := ExtensionListView.Items.Add;
      ListItem.Data := Pointer(FileTypeList[i]);
      ListItem.Caption := TFileType(FileTypeList[i]).Name;
      ListItem.SubItems.Add(TFileType(FileTypeList[i]).Extension.CommaText);
      ListItem.SubItems.Add(BoolToListViewStr(TFileType(FileTypeList[i]).ContentsDisplay));
      ListItem.SubItems.Add(BoolToListViewStr(TFileType(FileTypeList[i]).EmphasisDisplay));
//      ListItem.SubItems[0] := TFileType(FileTypeList[i]).Extension.CommaText;
//      ListItem.SubItems[1] := BoolToListViewStr(TFileType(FileTypeList[i]).ContentsDisplay);
//      ListItem.SubItems[2] := BoolToListViewStr(TFileType(FileTypeList[i]).EmphasisDisplay);
    end;
  end;
  ExtensionListView.Items.EndUpdate;
  if ExtensionListView.Selected = nil then
  begin
    EditExButton.Enabled := False;
    DeleteExButton.Enabled := False;
  end;

  with MainForm.OptionSetting, MainForm.RichEdit do
  begin
    //標準
    ReadOnlyAllCheckBox.Checked   := Standard.ReadOnlyAll;
    FolderInfoCheckBox.Checked    := Standard.FolderInfoDsp;
    ContentsDspCheckBox.Checked   := Standard.ContentsDsp;
    ExpandCheckBox.Checked        := Standard.Expand;
    SearchDspRadioGroup.ItemIndex := MainForm.SearchDspToInt(Standard.SearchDsp);
    HotTrackCheckBox.Checked      := Standard.HotTrack;
    PopupHintCheckBox.Checked     := Standard.PopupHint;

    //表示
    AddDspType;
    SelectDspType;

    //エディタ
    AddFontName;                                          //フォント名
    SelectComboBox(Font.Size, FontSizeComboBox); //フォントサイズ
    AutoIndentCheckBox.Checked       := Caret.AutoIndent;
    UndoSpinEdit.Value               := UndoListMax;
    SelectComboBox(Caret.TabSpaceCount, TabWidthComboBox); //タブ幅

    NewLineCheckBox.Checked          := Marks.RetMark.Visible;
    EOFCheckBox.Checked              := Marks.EofMark.Visible;
    FullSpaceCheckBox.Checked        := ExMarks.DBSpaceMark.Visible;
    HerfSpaceCheckBox.Checked        := ExMarks.SpaceMark.Visible;
    TabCheckBox.Checked              := ExMarks.TabMark.Visible;
    WrapCheckBox.Checked             := Marks.WrapMark.Visible;
    UnderLineCheckBox.Checked        := Marks.Underline.Visible;

    RulerCheckBox.Checked            := Ruler.Visible;
    rlGaugeRangeRadioGroup.ItemIndex := GetGaugeRangeIndex(Ruler.GaugeRange);
    rlBLineCheckBox.Checked          := Ruler.Edge;
//    rlColorPane.Color                 := Ruler.Color;
//    rlBKColorPane.Color                := Ruler.BkColor;

    LineNoCheckBox.Checked           := Leftbar.Visible;
    lnZeroLeadCheckBox.Checked       := Leftbar.ZeroLead;
    SelectComboBox(Leftbar.Column, lnColumComboBox);//桁数
    lnBLineCheckBox.Checked          := Leftbar.Edge;
//    lnColorPane.Color                := Leftbar.Color;
//    lnBKColorPane.Color              := Leftbar.BkColor;
    lnDspRadioGroup.ItemIndex        := ShowNumberModeToInt(Leftbar.ShowNumberMode);
  end;



  RulerEnabled;
  LineNoEnabled;
end;

function TOptionDlg.ShowNumberModeToInt(SNM: TEditorShowNumberMode): Integer;
begin
  Result := 0;
  case SNM of
    nmRow:  Result := 0;
    nmLine: Result := 1;
  end;

end;

procedure TOptionDlg.OKBtnClick(Sender: TObject);
//var
//  i, Idx: Integer;
//  ListItem: TListItem;
begin
  with MainForm.OptionSetting, MainForm.RichEdit do
  begin
    //標準                                               
    Standard.ReadOnlyAll   := ReadOnlyAllCheckBox.Checked;
    Standard.FolderInfoDsp := FolderInfoCheckBox.Checked;
    Standard.ContentsDsp   := ContentsDspCheckBox.Checked;
    Standard.Expand        := ExpandCheckBox.Checked;
    Standard.SearchDsp     := MainForm.IntToSearchDsp(SearchDspRadioGroup.ItemIndex);
    if Standard.ContentsDsp = False then MainForm.ContentsListView.Clear;
    Standard.HotTrack      := HotTrackCheckBox.Checked;
    Standard.PopupHint     := PopupHintCheckBox.Checked;

    //表示
    Display.DefaultDspType := DefaultDspComboBox.Text;

    //エディタ
    Font.Name               := FontNameComboBox.Text;
    Font.Size               := StrToInt(FontSizeComboBox.Text);
    Caret.AutoIndent        := AutoIndentCheckBox.Checked;
    UndoListMax             := UndoSpinEdit.Value;
    Caret.TabSpaceCount     := StrToInt(TabWidthComboBox.Text);
    Marks.RetMark.Visible   := NewLineCheckBox.Checked;
    ExMarks.DBSpaceMark.Visible := FullSpaceCheckBox.Checked;
    ExMarks.SpaceMark.Visible := HerfSpaceCheckBox.Checked;
    ExMarks.TabMark.Visible := TabCheckBox.Checked;
    Marks.WrapMark.Visible := WrapCheckBox.Checked;
    Marks.EofMark.Visible   := EOFCheckBox.Checked;
    Marks.Underline.Visible := UnderLineCheckBox.Checked;
    Ruler.Visible           := RulerCheckBox.Checked;
    Ruler.GaugeRange        := SetGaugeRange(rlGaugeRangeRadioGroup.ItemIndex);
    Ruler.Edge              := rlBLineCheckBox.Checked;
//    Ruler.Color             := rlColorPane.Color;
//    Ruler.BkColor           := rlBKColorPane.Color;
    Leftbar.Visible         := LineNoCheckBox.Checked;
    Leftbar.ZeroLead        := lnZeroLeadCheckBox.Checked;
    Leftbar.Column          := StrToInt(lnColumComboBox.Text);
    Leftbar.Edge            := lnBLineCheckBox.Checked;
//    Leftbar.Color           := lnColorPane.Color;
//    Leftbar.BkColor         := lnBKColorPane.Color;
    Leftbar.ShowNumberMode  := IntToShowNumberMode(lnDspRadioGroup.ItemIndex);
  end;
  MainForm.OptionSettingReflection;
end;

function TOptionDlg.IntToShowNumberMode(Int: Integer): TEditorShowNumberMode;
begin
  Result := nmRow;
  case Int of
    0: Result := nmRow;
    1: Result := nmLine;
  end;

end;

procedure TOptionDlg.CancelBtnClick(Sender: TObject);
begin
  //MainForm.OptionSetting.FileTypeList := MainForm.TempList;
  AddExtensionList;
end;

procedure TOptionDlg.ExtensionListViewDblClick(Sender: TObject);
begin
  if ExtensionListView.Selected <> nil then
    EditExButton.Click;
end;

procedure TOptionDlg.ExtensionListViewSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
  //\f
  case Item.Index of
    0, 1, 2, 3, 4, 5, 6, 7, 8, 9:
    begin
      EditExButton.Enabled := True;
      DeleteExButton.Enabled := False;
    end;
    else
    begin
      EditExButton.Enabled := True;
      DeleteExButton.Enabled := True;
    end;
  end;

//  if Item.Index = 0 then
//  begin
//    EditExButton.Enabled := True;
//    DeleteExButton.Enabled := False;
//  end
//  else
//  begin
//    EditExButton.Enabled := True;
//    DeleteExButton.Enabled := True;
//  end;

end;

procedure TOptionDlg.DisplayTabSheetShow(Sender: TObject);
begin
  AddDspType;
  SelectDspType;
end;

procedure TOptionDlg.AddDspType;
var
  i: Integer;
  s: String;
begin
  DefaultDspComboBox.Clear;
  with MainForm.OptionSetting do
  begin
    for i := 0 to FileTypeList.Count -1 do
    begin
      s := TFileType(FileTypeList[i]).Name;
      DefaultDspComboBox.Items.Add(s);    
    end;
  end;
end;

procedure TOptionDlg.SelectDspType;
var
  s: String;
  i: Integer;
begin
  s := MainForm.OptionSetting.Display.DefaultDspType;
  i :=  DefaultDspComboBox.Items.IndexOf(s);
  if i <> -1 then
    DefaultDspComboBox.ItemIndex := i
  else
    DefaultDspComboBox.ItemIndex := 0;
end;

procedure TOptionDlg.AddExtensionList; 
var
  i, j: Integer;
  ExtSL: TStringList;
  s: String;
begin
  with MainForm.OptionSetting do
  begin
    ExtensionList.Clear;
    for i := 0 to FileTypeList.Count -1 do
    begin
      ExtSL := TFileType(FileTypeList[i]).Extension;
      for j := 0 to ExtSL.Count -1 do
      begin
        s := ExtSL[j];
        s := ExtractFileExt(s);
        ExtensionList.Add(s);
      end;
    end;
//    ShowMessage(ExtensionList.Text);
  end;



end;

procedure TOptionDlg.AddFontName;
var
  i: Integer;
begin
  with FontNameComboBox, MainForm do
  begin
    Clear;
    FontNameComboBox.Items := Screen.Fonts;
    i := Items.IndexOf(MainForm.RichEdit.Font.Name);
    ItemIndex := i;
    FontDspPanel.Font.Name := MainForm.RichEdit.Font.Name;
  end;

end;

procedure TOptionDlg.SelectComboBox(Int: Integer; Combo: TComboBox);
var
  i: Integer;
begin

  i := Combo.Items.IndexOf(IntToStr(Int));
  Combo.ItemIndex := i;

end;

procedure TOptionDlg.FontNameComboBoxChange(Sender: TObject);
begin
  FontDspPanel.Font.Name := FontNameComboBox.Text;
  FontDspPanel.Font.Size := StrToInt(FontSizeComboBox.Text);
end;

procedure TOptionDlg.FontSizeComboBoxChange(Sender: TObject);
begin
//  FontDspPanel.Font.Size := StrToInt(FontSizeComboBox.Text);
end;

//procedure TOptionDlg.rlStrPanelClick(Sender: TObject);
//begin
//  if TObject(Sender) is TPanel then
//  begin
//    ColorDialog1.Color := TPanel(Sender).Color;
//    if ColorDialog1.Execute then
//      TPanel(Sender).Color := ColorDialog1.Color;
//  end;
//end;

procedure TOptionDlg.RulerEnabled;
begin
//  rl10RadioButton.Enabled := RulerCheckBox.Checked;
//  rl8RadioButton.Enabled  := RulerCheckBox.Checked;
  rlGaugeRangeRadioGroup.Enabled := RulerCheckBox.Checked;
  rlBLineCheckBox.Enabled      := RulerCheckBox.Checked;
//  rlColorPane.Enabled          := RulerCheckBox.Checked;
//  rlBKColorPane.Enabled        := RulerCheckBox.Checked;
  rlStrLabel.Enabled           := RulerCheckBox.Checked;
  rlBackLabel.Enabled          := RulerCheckBox.Checked;
  if RulerCheckBox.Checked then
  begin
    rlGaugeRangeRadioGroup.Font.Color := clBlack;
  end
  else
    rlGaugeRangeRadioGroup.Font.Color := clGrayText;
end;

procedure TOptionDlg.RulerCheckBoxClick(Sender: TObject);
begin
  RulerEnabled;
end;

procedure TOptionDlg.LineNoEnabled;
begin
  lnStrLabel.Enabled         := LineNoCheckBox.Checked;
//  lnColorPane.Enabled        := LineNoCheckBox.Checked;
  lnBackLabel.Enabled        := LineNoCheckBox.Checked;
//  lnBKColorPane.Enabled      := LineNoCheckBox.Checked;
  lnBLineCheckBox.Enabled    := LineNoCheckBox.Checked;
  lnZeroLeadCheckBox.Enabled := LineNoCheckBox.Checked;
  lnColumLabel.Enabled       := LineNoCheckBox.Checked;
  lnColumComboBox.Enabled    := LineNoCheckBox.Checked;
  lnDspRadioGroup.Enabled    := LineNoCheckBox.Checked;
end;

procedure TOptionDlg.LineNoCheckBoxClick(Sender: TObject);
begin
  LineNoEnabled;
end;

function TOptionDlg.GetGaugeRangeIndex(Gauge: Integer): Integer;
begin
  if Gauge = 10 then
    Result := 0
  else
    Result := 1;
end;

function TOptionDlg.SetGaugeRange(Index: Integer): Integer;
begin
  if Index = 0 then
    Result := 10
  else
    Result := 8;
end;

procedure TOptionDlg.rlColorPaneClickOtherBtn(Sender: TObject);
begin
  ColorDialog1.Color := TColorPane(Sender).Color;
  if ColorDialog1.Execute then
    TColorPane(Sender).Color := ColorDialog1.Color;

end;

//function TOptionDlg.IntTo(Int: Integer): TEditorShowNumberMode;
//begin
//
//end;

procedure TOptionDlg.HelpButtonClick(Sender: TObject);
begin
  case PageControl.ActivePageIndex of
    0: MainForm.HelpHelpContextDisplay(000026);
    1: MainForm.HelpHelpContextDisplay(000027);
    2: MainForm.HelpHelpContextDisplay(000028);
  end;
end;

end.

