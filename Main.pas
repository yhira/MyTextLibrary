unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ComCtrls, ToolWin, Menus, StdCtrls, ActnList, ImgList,
  StdActns, IniFileCompo, commctrl, Clipbrd, Settings, Contnrs, IniFiles,
  AddContents, FolderDialog, HEditor, heClasses, heRaStrings, htSearch,
  HTMLFountain, heFountain, DelphiFountain, PerlFountain, PLSQLFountain,
  JSPFountain, COBOLFountain, JavaFountain, CppFountain, hOleddEditor,
  EditorEx, RubyFountain, HEdtProp, EditorExprop, ShellApi,LibraryItem,
  HViewEdt, DateUtils;
                    
const                               
  VER_INFO = 'Version 0.83';
  URL = '今んとこなし';
  COPYRIGHT = 'Copyright (C) 2003-2010 by yhira';

  INI_CONFIG = 'Config.ini';
  INI_OPTION = 'Option.ini';

type
  TItemEditMode = (imNone, imNewFolder, imPropertyFolder, imNewFile,
                   imPropertyFile, imImport);
  TSearchStyle = (ssNone, ssItemName, ssFolder, ssText, ssAll, ssBook);

  TSortMode = (smNone, smFolder, smAlphaUp, smAlphaDown,
               smDayUp, smDayDown, smUpDayUp, smUpDayDown,
               smExt, smDspType);


  TMainForm = class(TForm)
    MainMenu1: TMainMenu;  
    RichEdit: TEditorEx;
    CoolBar1: TCoolBar;
    StatusBar: TStatusBar;
    FileToolBar: TToolBar;
    PanelT: TPanel;
    SplitterT: TSplitter;
    PanelL: TPanel;
    SplitterL: TSplitter;
    PanelM: TPanel;
    ActionList1: TActionList;
    ListView: TListView;
    TreeView: TTreeView;
    FileOpenAction: TAction;
    FolderOpenAction: TAction;
    TreeItemImageList: TImageList;
    ToolImageList: TImageList;
    PrintAction: TAction;
    PrintPreviewAction: TAction;
    PrintSetAction: TAction;
    CloseAction: TAction;
    File1: TMenuItem;
    O1: TMenuItem;
    F1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    EditSelectAllAction: TEditSelectAll;
    Edit1: TMenuItem;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Delete1: TMenuItem;
    N3: TMenuItem;
    Undo1: TMenuItem;
    N4: TMenuItem;
    A1: TMenuItem;
    DisplayToolBar: TToolBar;
    SearchToolBar: TToolBar;
    NewFileAction: TAction;
    N5: TMenuItem;
    New1: TMenuItem;
    Show1: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    PanelMain: TPanel;
    AddressToolBar: TToolBar;
    AddressComboBox: TComboBox;
    NewFileToolButton: TToolButton;
    FileOpenToolButton: TToolButton;
    FolderOpenToolButton: TToolButton;
    EditRedoAction: TAction;
    Repeat1: TMenuItem;
    SearchComboBox: TComboBox;
    SearchToolButton: TToolButton;
    SearchMarkToolButton: TToolButton;
    AddressLabel: TLabel;
    AddressToolButton: TToolButton;
    SearchLabel: TLabel;
    ToolButton2: TToolButton;
    WordWrapAction: TAction;
    R2: TMenuItem;
    WordWrapToolButton: TToolButton;
    FormIniFileCompo: TIniFileCompo;
    SettingAction: TAction;
    HelpAction: THelpContents;
    BugReportAction: TAction;
    AboutAction: TAction;
    T1: TMenuItem;
    N9: TMenuItem;
    tbFileAction: TAction;
    F2: TMenuItem;
    tbEditAction: TAction;
    tbDisplayAction: TAction;
    tbAddressAction: TAction;
    tbSearchAction: TAction;
    Show2: TMenuItem;
    Find1: TMenuItem;
    A2: TMenuItem;
    RichEditPopup: TPopupMenu;
    Undo2: TMenuItem;
    Repeat2: TMenuItem;
    N10: TMenuItem;
    Cut2: TMenuItem;
    Copy2: TMenuItem;
    Paste2: TMenuItem;
    Delete2: TMenuItem;
    N11: TMenuItem;
    A3: TMenuItem;
    Find2: TMenuItem;
    ool1: TMenuItem;
    Help1: TMenuItem;
    O2: TMenuItem;
    B1: TMenuItem;
    About1: TMenuItem;
    extLibraryS1: TMenuItem;
    SearchAction: TAction;
    Find3: TMenuItem;
    NewFolderAction: TAction;
    C1: TMenuItem;
    TreeViewPopup: TPopupMenu;
    C2: TMenuItem;
    SearchSelectComboBox: TComboBox;
    EditItemAction: TAction;
    N13: TMenuItem;
    N14: TMenuItem;
    DeleteItemAction: TAction;
    Copy3: TMenuItem;
    New2: TMenuItem;
    GoAddressAction: TAction;
    ToolButton3: TToolButton;
    ToolButton5: TToolButton;
    OpenDialog1: TOpenDialog;
    TextAreaPanel: TPanel;
    DocumentNameLabel: TLabel;
    ContentsPageControl: TPageControl;
    FileDspTabSheet: TTabSheet;
    ContentsDspTabSheet: TTabSheet;
    ContentsListView: TListView;
    EditCutAction: TAction;
    EditCopyAction: TAction;
    EditUndoAction: TAction;
    EditDeleteAction: TAction;
    EditPasteAction: TAction;
    OptionIniFileCompo: TIniFileCompo;
    OpenFromEditerAction: TAction;
    N15: TMenuItem;
    O3: TMenuItem;
    F3: TMenuItem;
    FolderDialog1: TFolderDialog;
    ClipToFileAction: TAction;
    N16: TMenuItem;
    C3: TMenuItem;
    UpTimer: TTimer;
    DownTimer: TTimer;
    SearchTabSheet: TTabSheet;
    SearchListView: TListView;
    Panel1: TPanel;
    EditToolBar: TToolBar;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton4: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    GoToTopAction: TAction;
    GoToButtomAction: TAction;
    N17: TMenuItem;
    J1: TMenuItem;
    GoToTopAction1: TMenuItem;
    GoToButtomAction1: TMenuItem;
    S2: TMenuItem;
    N18: TMenuItem;
    SortAlphaDownAction: TAction;
    SortAlphaUpAction: TAction;
    SortDayUoAction: TAction;
    SortDayDownAction: TAction;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    SortExtAction: TAction;
    SortDspTypeAction: TAction;
    SortUpDayUpAction: TAction;
    SortUpDayDownAction: TAction;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    S3: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    N41: TMenuItem;
    LayoutDocumentAreaAction: TAction;
    LayoutListViewAreaAction: TAction;
    ToolButton16: TToolButton;
    ToolButton17: TToolButton;
    LeftTimer: TTimer;
    RightTimer: TTimer;
    HitImageList: TImageList;

    SetBookMarkAction: TAction;
    N42: TMenuItem;
    N43: TMenuItem;
    DeleteBookMarkAction: TAction;
    W1: TMenuItem;
    DelphiFountain: TDelphiFountain;
    HTMLFountain: THTMLFountain;
    PerlFountain: TPerlFountain;
    CppFountain: TCppFountain;
    JavaFountain: TJavaFountain;
    COBOLFountain: TCOBOLFountain;
    JSPFountain: TJSPFountain;
    PLSQLFountain: TPLSQLFountain;
    RubyFountain: TRubyFountain;
    EditorExProp: TEditorExProp;
    MarkerAction: TAction;
    DeleteAllBookMarkAction: TAction;
    M1: TMenuItem;
    TreeViewForSearch: TTreeView;
    FolderOpenIncludeSubAction: TAction;
    N12: TMenuItem;
    SpaSearchToolButton: TToolButton;
    PageSearchUpToolButton: TToolButton;
    PageSearchDownToolButton: TToolButton;
    PageSearchDownAction: TAction;
    PageSearchUpAction: TAction;
    N44: TMenuItem;
    N45: TMenuItem;
    P1: TMenuItem;
    SearchCancelToolButton: TToolButton;
    SearchCancelAction: TAction;
    AllExpandAction: TAction;
    AllCollapceAction: TAction;
    N46: TMenuItem;
    N47: TMenuItem;
    N48: TMenuItem;
    I1: TMenuItem;
    C4: TMenuItem;
    O4: TMenuItem;
    BookMarkManagerAction: TAction;
    B2: TMenuItem;
    ContentsPopupMenu: TPopupMenu;
    RefleshContentsAction: TAction;
    N49: TMenuItem;
    SettingToolBar: TToolBar;
    ToolButton18: TToolButton;
    ToolButton19: TToolButton;
    tbSettigAction: TAction;
    tbSettigAction1: TMenuItem;
    SearchDspTextAction: TAction;
    N50: TMenuItem;
    N51: TMenuItem;
    EditorOptionAction: TAction;
    E1: TMenuItem;
    procedure FormCreate(Sender: TObject);
//    procedure Layout1ActionExecute(Sender: TObject);
//    procedure Layout2ActionExecute(Sender: TObject);
    procedure AddressToolBarResize(Sender: TObject);
    procedure SearchToolBarResize(Sender: TObject);
    procedure StatusBarResize(Sender: TObject);
    procedure WordWrapActionExecute(Sender: TObject);
    procedure tbFileActionExecute(Sender: TObject);
    procedure tbEditActionExecute(Sender: TObject);
    procedure tbDisplayActionExecute(Sender: TObject);
    procedure tbAddressActionExecute(Sender: TObject);
    procedure tbSearchActionExecute(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure BugReportActionExecute(Sender: TObject);
    procedure NewFolderActionExecute(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TreeViewAddition(Sender: TObject; Node: TTreeNode);
    procedure EditItemActionExecute(Sender: TObject);
    procedure TreeViewPopupPopup(Sender: TObject);
    procedure DeleteItemActionExecute(Sender: TObject);
    procedure NewFileActionExecute(Sender: TObject);
    procedure TreeViewChange(Sender: TObject; Node: TTreeNode);
    procedure TreeViewChanging(Sender: TObject; Node: TTreeNode;
      var AllowChange: Boolean);
    procedure GoAddressActionExecute(Sender: TObject);
    procedure SettingActionExecute(Sender: TObject);
    procedure TreeViewMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure EditCopyActionExecute(Sender: TObject);
    procedure EditCutActionExecute(Sender: TObject);
    procedure EditDeleteActionExecute(Sender: TObject);
    procedure EditPasteActionExecute(Sender: TObject);
    procedure TreeViewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ContentsListViewMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FileOpenActionExecute(Sender: TObject);
    procedure ListViewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FolderOpenActionExecute(Sender: TObject);
    procedure TreeViewCollapsing(Sender: TObject; Node: TTreeNode;
      var AllowCollapse: Boolean);
    procedure ClipToFileActionExecute(Sender: TObject);
    procedure UpTimerTimer(Sender: TObject);
    procedure DownTimerTimer(Sender: TObject);
    procedure TreeViewDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TreeViewDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure SearchActionExecute(Sender: TObject);
    procedure SearchComboBoxKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SearchListViewMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure GoToTopActionExecute(Sender: TObject);
    procedure GoToButtomActionExecute(Sender: TObject);
    procedure ContentsListViewMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure ContentsListViewColumnClick(Sender: TObject;
      Column: TListColumn);
    procedure ContentsListViewCompare(Sender: TObject; Item1,
      Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure SearchListViewCompare(Sender: TObject; Item1,
      Item2: TListItem; Data: Integer; var Compare: Integer);
    procedure SearchListViewMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormResize(Sender: TObject);
    procedure TreeViewCompare(Sender: TObject; Node1, Node2: TTreeNode;
      Data: Integer; var Compare: Integer);
    procedure SortAlphaUpActionExecute(Sender: TObject);
    procedure SortAlphaDownActionExecute(Sender: TObject);
    procedure SortDayUoActionExecute(Sender: TObject);
    procedure SortDayDownActionExecute(Sender: TObject);
    procedure SortUpDayUpActionExecute(Sender: TObject);
    procedure SortUpDayDownActionExecute(Sender: TObject);
    procedure SortExtActionExecute(Sender: TObject);
    procedure SortDspTypeActionExecute(Sender: TObject);
    procedure ListViewCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure LayoutDocumentAreaActionExecute(Sender: TObject);
    procedure LayoutListViewAreaActionExecute(Sender: TObject);
    procedure LeftTimerTimer(Sender: TObject);
    procedure RightTimerTimer(Sender: TObject);
    procedure EndTimerTimer(Sender: TObject);
    procedure AboutActionExecute(Sender: TObject);
    procedure ContentsListViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure EditUndoActionExecute(Sender: TObject);
    procedure EditRedoActionExecute(Sender: TObject);
    procedure RichEditChange(Sender: TObject);
    procedure RichEditCaretMoved(Sender: TObject);
    procedure SetBookMarkActionExecute(Sender: TObject);
    procedure GetBookMark;
    procedure DeleteBookMarkActionExecute(Sender: TObject);
    procedure MarkerActionExecute(Sender: TObject);
    procedure SearchComboBoxChange(Sender: TObject);
    procedure RichEditSelectionChange(Sender: TObject; Selected: Boolean);
    procedure EditSelectAllActionExecute(Sender: TObject);
    procedure CloseActionExecute(Sender: TObject);
    procedure DeleteAllBookMarkActionExecute(Sender: TObject);
    procedure RichEditMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure RichEditDblClick(Sender: TObject);
    procedure TreeViewForSearchMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure TreeViewForSearchExpanding(Sender: TObject; Node: TTreeNode;
      var AllowExpansion: Boolean);
    procedure TreeViewForSearchAdvancedCustomDrawItem(
      Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
      Stage: TCustomDrawStage; var PaintImages, DefaultDraw: Boolean);
    procedure PrintActionExecute(Sender: TObject);
    procedure PrintSetActionExecute(Sender: TObject);
    procedure TreeViewForSearchChange(Sender: TObject; Node: TTreeNode);
//    procedure PrintPreviewActionExecute(Sender: TObject);
    procedure FolderOpenIncludeSubActionExecute(Sender: TObject);
    procedure RichEditExit(Sender: TObject);
    procedure PageSearchDownActionExecute(Sender: TObject);
    procedure PageSearchUpActionExecute(Sender: TObject);
    procedure TreeViewForSearchExpanded(Sender: TObject; Node: TTreeNode);
    procedure TreeViewForSearchMouseMove(Sender: TObject;
      Shift: TShiftState; X, Y: Integer);
    procedure AllExpandActionExecute(Sender: TObject);
    procedure AllCollapceActionExecute(Sender: TObject);
    procedure BookMarkManagerActionExecute(Sender: TObject);
    procedure RefleshContentsActionExecute(Sender: TObject);
    procedure TreeViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tbSettigActionExecute(Sender: TObject);
    procedure SearchCancelToolButtonMouseDown(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure RichEditDropFiles(Sender: TObject; Drop, KeyState: Integer;
      Point: TPoint);
    procedure HelpActionExecute(Sender: TObject);
    procedure SearchComboBoxEnter(Sender: TObject);
    procedure SearchComboBoxExit(Sender: TObject);
    procedure SearchDspTextActionExecute(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure RichEditMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure RichEditMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure EditorOptionActionExecute(Sender: TObject);
  private
    { Private 宣言 }
    SearchString: String;
		FSortIndex: Integer;
		FSortOrder: Boolean;

    FSearchCancel: Boolean;

    FHits: Cardinal;

    FFileCount: Integer; //フォルダのファイル数を数えるときに使用

    FCreateFlag: Boolean;
    FCloseFlag: Boolean;
//    FTempStrList: TStringList; //インポート時使用

    FDragCancel: Boolean;
    //OldNode: TTreeNode;
    OldNode, SearchNode: TTreeNode;



    OldListViewPanelWidth: Integer;
//    AddContentsThread: TAddContentsThread;
    procedure ReadWindow;    //Window状態の読み込み
    procedure WriteWindow;   //Window状態の保存
//    procedure ListViewToTheTop;
//    procedure ListViewToTheLeft;
    procedure ShowHint(Sender: TObject); //ステータスバーのヒント表示イベント
    procedure LoadTreeView;
    procedure TreeActionEnable;   //TreeViewアクションのEnableのON,OFF
    procedure EditActionEnable;
    procedure NodeTextSave(SelNode: TTreeNode);
    procedure NodePathReName;
    procedure AddComboBox(const FileName: String; ComboBox: TComboBox);
    procedure AddNodeChildrenDspToListView(ANode: TTreeNode);
    function ReadOnlyJudgment(ANode: TTreeNode): Boolean;
    procedure AppShowHint(var HintStr: string;
      var CanShow: Boolean; var HintInfo: THintInfo);
    procedure FileTypeSaveToFile;
    procedure FileTypeLoadFromFile;
    procedure OptionSaveToFile;
    procedure OptionLoadFromFile;
    function GetFileUpdateDay(FileName: String): TDateTime;
    function GetFileCreateDay(FileName: String): TDateTime;
    function GetFileName(FileName, Exe: String): String;
    function GetDspType(Ext: String): String;
    procedure ImportFile(OldFileName, NewFileName: String; ParentNode: TTreeNode; SubFolder: Boolean);
    function FindTextItem(ANode: TTreeNode; SubStr: String): TTreeNode;
    function GetFileCount(Dir: String; SubFolder: Boolean): Integer;
    procedure ContentsShowHint(var HintStr: string;
      var CanShow: Boolean; var HintInfo: THintInfo);
    procedure SearchShowHint(var HintStr: string;
      var CanShow: Boolean; var HintInfo: THintInfo);
    procedure AutoScrollForTreeView(X, Y:Integer);
    procedure ChangeAttributes(FileName: String);
    procedure SearchItemName;
    procedure SearchSelectFolder;
    procedure SearchText;
    procedure SearchAll;
    procedure SearchFolder(sNode: TTreeNode);
    procedure SearchChildFolder(SubStr: String; n: TTreeNode; sl: TStringList);
    function NodeChildCount(n: TTreeNode): Cardinal;
    procedure ContentsJump(Item: TListItem; idx: Integer);
    procedure SearchJump(Item: TListItem);   //サーチアイテムを選択したとき
    procedure TreeChange(Node: ttreenode);   //ノードを変更したとき
//    procedure SetMargin;
    function FindStr(Editor: TEditor; Count, Max: Integer): String; overload;
    procedure LayoutCheckFalse;
    function FileTypeJudgment(DspType: String): TFileType;
    function HeadLine(Line: Integer): Integer;
    procedure EmphasisDsp(Node: TTreeNode);
    procedure SetWordWrapColCount;
    procedure SearchChildFolderLight(SubStr: String; n: TTreeNode; sl,
      ResultSL: TStringList);
    procedure SearchItemNameEx;
    procedure SearchItemNameExLight(ResultSL: TStringList);
    procedure SearchTextEx;
    procedure SearchTextExLight(ResultSL: TStringList);
    procedure JumpTreeLevel0(Node: TTreeNode);
    procedure JumpTreeLevel1(Node: TTreeNode);
    procedure JumpSearchStr(Line: Integer);
//    function LineEndCount(lCount, pCount, nowpCount,
//      slCount: Integer): Integer;
//    function TabString(TabCount: Integer): String;
//    function LineCut(s: String; CutCount: Integer): String;
//    procedure PrintPreviewSet;
    procedure FolderImport(SubFolder: Boolean = False);
    procedure ImportFileEx(OldFileName, NewFileName: String;
      ParentNode: TTreeNode; SubFolder: Boolean);
    function FindImportNode(DirName: String;
      ParNode: TTreeNode): TTreeNode;
    procedure PageSearch(Down: Boolean);
    procedure StartSearchSet;
    procedure EndSearchSet;
    procedure SearchTreeShowHint(var HintStr: string; var CanShow: Boolean;
      var HintInfo: THintInfo);
    procedure AllEnabledChenge(Enabled: Boolean);
    procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
    procedure FolderImportEx(OName, NName: String; PNode: TTreeNode;
      fi: TFolderItem; SubFolder: Boolean);
    procedure TextFileImport(OName, NName: String; PNode: TTreeNode;
      fi: TFolderItem);
    procedure DragFileProc(FileName: String);
    procedure ArrangementTreeItem;
//    procedure SetEditorImageRect;
    
  protected
    procedure CreateWnd; override;
  public
    { Public 宣言 }
    HelpFile: String;
    SearchStyle: TSearchStyle;
    OldSL: TStringList;
//    CompareContents: Integer;
    MyPath: String;          //アプリがあるフォルダのパス
    MySettingPath: String;   //設定データの保存フォルダのパス
    MyLibraryData: String;
    MyFileTypeDataPath: String;
    ItemEditMode: TItemEditMode;
    OptionSetting: TSetting;
    ProgressBar: TProgressBar; //プログレスバー
    IpName, IpPath, IpExe, IpDspType, IpSLText: String;
    //TempList: TObjectList;
    procedure MouseOnButton(Btn: TButton);
    procedure ComponentDblClick(Sender: TObject);
    //function EmptyChech(s: String): String;
    function FolderNameCheck(DirPath, AName: String): String;
    function FileNameCheck(FilePath, AName, AExtension: String): String;
    procedure ReadOnlyStatus;
    procedure FolderSort;
    procedure SetFilter;
    procedure AddContentsToListView(ANode: TTreeNode);
    procedure AddBookMarkToListView(ANode: TTreeNode);
    procedure OptionSettingReflection;
    procedure ReadOnlyAll;
    procedure SaveTreeView(ItemFree: Boolean = True);  
    procedure SaveTreeItemDataToFile;
    function IntToSearchDsp(Int: Integer): TSearchDsplay;
    function SearchDspToInt(SearchDsp: TSearchDsplay): Integer;
    function GetTreeItemIndex(s: String): Integer;
    function GetLineIndex(s: String): Integer;
    function FindStr(sl: TStrings; Count, Max: Integer): String; overload;
    procedure JumpSeafchTree(Node: TTreeNode);
    procedure DeleteAllBookMark;    
    function SelectNode: TTreeNode;
    procedure HelpFinderDisplay;
    procedure HelpHelpContextDisplay(Context: THelpContext);
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

uses
  BugReport, FolderSet, TextSet, Option, About, BookMarker, Splash;

const

  //アイテムの種類
  ROOTFOLDER_TYPE = 0;
  FOLDER_TYPE = 1;
  DUSTBOX_TYPE = 2;
  TEXTFILE_TYPE = 3;

  //アイコンイメージ
  ICON_ROOTFOLDER = 6;
  ICON_DUSTBOX = 7;

  ICON_BOOKMARK = 0;
  ICON_CONTENTS = 1;
  //タイトル発見時
  TITLE_SEARCH = '---';
var
  ErrorCommaChar: String = '",';
  SaveCommaChar: array[0..1] of String = ('""', ',');
  function ECharToJChar(s: WideString): WideString;
  var
    i, Index: Integer;
  begin
    Result := '';
    for i := 1 to Length(s) do
    begin
      Index := AnsiPos(s[i], ErrorCommaChar);
      if Index <> 0 then
        Result := Result + SaveCommaChar[Index - 1]
      else
        Result := Result + Copy(s, i, 1);
    end;
  end;

  function DelimiterCut(s: WideString): WideString;
  var
    i: Integer;
  begin
    i := Length(s);
    Result := Copy(s, 1, i -1);
  end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  NewItem: TRootFolderItem;
//  DustItem: TDustBoxItem;
begin
  SplashWindow.jyoukypLabel.Caption := 'Data reading...';
  Application.ProcessMessages;
{ DONE -oyhira -cprocedure : FormCreate }
  TreeView.Items.BeginUpdate;

  FCreateFlag := True;
  FCloseFlag := False;
  FSearchCancel := False;
  //ソフトの初期設定
  RichEdit.SelectionMode := smLine;
  Caption := Application.Title;
  TreeView.Align := alClient;
  ListView.Align := alClient;
  RichEdit.Align := alClient;
  CoolBar1.AutoSize := True;
  FileDspTabSheet.TabVisible := False;
  ContentsDspTabSheet.TabVisible := False;
  SearchTabSheet.TabVisible := False;
  ContentsPageControl.ActivePage := ContentsDspTabSheet;
  RichEdit.Lines.Clear;
  AddressComboBox.Text := '';
  SearchComboBox.Text := '';
  DocumentNameLabel.Caption := '';
  ItemEditMode := imNone;

//  SetMargin;
  //TreeViewのヒント表示
  Application.OnHint := ShowHint;
  //編集アクションのEnable
  EditActionEnable;
  AddressToolBarResize(nil);
  SearchToolBarResize(nil);
  //比較StringListの作成
  OldSL := TStringList.Create;
//  FTempStrList := TStringList.Create;
  //テンポラリTObjectListの作成
  //TempList := TObjectList.Create;

  MyPath := ExtractFilePath(Application.ExeName);
  MySettingPath := MyPath + 'Setting\';
  if not DirectoryExists(MySettingPath) then ForceDirectories(MySettingPath);

  MyLibraryData := MyPath + 'LibraryData\';
  if not DirectoryExists(MyLibraryData) then ForceDirectories(MyLibraryData);

  MyFileTypeDataPath := MySettingPath + 'FileType\';
  if not DirectoryExists(MyFileTypeDataPath) then ForceDirectories(MyFileTypeDataPath);

  HelpFile := ChangeFileExt(Application.ExeName, '.hlp');
//  OpenDialog1.InitialDir := MyPath;
  //TreeViewにNodeを読み込む
  LoadTreeView;

//  SplashTimer.Enabled := False;
//  SplashWindow.jyoukypLabel.Caption := 'アイテム読み込み終了';
//  Application.ProcessMessages;
  //初回起動時にルートフォルダを作成
  if TreeView.Items.Count = 0 then
  begin
     NewItem := TRootFolderItem.Create(nil);
     with NewItem do
     begin
       Name := 'LibraryData';
       Path := MyPath;
       Comment := 'ルートフォルダ';
       ImageIndex := ICON_ROOTFOLDER;
       //FileType := ftRootFolder;
       TreeView.Items.AddObject(nil, Name, Pointer(NewItem));
       TreeView.Items[0].Selected := True;
     end;
//     DustItem := TDustBoxItem.Create(nil);
//     with DustItem do
//     begin
//       Name := 'ごみ箱';
//       Path := Path + 'ごみ箱\';
//       ImageIndex := ICON_DUSTBOX;
//       TreeView.Items.AddObject(nil, Name, Pointer(DustItem));
//       ForceDirectories(Path);
//     end;

  end;
  //アドレスコンボボックスに前回の履歴を読み込み
  if FileExists(MySettingPath + 'Address.txt') then
    AddressComboBox.Items.LoadFromFile(MySettingPath + 'Address.txt');
  //検索コンボボックスに前回の履歴を読み込み
  if FileExists(MySettingPath + 'Search.txt') then
    SearchComboBox.Items.LoadFromFile(MySettingPath + 'Search.txt');
  //Option設定クラスの作成・読み込み
  OptionSetting := TSetting.Create;
  OptionLoadFromFile;

  TreeView.FullCollapse;
  //フォルダが上に来るようにソート
  FolderSort;

  //プログレスバーの生成
  ProgressBar  :=  TProgressBar.Create(Self);
  //プログレスバーの初期化
  with  ProgressBar  do  begin
    Parent  :=  StatusBar;
    Top     :=  2;
    Height  :=  StatusBar.Height - 2;
    Visible :=  True;
    Step := 1;
  end;


  //前回Window状態の復元
  ReadWindow;
  TreeActionEnable;
  SetFilter;
  TreeView.Items.EndUpdate;
end;

//procedure TMainForm.Layout1ActionExecute(Sender: TObject);
//begin
//  Layout1Action.Checked := True;
//  Layout1ToolButton.Down := Layout1Action.Checked;
//  Layout2Action.Checked :=  not Layout1Action.Checked;
//
//  ListViewToTheLeft;
//end;
//
//procedure TMainForm.Layout2ActionExecute(Sender: TObject);
//begin
//  Layout2Action.Checked := True;
//  Layout2ToolButton.Down := Layout2Action.Checked;
//  Layout1Action.Checked := not Layout2Action.Checked;
//
//  ListViewToTheTop;
//end;


procedure TMainForm.AddressToolBarResize(Sender: TObject);
begin
  AddressComboBox.Width := AddressToolBar.Width - AddressToolButton.Width -
    AddressLabel.Width;
end;

procedure TMainForm.SearchToolBarResize(Sender: TObject);
begin
  SearchComboBox.Width := SearchToolBar.Width - SearchToolButton.Width -
    SearchMarkToolButton.Width - SearchLabel.Width - SearchSelectComboBox.Width -
    SpaSearchToolButton.Width - PageSearchUpToolButton.Width - PageSearchDownToolButton.Width;
end;

procedure TMainForm.StatusBarResize(Sender: TObject);
begin
  with StatusBar do
  begin
    Panels[1].Width := 55;
    Panels[2].Width := 150;
    Panels[3].Width := 70;
    Panels[4].Width := 100;
    Panels[0].Width := Width - Panels[1].Width - Panels[2].Width -Panels[3].Width - Panels[4].Width;

    ProgressBar.Left := Panels[0].Width + Panels[1].Width + 1;
    ProgressBar.Width := Panels[2].Width - 1;
  end;

end;

procedure TMainForm.ReadWindow;
var
  id: array of Integer;
  i, BandCount{, Sel}: Integer;
  doc, lis: Boolean;
begin
{ TODO -oyhira -cprocedure : Window状態の読み込み }

  with FormIniFileCompo do
  begin
    //フォーム状態
    ReadForm('Window', 'Form', MainForm);

    //パネルレイアウト状態
    OldListViewPanelWidth := ReadInt('Window', 'OldListViewHeight', 200);
    lis := ReadBool('Window', 'ListArea', False);
    doc := ReadBool('Window', 'DocArea', False);
    if lis then
//      LayoutListViewAreaAction.Checked := lis
      LayoutListViewAreaAction.Execute
    else
      if doc then
        LayoutDocumentAreaAction.Execute;
//        LayoutDocumentAreaAction.Checked := doc;
    Application.ProcessMessages;
    if (LayoutListViewAreaAction.Checked = False) and
       (LayoutDocumentAreaAction.Checked = False) then
      PanelL.Height := ReadInt('Window', 'ListViewHeight', 200);
    PanelT.Width := ReadInt('Window', 'TreeView', 200);
    //折り返すか
    WordWrapAction.Checked := ReadBool('ToolSet', 'WordWrap', False);
    if WordWrapAction.Checked then
      RichEdit.ScrollBars := ssVertical
    else
      RichEdit.ScrollBars := ssBoth;

    //CoolBar状態
    CoolBar1.AutoSize := False;
//    CoolBar1.Bands.BeginUpdate;
    BandCount := ReadInt('CoolSet', 'BandCount', CoolBar1.Bands.Count);
    SetLength(id, BandCount);
    for i := Low(id) to High(id) do
    begin                                                                                             
      CoolBar1.Bands[i].Visible := ReadBool('CoolSet', 'BandVisible#' + IntToStr(i), CoolBar1.Bands[i].Visible);
      CoolBar1.Bands[i].Break := ReadBool('CoolSet', 'BandBreak#' + IntToStr(i), CoolBar1.Bands[i].Break);
      id[i] := ReadInt('CoolSet', 'BandID#' + IntToStr(i), i);
      CoolBar1.Bands.FindItemID(id[i]).Index := i;
      CoolBar1.Bands[i].Width := ReadInt('CoolSet', 'BandWidth#' + IntToStr(i), CoolBar1.Bands[i].Width);
    end;
//    CoolBar1.Bands.EndUpdate;
    CoolBar1.AutoSize := True;
    //ツールバーの表示
    tbFileAction.Checked    := ReadBool('ToolSet', 'tbFileDsp',    True);
    tbEditAction.Checked    := ReadBool('ToolSet', 'tbEditDsp',    True);
    tbDisplayAction.Checked := ReadBool('ToolSet', 'tbDisplayDsp', True);
    tbSearchAction.Checked  := ReadBool('ToolSet', 'tbSeachDsp',   True);
    tbAddressAction.Checked := ReadBool('ToolSet', 'tbAddressDsp', True);
    tbSettigAction.Checked  := ReadBool('ToolSet', 'tbSettingDsp', True);
                      
    //サーチ方法の状態
    SearchSelectComboBox.ItemIndex := ReadInt('SearchSet', 'SearchMeThod', 0);

    //ファイル表示ListViewのColumnsの保存
    ListView.Columns[0].Width := ReadInt('ListViewSet', 'FileDspIcon', 25);
    ListView.Columns[1].Width := ReadInt('ListViewSet', 'FileDspName', 200);
    ListView.Columns[2].Width := ReadInt('ListViewSet', 'FileDspFileType', 110);
    ListView.Columns[3].Width := ReadInt('ListViewSet', 'FileDspCleateDay', 125);
    ListView.Columns[4].Width := ReadInt('ListViewSet', 'FileDspUpdateDay', 125);
    ListView.Columns[5].Width := ReadInt('ListViewSet', 'FileDspPath', 250);
    //目次表示ListViewのColumnsの保存
    ContentsListView.Columns[0].Width := ReadInt('ListViewSet', 'ContentsIcon', 25);
    ContentsListView.Columns[1].Width := ReadInt('ListViewSet', 'ContentsNo', 65);
    ContentsListView.Columns[2].Width := ReadInt('ListViewSet', 'ContentsName', 500);

    //ダイアログ関係
    OpenDialog1.InitialDir  := ReadStr('OpenDlg',   'InitialDir', MyPath);
    FolderDialog1.Directory := ReadStr('FolderDlg', 'Directory',  MyPath);

//    //最終選択TreeView.Node
//    Sel := ReadInt('TreeView', 'Selected', 0);
//    if (TreeView.Items.Count -1) >= Sel then
//      TreeView.Items[Sel].Selected := True
//    else
//      TreeView.Items[0].Selected := True;
    if TreeView.Items.Count <> 0 then
      TreeView.Selected := TreeView.Items[0];
  end;

end;

procedure TMainForm.WriteWindow;
var
  id: array of Integer;
  i: Integer;
begin
{ TODO -oyhira -cprocedure : Window状態の保存 }
  with FormIniFileCompo do
  begin
    //フォーム状態
    WriteForm('Window', 'Form', MainForm);
    //レイアウトボタンのON/OFF
//    WriteBool('ToolSet', 'Lay1', Layout1Action.Checked);
//    WriteBool('ToolSet', 'Lay2', Layout2Action.Checked);
    //パネルレイアウト状態
    WriteInt('Window', 'TreeView', PanelT.Width);
    WriteInt('Window', 'ListViewHeight', PanelL.Height);
    WriteInt('Window', 'OldListViewHeight', OldListViewPanelWidth);
    WriteBool('Window', 'ListArea', LayoutListViewAreaAction.Checked);
    WriteBool('Window', 'DocArea', LayoutDocumentAreaAction.Checked);

    //折り返すか
    WriteBool('ToolSet', 'WordWrap', WordWrapAction.Checked);

    //CoolBar状態
    CoolBar1.AutoSize := False;
    WriteInt('CoolSet', 'BandCount', CoolBar1.Bands.Count);
    SetLength(id, CoolBar1.Bands.Count);
    for i := Low(id) to High(id) do
    begin
      id[i] := CoolBar1.Bands[i].ID;
      WriteInt('CoolSet', 'BandID#' + IntToStr(i), id[i]);
      WriteInt('CoolSet', 'BandWidth#' + IntToStr(i), CoolBar1.Bands[i].Width);
      WriteBool('CoolSet', 'BandBreak#' + IntToStr(i), CoolBar1.Bands[i].Break);
      WriteBool('CoolSet', 'BandVisible#' + IntToStr(i), CoolBar1.Bands[i].Visible);
    end;
    //ツールバーの表示
    WriteBool('ToolSet', 'tbFileDsp',    tbFileAction.Checked);
    WriteBool('ToolSet', 'tbEditDsp',    tbEditAction.Checked);
    WriteBool('ToolSet', 'tbDisplayDsp', tbDisplayAction.Checked);
    WriteBool('ToolSet', 'tbSeachDsp',   tbSearchAction.Checked);
    WriteBool('ToolSet', 'tbAddressDsp', tbAddressAction.Checked);
    WriteBool('ToolSet', 'tbSettingDsp', tbSettigAction.Checked);

    //サーチ方法の状態
    WriteInt('SearchSet', 'SearchMeThod', SearchSelectComboBox.ItemIndex);

    //ファイル表示ListViewのColumnsの保存
    WriteInt('ListViewSet', 'FileDspIcon', ListView.Columns[0].Width);
    WriteInt('ListViewSet', 'FileDspName', ListView.Columns[1].Width);
    WriteInt('ListViewSet', 'FileDspFileType', ListView.Columns[2].Width);
    WriteInt('ListViewSet', 'FileDspCleateDay', ListView.Columns[3].Width);
    WriteInt('ListViewSet', 'FileDspUpdateDay', ListView.Columns[4].Width);
    WriteInt('ListViewSet', 'FileDspPath', ListView.Columns[5].Width);
    //目次表示ListViewのColumnsの保存
    WriteInt('ListViewSet', 'ContentsIcon', ContentsListView.Columns[0].Width);
    WriteInt('ListViewSet', 'ContentsNo', ContentsListView.Columns[1].Width);
    WriteInt('ListViewSet', 'ContentsName', ContentsListView.Columns[2].Width);

    //ダイアログ関係
    WriteStr('OpenDlg',   'InitialDir', OpenDialog1.InitialDir);
    WriteStr('FolderDlg', 'Directory',  FolderDialog1.Directory);
//    //最終選択TreeView.Node
//    if TreeView.Selected <> nil then
//      WriteInt('TreeView', 'Selected', TreeView.Selected.AbsoluteIndex)
//    else
//      WriteInt('TreeView', 'Selected', 0);

//    WriteSizePos('ToolBar', 'Search', CoolBar1);
  end;

end;

//procedure TMainForm.ListViewToTheLeft;
//begin
//  PanelL.Align := alLeft;
//  SplitterL.Align := alLeft;
//  SplitterL.Left := PanelL.Width;
//end;
//
//procedure TMainForm.ListViewToTheTop;
//begin
//  PanelL.Align := alTop;
//  ContentsPageControl.Align := alClient;
//  ListView.Align := alClient;
//  ContentsListView.Align := alClient;
//  SearchListView.Align := alClient;
//  SplitterL.Align := alTop;
//end;

procedure TMainForm.WordWrapActionExecute(Sender: TObject);
begin
//  ContentsPageControl.ActivePage := ContentsDspTabSheet;
  FCreateFlag := False;
  SetWordWrapColCount;
  WordWrapAction.Checked := not WordWrapAction.Checked;
  RichEdit.Lines.BeginUpdate;
  RichEdit.WordWrap := WordWrapAction.Checked;
//  SetMargin;
  if WordWrapAction.Checked then
    RichEdit.ScrollBars := ssVertical
  else
    RichEdit.ScrollBars := ssBoth;


  RichEdit.Lines.EndUpdate;
  
  if (TObject(TreeView.Selected.Data) is TTextItem) and
     (SearchStyle = ssNone) then
  begin
    ContentsPageControl.ActivePage := ContentsDspTabSheet;
    AddBookMarkToListView(TreeView.Selected);
  end;

  if OptionSetting.Standard.ContentsDsp and
     (TObject(TreeView.Selected.Data) is TTextItem) and
     (SearchStyle = ssNone) then
  begin
    ContentsPageControl.ActivePage := ContentsDspTabSheet;
    AddContentsToListView(TreeView.Selected);
  end;
end;



procedure TMainForm.ShowHint(Sender: TObject);
begin
  StatusBar.Panels[0].Text := Application.Hint;
end;

procedure TMainForm.tbFileActionExecute(Sender: TObject);
begin
  tbFileAction.Checked := not tbFileAction.Checked;
  FileToolBar.Visible := tbFileAction.Checked;
end;

procedure TMainForm.tbEditActionExecute(Sender: TObject);
begin
  tbEditAction.Checked := not tbEditAction.Checked;
  EditToolBar.Visible := tbEditAction.Checked;
end;

procedure TMainForm.tbDisplayActionExecute(Sender: TObject);
begin
  tbDisplayAction.Checked := not tbDisplayAction.Checked;
  DisplayToolBar.Visible := tbDisplayAction.Checked;
end;

procedure TMainForm.tbAddressActionExecute(Sender: TObject);
begin
  tbAddressAction.Checked := not tbAddressAction.Checked;
  AddressToolBar.Visible := tbAddressAction.Checked;
end;

procedure TMainForm.tbSearchActionExecute(Sender: TObject);
begin
  tbSearchAction.Checked := not tbSearchAction.Checked;
  SearchToolBar.Visible := tbSearchAction.Checked;
end;

procedure TMainForm.tbSettigActionExecute(Sender: TObject);
begin
  tbSettigAction.Checked := not tbSettigAction.Checked;
  SettingToolBar.Visible := tbSettigAction.Checked;
end;

procedure TMainForm.FormPaint(Sender: TObject);
begin
  //ツールバー表示反映
  FileToolBar.Visible    := tbFileAction.Checked;
  EditToolBar.Visible    := tbEditAction.Checked;
  DisplayToolBar.Visible := tbDisplayAction.Checked;
  SearchToolBar.Visible  := tbSearchAction.Checked;
  AddressToolBar.Visible := tbAddressAction.Checked;
  SettingToolBar.Visible := tbSettigAction.Checked;
  //折り返し設定反映
  RichEdit.WordWrap := WordWrapAction.Checked;

//  SetEditorImageRect;
end;

procedure TMainForm.BugReportActionExecute(Sender: TObject);
var
  Dlg: TBugReportForm;
begin
   Dlg := TBugReportForm.Create(Self);
   try
     Dlg.ShowModal;
   finally
     Dlg.Free;
   end;

end;

procedure TMainForm.NewFolderActionExecute(Sender: TObject);
begin
  FolderSetDlg := TFolderSetDlg.Create(Self);
  try
    ItemEditMode := imNewFolder;
    FolderSetDlg.ShowModal;
  finally
    FolderSetDlg.Free;
  end;

end;

procedure TMainForm.MouseOnButton(Btn: TButton);
var
  P: TPoint;
begin
  P := Point(Btn.Width div 2, Btn.Height div 2);
  P := Btn.ClientToScreen(P);
  SetCursorPos(P.X, P.Y);
end;

procedure TMainForm.FormDestroy(Sender: TObject);
//var
//  i: Integer;
begin
  OldSL.Free;
  OldNode := nil;
//  FTempStrList.Free;
  TreeView.Items.BeginUpdate;
  TreeViewForSearch.Items.BeginUpdate;
  ListView.Items.BeginUpdate;
  ContentsListView.Items.BeginUpdate;
  SearchListView.Items.BeginUpdate;

  TreeView.Items.Clear;
//  for i := TreeViewForSearch.Items.Count -1 downto 0 do begin
//    if TreeViewForSearch.Items[i].Level = 0 then
//      TreeViewForSearch.Items[i].Delete;
//  end;
  TreeViewForSearch.Items.Clear;
  ListView.Clear;
  ContentsListView.Clear;
  SearchListView.Clear;
  OptionSetting.Free;
  OptionSetting := nil;
//  TempList.Free;
//  for i := TreeView.Items.Count -1 downto 0 do
//  begin
//    TreeView.Items[i].Delete;
//  end;

end;

procedure TMainForm.TreeViewAddition(Sender: TObject; Node: TTreeNode);
begin
  if TObject(Node.Data) is TFolderItem then
  begin
    Node.ImageIndex := TFolderItem(Node.Data).ImageIndex;
    Node.SelectedIndex := TFolderItem(Node.Data).ImageIndex;
  end;
  if ItemEditMode <> imNone then
    TreeView.Selected := Node;


end;

procedure TMainForm.ComponentDblClick(Sender: TObject);
begin
  if Sender is TLabeledEdit then
    TLabeledEdit(Sender).SelectAll;
  if Sender is TMemo then
    TMemo(Sender).SelectAll;
end;

procedure TMainForm.EditItemActionExecute(Sender: TObject);
begin

  if TObject(TreeView.Selected.Data) is TTextItem then
  begin
    TextSetDlg := TTextSetDlg.Create(Self);
    try
      ItemEditMode := imPropertyFile;
      TextSetDlg.ShowModal;
    finally
      TextSetDlg.Free;
    end;
    EmphasisDsp(TreeView.Selected);
    Exit;
  end;

  if TObject(TreeView.Selected.Data) is TFolderItem then
  begin
    FolderSetDlg := TFolderSetDlg.Create(Self);
    try
      ItemEditMode := imPropertyFolder;
      FolderSetDlg.ShowModal;
    finally
      FolderSetDlg.Free;
    end;
    Exit;
  end;


end;



procedure TMainForm.TreeViewPopupPopup(Sender: TObject);
begin
  TreeActionEnable;
end;

procedure TMainForm.LoadTreeView;
var
  fs: TFileStream;
  Node: TTreeNode;
  i, Count, FileType, IntLevelA, IntLevelB: Integer;
  NewItem: TFolderItem;
  TextItem: TTextItem;
//  Msg: String;

  function LoadInt(Streem: TFileStream): Integer;
  var
    Int: Integer;
  begin
    Streem.Read(Int, SizeOf(Int));
    Result := Int;
  end;

  procedure NodeMove(ANode: TTreeNode; var IntA, IntB:Integer);
  begin
    if IntB > IntA then
    begin
      IntB := IntA;
      while ANode.Level > IntA do
      begin
        ANode.MoveTo(ANode.Parent, naAdd);
      end;
    end
    else
    begin
      if IntB < IntA then
      begin
        IntB := IntA;
        ANode.MoveTo(ANode.GetPrev, naAddChild);
      end;
    end;
  end;

begin { TODO -oyhira -cprocedure : TreeViewの読み込み }
  if (FileExists(MySettingPath + 'Tree.tlb') = False) then Exit;

  fs := TFileStream.Create(MySettingPath + 'Tree.tlb', fmOpenRead or fmShareExclusive);

  try
    fs.read(Count, SizeOf(Count));
    IntLevelB := 0;
    Node := nil;

//    with ProgressBox1 do begin
//      Min := 0;
//      Max := Count -1;
//      CancelBtnVisible := False;
//    end;

    for i := 0 to Count -1 do
    begin
//      with ProgressBox1 do begin
//        Msg := '全' + IntToStr(Count) + 'アイテム中、' + IntToStr(i + 1) + 'アイテム読み込み中...';
//        SetValue(i, Msg)
//      end;


      FileType := LoadInt(fs);

      case FileType of
        ROOTFOLDER_TYPE:
        begin
          NewItem := TRootFolderItem.Create(nil);
          NewItem := NewItem.LoadStreem(fs, NewItem);
          intLevelA := LoadInt(fs);
          Node := TreeView.Items.AddObject(Node, NewItem.Name, Pointer(NewItem));
          //TreeView.Selected := NewItem.AddObject(TreeView, nil, NewItem.Name, Pointer(NewItem));
        end;
        FOLDER_TYPE:
        begin
          NewItem := TFolderItem.Create(nil);
          NewItem := NewItem.LoadStreem(fs, NewItem);
          IntLevelA := LoadInt(fs);

          Node := TreeView.Items.AddObject(Node, NewItem.Name, Pointer(NewItem));
          NodeMove(Node, IntLevelA, IntLevelB);
        end;
        TEXTFILE_TYPE:
        begin
          TextItem := TTextItem.Create(nil);
          TextItem := TextItem.LoadStreem(fs, TextItem);
          IntLevelA := LoadInt(fs);

          Node := TreeView.Items.AddObject(Node, TextItem.Name + TextItem.Extension, Pointer(TextItem));
          NodeMove(Node, IntLevelA, IntLevelB);
        end;


      end;

                                
    end;

  finally
    fs.Free;
  end;
  if TFolderItem(TreeView.Items[0].Data).Path <> ExtractFilePath(Application.ExeName) then
    NodePathReName;
end;                                  

procedure TMainForm.SaveTreeView(ItemFree: Boolean = True);
var
  fs: TFileStream;
  Node: TTreeNode;
  Len, i: Integer;

  procedure SaveInt(Streem: TFileStream; Int: Integer);
  begin
    Streem.Write(int, SizeOf(Int));
  end;

begin { TODO -oyhira -cprocedure : TreeViewの保存 }
  fs := TFileStream.Create(MySettingPath + 'Tree.tlb', fmCreate or fmShareExclusive);
  try
    len := TreeView.Items.Count;
    fs.Write(len, SizeOf(len));

    for i := 0 to TreeView.Items.Count -1 do
    begin
      Node := TreeView.Items[i];

//      if TObject(Node.Data) is TDustBoxItem then
//      begin
//        SaveInt(fs, DUSTBOX_TYPE);
//        TRootFolderItem(Node.Data).SaveStreem(fs, TDustBoxItem(Node.Data));
//        SaveInt(fs, Node.Level);
//        Continue;
//      end;
      if TObject(Node.Data) is TTextItem then
      begin
        SaveInt(fs, TEXTFILE_TYPE);
        TTextItem(Node.Data).SaveStreem(fs, TTextItem(Node.Data), ItemFree);
        SaveInt(fs, Node.Level);
        Continue;
      end;

      if TObject(Node.Data) is TRootFolderItem then
      begin
        SaveInt(fs, ROOTFOLDER_TYPE);
        TRootFolderItem(Node.Data).SaveStreem(fs, TRootFolderItem(Node.Data), ItemFree);
        SaveInt(fs, Node.Level);
        Continue;
      end;

      if TObject(Node.Data) is TFolderItem then
      begin
        SaveInt(fs, FOLDER_TYPE);
        TFolderItem(Node.Data).SaveStreem(fs, TFolderItem(Node.Data), ItemFree);
        SaveInt(fs, Node.Level);
        Continue;
      end;


    end;
  finally
    fs.Free;
  end;

end;
function TMainForm.FolderNameCheck(DirPath, AName: String): String;
var
  i: Integer;
begin
  i := 2;

  if DirectoryExists(DirPath + AName) = False then
  begin
    Result := AName;
  end
  else
  begin
    while DirectoryExists(DirPath + AName + '(' + IntToStr(i) + ')') do
    begin
      Inc(i);
    end;
    Result := AName + '(' + IntToStr(i) + ')';
  end;
end;

function TMainForm.FileNameCheck(FilePath, AName, AExtension: String): String;
var
  i: Integer;
begin
  i := 2;

  if FileExists(FilePath + AName + AExtension) = False then
  begin
    Result := AName;
  end
  else
  begin
    while FileExists(FilePath + AName + '(' + IntToStr(i) + ')' + AExtension) do
    begin
      Inc(i);
    end;
    Result := AName + '(' + IntToStr(i) + ')';
  end;
end;

procedure TMainForm.DeleteItemActionExecute(Sender: TObject);
var
  Msg, StrPath, StrName, StrEx, FullName{, s, ss}: String;
//  i: Integer;
  sl: TStringList;
  Attributes: Word;

  procedure SearchChild(FolderName: String; SList:TStringList);
  var
    sr: TSearchRec;
    Found: Integer;
  begin
    Found := FindFirst(FolderName + '*.*', faAnyFile, SR);

//    if (sr.Attr and SysUtils.faReadOnly) <> 0 then
//      SysUtils.FileSetAttr(FolderName, SysUtils.faAnyFile);

    sl.Add(FolderName);
    try
      while Found = 0 do
      begin
        if (SR.Name <> '..') and (SR.Name <> '.') then
        begin
          //ShowMessage(FolderName);
          if (SR.Attr and faDirectory > 0) then
            SearchChild(FolderName + SR.Name + '\', SList)
          else
            sl.Add(FolderName + sr.Name);
        end;
        Found := FindNext(SR);
      end;
    finally
      Sysutils.FindClose(SR);
    end;
  end;

  procedure DeleteStringListFile(StringList: TStringList);
  var
    i: Integer;
  begin
    for i := StringList.Count -1 downto 0 do
    begin
      if StringList[i] <> '' then
      begin
        Attributes := GetFileAttributes(PChar(StringList[i]));
//        if (Attributes and SysUtils.faReadOnly) <> 0 then
//          ShowMessage('"' + StringList[i] + '"は'+ #13#10 +
//                      '読みとり専用になっていますが削除します。');
        Attributes := Attributes and not SysUtils.faReadOnly;
        SysUtils.FileSetAttr(StringList[i], Attributes);
        if (Attributes and SysUtils.faDirectory > 0) then
          RemoveDir(StringList[i])
        else
          DeleteFile(StringList[i]);
      end;
    end;
  end;



begin
  if TreeView.Selected <> nil then
  begin
    if TObject(TreeView.Selected.Data) is TRootFolderItem then begin
      Exit;
    end;

    if TObject(TreeView.Selected.Data) is TTextItem then
    begin
      Msg := 'アイテム "'  + TreeView.Selected.Text +
        '" を削除していいですか？';
      if Application.MessageBox(PChar(Msg), '確認', MB_ICONQUESTION or
        MB_YESNO) = IDYES then
      begin
        StrPath := TTextItem(TreeView.Selected.Data).Path;
        StrName := TTextItem(TreeView.Selected.Data).Name;
        StrEx := TTextItem(TreeView.Selected.Data).Extension;
        FullName := StrPath + StrName + StrEx;

        Attributes := GetFileAttributes(PChar(FullName));
//        if (Attributes and SysUtils.faReadOnly) <> 0 then
//          ShowMessage('"' + FullName + '"は'+ #13#10 +
//                      '読みとり専用になっていますが削除します。');
        Attributes := Attributes and not SysUtils.faReadOnly;
        SysUtils.FileSetAttr(FullName, Attributes);

        DeleteFile(FullName);
        TTextItem(TreeView.Selected.Data).Free;
        TreeView.Selected.Delete;
        SaveTreeItemDataToFile;
        Exit;
      end
      else Exit;
    end;


    if TObject(TreeView.Selected.Data) is TFolderItem then
    begin

      Msg := 'アイテム "'  + TreeView.Selected.Text +
        '" を削除していいですか？' + #13#10 + '削除すると "' +
        TreeView.Selected.Text + '" に含まれる全てのファイルが削除されます。';
      if Application.MessageBox(PChar(Msg), '確認', MB_ICONQUESTION or
        MB_YESNO) = IDYES then
      begin
      Screen.Cursor := crHourGlass;
      sl := TStringList.Create;
      try
        sl.Clear;
        StrPath := TFolderItem(TreeView.Selected.Data).Path;
        StrName := TFolderItem(TreeView.Selected.Data).Name;
        SearchChild(StrPath + StrName + '\', sl);

        //ShowMessage(sl.Text);
        //StringListに書かれているファイルを削除
        DeleteStringListFile(sl);

        TFolderItem(TreeView.Selected.Data).Free;
        TreeView.Selected.Delete;
//        TreeView.Selected.Free;
        SaveTreeItemDataToFile;
      finally
        sl.Free;
        Screen.Cursor := crDefault;
      end;
      Exit;
    end;


    end;

  end;

end;

procedure TMainForm.NewFileActionExecute(Sender: TObject);
begin
  //LayoutCheckFalse;

  TextSetDlg := TTextSetDlg.Create(Self);
  try
    ItemEditMode := imNewFile;
    TextSetDlg.ShowModal;
  finally
    TextSetDlg.Free;
  end;

end;

procedure TMainForm.TreeActionEnable;
  function ClipEnebled: Boolean;
  var
    s: String;
  begin
    Result := True;
    s := Clipboard.AsText;
    s := Trim(s);
    if (s = '') or (s = #13#10 ) then
      Result := False;
  end;

begin
  { TODO -oyhira -cprocedure : TreeViewクリック時のポップアップメニューの処理 }
  if TreeView.Selected = nil then Exit;


  //ノードがないとき
  if TObject(TreeView.Selected.Data) = nil then
  begin
    NewFolderAction.Enabled := False;
    EditItemAction.Enabled := False;
    DeleteItemAction.Enabled := False;
    NewFileAction.Enabled := False;
    FileOpenAction.Enabled := False;
    FolderOpenAction.Enabled := False;
    FolderOpenIncludeSubAction.Enabled := False;
    ClipToFileAction.Enabled := False;
    Exit;
  end;
  //テキストファイル
  if TObject(TreeView.Selected.Data) is TTextItem then
  begin
    NewFolderAction.Enabled := False;
    EditItemAction.Enabled := True;
    DeleteItemAction.Enabled := True;
    NewFileAction.Enabled := False;
    FileOpenAction.Enabled := False;
    FolderOpenAction.Enabled := False;
    FolderOpenIncludeSubAction.Enabled := False;
    ClipToFileAction.Enabled := False;
    Exit;
  end;
  //ルートフォルダ
  if TObject(TreeView.Selected.Data) is TRootFolderItem then
  begin
    NewFolderAction.Enabled := True;
    EditItemAction.Enabled := False;
    DeleteItemAction.Enabled := False;

    if OptionSetting.Standard.ReadOnlyAll then
      NewFileAction.Enabled := False
    else
      NewFileAction.Enabled := True;

    FileOpenAction.Enabled := True;
    FolderOpenIncludeSubAction.Enabled := True;
    FolderOpenAction.Enabled := True;
    ClipToFileAction.Enabled := ClipEnebled;
    Exit;
  end;
  //フォルダ
  if TObject(TreeView.Selected.Data) is TFolderItem then
  begin
    NewFolderAction.Enabled := True;
    EditItemAction.Enabled := True;
    DeleteItemAction.Enabled := True;

    if OptionSetting.Standard.ReadOnlyAll then
      NewFileAction.Enabled := False
    else
      NewFileAction.Enabled := True;
    FileOpenAction.Enabled := True;
    FolderOpenAction.Enabled := True;  
    FolderOpenIncludeSubAction.Enabled := True;
    ClipToFileAction.Enabled := ClipEnebled;
    Exit;
  end;
end;

function TMainForm.ReadOnlyJudgment(ANode: TTreeNode): Boolean;
var
  n: TTreeNode;
begin
  n := ANode;
  Result := False;
  while n.Parent <> nil do
  begin
    n := n.Parent;
    if TFolderItem(n.Data).ReadOnlyBool then
    begin
      Result := True;
      Break;
    end;
  end;
end;

procedure  TMainForm.AddNodeChildrenDspToListView(ANode: TTreeNode);
var
  i: Integer;
  n: TTreeNode;
  ListItem: TListItem;
  Day: TDateTime;
  s: String;
begin
  Screen.Cursor := crHourGlass;
  ListView.Items.BeginUpdate;
  ListView.Clear;
  ListView.AllocBy := ANode.Count;
  ListView.IconOptions.AutoArrange := False;
  with ProgressBar do begin
    Position := 0;
    Min := 0;
    Max := ANode.Count;
//    Step := 1;
  end;

  try
    for i := 0 to ANode.Count -1 do
    begin
      n := ANode.Item[i];
      ProgressBar.StepIt;
      if TObject(n.Data) is TTextItem then
      begin
        ListItem := ListView.Items.Add;
        ListItem.Data := Pointer(n.AbsoluteIndex);
        ListItem.ImageIndex := TTextItem(n.Data).ImageIndex;
        ListItem.SubItems.Add(TTextItem(n.Data).Name + TTextItem(n.Data).Extension);
        ListItem.SubItems.Add(TTextItem(n.Data).DspType);
        Day := TTextItem(n.Data).CreationDay;

        s := FormatDateTime('yyyy/mm/dd hh:nn', Day);
        ListItem.SubItems.Add(s);
        Day := TTextItem(n.Data).UpdateDay;
        s := FormatDateTime('yyyy/mm/dd hh:nn', Day);
        ListItem.SubItems.Add(s);
        ListItem.SubItems.Add(TTextItem(n.Data).FullName);
        Continue;
      end;

      if TObject(n.Data) is TFolderItem then
      begin
        ListItem := ListView.Items.Add;
        ListItem.Data := Pointer(n.AbsoluteIndex);
        ListItem.ImageIndex := TFolderItem(n.Data).ImageIndex;
        ListItem.SubItems.Add(TFolderItem(n.Data).Name);
        ListItem.SubItems.Add('---');
        Day := TFolderItem(n.Data).CreationDay;
        s := FormatDateTime('yyyy/mm/dd hh:nn', Day);
        ListItem.SubItems.Add(s);
        ListItem.SubItems.Add('');
        ListItem.SubItems.Add(TFolderItem(n.Data).FullName);
        Continue;
      end;

    end;
  finally
    ProgressBar.Position := 0;
    ListView.Items.EndUpdate;
    Screen.Cursor := crDefault;
  end;
end;


procedure TMainForm.TreeViewChange(Sender: TObject; Node: TTreeNode);
begin
//  if TreeView.Selected = TreeView.Items[0] then
//    LayoutCheckFalse;
  FCreateFlag := False;
  TreeChange(Node);
  EditActionEnable;
  OldNode := Node;
  RichEdit.Modified := False;
  SendMessage(RichEdit.Handle, EM_SCROLLCARET, 0, 0);
  if TObject(Node.Data) is TTextItem then begin
    StatusBar.Panels[4].Text := TTextItem(Node.Data).DspType + '形式表示';
  end else begin
    StatusBar.Panels[4].Text := '';
  end;
//  ShowMessage('che');
end;

procedure TMainForm.EmphasisDsp(Node: TTreeNode);
var
  FileType: TFileType;
begin
  //\f
  FileType := FileTypeJudgment(TTextItem(Node.Data).DspType);
  if FileType.EmphasisDisplay then  begin
    if FileType.Fountain <> nil then begin
      RichEdit.Fountain := FileType.Fountain;
    end else begin
      RichEdit.Fountain := nil;
      RichEdit.ReserveWordList.Text := FileType.Emphasis.Text;
    end;
  end else begin
    RichEdit.Fountain := nil;
    RichEdit.ReserveWordList.Text := '';
  end;
  RichEdit.Refresh;
end;


procedure TMainForm.TreeChange(Node: TTreeNode);
var
  SName, SPath, SExtension, SFull, Msg, ss: String;
  Item: TListItem;
  ms: TMemoryStream;
//  FileType: TFileType;
begin
  if TreeView.Items.Count = 1 then Exit;

//  RichEdit.Modified := False;
//  if TTreeView(Sender) = TreeView then
//    TreeView.OnChange := TreeViewChange;
  TreeActionEnable;
  EditActionEnable;
  RichEdit.Lines.Clear;
  StatusBar.Panels[1].Text := '';
  RichEdit.ReadOnly := True;
  DocumentNameLabel.Caption := '';

  ms := TMemoryStream.Create;
  try
    if TObject(Node.Data) is TTextItem then
    begin
      SPath := TTextItem(Node.Data).Path;
      SName := TTextItem(Node.Data).Name;
      SExtension := TTextItem(Node.Data).Extension;
      SFull := TTextItem(Node.Data).FullName;
      DocumentNameLabel.Caption := SName + SExtension;
      //ReadOnly判定
      if TTextItem(Node.Data).ReadOnlyBool then
      begin
        RichEdit.ReadOnly := TTextItem(Node.Data).ReadOnlyBool;
        StatusBar.Panels[1].Text := '書込不可';
      end
      else
      begin
        RichEdit.ReadOnly := ReadOnlyJudgment(Node);
        ReadOnlyStatus;
      end;

      if FileExists(SFull) then
      begin
        AddComboBox(SFull, AddressComboBox);
        ms.LoadFromFile(SFull);
        RichEdit.Lines.LoadFromStream(ms);
        //強調表示
        EmphasisDsp(Node);

        Application.HandleMessage;

        Application.ProcessMessages;

//        LayoutCheckFalse;
        case SearchStyle of
          ssFolder, ssText, ssAll:
          begin
            Item := SearchListView.Selected;
            if Item = nil then Exit;
            ss := Trim(Item.SubItems[1]);
            if ss = TITLE_SEARCH then Exit;
           JumpSearchStr(StrToInt(ss) -1);
           end;
        end;

        if SearchStyle <> ssNone then Exit;

        ContentsPageControl.ActivePage := ContentsDspTabSheet;
        AddBookMarkToListView(Node);
        if OptionSetting.Standard.ContentsDsp then
        begin
          AddContentsToListView(Node);
          Application.HandleMessage;
        end;

      end
      else
      begin
        Msg := 'このアイテムに関連づけられたファイルが存在しません。このアイテムを削除しますか？';
        if Application.MessageBox(PChar(Msg), '確認', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON1) = IDYES then
        begin
          TreeView.Selected.Delete;
        end;

        ContentsListView.Clear;
      end;
//      RichEdit.SetFocus;
      Exit;
    end;

    if TObject(Node.Data) is TFolderItem then
    begin

    ContentsListView.Items.BeginUpdate;
    ContentsListView.Clear;
    ContentsListView.Items.EndUpdate;
    ListView.Clear;
    Application.ProcessMessages;
      SPath := TFolderItem(Node.Data).Path;
      SName := TFolderItem(Node.Data).Name;
      if DirectoryExists(SPath + SName) then
      begin
        AddressComboBox.Text := SPath + SName;
        if SearchStyle <> ssNone then Exit;

        if OptionSetting.Standard.FolderInfoDsp then
        begin
          ContentsPageControl.ActivePage := FileDspTabSheet;
          AddNodeChildrenDspToListView(Node);
        end
        else ContentsPageControl.ActivePage := ContentsDspTabSheet;
      end
      else begin
        Msg := 'このアイテムに関連づけられたファイルが存在しません。このアイテムを削除しますか？';
        if Application.MessageBox(PChar(Msg), '確認', MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON1) = IDYES then
        begin
          TreeView.Selected.Delete;
        end;

        Exit;
      end;
    end;
  finally
    ms.Free;
  end;


end;

function TMainForm.FileTypeJudgment(DspType: String): TFileType;
var
  i: Integer;
begin
  with OptionSetting do
  begin
    Result := TFileType(FileTypeList[0]);
    for i := 0 to FileTypeList.Count -1 do
    begin
      if TFileType(FileTypeList[i]).Name = Display.DefaultDspType then
      begin
        Result := TFileType(FileTypeList[i]);
        Break;
      end
      else
        Result := TFileType(FileTypeList[0]);

    end;

    for i := 0 to FileTypeList.Count -1 do
    begin
      if TFileType(FileTypeList[i]).Name = DspType then
      begin
        Result := TFileType(FileTypeList[i]);
        Break;
      end;

    end;
  end;
end;

procedure TMainForm.AddBookMarkToListView(ANode: TTreeNode);
var
  i, iLine: Integer;
  s, bStr: String;
  ListItem: TListItem;
  sl: TStringList;
begin
  ContentsListView.Items.BeginUpdate;
  ContentsListView.Clear;
  ContentsListView.Items.EndUpdate;
  Application.ProcessMessages;
  if RichEdit.Lines.Text = '' then Exit;

  if TTextItem(ANode.Data).Bookmarker.Text <> '' then
  begin
    sl := TTextItem(ANode.Data).Bookmarker;
    for i := 0 to sl.Count -1 do
    begin
      s := sl[i];
      iLine := StrToInt(Copy(s, 1, Pos(',', s) -1));
      if WordWrapAction.Checked then
        iLine := RichEdit.LinesToRow(iLine);
      if iLine <= (RichEdit.ListCount -1) then
      begin
        RichEdit.PutRowMark(iLine, rm10);
        bStr :=  Copy(s, Pos(',', s) + 1, MaxInt);
        ListItem := ContentsListView.Items.Add;
        ListItem.ImageIndex := 0;
        ListItem.SubItems.Add(IntToStr(iLine + 1));
        ListItem.SubItems.Add(bStr);
      end;
    end;

  end;
end;

procedure TMainForm.AddContentsToListView(ANode: TTreeNode);
var
  i, j: Integer;
  s: String;
  FileType: TFileType;
  ContentsList, RichList: TStringList;
  chr: array[0..1] of Char;
  ListItem: TListItem;
//  P: TPoint;
//  R: TRect;
begin
  { TODO -c目次 : AddContentsToListView }
  if RichEdit.Lines.Text = '' then Exit;
  if not (TObject(ANode.Data) is TTextItem) then Exit;

  FileType := FileTypeJudgment(TTextItem(ANode.Data).DspType);
  if FileType.ContentsDisplay then
  begin
    Screen.Cursor := crHourGlass;
    StatusBar.Panels[0].Text := '目次表示中...';
    Application.ProcessMessages;
    ContentsListView.Items.BeginUpdate;
    ContentsList := TStringList.Create;
    ContentsList.Text := FileType.Contents.Text;
    ContentsList.Text := AnsiLowerCase(ContentsList.Text);
    RichList := TStringList.Create;//
//    if WordWrapAction.Checked then
//    begin
//      ProgressBar.StepIt;
//      for i := 0 to RichEdit.Lines.Count -1 do
//        RichList.Add(RichEdit.Lines[i]);
//    end
//    else
//      RichList.Text := RichEdit.Lines.Text;//


    if FileType.NumberContents then
      for i := 0 to 9 do
      begin
        ContentsList.Add(IntToStr(i));
        Windows.LCMapString(
          GetUserDefaultLCID(),
          LCMAP_FULLWIDTH,
          PChar(IntToStr(i)),
          Length(IntToStr(i)) + 1,
          Chr,
          Sizeof(chr)
          );
        ContentsList.Add(Trim(chr));
      end;
    try
      with ProgressBar do
      begin
        Min := 0;
//        Max := RichList.Count -1;
        Max := RichEdit.ListCount -1;
        Position := 0;
//        Step := 1;
      end;
      for i := 0 to RichEdit.ListCount -1 do
//      for i := 0 to RichList.Count -1 do
      begin
        ProgressBar.StepIt;
//          s := RichList[i];
        s := RichEdit.ListString[i];
////        c := RichEdit.Lines[i];
//        s := c;

        if FileType.BlankDeletion then s := Trim(s)  //空白削除がTrueのとき空白削除
        else
          if (AnsiPos(' ', s)  = 1) or
             (AnsiPos('　', s)  = 1) or
             (AnsiPos('#9', s)  = 1) or
             (AnsiPos('#13', s)  = 1) then Continue;

        if s = '' then Continue;
        s := AnsiLowerCase(s);

        for j := 0 to ContentsList.Count -1 do
        begin
          if AnsiPos(ContentsList[j], s)  = 1 then
          begin
            ListItem := ContentsListView.Items.Add;
            ListItem.ImageIndex := 1;
            ListItem.SubItems.Add(IntToStr(i + 1));
            ListItem.SubItems.Add(Trim(RichEdit.ListString[i]));
//            ListItem.SubItems.Add(Trim(RichList[i]));
            RichEdit.PutRowMark(i, rm11);

          end;

        end;

      end;
    finally
      Screen.Cursor := crDefault;
      ContentsList.Free;
      RichList.Free;
      ProgressBar.Position := 0;
      ContentsListView.Items.EndUpdate;
      StatusBar.Panels[0].Text := '目次表示終了';
      Application.ProcessMessages;
    end;

  end;
end;

procedure TMainForm.TreeViewChanging(Sender: TObject; Node: TTreeNode;
  var AllowChange: Boolean);
begin
  SetWordWrapColCount;
  NodeTextSave(TreeView.Selected);

end;

procedure TMainForm.GetBookMark;
var
  sl: TStringList;
  i: Integer;
begin
  with RichEdit do
  begin
    if Lines.Text = '' then Exit;
    sl := TStringList.Create;
    try
      for i := 0 to ListCount -1 do
      begin
//        if (ListRowMarks[i] <> [rm11]) and
//           (ListRowMarks[i] <> []) then
        if rm10 in ListRowMarks[i] then
        begin
          sl.Add(IntToStr(RowToLines(i)) + ',' + Lines[RowToLines(i)]);
        end;

      end;
      TTextItem(TreeView.Selected.Data).Bookmarker.Text := sl.Text;
//      ShowMessage(sl.Text);
    finally
      sl.Free;
    end;
  end;
end;

procedure TMainForm.NodeTextSave(SelNode: TTreeNode);
var
  SName, SPath, SExtension, SFull: String;
  SR: TSearchRec;
//  ms: TMemoryStream;
begin
  if (SelNode = nil) then Exit;

  if (TObject(SelNode.Data) is TTextItem) then
  begin
    SPath := TTextItem(SelNode.Data).Path;
    SName := TTextItem(SelNode.Data).Name;
    SExtension := TTextItem(SelNode.Data).Extension;
    SFull := SPath + SName + SExtension;
    //ShowMessage(SPath + SName + SExtension);
    //RichEdit.Lines.LoadFromFile(SPath + SName + SExtension);

//    if Trim(RichEdit.Lines.Text) <> Trim(OldSL.Text) then
//    if RichEdit.CanUndo  then
    GetBookMark;
    if RichEdit.Modified  then
    begin
//      ShowMessage('ch');
      ChangeAttributes(SFull);
      RichEdit.Lines.SaveToFile(SFull);


//      ShowMessage(OldSL.Text);
      { TODO -c予定 : 読みとり専用解消措置1 }
      FindFirst(SPath + SName + SExtension, faAnyFile, sr);
      try
        TTextItem(SelNode.Data).UpdateDay := FileDateToDateTime(sr.Time);
      finally
        SysUtils.FindClose(sr);
      end;

    end;

  end;
end;

procedure TMainForm.NodePathReName;
var
  SPath, SName: String;
  i: Integer;
  Node: TTreeNode;
begin
  for i := 0 to TreeView.Items.Count -1 do
  begin
    Node := TreeView.Items[i];
    if TObject(Node.Data) is TRootFolderItem then
    begin
      SPath := ExtractFilePath(Application.ExeName);
      TRootFolderItem(Node.Data).Path := SPath;
      Continue;
    end;          

    if TObject(Node.Data) is TTextItem then
    begin
      SPath := TFolderItem(Node.Parent.Data).Path;
      SName := TFolderItem(Node.Parent.Data).Name;
      TTextItem(Node.Data).Path := SPath + SName + '\';
      Continue;
    end;

    if TObject(Node.Data) is TFolderItem then
    begin
      SPath := TFolderItem(Node.Parent.Data).Path;
      SName := TFolderItem(Node.Parent.Data).Name;
      TFolderItem(Node.Data).Path := SPath + SName + '\';
      Continue;
    end;
  end;


end;

procedure TMainForm.AddComboBox(const FileName: String; ComboBox: TComboBox);
var
  i, ii: Integer;
const
  MAX_ADD_HISTORY = 100;
begin
  if FileName = '' then Exit;
  if ComboBox.Items.IndexOf(FileName) <> -1 then
  begin
    ii := ComboBox.Items.IndexOf(FileName);
    if ComboBox.ItemIndex <> ii then
    	ComboBox.Items.Delete(ii);
    ComboBox.Items.Insert(0, FileName);
  end
  else
  begin
    ComboBox.Items.Insert(0, FileName);
  end;
  if (ComboBox.Items.Count -1) > MAX_ADD_HISTORY then
    for i := ComboBox.Items.Count -1 downto MAX_ADD_HISTORY do
      ComboBox.Items.Delete(i);
  ComboBox.Text := FileName;

end;

procedure TMainForm.GoAddressActionExecute(Sender: TObject);
var
  i: Integer;
  Node: TTreeNode;
  sp, sn, se, sf: String;
begin
  for i := 0 to TreeView.Items.Count -1 do
  begin
    Node := TreeView.Items[i];

    if TObject(Node.Data) is TTextItem then
    begin
      sp := TTextItem(Node.Data).Path;
      sn := TTextItem(Node.Data).Name;
      se := TTextItem(Node.Data).Extension;
      sf := sp + sn + se;
      if sf = AddressComboBox.Text then
      begin
        if TreeView.Selected.Parent <> Node.Parent then
          TreeView.FullCollapse;
        TreeView.Selected := Node;
        Break;
      end
      else Continue;
    end;
      
    if TObject(Node.Data) is TFolderItem then
    begin
      sp := TFolderItem(Node.Data).Path;
      sn := TFolderItem(Node.Data).Name;
      sf := sp + sn;
      if sf = AddressComboBox.Text then
      begin
        TreeView.Selected := Node;
        Break;
      end
      else Continue;
    end;

  end;

end;

procedure TMainForm.SettingActionExecute(Sender: TObject);
begin
  OptionDlg := TOptionDlg.Create(Self);
  try
    OptionDlg.ShowModal;
  finally
    OptionDlg.Free;
  end;

end;

procedure TMainForm.AppShowHint(var HintStr: string; var CanShow: Boolean;
  var HintInfo: THintInfo);
var
  P: TPoint;
  Style: DWORD;
  Node: TTreeNode;
  R: TRect;
  strName, strPath, strComment, strEx, strDsp, strFull: String;
  CrDay, UpDay: TDateTime;
  ReadBool: Boolean;

  function CommentStr(str: String): String;
  begin
    Result := '';
    if str <> '' then
      Result := #13#10 + '[コメント]' + #13#10 + str;
  end;

  function DateTimeToStr(Day: TDateTime): String;
  begin
    Result := FormatDateTime('yyyy/mm/dd日 hh:nn', Day);
  end;

  function ReadOnlyToStr(Bool: Boolean): String;
  begin
    if Bool then
      Result := #13#10 + '* ReadOnly'
    else
      Result := '';
  end;

begin
  CanShow := True;
  if HintInfo.HintControl = TreeView then
  begin
    // TTreeViewのコントロール内にTTreeNode.Textが収まりきらないヒントを消す
    Style := GetWindowLong(TreeView.Handle, GWL_STYLE);
    Style := Style or TVS_NOTOOLTIPS; //uses + commctrl
    SetWindowLong(TreeView.Handle, GWL_STYLE, Style);
    //Node取得
    GetCursorPos(P);
    P := TreeView.ScreenToClient(P);
    Node := TreeView.GetNodeAt(P.X, P.Y);
    if Node = nil then Exit;

    r := Node.DisplayRect(True);
    HintInfo.CursorRect := R;
    HintInfo.HideTimeout := 10000;
    HintInfo.ReshowTimeout := 500;
    //HintInfo.HintData := Node.Data;
    //TTextItem
    if TObject(Node.Data) is TTextItem then
    begin
      strName := TTextItem(Node.Data).Name;
      strPath := TTextItem(Node.Data).Path;
      strComment := TTextItem(Node.Data).Comment;
      strEx := TTextItem(Node.Data).Extension;
      CrDay := TTextItem(Node.Data).CreationDay;
      UpDay := TTextItem(Node.Data).UpdateDay;
      strDsp := TTextItem(Node.Data).DspType;
      ReadBool := TTextItem(Node.Data).ReadOnlyBool;
      strFull := TTextItem(Node.Data).FullName;

      HintStr := '[ファイル名]  ' + strName + strEx + #13#10 +
                 '[アドレス]     ' + strFull + #13#10 +
                 '[作成日]     ' + DateTimeToStr(CrDay) + #13#10 +
                 '[更新日]     ' + DateTimeToStr(UpDay) + #13#10 +
                 '[表示形式]  ' + strDsp +
                 ReadOnlyToStr(ReadBool) +
                 CommentStr(strComment);


    HintInfo.ReshowTimeout := 0;
    Exit;
    end;
    //TFolderItem
    if TObject(Node.Data) is TFolderItem then
    begin                 
      strName := TFolderItem(Node.Data).Name;
      strPath := TFolderItem(Node.Data).Path;
      strComment := TFolderItem(Node.Data).Comment;
      CrDay := TFolderItem(Node.Data).CreationDay;
      ReadBool := TFolderItem(Node.Data).ReadOnlyBool;
      strFull := TFolderItem(Node.Data).FullName;

      HintStr := '[ファイル名]  ' + strName + strEx + #13#10 +
                 '[アドレス]     ' + strPath + #13#10 +
                 '[作成日]     ' + DateTimeToStr(CrDay) +
                 ReadOnlyToStr(ReadBool) +
                 CommentStr(strComment);
                   
    HintInfo.ReshowTimeout := 0;
    Exit;
    end;
  end;

end;

procedure TMainForm.TreeViewMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  Application.OnShowHint := AppShowHint;
  UpTimer.Enabled := False;
  DownTimer.Enabled := False;
  LeftTimer.Enabled := False;
  RightTimer.Enabled := False;
end;

procedure TMainForm.EditCopyActionExecute(Sender: TObject);
begin
  RichEdit.CopyToClipboard;
end;

procedure TMainForm.EditCutActionExecute(Sender: TObject);
begin
  RichEdit.CutToClipboard;
end;

procedure TMainForm.EditDeleteActionExecute(Sender: TObject);
begin
  RichEdit.SelText := '';
end;

procedure TMainForm.EditPasteActionExecute(Sender: TObject);
begin
  RichEdit.PasteFromClipboard;
end;

procedure TMainForm.EditActionEnable;
  function SelectText(s: String): Boolean;
  begin
    if s <> '' then
      Result := True
    else
      Result := False;
  end;

begin
  case RichEdit.ReadOnly of
    True:
    begin
      EditCutAction.Enabled := False;
      EditCopyAction.Enabled := SelectText(RichEdit.SelText);
      EditPasteAction.Enabled := False;
      EditSelectAllAction.Enabled := True;
//      EditUndoAction.Enabled := False;
//      EditRedoAction.Enabled := False;
      EditDeleteAction.Enabled := False;
      EditUndoAction.Enabled := False;
      EditRedoAction.Enabled := False;
    end;
    False:
    begin
      EditCutAction.Enabled := SelectText(RichEdit.SelText);
      EditCopyAction.Enabled := SelectText(RichEdit.SelText);
      EditPasteAction.Enabled := True;
      EditSelectAllAction.Enabled := True;
//      EditUndoAction.Enabled := True;
//      EditRedoAction.Enabled := True;
      EditDeleteAction.Enabled := SelectText(RichEdit.SelText);
      EditUndoAction.Enabled := RichEdit.CanUndo;
      EditRedoAction.Enabled := RichEdit.CanRedo;
    end;
  end;
  SearchDspTextAction.Enabled := SelectText(RichEdit.SelText);
end;


procedure TMainForm.ReadOnlyStatus;
begin

  if RichEdit.ReadOnly then
    StatusBar.Panels[1].Text := '書込不可'
  else
    StatusBar.Panels[1].Text := '書込可';
end;

procedure TMainForm.TreeViewMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Node: TTreeNode;
begin
//  TreeView.OnChange := TreeViewChange;
//  TreeView.OnChanging := TreeViewChanging;
//  FCreateFlag := False;
  if OptionSetting.Standard.ContentsDsp = False then SearchListView.Clear;

  SearchStyle := ssNone;
  Node := TreeView.GetNodeAt(X, Y);
  if Node = nil then Exit;

  if Node <> nil then
  begin
    if Button = mbRight then
      Node.Selected := True;
  end;
//  ShowMessage('clk');
//  TreeChange(Node);
  if (TObject(Node.Data) is TTextItem) then
  if (Node = OldNode) then
  begin
    EmphasisDsp(Node);
    if RichEdit.Lines.Text = '' then Exit;
    GetBookMark;
    AddBookMarkToListView(Node);
    if OptionSetting.Standard.ContentsDsp then
      AddContentsToListView(Node);
//    NodeTextSave(TreeView.Selected);
//    TreeChange(Node);
  end;
end;

procedure TMainForm.FileTypeSaveToFile;
var
  i: Integer;
  sName, sExtension, sContents, sEmphasis: String;
  bContents, bEmphasis, bBlank, bNumber: Boolean;
//  sl: array of TStringList;
  List: TObjectList;
  IniFile: TIniFile;

  function StringListToCommaText(sList: TStringList): String;
  var
    s: String;
    i: Integer;

    function CommaSaveStr(Str: WideString): WideString;
    var
      ss: String;
    begin
      if AnsiPos(',', Str) > 0 then
      begin
        ss := ECharToJChar(Str);
        Result := ss;
      end
      else
      begin
        if AnsiPos('"', Str) > 0 then
        begin
          ss := ECharToJChar(Str);
          Result := ss;
        end
        else
        begin
          Result := Str;
        end;
      end;
    end;

  begin
    s := '';
    for i := 0 to sList.Count -1 do
    begin
      if i <> (sList.Count -1) then
        s := s + '"' + CommaSaveStr(sList[i]) + '",'
      else
        s := s + '"' + CommaSaveStr(sList[i]) + '"';
    end;
    Result := s;
  end;

begin
  List := OptionSetting.FileTypeList;
  OptionIniFileCompo.WriteInt('Option.FileType', 'FileType.Count', List.Count);
  for i := 0 to List.Count -1 do
  begin
    sName := TFileType(List[i]).Name;
    OptionIniFileCompo.WriteStr('Option.FileType', 'FileType.Name#' + IntToStr(i), sName);
    IniFile := TIniFile.Create(MyFileTypeDataPath + sName + '.ini');
    try
      with IniFile do
      begin
        sExtension := TFileType(List[i]).Extension.CommaText;
        sContents :=  TFileType(List[i]).Contents.CommaText;
        sEmphasis :=  {StringListToCommaText(}TFileType(List[i]).Emphasis.CommaText;//);
        bContents :=  TFileType(List[i]).ContentsDisplay;
        bEmphasis :=  TFileType(List[i]).EmphasisDisplay;
        bBlank :=     TFileType(List[i]).BlankDeletion;
        bNumber :=    TFileType(List[i]).NumberContents;
        WriteString(sName, 'Extension', sExtension);
        WriteString(sName, 'Contents', sContents);
        WriteString(sName, 'Emphasis', sEmphasis);
        WriteBool(sName, 'ContentsDisplay', bContents);
        WriteBool(sName, 'EmphasisDisplay', bEmphasis);
        WriteBool(sName, 'BlankDeletion', bBlank);
        WriteBool(sName, 'NumberContents', bNumber);
      end;

    finally
      IniFile.Free;
    end;
    //\f
//    if sName = DEFAULT_DELPHI_NAME then
//      TFileType(List[i]).Fountain.WriteIni(MyFileTypeDataPath + sName + '.ini' ,sName, 'DelphiFountain')
//    else if sName = DEFAULT_HTML_NAME then
//      TFileType(List[i]).Fountain.WriteIni(MyFileTypeDataPath + sName + '.ini' ,sName, 'HTMLFountain')
//    else if sName = DEFAULT_PERL_NAME then
//      TFileType(List[i]).Fountain.WriteIni(MyFileTypeDataPath + sName + '.ini' ,sName, 'PerlFountain')
//    else if sName = DEFAULT_CPP_NAME then
//      TFileType(List[i]).Fountain.WriteIni(MyFileTypeDataPath + sName + '.ini' ,sName, 'CppFountain')
//    else if sName = DEFAULT_JAVA_NAME then
//      TFileType(List[i]).Fountain.WriteIni(MyFileTypeDataPath + sName + '.ini' ,sName, 'JavaFountain')
//    else if sName = DEFAULT_COBOL_NAME then
//      TFileType(List[i]).Fountain.WriteIni(MyFileTypeDataPath + sName + '.ini' ,sName, 'COBOLFountain')
//    else if sName = DEFAULT_JSP_NAME then
//      TFileType(List[i]).Fountain.WriteIni(MyFileTypeDataPath + sName + '.ini' ,sName, 'JSPFountain')
//    else if sName = DEFAULT_SQL_NAME then
//      TFileType(List[i]).Fountain.WriteIni(MyFileTypeDataPath + sName + '.ini' ,sName, 'PLSQLFountain')
//    else if sName = DEFAULT_RUBY_NAME then
//      TFileType(List[i]).Fountain.WriteIni(MyFileTypeDataPath + sName + '.ini' ,sName, 'RubyFountain')
//      ;
  end;



//  sl := TStringList.Create;
//  try
//    for i := 0 to OptionSetting.FileTypeList.Count -1 do
//    begin
//      sName := TFileType(List[i]).Name;
//      sEx := sEx + TFileType(List[i]).Extension.Text + ',';
//
//    end;
//    sl.Add(sName);//1
//    sl.Add(sEx);
//    ShowMessage(sl.Text);
//  finally
//    sl.Free;
//  end;

end;

procedure TMainForm.FileTypeLoadFromFile;
var
  i, ftCount: Integer;
  sName, sExtension, sContents, sEmphasis: String;
  bContents, bEmphasis, bBlank, bNumber: Boolean;
  //List: TObjectList;
  IniFile: TIniFile;
  FileType, ftText, ftDelphi, ftHTML, ftPerl, ftCpp, ftJava, ftCOBOL,
  ftJSP, ftSQL, ftRuby, ftINI: TFileType;
begin
  { TODO -oyhira -cprocedure : ファイル形式読み込み }
  ftCount := OptionIniFileCompo.ReadInt('Option.FileType', 'FileType.Count', 0);
  if ftCount <> 0 then
  begin

    for i := 0 to ftCount -1 do
    begin
      sName := OptionIniFileCompo.ReadStr('Option.FileType', 'FileType.Name#' + IntToStr(i), '');
      if sName <> '' then
      begin
        IniFile := TIniFile.Create(MyFileTypeDataPath + sName + '.ini');
        try
          with IniFile do
          begin
            sExtension := ReadString(sName, 'Extension', DEFAULT_TEXT_EXTENSION);
            sContents :=  ReadString(sName, 'Contents', DEFAULT_TEXT_CONTENTS);
            //ShowMessage(sContents);
            sEmphasis :=  ReadString(sName, 'Emphasis', '');
            bContents :=  ReadBool(sName, 'ContentsDisplay', True);
            bEmphasis :=  ReadBool(sName, 'EmphasisDisplay', True);
            bBlank :=     ReadBool(sName, 'BlankDeletion', True);
            bNumber :=    ReadBool(sName, 'NumberContents', True);

            FileType := TFileType.Create;
            with FileType do
            begin
              Name := sName;
              Extension.CommaText := sExtension;
              Contents.CommaText := sContents;
              //ShowMessage(Extension.Text);
              Emphasis.CommaText := sEmphasis;
              ContentsDisplay := bContents;
              EmphasisDisplay := bEmphasis;
              BlankDeletion := bBlank;
              NumberContents := bNumber;
              //\f                                                
              if sName = DEFAULT_DELPHI_NAME then begin           //Delphiファイル
                Fountain := DelphiFountain;
                Fountain.ReserveWordList.Text := Emphasis.Text;
//                Fountain.ReadIni(MyFileTypeDataPath + sName + '.ini' ,sName, 'DelphiFountain');
              end else if sName = DEFAULT_HTML_NAME then begin    //HTMLファイル
                Fountain := HTMLFountain;
                Fountain.ReserveWordList.Text := Emphasis.Text;
//                Fountain.ReadIni(MyFileTypeDataPath + sName + '.ini' ,sName, 'HTMLFountain');
              end else if sName = DEFAULT_PERL_NAME then begin     //Perlファイル
                Fountain := PerlFountain;
                Fountain.ReserveWordList.Text := Emphasis.Text;
                Fountain.ReadIni(MyFileTypeDataPath + sName + '.ini' ,sName, 'PerlFountain'); 
              end else if sName = DEFAULT_CPP_NAME then begin      //C++ファイル
                Fountain := CppFountain;
                Fountain.ReserveWordList.Text := Emphasis.Text;
//                Fountain.ReadIni(MyFileTypeDataPath + sName + '.ini' ,sName, 'CppFountain');
              end else if sName = DEFAULT_JAVA_NAME then begin      //JAVAファイル
                Fountain := JavaFountain;
                Fountain.ReserveWordList.Text := Emphasis.Text;
//                Fountain.ReadIni(MyFileTypeDataPath + sName + '.ini' ,sName, 'JavaFountain');
              end else if sName = DEFAULT_COBOL_NAME then begin     //COBOLファイル
                Fountain := COBOLFountain;
                Fountain.ReserveWordList.Text := Emphasis.Text;
//                Fountain.ReadIni(MyFileTypeDataPath + sName + '.ini' ,sName, 'COBOLFountain');
              end else if sName = DEFAULT_JSP_NAME then begin       //JSPファイル
                Fountain := JSPFountain;
                Fountain.ReserveWordList.Text := Emphasis.Text;
//                Fountain.ReadIni(MyFileTypeDataPath + sName + '.ini' ,sName, 'JSPFountain');
              end else if sName = DEFAULT_SQL_NAME then begin       //SQLファイル
                Fountain := PLSQLFountain;
                Fountain.ReserveWordList.Text := Emphasis.Text;
//                Fountain.ReadIni(MyFileTypeDataPath + sName + '.ini' ,sName, 'PLSQLFountain');
              end else if sName = DEFAULT_RUBY_NAME then begin      //Rubyファイル
                Fountain := RubyFountain;
                Fountain.ReserveWordList.Text := Emphasis.Text;
//                Fountain.ReadIni(MyFileTypeDataPath + sName + '.ini' ,sName, 'RubyFountain');
              end else
                Fountain := nil;

            end;
            OptionSetting.FileTypeList.Add(FileType);
          end;
        finally
          IniFile.Free;
        end;

      end;

    end;
  end
  else
  begin
    //テキストファイル
    ftText := TFileType.Create;
    with ftText do
    begin
      Name := DEFAULT_TEXT_NAME;
      Extension.CommaText := DEFAULT_TEXT_EXTENSION;
      Contents.CommaText := DEFAULT_TEXT_CONTENTS;
      Emphasis.CommaText := DEFAULT_TEXT_EMPHASIS;
      ContentsDisplay := True;
      EmphasisDisplay := False;
      BlankDeletion := True;
      NumberContents := True;
      Fountain := nil;
    end;
    OptionSetting.FileTypeList.Add(ftText);

    //HTMLファイル
    ftHTML := TFileType.Create;
    with ftHTML do
    begin
      Name := DEFAULT_HTML_NAME;
      Extension.CommaText := DEFAULT_HTML_EXTENSION;
      Contents.CommaText := DEFAULT_HTML_CONTENTS;
      Emphasis.CommaText := DEFAULT_HTML_EMPHASIS;
      ContentsDisplay := True;
      EmphasisDisplay := True;
      BlankDeletion := True;
      NumberContents := False;
      Fountain := HTMLFountain;
      Fountain.ReserveWordList.Text := Emphasis.Text;
    end;
    OptionSetting.FileTypeList.Add(ftHTML);

    //C++ファイル
    ftCpp := TFileType.Create;
    with ftCpp do
    begin
      Name := DEFAULT_CPP_NAME;
      Extension.CommaText := DEFAULT_CPP_EXTENSION;
      Contents.CommaText := DEFAULT_CPP_CONTENTS;
      Emphasis.CommaText := DEFAULT_CPP_EMPHASIS;
      ContentsDisplay := False;
      EmphasisDisplay := True;
      BlankDeletion := True;
      NumberContents := False;
      Fountain := CppFountain;
      Fountain.ReserveWordList.Text := Emphasis.Text;
    end;
    OptionSetting.FileTypeList.Add(ftCpp);

    //JAVAファイル
    ftJava := TFileType.Create;
    with ftJava do
    begin
      Name := DEFAULT_JAVA_NAME;
      Extension.CommaText := DEFAULT_JAVA_EXTENSION;
      Contents.CommaText := DEFAULT_JAVA_CONTENTS;
      Emphasis.CommaText := DEFAULT_JAVA_EMPHASIS;
      ContentsDisplay := False;
      EmphasisDisplay := True;
      BlankDeletion := True;
      NumberContents := False;
      Fountain := JavaFountain;
      Fountain.ReserveWordList.Text := Emphasis.Text;
    end;
    OptionSetting.FileTypeList.Add(ftJava);

    //Delphiファイル
    ftDelphi := TFileType.Create;
    with ftDelphi do
    begin
      Name := DEFAULT_DELPHI_NAME;
      Extension.CommaText := DEFAULT_DELPHI_EXTENSION;
      Contents.CommaText := DEFAULT_DELPHI_CONTENTS;
      Emphasis.CommaText := DEFAULT_DELPHI_EMPHASIS;
      ContentsDisplay := True;
      EmphasisDisplay := True;
      BlankDeletion := True;
      NumberContents := False;
      Fountain := DelphiFountain;
      Fountain.ReserveWordList.Text := Emphasis.Text;
    end;
    OptionSetting.FileTypeList.Add(ftDelphi);

    //Perlファイル
    ftPerl := TFileType.Create;
    with ftPerl do
    begin
      Name := DEFAULT_PERL_NAME;
      Extension.CommaText := DEFAULT_PERL_EXTENSION;
      Contents.CommaText := DEFAULT_PERL_CONTENTS;
      Emphasis.CommaText := DEFAULT_PERL_EMPHASIS;
      ContentsDisplay := False;
      EmphasisDisplay := True;
      BlankDeletion := True;
      NumberContents := False;
      Fountain := PerlFountain;   
      Fountain.ReserveWordList.Text := Emphasis.Text;
    end;
    OptionSetting.FileTypeList.Add(ftPerl);

    //COBOLファイル
    ftCOBOL := TFileType.Create;
    with ftCOBOL do
    begin
      Name := DEFAULT_COBOL_NAME;
      Extension.CommaText := DEFAULT_COBOL_EXTENSION;
      Contents.CommaText := DEFAULT_COBOL_CONTENTS;
      Emphasis.CommaText := DEFAULT_COBOL_EMPHASIS;
      ContentsDisplay := False;
      EmphasisDisplay := True;
      BlankDeletion := True;
      NumberContents := False;
      Fountain := COBOLFountain;
      Fountain.ReserveWordList.Text := Emphasis.Text;
    end;
    OptionSetting.FileTypeList.Add(ftCOBOL);

    //Rubyファイル
    ftRuby := TFileType.Create;
    with ftRuby do
    begin
      Name := DEFAULT_RUBY_NAME;
      Extension.CommaText := DEFAULT_RUBY_EXTENSION;
      Contents.CommaText := DEFAULT_RUBY_CONTENTS;
      Emphasis.CommaText := DEFAULT_RUBY_EMPHASIS;
      ContentsDisplay := False;
      EmphasisDisplay := True;
      BlankDeletion := True;
      NumberContents := False;
      Fountain := RubyFountain;
      Fountain.ReserveWordList.Text := Emphasis.Text;
    end;
    OptionSetting.FileTypeList.Add(ftRuby);

    //JSPファイル
    ftJSP := TFileType.Create;
    with ftJSP do
    begin
      Name := DEFAULT_JSP_NAME;
      Extension.CommaText := DEFAULT_JSP_EXTENSION;
      Contents.CommaText := DEFAULT_JSP_CONTENTS;
      Emphasis.CommaText := DEFAULT_JSP_EMPHASIS;
      ContentsDisplay := False;
      EmphasisDisplay := True;
      BlankDeletion := True;
      NumberContents := False;
      Fountain := JSPFountain;
      Fountain.ReserveWordList.Text := Emphasis.Text;
    end;
    OptionSetting.FileTypeList.Add(ftJSP);

    //SQLファイル
    ftSQL := TFileType.Create;
    with ftSQL do
    begin
      Name := DEFAULT_SQL_NAME;
      Extension.CommaText := DEFAULT_SQL_EXTENSION;
      Contents.CommaText := DEFAULT_SQL_CONTENTS;
      Emphasis.CommaText := DEFAULT_SQL_EMPHASIS;
      ContentsDisplay := False;
      EmphasisDisplay := True;
      BlankDeletion := True;
      NumberContents := False;
      Fountain := PLSQLFountain;
      Fountain.ReserveWordList.Text := Emphasis.Text;
    end;
    OptionSetting.FileTypeList.Add(ftSQL);

    //INIファイル
    ftINI := TFileType.Create;
    with ftINI do
    begin
      Name := DEFAULT_INI_NAME;
      Extension.CommaText := DEFAULT_INI_EXTENSION;
      Contents.CommaText := DEFAULT_INI_CONTENTS;
      Emphasis.CommaText := DEFAULT_INI_EMPHASIS;
      ContentsDisplay := True;
      EmphasisDisplay := False;
      BlankDeletion := True;
      NumberContents := False;
      Fountain := nil;
    end;
    OptionSetting.FileTypeList.Add(ftINI);

  //\f
  end;
end;

function TMainForm.IntToSearchDsp(Int: Integer): TSearchDsplay;
begin
  Result := sdTreeView;
  case Int of
    0: Result := sdTreeView;
    1: Result := sdListView;
  end;
end;

procedure TMainForm.OptionLoadFromFile;
begin
  { TODO -cprocedure : 設定の読み込み }
  FileTypeLoadFromFile;

    with OptionIniFileCompo, OptionSetting do
  begin
    //デフォルトの表示形式
    Display.DefaultDspType := ReadStr('Display', 'DefaultDsp', DEFAULT_TEXT_NAME);

    //標準
    Standard.ReadOnlyAll   := ReadBool('Standard', 'ReadOnlyAll',   False);
    Standard.FolderInfoDsp := ReadBool('Standard', 'FolderInfoDsp', False);
    Standard.ContentsDsp   := ReadBool('Standard', 'ContentsDsp',   False);
    Standard.Expand        := ReadBool('Standard', 'Expand',        True);
    Standard.SearchDsp     := IntToSearchDsp(ReadInt('Standard', 'SearchDsp', 0));
    Standard.HotTrack      := ReadBool('Standard', 'HotTrack',       True);
    Standard.PopupHint     := ReadBool('Standard', 'PopupHint',      True);

    //エディタ
    EditorExProp.ReadIni(ExtractFilePath(Application.ExeName) + 'editor.tls', 'Editor', 'Data');
    EditorExProp.AssignTo(RichEdit);
//    RichEdit.Font.Name               := ReadStr ('Editor', 'FontName',              RichEdit.Font.Name);
//    RichEdit.Font.Size               := ReadInt ('Editor', 'FontSize',              RichEdit.Font.Size);
//    RichEdit.Caret.AutoIndent        := ReadBool('Editor', 'AutoIndent',            RichEdit.Caret.AutoIndent);
//    RichEdit.UndoListMax             := ReadInt ('Editor', 'UndoMaxCount',          RichEdit.UndoListMax);
//    RichEdit.Caret.TabSpaceCount     := ReadInt ('Editor', 'TabWidth',              RichEdit.Caret.TabSpaceCount);
//    RichEdit.Marks.RetMark.Visible   := ReadBool('Editor', 'Mark.NewLine',          RichEdit.Marks.RetMark.Visible);
//    RichEdit.Marks.EofMark.Visible   := ReadBool('Editor', 'Mark.EOF',              RichEdit.Marks.EofMark.Visible);
//    RichEdit.Marks.Underline.Visible := ReadBool('Editor', 'Mark.UnderLine',        RichEdit.Marks.Underline.Visible);
//    RichEdit.Ruler.Visible           := ReadBool('Editor', 'Ruler.Enabled',         RichEdit.Ruler.Visible);
//    RichEdit.Ruler.GaugeRange        := ReadInt ('Editor', 'Ruler.GaugeRange',      RichEdit.Ruler.GaugeRange);
//    RichEdit.Ruler.Edge              := ReadBool('Editor', 'Ruler.BorderLine',      RichEdit.Ruler.Edge);
//    RichEdit.Ruler.Color             := ReadInt ('Editor', 'Ruler.StrColor',        RichEdit.Ruler.Color);
//    RichEdit.Ruler.BkColor           := ReadInt ('Editor', 'Ruler.BackColor',       RichEdit.Ruler.BkColor);
//    RichEdit.Leftbar.Visible         := ReadBool('Editor', 'LineNumBer.Enabled',    RichEdit.Leftbar.Visible);
//    RichEdit.Leftbar.ZeroLead        := ReadBool('Editor', 'LineNumBer.ZeroLead',   RichEdit.Leftbar.ZeroLead);
//    RichEdit.Leftbar.Column          := ReadInt ('Editor', 'LineNumBer.Colum',      RichEdit.Leftbar.Column);
//    RichEdit.Leftbar.Edge            := ReadBool('Editor', 'LineNumBer.BorderLine', RichEdit.Leftbar.Edge);
//    RichEdit.Leftbar.Color           := ReadInt ('Editor', 'LineNumBer.StrColor',   RichEdit.Leftbar.Color);
//    RichEdit.Leftbar.BkColor         := ReadInt ('Editor', 'LineNumBer.BackColor',  RichEdit.Leftbar.BkColor);


  end;
  OptionSettingReflection;
end;

function TMainForm.SearchDspToInt(SearchDsp: TSearchDsplay): Integer;
begin
  Result := 0;
  case SearchDsp of
    sdTreeView: Result := 0;
    sdListView: Result := 1;
  end;
end;

procedure TMainForm.OptionSaveToFile;
begin
  { TODO -oyhira -cprocedure : 設定の保存 }
  FileTypeSaveToFile;

  with OptionIniFileCompo, OptionSetting do
  begin
    //デフォルトの表示形式
    WriteStr('Display', 'DefaultDsp', Display.DefaultDspType);

    //標準
    WriteBool('Standard', 'ReadOnlyAll',   Standard.ReadOnlyAll);
    WriteBool('Standard', 'FolderInfoDsp', Standard.FolderInfoDsp);
    WriteBool('Standard', 'ContentsDsp',   Standard.ContentsDsp);
    WriteBool('Standard', 'Expand',        Standard.Expand);
    WriteInt ('Standard', 'SearchDsp',     SearchDspToInt(Standard.SearchDsp));
    WriteBool('Standard', 'HotTrack',      Standard.HotTrack);
    WriteBool('Standard', 'PopupHint',     Standard.PopupHint);

    //エディタ
    RichEdit.FindString := '';
    EditorExProp.Assign(RichEdit);
    EditorExProp.WriteIni(ExtractFilePath(Application.ExeName) + 'editor.tls', 'Editor', 'Data');
//    WriteStr ('Editor', 'FontName',              RichEdit.Font.Name               );
//    WriteInt ('Editor', 'FontSize',              RichEdit.Font.Size               );
//    WriteBool('Editor', 'AutoIndent',            RichEdit.Caret.AutoIndent        );
//    WriteInt ('Editor', 'UndoMaxCount',          RichEdit.UndoListMax             );
//    WriteInt ('Editor', 'TabWidth',              RichEdit.Caret.TabSpaceCount     );
//    WriteBool('Editor', 'Mark.NewLine',          RichEdit.Marks.RetMark.Visible   );
//    WriteBool('Editor', 'Mark.EOF',              RichEdit.Marks.EofMark.Visible   );
//    WriteBool('Editor', 'Mark.UnderLine',        RichEdit.Marks.Underline.Visible );
//    WriteBool('Editor', 'Ruler.Enabled',         RichEdit.Ruler.Visible           );
//    WriteInt ('Editor', 'Ruler.GaugeRange',      RichEdit.Ruler.GaugeRange        );
//    WriteBool('Editor', 'Ruler.BorderLine',      RichEdit.Ruler.Edge              );
//    WriteInt ('Editor', 'Ruler.StrColor',        RichEdit.Ruler.Color             );
//    WriteInt ('Editor', 'Ruler.BackColor',       RichEdit.Ruler.BkColor           );
//    WriteBool('Editor', 'LineNumBer.Enabled',    RichEdit.Leftbar.Visible         );
//    WriteBool('Editor', 'LineNumBer.ZeroLead',   RichEdit.Leftbar.ZeroLead        );
//    WriteInt ('Editor', 'LineNumBer.Colum',      RichEdit.Leftbar.Column          );
//    WriteBool('Editor', 'LineNumBer.BorderLine', RichEdit.Leftbar.Edge            );
//    WriteInt ('Editor', 'LineNumBer.StrColor',   RichEdit.Leftbar.Color           );
//    WriteInt ('Editor', 'LineNumBer.BackColor',  RichEdit.Leftbar.BkColor         );
  end;

end;

procedure TMainForm.ContentsListViewMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Item: TListItem;
begin
  Item := ContentsListView.GetItemAt(X, Y);
  if Item = nil then Exit;
  if Button = mbRight then Exit;
  //LayoutCheckFalse;
  Application.ProcessMessages;
  ContentsJump(Item, 0);
end;

procedure TMainForm.ContentsListViewSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
//  if Item = nil then Exit;
//  if RichEdit.Lines.Text = '' then Exit;
//  LayoutCheckFalse;
//  Application.ProcessMessages;
//  ContentsJump(Item, 0);
end;

procedure TMainForm.ContentsJump(Item: TListItem; idx: Integer);
var
  ss: String;
  NowLine : Integer;
  ToLine : Integer;
  LinePos: Integer;
begin
//  LayoutCheckFalse;
  with RichEdit do
  begin
    NowLine:=Perform(EM_LINEFROMCHAR,SelStart,0);
    if NowLine < 0 then Exit;
    ss := Trim(Item.SubItems[idx]);
    if ss = TITLE_SEARCH then Exit;
    ToLine := StrToInt(ss) -1;
//    if NowLine < ToLine then
//    begin
//      Perform(EM_LINESCROLL, 0,ToLine - NowLine);
//      SelStart:=Perform(EM_LINEINDEX, ToLine, 0);
//      Perform(EM_SCROLLCARET, 0, 0);
//    end
//    else
//    begin
      SelStart := SendMessage(Handle, EM_LINEINDEX, ToLine, 0);
      SendMessage(Handle, EM_SCROLLCARET, 0, 0);
//    end;

    Application.ProcessMessages;
    if SearchStyle <> ssNone then
    begin
      ss := AnsiLowerCase(RichEdit.ListString[ToLine]);
      LinePos := AnsiPos(SearchString, ss) -1;
      SelStart := SelStart + LinePos;
      SelLength := Length(SearchString);
      LayoutCheckFalse;
      Application.ProcessMessages;
      SetFocus;
    end
    else
    begin
      SelLength := Length(ListString[ToLine]);
      LayoutCheckFalse;
      Application.ProcessMessages;
      SetFocus;
    end;

  end;
end;

function TMainForm.FindTextItem(ANode: TTreeNode; SubStr: String): TTreeNode;
var
  i: Integer;
  tim: TTextItem;
begin
  Result := nil;
  for i := 0 to ANode.Count -1 do
  begin
    if TObject(ANode.Item[i].Data) is TTextItem then
    begin
      tim := TTextItem(ANode.Item[i].Data);
      //ShowMessage(tim.FullName + #13#10 + SubStr);
      if tim.FullName = SubStr then
      begin
        Result := ANode.Item[i];
        Break;
      end;
    end;
  end;
end;

procedure TMainForm.TextFileImport(OName, NName: String; PNode: TTreeNode; fi: TFolderItem);
var
  Msg: String;
  sl: TStringList;
  ti: TTextItem;
  DlgSelect: Integer;
  NNode: TTreeNode;
begin
  sl := TStringList.Create;
  try
    sl.LoadFromFile(OName);
    if FileExists(NName) then
    begin
      Msg := '"' + ExtractFileName(OName) + '" はすでに "' + fi.Name +
        '" の中に存在しています。上書きしますか？' + #13#10 + '上書きする場合は「はい」を' +
        '編集ダイアログを開いてタイトルを編集するには「いいえ」を何もしないには' +
        '「キャンセル」を押してください。';
      DlgSelect := Application.MessageBox(PChar(Msg), '確認',
        MB_ICONQUESTION or MB_YESNOCANCEL);
      case DlgSelect of
        IDYES:
        begin
          sl.SaveToFile(NName);
          RichEdit.Lines.Text := sl.Text;
          NNode := FindTextItem(PNode, NName);
          if NNode = nil then Exit;
          TTextItem(NNode.Data).UpdateDay := GetFileUpdateDay(NName);
          NNode.Selected := True;

          SaveTreeItemDataToFile;
          Exit;
        end;
        IDNO:
        begin
          IpPath := fi.Path + fi.Name + '\';
          IpExe  := ExtractFileExt(NName);
          IpName:= GetFileName(NName, ExtractFileExt(NName));
          IpDspType := GetDspType(ExtractFileExt(NName));
          OldSL.Text := sl.Text;

          //LayoutCheckFalse;

          TextSetDlg := TTextSetDlg.Create(Self);
          try
            ItemEditMode := imImport;
            TextSetDlg.ShowModal;
          finally
            TextSetDlg.Free;
          end;

        end;
        IDCANCEL:
        begin
          Exit;
        end;
      end;
    end
    else
    begin

      sl.SaveToFile(NName);
      ti := TTextItem.Create(PNode);
      ti.Path         := fi.Path + fi.Name;
      ti.Extension    := ExtractFileExt(NName);
      ti.Name         := GetFileName(NName, ti.Extension);
      ti.DspType      := GetDspType(ExtractFileExt(NName));
      ti.CreationDay  := GetFileUpdateDay(NName);
      ti.UpdateDay    := ti.CreationDay;
      ti.Comment      := '';
      ti.ReadOnlyBool := False;
      NNode := TreeView.Items.AddChildObject(PNode, ti.Name + ti.Extension, Pointer(ti));
      NNode.Selected := True;
      RichEdit.Lines.Text := sl.Text;
      SaveTreeItemDataToFile;
    end;

  finally
    sl.Free;
  end;

end;

procedure TMainForm.FileOpenActionExecute(Sender: TObject);
var
  OName, NName: String;
  fi: TFolderItem;
  PNode: TTreeNode;


begin
  if OpenDialog1.Execute then
  begin
    OName := OpenDialog1.FileName;
    PNode := TreeView.Selected;
    fi := TFolderItem(TreeView.Selected.Data);
    NName := IncludeTrailingPathDelimiter(fi.Path + fi.Name) +
             ExtractFileName(OName);
    TextFileImport(OName, NName, PNode, fi);
  end;

end;

procedure TMainForm.SetFilter;
  function FileTypeToFilter: String;
  var
    i: Integer;
    FileType: TFileType;
    sFilter, sExe: String;
  begin
    sFilter := '';
    sExe := '';
    with OptionSetting do
    begin
      for i := 0 to FileTypeList.Count -1 do
      begin
        FileType := TFileType(FileTypeList[i]);
        sExe := FileType.Extension.CommaText;
        sFilter := sFilter + FileType.Name + ' (' + sExe + ')|' + StringReplace(sExe, ',', ';', [rfReplaceAll]) + '|';
      end;
    end;
    sFilter := DelimiterCut(sFilter);
    Result := sFilter;
  end;

  function FileIndexJudgment: Integer;
  var
    i: Integer;
  begin
    with OptionSetting do
    begin
      Result := 0;
      for i := 0 to FileTypeList.Count -1 do
      begin
        if TFileType(FileTypeList[i]).Name = Display.DefaultDspType then
        begin
          Result := i;
          Break;
        end;
      end;
    end;
  end;
begin
  OpenDialog1.Filter := FileTypeToFilter;
  OpenDialog1.FilterIndex := FileIndexJudgment  + 1;
end;

function TMainForm.GetFileUpdateDay(FileName: String): TDateTime;
var
  SR: TSearchRec;
begin
  if FileExists(FileName) then
  begin
    FindFirst(FileName, faAnyFile, sr);
    try
      Result := FileDateToDateTime(sr.Time);
    finally
      SysUtils.FindClose(sr);
    end;
  end
  else
    Result := Now;
end;

function TMainForm.GetFileName(FileName, Exe: String): String;
var
  wse, wsn: WideString;
  sCount: Integer;
begin
  wse := Exe;
  wsn := ExtractFileName(FileName);
  sCount := Length(wse);
  Result := Copy(wsn, 1, Length(wsn) - sCount);
end;

procedure TMainForm.ListViewMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  ListItem: TListItem;
  procedure SelectSameNode(AItem: TListItem);
  var
    i: Integer;
    Node: TTreeNode;
  begin
    for i := 0 to TreeView.Items.Count -1 do
    begin
      Node := TreeView.Items[i];
      if Node.Data = AItem.Data then
      begin
        Node.Selected := True;
        break;
      end;

    end;
  end;
begin
  ListItem := ListView.GetItemAt(X, Y);
  //ListView.Selected := nil;
  if ListItem = nil then Exit;

//  if TObject(ListItem.Data) is TTextItem then
//  begin
//    //SelectSameNode(ListItem);
//    TreeView.Selected := TreeView.Items[Integer(ListItem.Data)];
//    Exit;
//  end;
//
//  if TObject(ListItem.Data) is TFolderItem then
//  begin
    //SelectSameNode(ListItem);
    TreeView.Selected := TreeView.Items[Integer(ListItem.Data)];
    Exit;
//  end;
end;

procedure TMainForm.FolderImportEx(OName, NName: String; PNode: TTreeNode; fi: TFolderItem; SubFolder: Boolean);
var
  Msg: String;   
  DlgSelect: Integer;
  NNode: TTreeNode;

  function FindFolderItem(ANode: TTreeNode; SubStr: String): TTreeNode;
  var
    i: Integer;
    tim: TFolderItem;
  begin
    Result := nil;
    for i := 0 to ANode.Count -1 do
    begin
      if TObject(ANode.Item[i].Data) is TFolderItem then
      begin
        tim := TFolderItem(ANode.Item[i].Data);
        if tim.FullName = SubStr then
        begin
          Result := ANode.Item[i];
          Break;
        end;
      end;
    end;
  end;

  procedure ChengeFileTime(PrNode: TTreeNode);
  var
    i: Integer;
    n: TTreeNode;
    s: String;
  begin
    for i := 0 to PrNode.Count -1 do
    begin
      n := PrNode.Item[i];
      s := TTextItem(n.Data).FullName;
      TTextItem(n.Data).UpdateDay := GetFileUpdateDay(s);
    end;
  end;

begin

  if DirectoryExists(NName) then
  begin
//    Msg := '"' + ExtractFileName(OName) + '" はすでに "' + fi.Name +
//      '" の中に存在しています。上書きしますか？' + #13#10 + '上書きする場合は「はい」を' +
//      '編集ダイアログを開いてタイトルを編集するには「いいえ」を何もしないには' +
//      '「キャンセル」を押してください。';
//    DlgSelect := Application.MessageBox(PChar(Msg), '確認',
//      MB_ICONQUESTION or MB_YESNOCANCEL);

    Msg := '"' + ExtractFileName(OName) + '" はすでに "' + fi.Name +
      '" の中に存在しています。名前を変えて追加しますか？' + #13#10 + 
      '編集ダイアログを開いてタイトルを編集するには「はい」を、何もしないには' +
      '「いいえ」を押してください。';
    DlgSelect := Application.MessageBox(PChar(Msg), '確認',
      MB_ICONQUESTION or MB_YESNO);
    case DlgSelect of
//      IDYES:
//      begin
//        NNode := FindImportNode(NName, PNode);
//        NNode.Selected := True;
////        NNode := PNode;
//
//        ImportFile(OName, NName, NNode, SubFolder);
//        ChengeFileTime(NNode);
//        NNode.Selected := True;
//
//        if OptionSetting.Standard.FolderInfoDsp then
//          AddNodeChildrenDspToListView(NNode);
//        FolderSort;
//        MainForm.SaveTreeView(False);
//        Exit;
//      end;
      IDYES:
//      IDNO:
      begin
        IpPath := IncludeTrailingPathDelimiter(fi.Path + fi.Name) ;
        IpName:= ExtractFileName(NName);

        FolderSetDlg := TFolderSetDlg.Create(Self);
        try
          ItemEditMode := imImport;
          FolderSetDlg.ShowModal;
        finally
          FolderSetDlg.Free;
        end;
        NNode := TreeView.Selected;
        NName := IncludeTrailingPathDelimiter(fi.Path + fi.Name) + IpName;
        ImportFile(OName, NName, NNode, SubFolder);
        NNode.Selected := True;
        if OptionSetting.Standard.FolderInfoDsp then
          AddNodeChildrenDspToListView(NNode);
        FolderSort;
        SaveTreeItemDataToFile;
        Exit;
      end;
      IDNO:
//      IDCANCEL:
      begin
        Exit;
      end;
    end;
  end
  else
  begin
    ForceDirectories(NName);
    fi := TFolderItem.Create(PNode);
    with fi do
    begin
      Path         := ExtractFilePath(NName);
      Name         := ExtractFileName(NName);
      CreationDay  := GetFileUpdateDay(NName);
      Comment      := '';
      ReadOnlyBool := False;
      NNode := TreeView.Items.AddChildObject(PNode, Name, Pointer(fi));
    end;
    TreeView.Selected := NNode;
    //ListView.Clear;
    ImportFile(OName, NName, NNode, SubFolder);
    NNode.Selected := True;
    if OptionSetting.Standard.FolderInfoDsp then
      AddNodeChildrenDspToListView(TreeView.Selected);
    FolderSort;
    SaveTreeItemDataToFile;
  end;
end;

procedure TMainForm.SaveTreeItemDataToFile;
begin
  PanelT.Enabled := False;
  Screen.Cursor := crHourGlass;
  try
    SaveTreeView(False);
  finally
    PanelT.Enabled := True;
    Screen.Cursor := crDefault;
  end;
end;

procedure TMainForm.FolderImport(SubFolder: Boolean);
var
  OName, NName: String;
  fi: TFolderItem;
  PNode: TTreeNode;
begin

  TreeView.OnChange := nil;
  TreeView.OnChanging := nil;
  AllEnabledChenge(False);

  try
    if FolderDialog1.Execute then
    begin
      OName := FolderDialog1.Directory;
      PNode := TreeView.Selected;
      fi := TFolderItem(TreeView.Selected.Data);
      NName := IncludeTrailingPathDelimiter(fi.Path + fi.Name) +
               ExtractFileName(OName);

    FolderImportEx(OName, NName, PNode, fi, SubFolder);


    end;
  finally
    TreeView.OnChange := TreeViewChange;
    TreeView.OnChanging := TreeViewChanging;
    AllEnabledChenge(True);
  end;

end;

procedure TMainForm.FolderOpenActionExecute(Sender: TObject);
begin
  FolderImport(False);
end;

procedure TMainForm.FolderOpenIncludeSubActionExecute(Sender: TObject);
begin
 FolderImport(True);
end;
function TMainForm.FindImportNode(DirName: String; ParNode: TTreeNode): TTreeNode;
var
  i: Integer;
  Node: TTreeNode;
begin
  Result := nil;
  for i := 0 to ParNode.Count -1 do begin
    Node := ParNode.Item[i];
    if not (TObject(Node.Data) is TTextItem) then begin
      if TFolderItem(Node.Data).FullName = DirName then begin
//        ShowMessage(TFolderItem(Node.Data).FullName + #13#10 + DirName);
        Result := Node;
        Exit;
      end;
    end;
  end;
end;

procedure TMainForm.ImportFileEx(OldFileName, NewFileName: String; ParentNode: TTreeNode;
  SubFolder: Boolean);
var
  SR: TSearchRec;
  Found: Integer;
  ti: TTextItem;
  fi: TFolderItem;
  NName, OName: String;
  NNode: TTreeNode;
begin
  Found := FindFirst(IncludeTrailingPathDelimiter(OldFileName) + '*.*', faAnyFile, SR);
  try
    while Found = 0 do
    begin

      if (SR.Name <> '..') and (SR.Name <> '.') then
      begin
        if (SR.Attr and SysUtils.faDirectory > 0) then
        begin
          if SubFolder then begin
            OName := IncludeTrailingPathDelimiter(OldFileName) + SR.Name;
            NName := IncludeTrailingPathDelimiter(NewFileName) + SR.Name;

            if DirectoryExists(NName) = False then begin
              ForceDirectories(NName);
              fi := TFolderItem.Create(ParentNode);
              with fi do
              begin
                Path         := ExtractFilePath(NName);
                Name         := ExtractFileName(NName);
                CreationDay  := GetFileUpdateDay(NName);
                Comment      := '';
                ReadOnlyBool := False;
                NNode := TreeView.Items.AddChildObject(ParentNode, Name, Pointer(fi));
              end;
            end else begin
              NNode := FindImportNode(NName, ParentNode);
//              ShowMessage(NNode.Text);
            end;
            if NNode <> nil then begin
              ImportFileEx(OName, NName, NNode, SubFolder);
            end else begin
              Found := FindNext(SR);
              Continue;
            end;
          end else begin
            Found := FindNext(SR);
            Continue;
          end;

        end;
        if OptionSetting.ExtensionList.IndexOf(ExtractFileExt(SR.Name)) = -1 then
        begin
          Found := FindNext(SR);
          Continue;
        end;
        OName := IncludeTrailingPathDelimiter(OldFileName) + SR.Name;
        NName := IncludeTrailingPathDelimiter(NewFileName) + SR.Name;
        //ShowMessage(OName + #13#10 + NName);
//        fNode := FindTextItem(ParentNode, NName);
//        if fNode = nil then
//        begin
          //CopyFile(PChar(OName), PChar(NName), False)

        if FileExists(NName) = False then
        begin
          ti := TTextItem.Create(ParentNode);
          with ti do
          begin
          CopyFile(PChar(OName), PChar(NName), False);
//          sl.LoadFromFile(OName);
//          sl.SaveToFile(NName);
//          Application.ProcessMessages;
            Path         := ExtractFilePath(NName);
            Extension    := ExtractFileExt(NName);
            Name         := GetFileName(NName, Extension);
            DspType      := GetDspType(ExtractFileExt(NName));
            CreationDay  := GetFileCreateDay(NName);
            UpdateDay    := GetFileUpdateDay(NName);
            Application.ProcessMessages;
            TreeView.Items.AddChildObject(ParentNode, Name + Extension, Pointer(ti));
//            ShowMessage(Name);
          end;
//          TreeView.Selected := ParentNode;
        end
        else
        begin
          CopyFile(PChar(OName), PChar(NName), False);
//          sl.LoadFromFile(OName);
//          sl.SaveToFile(NName);
//          Application.ProcessMessages;
        end;

        ProgressBar.StepIt;
        StatusBar.Panels[0].Text := '全' + IntToStr(ProgressBar.Max) +
          'ファイル中' + IntToStr(ProgressBar.Position) + 'ファイル終了...';
        Application.ProcessMessages;
      end;
      Found := FindNext(SR);
    end;
  finally
//    sl.Free;
    SysUtils.FindClose(SR);
  end;
end;
procedure TMainForm.ImportFile(OldFileName, NewFileName: String; ParentNode: TTreeNode; SubFolder: Boolean);
var
  Msg: String;
  Node: TTreeNode;
  s: String;
//  Time: Cardinal;
begin
  TreeView.OnChange := nil;
  TreeView.OnChanging := nil;
  Screen.Cursor := crHourGlass;

  StatusBar.Panels[0].Text := 'インポート情報取得中...';
  Application.ProcessMessages;
  with ProgressBar do
  begin
    Min := 0;
    Max := GetFileCount(OldFileName, SubFolder);
    Position := 0;
  end;
  TreeView.Items.BeginUpdate;
  try
    if SubFolder or (ProgressBar.Max > 3000) then begin
      Msg := 'インポート対象ファイルは' + IntToStr(ProgressBar.Max) + '個です。' + #13#10 +
        'ファイル数やマシン環境によってはかなり時間がかかるかもしれませんが作業を続行しますか？';
      if Application.MessageBox(PChar(Msg), PChar(Application.Title),
           MB_ICONINFORMATION or MB_YESNO) = IDNO then begin
        Node := TreeView.Selected;
        s := TFolderItem(Node.Data).FullName;
        if DirectoryExists(s) then begin
          ChangeAttributes(s);
          RemoveDir(s);
        end;
        Node.Delete;
        Exit;
      end;
    end;

//    Memo1.Lines.Add('-----------------------------------');
//    Time := GetTickCount;

    ImportFileEx(OldFileName, NewFileName, ParentNode, SubFolder);


//    Time := GetTickCount - Time;
//    Memo1.Lines.Add('インポート時間　: ' + IntToStr(Time div 1000) + '.' + IntToStr(Time mod 1000) + '秒');
//    beep;
//    Memo1.Lines.Add('整理前アイテム数：' + IntToStr(TreeView.Items.Count));
//    Time := GetTickCount;

    if SubFolder then ArrangementTreeItem;


//    Time := GetTickCount - Time;
//     Memo1.Lines.Add('アイテム整理時間: ' + IntToStr(Time div 1000) + '.' + IntToStr(Time mod 1000) + '秒');
//    beep;
//    Memo1.Lines.Add('整理後アイテム数：' + IntToStr(TreeView.Items.Count));
  finally
    ProgressBar.Position := 0;
    TreeView.Items.EndUpdate;
    TreeView.OnChange := TreeViewChange;
    TreeView.OnChanging := TreeViewChanging;
    StatusBar.Panels[0].Text := 'インポート完了';
    Screen.Cursor := crDefault;
//    sl.Free;
  end;


end;

procedure TMainForm.ArrangementTreeItem;
var
//  i: Integer;
  Node: TTreeNode;
  s: String;
  TmpNode: TTreeNode;
begin
  StatusBar.Panels[0].Text := 'アイテム整理中...';
  Application.ProcessMessages;

  with ProgressBar do begin
    Min := 0;
    Max := TreeView.Items.Count;
    Position := 0;
  end;
  Node := TreeView.Items[TreeView.Items.Count -1];
  while Node  <> nil do begin
//    Node := TreeView.Items[i];
    ProgressBar.StepIt;
    if not (TObject(Node.Data) is TTextItem) and
       not (TObject(Node.Data) is TRootFolderItem) then begin
      if Node.Count = 0 then begin
        s := TFolderItem(Node.Data).FullName;
        if DirectoryExists(s) then begin
          ChangeAttributes(s);
          RemoveDir(s);
        end;
        TFolderItem(Node.Data).Free;
        TmpNode := Node.GetPrev;
        Node.Delete;
        Node := TmpNode;
        Continue;
      end;
    end;
    Node := Node.GetPrev;
  end;
end;

//procedure TMainForm.ArrangementTreeItem;
//var
//  i: Integer;
//  Node: TTreeNode;
//  s: String;
//begin
//  StatusBar.Panels[0].Text := 'アイテム整理中...';
//  Application.ProcessMessages;
//
//  with ProgressBar do begin
//    Min := 0;
//    Max := TreeView.Items.Count;
//    Position := 0;
//  end;
//
//  for i := TreeView.Items.Count -1 downto 0 do begin
//    Node := TreeView.Items[i];
//    ProgressBar.StepIt;
//    if not (TObject(Node.Data) is TTextItem) and
//       not (TObject(Node.Data) is TRootFolderItem) then begin
//      if Node.Count = 0 then begin
//        s := TFolderItem(Node.Data).FullName;
//        if DirectoryExists(s) then begin
//          ChangeAttributes(s);
//          RemoveDir(s);
//        end;
//        TFolderItem(Node.Data).Free;
//        Node.Delete;
//      end;
//    end;
//  end;
//end;

function TMainForm.GetDspType(Ext: String): String;
var
  i: Integer;
begin
  with OptionSetting do
  begin
    for i := FileTypeList.Count -1 downto 0 do
    begin
      if TFileType(FileTypeList[i]).Extension.IndexOf('*' + Ext) <> -1 then
      begin
        Result := TFileType(FileTypeList[i]).Name;
        Break;
      end;
    end;

  end;

end;

function TMainForm.GetFileCount(Dir: String; SubFolder: Boolean): Integer;
  procedure GetFileCount(Dir: String; SubFolder: Boolean);
  var
    sr: TSearchRec;
    Found: Integer;
  begin
    Found := FindFirst(IncludeTrailingPathDelimiter(Dir) + '*.*', faAnyFile, sr);
    try
      while (Found = 0) do begin
        if (SR.Name <> '..') and (SR.Name <> '.') then
        begin
          if (SR.Attr and SysUtils.faDirectory > 0) then
          begin
            if SubFolder then
              GetFileCount(IncludeTrailingPathDelimiter(Dir) + sr.Name, SubFolder);
          end;

          if (SR.Attr and SysUtils.faDirectory) = 0 then
          begin

            if OptionSetting.ExtensionList.IndexOf(ExtractFileExt(SR.Name)) <> -1 then
            begin
              inc(FFileCount);
            end;
          end;
        end;

        Found := FindNext(sr);
      end;
    finally
      SysUtils.FindClose(sr);
    end;
  end;
begin
  //Result := 0;
  FFileCount := 0;
//  StatusBar.Panels[0].Text := 'インポート情報取得中...';
//  Application.ProcessMessages;
  GetFileCount(Dir, SubFolder);

  Result := FFileCount;
end;

procedure TMainForm.TreeViewCollapsing(Sender: TObject; Node: TTreeNode;
  var AllowCollapse: Boolean);
begin
  if TObject(Node.Data) is TRootFolderItem then
    AllowCollapse := False;
end;



function TMainForm.GetFileCreateDay(FileName: String): TDateTime;
var
  hFile:      THandle;
  timFile, LocalTime: TFileTime;
  DosTime: packed record
     case boolean of
       true:  (Time,Date:  Word);
       false: (DateTime:   integer);
  end;
begin
//  Result := Now;
  hFile := CreateFile(PChar(FileName)
      ,0
      ,FILE_SHARE_READ
      ,Nil ,OPEN_EXISTING ,0 ,0);
  //if hFile > 0 then
      GetFileTime(hFile, @timFile, nil, nil);

  try
    try
      FileTimeToLocalFileTime(timFile, LocalTime);
      FileTimeToDosDateTime(LocalTime,DosTime.Date,DosTime.Time);
      Result := FileDateToDateTime(DosTime.DateTime);
    except
      Result := Now;
    end;
  finally
    CloseHandle(hFile);
  end;


  
end;

procedure TMainForm.ReadOnlyAll;
begin
  if OptionSetting.Standard.ReadOnlyAll then
    TRootFolderItem(TreeView.Items[0].Data).ReadOnlyBool := True
  else
    TRootFolderItem(TreeView.Items[0].Data).ReadOnlyBool := False;
end;

procedure TMainForm.OptionSettingReflection;
begin
  with OptionSetting do
  begin
    ReadOnlyAll;
    OptionDlg.AddExtensionList;
    MainForm.SetFilter;

    TreeView.AutoExpand := Standard.Expand;
    case Standard.SearchDsp of
      sdTreeView:
      begin
        TreeViewForSearch.Visible := True;
        SearchListView.Visible := False;
      end;
      sdListView: 
      begin
        TreeViewForSearch.Visible := False;
        SearchListView.Visible := True;
      end;
    end;

    TreeView.HotTrack := Standard.HotTrack;
    TreeViewForSearch.HotTrack := Standard.HotTrack;

    Application.ShowHint := Standard.PopupHint;
//    ListView.HotTrack := Standard.HotTrack;
//    SearchListView.HotTrack := Standard.HotTrack;
//    ContentsListView.HotTrack := Standard.HotTrack;

  end;



//  with OptionSetting do
//  begin
//    RichEdit.Font.Name               := EditorSet.FontName;
//    RichEdit.Font.Size               := EditorSet.FontSize;
//    RichEdit.Caret.AutoIndent        := EditorSet.AutoIndent;
//    RichEdit.UndoListMax             := EditorSet.UndoMaxCount;
//    RichEdit.Caret.TabSpaceCount     := EditorSet.TabWidth;
//    RichEdit.Marks.RetMark.Visible   := EditorSet.Mark.NewLine;
//    RichEdit.Marks.EofMark.Visible   := EditorSet.Mark.Eof;
//    RichEdit.Marks.Underline.Visible := EditorSet.Mark.UnderLine;
//    RichEdit.Ruler.Visible           := EditorSet.Ruler.Enabled;
//    RichEdit.Ruler.GaugeRange        := EditorSet.Ruler.GaugeRange;
//    RichEdit.Ruler.Edge              := EditorSet.Ruler.BorderLine;
//    RichEdit.Ruler.Color             := EditorSet.Ruler.StrColor;
//    RichEdit.Ruler.BkColor           := EditorSet.Ruler.BackColor;
//    RichEdit.Leftbar.Visible         := EditorSet.LineNumBer.Enabled;
//    RichEdit.Leftbar.ZeroLead        := EditorSet.LineNumBer.ZeroLead;
//    RichEdit.Leftbar.Column          := EditorSet.LineNumBer.Colum;
//    RichEdit.Leftbar.Edge            := EditorSet.LineNumBer.BorderLine;
//    RichEdit.Leftbar.Color           := EditorSet.LineNumBer.StrColor;
//    RichEdit.Leftbar.BkColor         := EditorSet.LineNumBer.BackColor;
//
//  end;

end;

procedure TMainForm.ContentsShowHint(var HintStr: string;
  var CanShow: Boolean; var HintInfo: THintInfo);
var
  P: TPoint;
  Style: DWORD;
  Item: TListItem;
  R: TRect;
  s: String;
  i: Integer;
begin
  if HintInfo.HintControl = ContentsListView then
  begin
    // ContentsListViewのコントロール内にTTreeNode.Textが収まりきらないヒントを消す
    Style := GetWindowLong(ContentsListView.Handle, GWL_STYLE);
    Style := Style or TVS_NOTOOLTIPS; //uses + commctrl
    SetWindowLong(ContentsListView.Handle, GWL_STYLE, Style);
    //Item取得
    GetCursorPos(P);
    P := ContentsListView.ScreenToClient(P);
    Item := ContentsListView.GetItemAt(P.X, P.Y);
    if Item = nil then Exit;

    r := Item.DisplayRect(drBounds);
    HintInfo.CursorRect := R;
    HintInfo.HideTimeout := 20000; 
//    HintInfo.ReshowTimeout := 500;
    HintInfo.HintMaxWidth := 600;

    case Item.ImageIndex of
      ICON_BOOKMARK:
      begin
        i := StrToInt(Item.SubItems[0]) -1;
        s := FindStr(RichEdit, i, 15);
      end;
      ICON_CONTENTS:
      begin
        i := StrToInt(Item.SubItems[0]) -1;
        s := FindStr(RichEdit, i, 15);
      end;
    end;



    HintStr := TrimRight(s); 
//    HintInfo.ReshowTimeout := 0;
  end;
end;

procedure TMainForm.ClipToFileActionExecute(Sender: TObject);
var
  Item: TTextItem;
  sl: TStringList;
  sName, sPath, SExt, Msg, NName: String;
  nNode: TTreeNode;
  DlgSelect: Integer;
begin
  sl := TStringList.Create;
  try
    sl.Text := clipboard.AsText;
    sPath := TFolderItem(TreeView.Selected.Data).FullName + '\';
    SExt := ExtractFileExt(DEFAULT_TEXT_EXTENSION);
    Item := TTextItem.Create(SelectNode);
    Item.Name := Trim(sl[0]);
    sName := Item.Name;
    Item.Free;
    NName := sPath + sName + SExt;
//    ShowMessage(sName);
    if FileExists(NName) then
    begin
      Msg := '"' + sName + SExt + '" はすでに "' + TFolderItem(TreeView.Selected.Data).Name +
        '" の中に存在しています。上書きしますか？' + #13#10 + '上書きする場合は「はい」を' +
        '編集ダイアログを開いてタイトルを編集するには「いいえ」を何もしないには' +
        '「キャンセル」を押してください。';
      DlgSelect := Application.MessageBox(PChar(Msg), '確認',
        MB_ICONQUESTION or MB_YESNOCANCEL);
      case DlgSelect of
        IDYES:
        begin
          sl.SaveToFile(NName);
          RichEdit.Lines.Text := sl.Text;
          NNode := FindTextItem(TreeView.Selected, NName);
          TTextItem(NNode.Data).UpdateDay := GetFileUpdateDay(NName);
          NNode.Selected := True;
          Exit;
        end;
        IDNO:
        begin
          IpPath := ExtractFilePath(NName);
          IpExe  := ExtractFileExt(NName);
          IpName:= GetFileName(NName, ExtractFileExt(NName));
          IpDspType := OptionSetting.Display.DefaultDspType;
          OldSL.Text := sl.Text;

          //LayoutCheckFalse;

          TextSetDlg := TTextSetDlg.Create(Self);
          try
            ItemEditMode := imImport;
            TextSetDlg.ShowModal;
          finally
            TextSetDlg.Free;
          end;

        end;
        IDCANCEL:
        begin
          Exit;
        end;
      end;
    end
    else
    begin
      Item := TTextItem.Create(TreeView.Selected);
      with Item do
      begin
        Path := sPath;
        Extension := SExt;
        Name := FileNameCheck(sPath, sName, SExt);
        sl.SaveToFile(FullName);
        DspType := OptionSetting.Display.DefaultDspType;
        CreationDay := GetFileUpdateDay(FullName);
        UpdateDay := GetFileUpdateDay(FullName);
        nNode := TreeView.Items.AddChildObject(TreeView.Selected, Name + Extension, Pointer(Item));
        TreeView.Selected := nNode;
      end;
    end;

  finally
    sl.Free;
  end;



end;

procedure TMainForm.UpTimerTimer(Sender: TObject);
begin
  TreeView.Perform(WM_VSCROLL, SB_LINEUP, 0);
  TreeView.Invalidate;
//  UpTimer.Enabled := False;
end;

procedure TMainForm.DownTimerTimer(Sender: TObject);
begin
  TreeView.Perform(WM_VSCROLL, SB_LINEDOWN, 0);
  TreeView.Invalidate;
//  DownTimer.Enabled := False;
end;

procedure TMainForm.LeftTimerTimer(Sender: TObject);
begin
  TreeView.Perform(WM_HSCROLL, SB_LINELEFT, 0);
//  SendMessage(TreeView.Handle, WM_HSCROLL, SB_LINELEFT, 0);
  TreeView.Invalidate;
//  LeftTimer.Enabled := False;
end;

procedure TMainForm.RightTimerTimer(Sender: TObject);
begin
  TreeView.Perform(WM_HSCROLL, SB_LINERIGHT, 0);
  TreeView.Invalidate; 
//  RightTimer.Enabled := False;
end;

procedure TMainForm.TreeViewDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  DragNode, TargetNode: TTreeNode;
//  R: TRect;
begin
  if TreeView.GetNodeAt(X, Y) = nil then Exit;

  Application.OnShowHint := nil;
  AutoScrollForTreeView(X, Y);
  TargetNode := TreeView.GetNodeAt(X, Y);
  DragNode := TreeView.Selected;

  while (TargetNode.Parent <> nil) and (TargetNode <> DragNode) do begin
    TargetNode := TargetNode.Parent;
  end;


  if (TObject(TargetNode.Data) is TTextItem) or (TargetNode = DragNode) then
  begin
    Accept := False;
  end;
end;

procedure TMainForm.TreeViewDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  DragNode, TargetNode: TTreeNode;
  oName, nName: String;

  function OldName(n: TTreeNode): String;
  begin
    if TObject(n.Data) is TTextItem then
      Result := TTextItem(n.Data).FullName
    else
      Result := TFolderItem(n.Data).FullName;
  end;

  function NewName(DrNode, TaNode: TTreeNode): String;
  begin
    if TObject(DrNode.Data) is TTextItem then
      Result := TFolderItem(TaNode.Data).Path +
                TFolderItem(TaNode.Data).Name + '\' +
                TTextItem(DrNode.Data).Name +
                TTextItem(DrNode.Data).Extension
    else
      Result := TFolderItem(TaNode.Data).Path + 
                TFolderItem(TaNode.Data).Name + '\' +
                TFolderItem(DrNode.Data).Name;
  end;

begin

  Application.OnShowHint := AppShowHint;
  Application.ProcessMessages;
  
  DragNode := TreeView.Selected;
  TargetNode := TreeView.GetNodeAt(X, Y);
  if TargetNode = nil then Exit;
  if TObject(TargetNode.Data) is TTextItem then Exit;

  if TObject(TargetNode.Data) is TFolderItem then
  begin
    oName := OldName(DragNode);
    nName := NewName(DragNode, TargetNode);
//    ShowMessage(oName + #13#10 + nName);
    if MoveFile(PChar(oName), PChar(nName)) then
    begin
      DragNode.MoveTo(TargetNode, naAddChild);
      NodePathReName;
      FolderSort;
    end
    else ShowMessage('D&&D失敗...');
  end;

end;

procedure TMainForm.AutoScrollForTreeView(X, Y: Integer);
begin
  if Y < 30 then
  begin
    DOWNTimer.Enabled := False;
    UPTimer.Enabled := True;
  end
  else if Y > TreeView.Height - 30 then
  begin
    UPTimer.Enabled := False;
    DOWNTimer.Enabled := True;
  end
  else
  begin
    UPTimer.Enabled := False;
    DOWNTimer.Enabled := False;
  end;
  if (X < 30) then
  begin
    LeftTimer.Enabled := True;
    RightTimer.Enabled := False;
  end
  else if (X > TreeView.Width -30)then
  begin
    LeftTimer.Enabled := False;
    RightTimer.Enabled := True;
  end
  else
  begin
    LeftTimer.Enabled := False;
    RightTimer.Enabled := False;
  end;
end;

procedure TMainForm.ChangeAttributes(FileName: String);
var
  Attributes: Word;
begin
  Attributes := GetFileAttributes(PChar(FileName));
  if (Attributes and SysUtils.faReadOnly) <> 0 then
  begin
    Attributes := Attributes and not SysUtils.faReadOnly;
    SysUtils.FileSetAttr(FileName, Attributes);
  end;

end;
procedure TMainForm.StartSearchSet;
begin
  FSearchCancel := False;
  FHits := 0;
  Screen.Cursor := crAppStart;

  SearchCancelAction.Enabled := True;

  AllEnabledChenge(False);

  SearchToolButton.Visible := False;
  SearchCancelToolButton.Visible := True;
  Application.ProcessMessages;
  TreeViewForSearch.OnChange := nil;
  TreeViewForSearch.OnExpanding := nil;
  TreeViewForSearch.OnExpanded := nil;
end;

procedure TMainForm.AllEnabledChenge(Enabled: Boolean);
var SysMenu: HMENU;
begin
  SysMenu := GetSystemMenu(Handle, False);
  if Enabled then
    EnableMenuItem(SysMenu, SC_CLOSE, MF_BYCOMMAND or MF_ENABLED)
  else
    EnableMenuItem(SysMenu, SC_CLOSE, MF_BYCOMMAND or MF_GRAYED);


  SearchAction.Enabled := Enabled;
  GoAddressAction.Enabled := Enabled;
  SettingAction.Enabled := Enabled;
  PrintAction.Enabled := Enabled;
  PrintPreviewAction.Enabled := Enabled;
  PrintSetAction.Enabled := Enabled;
  CloseAction.Enabled := Enabled;
  HelpAction.Enabled := Enabled;
  BugReportAction.Enabled := Enabled;
  AboutAction.Enabled := Enabled;
  GoToTopAction.Enabled := Enabled;
  GoToButtomAction.Enabled := Enabled;
  SetBookMarkAction.Enabled := Enabled;
  DeleteBookMarkAction.Enabled := Enabled;
  MarkerAction.Enabled := Enabled;
  DeleteAllBookMarkAction.Enabled := Enabled;
  PageSearchDownAction.Enabled := Enabled;
  PageSearchUpAction.Enabled := Enabled;
  WordWrapAction.Enabled := Enabled;
  tbFileAction.Enabled := Enabled;
  tbEditAction.Enabled := Enabled;
  tbDisplayAction.Enabled := Enabled;
  tbAddressAction.Enabled := Enabled;
  tbSearchAction.Enabled := Enabled;
  LayoutDocumentAreaAction.Enabled := Enabled;
  LayoutListViewAreaAction.Enabled := Enabled;
  EditCopyAction.Enabled := Enabled;
  EditCutAction.Enabled := Enabled;
  EditSelectAllAction.Enabled := Enabled;
  EditRedoAction.Enabled := Enabled;
  EditUndoAction.Enabled := Enabled;
  EditDeleteAction.Enabled := Enabled;
  EditPasteAction.Enabled := Enabled;
  FileOpenAction.Enabled := Enabled;
  FolderOpenAction.Enabled := Enabled;
  NewFileAction.Enabled := Enabled;
  NewFolderAction.Enabled := Enabled;
  EditItemAction.Enabled := Enabled;
  DeleteItemAction.Enabled := Enabled;
  OpenFromEditerAction.Enabled := Enabled;
  ClipToFileAction.Enabled := Enabled;
  FolderOpenIncludeSubAction.Enabled := Enabled;
  SortAlphaDownAction.Enabled := Enabled;
  SortAlphaUpAction.Enabled := Enabled;
  SortDayUoAction.Enabled := Enabled;
  SortDayDownAction.Enabled := Enabled;
  SortExtAction.Enabled := Enabled;
  SortDspTypeAction.Enabled := Enabled;
  SortUpDayUpAction.Enabled := Enabled;
  SortUpDayDownAction.Enabled := Enabled;
  AllExpandAction.Enabled := Enabled;
  AllCollapceAction.Enabled := Enabled;
  BookMarkManagerAction.Enabled := Enabled;

  PanelT.Enabled := Enabled;
  PanelL.Enabled := Enabled;
  AddressComboBox.Enabled := Enabled;
  SearchComboBox.Enabled := Enabled;
  SearchSelectComboBox.Enabled := Enabled;
  RichEdit.Enabled := Enabled;
end;

procedure TMainForm.EndSearchSet;
begin
  SearchCancelAction.Enabled := False;

  AllEnabledChenge(True);

  SearchCancelToolButton.Visible := False;
  SearchToolButton.Visible := True;
  Screen.Cursor := crDefault;
  TreeViewForSearch.OnChange := TreeViewForSearchChange;
  TreeViewForSearch.OnExpanding := TreeViewForSearchExpanding;
  TreeViewForSearch.OnExpanded := TreeViewForSearchExpanded;
  StatusBar.Panels[0].Text := '検索終了' + '( ' + IntToStr(FHits) + ' hits)';
  Application.ProcessMessages;
end;

procedure TMainForm.SearchActionExecute(Sender: TObject);
  procedure CheckSearch(CheckStr: String);
  var
    ws: WideString;
  begin
    ws := CheckStr;
    if Trim(ws) = '' then Abort;
    if Length(ws) <= 2 then
      if Application.MessageBox('文字数が２文字以下です。場合によってはかなり時間のかかる可能性がありますが' +
        '検索を続行しますか？', '確認', MB_ICONQUESTION or MB_YESNO) = IDNO then Abort;
  end;
begin
  CheckSearch(SearchComboBox.Text);
  StartSearchSet;
//  BookMarkForm.Free;
  try
//    ShowMessage('tt');

    SearchString := SearchComboBox.Text;
    SearchString := Trim(AnsiLowerCase(SearchString));
    SearchNode := TreeView.Selected;
    SearchListView.Items.BeginUpdate;
    SearchListView.Clear;
    SearchListView.Items.EndUpdate;
    TreeViewForSearch.Items.BeginUpdate;
    TreeViewForSearch.Items.Clear;
    TreeViewForSearch.Items.EndUpdate;
    ContentsPageControl.ActivePage := SearchTabSheet;
    AddComboBox(Trim(SearchComboBox.Text), SearchComboBox);

    case SearchSelectComboBox.ItemIndex of
      0: SearchItemName;
      1: SearchSelectFolder;
      2: SearchText;
      3: SearchAll;
    end;
    SearchTabSheet.Caption := '"' + SearchComboBox.Text + '" の検索結果';
  finally
    EndSearchSet;
  end;



end;

procedure TMainForm.SearchAll;
begin
  SearchStyle := ssAll;
  SearchFolder(TreeView.Items[0]);
end;

procedure TMainForm.SearchItemNameEx;
  function ItemName(N: TTreeNode): String;
  begin
    if TObject(N.Data) is TTextItem then
      Result := TTextItem(N.Data).Name + TTextItem(N.Data).Extension
    else
      Result := TFolderItem(N.Data).Name;
  end;

var
  i: Integer;
  SchStr, ItmName: String;
  Node: TTreeNode;
  Item: TListItem;
begin
  SearchListView.Items.BeginUpdate;
//  SearchListView.Columns[1].Caption := 'ｱｲﾃﾑ番号';
  with ProgressBar do
  begin
    Min := 0;
    Max := TreeView.Items.Count -2;
//    Step := 1;
    Position := 0;
  end;
  SchStr := SearchString;
  SchStr := Trim(SchStr);
  SchStr := AnsiLowerCase(SchStr);
  for i := 1 to TreeView.Items.Count -1 do
  begin
    if FSearchCancel then begin
      Exit;
      Application.HandleMessage;
    end;                    
    Application.ProcessMessages;
    StatusBar.Panels[0].Text := IntToStr(TreeView.Items.Count -2) + 'ファイル中、' +
                                IntToStr(i) + 'ファイル検索中...' +
                                '( ' + IntToStr(FHits) + ' hits)';
    ProgressBar.StepIt;
    Node := TreeView.Items[i];
    ItmName := ItemName(Node);
    ItmName := AnsiLowerCase(ItmName);
    if AnsiPos(SchStr, ItmName) > 0 then
    begin
// //     with SearchListView do
//      begin
      if TObject(Node.Data) is TTextItem then
      begin
        Item := SearchListView.Items.Add;
        Item.Data := Pointer(i);
        Item.ImageIndex := TFolderItem(Node.Data).ImageIndex;
        Item.SubItems.Add(ItemName(Node));
        Item.SubItems.Add(TITLE_SEARCH);
        Item.SubItems.Add(ItemName(Node));
        Item.SubItems.Add(TFolderItem(Node.Data).FullName);
        Inc(FHits);
      end;
//
//
//      end;

    end;

  end;
  SearchListView.Items.EndUpdate;
end;

procedure TMainForm.SearchItemNameExLight(ResultSL: TStringList);
  function ItemName(N: TTreeNode): String;
  begin
    if TObject(N.Data) is TTextItem then
      Result := TTextItem(N.Data).Name + TTextItem(N.Data).Extension
    else
      Result := TFolderItem(N.Data).Name;
  end;

var
  i: Integer;
  SchStr, ItmName: String;
  Node: TTreeNode;
begin
  with ProgressBar do
  begin
    Min := 0;
    Max := TreeView.Items.Count -2;
//    Step := 1;
    Position := 0;
  end;
  SchStr := SearchString;
  SchStr := Trim(SchStr);
  SchStr := AnsiLowerCase(SchStr);
  for i := 1 to TreeView.Items.Count -1 do
  begin
    if FSearchCancel then begin
      Exit;
      Application.HandleMessage;
    end;                       
    Application.ProcessMessages;
    StatusBar.Panels[0].Text := IntToStr(TreeView.Items.Count -2) + 'ファイル中、' +
                                IntToStr(i - 1) + 'ファイル検索中...' +
                                '( ' + IntToStr(FHits) + ' hits)';
    ProgressBar.StepIt;
    Node := TreeView.Items[i];
    ItmName := ItemName(Node);
    ItmName := AnsiLowerCase(ItmName);
    if AnsiPos(SchStr, ItmName) > 0 then
    begin
// //     with SearchListView do
//      begin
      if TObject(Node.Data) is TTextItem then
      begin
        ResultSL.Add('No.' + IntToStr(Node.AbsoluteIndex) + ':[ ' + ItemName(Node) + ' ]');
        Inc(FHits);
//        Item := SearchListView.Items.Add;
//        Item.Data := Pointer(i);
//        Item.ImageIndex := TFolderItem(Node.Data).ImageIndex;
//        Item.SubItems.Add(ItemName(Node));
//        Item.SubItems.Add(TITLE_SEARCH);
//        Item.SubItems.Add(ItemName(Node));
//        Item.SubItems.Add(TFolderItem(Node.Data).FullName);
      end;
//
//
//      end;

    end;

  end;
end;

procedure TMainForm.SearchItemName;
var
  rsl: TStringList;
  Streem: TStream;
begin
  SearchStyle := ssItemName;
  case OptionSetting.Standard.SearchDsp of
    sdTreeView:
    begin
      TreeViewForSearch.Visible := True;
      SearchListView.Visible := False;
      rsl := TStringList.Create;
      try
        SearchItemNameExLight(rsl);
        Streem := TStringStream.Create(rsl.Text);
        TreeViewForSearch.Items.BeginUpdate;
        TreeViewForSearch.OnChange := nil;
        TreeViewForSearch.OnExpanding := nil;
        TreeViewForSearch.OnExpanded := nil;

        TreeViewForSearch.LoadFromStream(Streem);

        TreeViewForSearch.OnChange := TreeViewForSearchChange;
        TreeViewForSearch.OnExpanding := TreeViewForSearchExpanding;
        TreeViewForSearch.OnExpanded := TreeViewForSearchExpanded;
        TreeViewForSearch.Items.EndUpdate;
        Streem.Free;
      finally
        rsl.Free;
      end;
    end;
    sdListView:
    begin
      TreeViewForSearch.Visible := False;
      SearchListView.Visible := True;
      SearchItemNameEx;
    end;
  end;

  ProgressBar.Position := 0;
  StatusBar.Panels[0].Text := '検索終了' + '( ' + IntToStr(FHits) + ' hits)';
  Application.ProcessMessages;
end;

procedure TMainForm.SearchSelectFolder;
begin
  SearchStyle := ssFolder;
  if TObject(SearchNode.Data) is TTextItem then
    SearchFolder(SearchNode.Parent)
  else
    SearchFolder(SearchNode);

end;

function TMainForm.FindStr(Editor: TEditor; Count, Max: Integer): String;
var
  i: Integer;
  s: String;
begin
  s := '';
  for i := Count to Count + Max do
  begin
    if (i <= Editor.ListCount -1) and (i >= 0) then
      s := s + Editor.ListString[i] + #13#10; 
  end;
  Result := s;
end;

function TMainForm.FindStr(sl: TStrings; Count, Max: Integer): String;
var
  i: Integer;
  s: String;
begin
  s := '';
  for i := Count to Count + Max do
  begin
    if (i <= sl.Count -1) and (i >= 0) then
      s := s + sl[i] + #13#10;
  end;
  Result := s;
end;

procedure TMainForm.SearchTextEx;
var
  sl: TStringList;
  i: Integer;
  sub, target, sName: String;
  Node: TTreeNode;
  Item: TListItem;
begin
  SearchListView.Items.BeginUpdate;
  sl := TStringList.Create;
  sub := SearchString;
  sub := Trim(AnsiLowerCase(sub));
  Node := TreeView.Selected;
  with ProgressBar do
  begin
    Min := 0;
    Max := RichEdit.ListCount ;
//    Step := 1;
    Position := 0;
  end;
  try
    sl.Text := RichEdit.Lines.Text;
    for i := 0 to sl.Count -1 do
    begin
      if FSearchCancel then begin
        Exit;
        Application.HandleMessage;
      end;             
      Application.ProcessMessages;
      ProgressBar.StepIt;
      target := AnsiLowerCase(sl[i]);
      if AnsiPos(sub, target) > 0 then
      begin
      Item := SearchListView.Items.Add;
      with SearchListView do
      begin
        sName := TTextItem(Node.Data).Name + TTextItem(Node.Data).Extension;
        Item.Data := Pointer(Node.AbsoluteIndex);
        Item.ImageIndex := TFolderItem(Node.Data).ImageIndex;
        Item.SubItems.Add(sName);
        Item.SubItems.Add(IntToStr(i + 1));//\row
//        Item.SubItems.Add(Trim(sl[i]));
        Item.SubItems.Add(FindStr(sl, i, 7));
        Item.SubItems.Add(TFolderItem(Node.Data).FullName);
        Inc(FHits);
      end;
      end;

    end;

  finally
    sl.Free;
  end;
  SearchListView.Items.EndUpdate;
end;

procedure TMainForm.SearchTextExLight(ResultSL: TStringList);
var
  sl: TStringList;
  i: Integer;
  sub, target, sName: String;
  Node: TTreeNode;
begin
  sl := TStringList.Create;
  sub := SearchString;
  sub := Trim(AnsiLowerCase(sub));
  Node := TreeView.Selected;
  with ProgressBar do
  begin
    Min := 0;
    Max := RichEdit.ListCount ;
//    Step := 1;
    Position := 0;
  end;
  try
    sName := TTextItem(Node.Data).Name + TTextItem(Node.Data).Extension;
    ResultSL.Add('No.' + IntToStr(Node.AbsoluteIndex) + ':[ ' + sName + ' ]');
    sl.Text := RichEdit.Lines.Text;
    for i := 0 to sl.Count -1 do
    begin
      if FSearchCancel then begin
        Exit;
        Application.HandleMessage;
      end;               
      Application.ProcessMessages;
      ProgressBar.StepIt;
      target := AnsiLowerCase(sl[i]);
      if AnsiPos(sub, target) > 0 then
      begin
        ResultSL.Add(#09 + IntToStr(i + 1) + ':' + sl[i]);//\row
        Inc(FHits);
//      Item := SearchListView.Items.Add;
//      with SearchListView do
//      begin
//        sName := TTextItem(Node.Data).Name + TTextItem(Node.Data).Extension;
//        Item.Data := Pointer(Node.AbsoluteIndex);
//        Item.ImageIndex := TFolderItem(Node.Data).ImageIndex;
//        Item.SubItems.Add(sName);
//        Item.SubItems.Add(IntToStr(i + 1));
////        Item.SubItems.Add(Trim(sl[i]));
//        Item.SubItems.Add(FindStr(sl, i, 7));
//        Item.SubItems.Add(TFolderItem(Node.Data).FullName);
//      end;
      end;

    end;

  finally
    sl.Free;
  end;
end;

procedure TMainForm.SearchText;
var
  rsl: TStringList;
  Streem: TStream;
begin
  SearchStyle := ssText;
  if RichEdit.Lines.Text  = '' then Exit;

  case OptionSetting.Standard.SearchDsp of
    sdTreeView:
    begin
      rsl := TStringList.Create;
      try
        TreeViewForSearch.Visible := True;
        SearchListView.Visible := False;
        Application.ProcessMessages;
        TreeViewForSearch.Items.BeginUpdate;
        SearchTextExLight(rsl);
        StatusBar.Panels[0].Text := '結果表示中...';
        Application.ProcessMessages;
        Streem := TStringStream.Create(rsl.Text);     ///
//        TreeViewForSearch.OnChange := nil;
//        TreeViewForSearch.OnExpanding := nil;

        TreeViewForSearch.LoadFromStream(Streem);

        TreeViewForSearch.OnChange := TreeViewForSearchChange;
        TreeViewForSearch.OnExpanding := TreeViewForSearchExpanding;
        TreeViewForSearch.OnExpanded := TreeViewForSearchExpanded;
        Streem.Free;
        TreeViewForSearch.FullExpand;
        TreeViewForSearch.Items.EndUpdate;
      finally
        rsl.Free;
      end;


    end;
    sdListView:
    begin
      TreeViewForSearch.Visible := False;
      SearchListView.Visible := True;
      Application.ProcessMessages;
      SearchTextEx;
    end;
  end;


  ProgressBar.Position := 0;
  StatusBar.Panels[0].Text := '検索終了' + '( ' + IntToStr(FHits) + ' hits)';
  Application.ProcessMessages;
end;

procedure TMainForm.SearchFolder(sNode: TTreeNode);
var
  sl, rsl: TStringList;
  Streem: TStream;
begin
  SearchListView.Items.BeginUpdate;
  sl := TStringList.Create;
  rsl := TStringList.Create;
  try

    with ProgressBar do
    begin
      Min := 0;
      Max := NodeChildCount(sNode);
      Position := 0;
//      Step := 1;
    end;
    Tag := ProgressBar.Max;

    case OptionSetting.Standard.SearchDsp of
      sdTreeView:
      begin
        TreeViewForSearch.Visible := True;
        SearchListView.Visible := False;
        Application.ProcessMessages;
        SearchChildFolderLight(SearchString, sNode, sl, rsl);
        TreeViewForSearch.Items.BeginUpdate;
        StatusBar.Panels[0].Text := '結果表示中...';
        Application.ProcessMessages;
        Streem := TStringStream.Create(rsl.Text);
        TreeViewForSearch.OnChange := nil;
        TreeViewForSearch.OnExpanding := nil;
        TreeViewForSearch.OnExpanded := nil;

        TreeViewForSearch.LoadFromStream(Streem);

        TreeViewForSearch.OnChange := TreeViewForSearchChange;
        TreeViewForSearch.OnExpanding := TreeViewForSearchExpanding;
        TreeViewForSearch.OnExpanded := TreeViewForSearchExpanded;

        Streem.Free;
        TreeViewForSearch.Items.EndUpdate;
      end;
      sdListView:
      begin
        TreeViewForSearch.Visible := False;
        SearchListView.Visible := True;
        Application.ProcessMessages;
        SearchChildFolder(SearchString, sNode, sl);
      end;
    end;
    //TreeView1(IntToStr(ProgressBar.Max));
    ProgressBar.Position := 0;
  finally

    rsl.Free;
    sl.Free;
  end;
  SearchListView.Items.EndUpdate;
  StatusBar.Panels[0].Text := '検索終了' + '( ' + IntToStr(FHits) + ' hits)';
end;

procedure TMainForm.SearchChildFolderLight(SubStr: String; n: TTreeNode; sl, ResultSL: TStringList);
var
  i, j: Integer;
  Node: TTreeNode;
  FileName, Sub, Target, tTarget, sName: String;
begin
  for i := 0 to n.Count -1 do
  begin
    if FSearchCancel then begin
      Exit;
      Application.HandleMessage;
    end;
    Application.ProcessMessages;
    Node := n.Item[i];
    if TObject(Node.Data) is TTextItem then
    begin
      ProgressBar.StepIt;
      StatusBar.Panels[0].Text := IntToStr(Tag) + 'ファイル中、' +
                                  IntToStr(ProgressBar.Position) + 'ファイル検索中...' +
                                  '( ' + IntToStr(FHits) + ' hits)';
      Application.ProcessMessages;
      FileName := TTextItem(Node.Data).FullName;
      if FileExists(FileName) then
        sl.LoadFromFile(FileName)
      else
        sl.Text := '';
      
      Sub := Trim(AnsiLowerCase(SubStr));
      tTarget := TTextItem(Node.Data).Name + TTextItem(Node.Data).Extension;
      sName := tTarget;
      tTarget := AnsiLowerCase(tTarget);

      Target := AnsiLowerCase(sl.Text);
      if AnsiPos(Sub, Target) > 0 then
      begin
        if (AnsiPos(Sub, tTarget) > 0) then Inc(FHits);
        ResultSL.Add('No.' + IntToStr(Node.AbsoluteIndex) +':[ ' + sName + ' ]');
        for j := 0 to sl.Count -1 do
        begin
          Target := AnsiLowerCase(sl[j]);
          if AnsiPos(Sub, Target) > 0 then
          begin
            sName := TTextItem(Node.Data).Name + TTextItem(Node.Data).Extension;
            ResultSL.Add(#09 + IntToStr(j + 1) + ':' + sl[j]); //\row
            Inc(FHits);
          end;
        end;
      end
      else if (AnsiPos(Sub, tTarget) > 0) {or (Pos(Sub, tTarget) > 0)} then begin
        ResultSL.Add('No.' + IntToStr(Node.AbsoluteIndex) +':[ ' + sName + ' ]');
        Inc(FHits);
      end;
        
    end
    else
    begin
      SearchChildFolderLight(SubStr, Node, sl, ResultSL);
    end;
  end;

end;
procedure TMainForm.SearchChildFolder(SubStr: String; n: TTreeNode; sl: TStringList);
var
  i, j: Integer;
  Node: TTreeNode;
  FileName, Sub, Target, sName: String;
  ListItem: TListItem;
begin
  for i := 0 to n.Count -1 do
  begin
    if FSearchCancel then begin
      Exit;
      Application.HandleMessage;
    end;            
    Application.ProcessMessages;
    Node := n.Item[i];
    if TObject(Node.Data) is TTextItem then
    begin
      ProgressBar.StepIt;
      StatusBar.Panels[0].Text := IntToStr(Tag) + 'ファイル中、' +
                                  IntToStr(ProgressBar.Position) + 'ファイル検索中...' +
                                  '( ' + IntToStr(FHits) + ' hits)';
      Application.ProcessMessages;
      FileName := TTextItem(Node.Data).FullName;
      sl.LoadFromFile(FileName);
      Sub := Trim(AnsiLowerCase(SubStr));
      Target := TTextItem(Node.Data).Name + TTextItem(Node.Data).Extension;
      sName := Target;
      Target := AnsiLowerCase(Target);
      if AnsiPos(Sub, Target) > 0 then
      begin
        ListItem := SearchListView.Items.Add;
        ListItem.ImageIndex := TTextItem(Node.Data).ImageIndex;
        ListItem.Data := Pointer(Node.AbsoluteIndex);
        ListItem.SubItems.Add(sName);
        ListItem.SubItems.Add(TITLE_SEARCH);
        ListItem.SubItems.Add(sName);
        ListItem.SubItems.Add(TTextItem(Node.Data).FullName);
        Inc(FHits);
      end;

      Target := AnsiLowerCase(sl.Text);
      if AnsiPos(Sub, Target) > 0 then
      begin
        for j := 0 to sl.Count -1 do
        begin
          if FSearchCancel then begin
            Exit;
            Application.HandleMessage;
          end;
          Application.ProcessMessages;
          Target := AnsiLowerCase(sl[j]);
          if AnsiPos(Sub, Target) > 0 then
          begin
            sName := TTextItem(Node.Data).Name + TTextItem(Node.Data).Extension;
            ListItem := SearchListView.Items.Add;
            ListItem.ImageIndex := TTextItem(Node.Data).ImageIndex;
            ListItem.Data := Pointer(Node.AbsoluteIndex);
            ListItem.SubItems.Add(sName);
            ListItem.SubItems.Add(IntToStr(j + 1)); //\row
            ListItem.SubItems.Add(FindStr(sl, j, 7));
            ListItem.SubItems.Add(TTextItem(Node.Data).FullName);
            Inc(FHits);
          end;
        end;
      end;
    end
    else
    begin
      SearchChildFolder(SubStr, Node, sl);
    end;
  end;

end;

function TMainForm.NodeChildCount(n: TTreeNode): Cardinal;
var
 i: Integer;
 Node: TTreeNode;
begin
  Result := 0;
  if FSearchCancel then begin
    Exit;
    Application.HandleMessage;
  end;
//  Application.ProcessMessages;
  StatusBar.Panels[0].Text := 'ファイル情報取得中...';
  for i := 0 to n.Count -1 do
  begin
    Node := n.Item[i];
    if TObject(Node.Data) is TTextItem then
    begin
      Result := Result + 1;
    end
    else
    begin
      Result := Result + NodeChildCount(Node);
    end;

  end;
  //ShowMessage(IntToStr(Result));
end;

procedure TMainForm.SearchJump(Item: TListItem);
var
  i: Integer;
  Node: TTreeNode;
  oNode: TTreeNode;
  ss: String;
begin
  if Item = nil then Exit;
  if TreeView.Items.Count = 0 then Exit;


//  if WordWrapToolButton.Down then
//    WordWrapAction.Execute;

  i := Integer(Item.Data);
  Node := TreeView.Items[i];
  oNode := TreeView.Selected;;
  if TreeView.Selected.Parent <> Node.Parent then
    TreeView.FullCollapse;
  TreeView.Selected := Node;

  Application.ProcessMessages;
                                           
//  FileName := TTextItem(TreeView.Selected.Data).FullName;
//  if FileName = Trim(Item.SubItems[3]) then
  if oNode = TreeView.Selected then
  begin
    ss := Trim(Item.SubItems[1]);
    if ss = TITLE_SEARCH then Exit;
    JumpSearchStr(StrToInt(ss) -1);
  end;



  //TreeView.OnChange := TreeViewChang
end;

procedure TMainForm.SearchComboBoxKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    Windows.VK_RETURN: SearchAction.Execute;
  end;

end;

procedure TMainForm.SearchTreeShowHint(var HintStr: string;
  var CanShow: Boolean; var HintInfo: THintInfo);
var
  P: TPoint;
  Style: DWORD;
  R: TRect;
  s, sn, sa: String;
  Node, OnNode: TTreeNode;
  Index, Count, iLine: Integer;
  sLine: String; 
  strDsp: String;
  CrDay, UpDay: TDateTime;
begin
  if HintInfo.HintControl = TreeViewForSearch then
  begin
    // ContentsListViewのコントロール内にTTreeNode.Textが収まりきらないヒントを消す
    Style := GetWindowLong(TreeViewForSearch.Handle, GWL_STYLE);
    Style := Style or TVS_NOTOOLTIPS; //uses + commctrl
    SetWindowLong(TreeViewForSearch.Handle, GWL_STYLE, Style);
    //Item取得
    GetCursorPos(P);
    P := TreeViewForSearch.ScreenToClient(P);
    OnNode := TreeViewForSearch.GetNodeAt(P.X, P.Y);
    if OnNode = nil then Exit;

    r := OnNode.DisplayRect(False);
    HintInfo.CursorRect := R;
    HintInfo.HideTimeout := 20000;
    HintInfo.ReshowTimeout := 500;
    HintInfo.HintMaxWidth := 800;

    case OnNode.Level of
      0:
      begin
        TreeViewForSearch.HotTrack := False;
        TreeViewForSearch.Cursor := crHandPoint;
        s := OnNode.Text;
        Index := Pos('.', s) + 1;
        Count := Pos(':', s) - Index;
        sLine := Copy(s, Index, Count);
        iLine := StrToInt(sLine);

        Node := TreeView.Items[iLine];
        sn := TTextItem(Node.Data).Name + TTextItem(Node.Data).Extension;
        sa := TTextItem(Node.Data).FullName;
        CrDay := TTextItem(Node.Data).CreationDay;
        UpDay := TTextItem(Node.Data).UpdateDay;
        strDsp := TTextItem(Node.Data).DspType;
        s := '[ファイル名]   ' + sn + #13#10 +
             '[アドレス]      ' + sa  + #13#10 +
             '[作成日]     ' + DateTimeToStr(CrDay) + #13#10 +
             '[更新日]     ' + DateTimeToStr(UpDay) + #13#10 +
             '[表示形式]  ' + strDsp;
//             '[発見タイトル] ' + Item.SubItems[2];
        HintStr := s;
        HintInfo.ReshowTimeout := 0;
      end;
      1:
      begin
        TreeViewForSearch.HotTrack := OptionSetting.Standard.HotTrack;;
        TreeViewForSearch.Cursor := crHandPoint;
        s := OnNode.Parent.Text;
        Index := Pos('.', s) + 1;
        Count := Pos(':', s) - Index;
        sLine := Copy(s, Index, Count);
        iLine := StrToInt(sLine);
        Node := TreeView.Items[iLine];
        sn := TTextItem(Node.Data).Name + TTextItem(Node.Data).Extension;
        sa := TTextItem(Node.Data).FullName;
        CrDay := TTextItem(Node.Data).CreationDay;
        UpDay := TTextItem(Node.Data).UpdateDay;
        strDsp := TTextItem(Node.Data).DspType;

        s := OnNode.Text;
        Count := Pos(':', s) - 1;
        sLine := Copy(s, 1, Count);
        iLine := StrToInt(sLine) -1;
        iLine := RichEdit.LinesToRow(iLine);
//        ShowMessage(sLine + #13#10 + FindStr(RichEdit, iLine, 7));
        s := '[ファイル名] ' + sn + #13#10 +
             '[アドレス]    ' + sa  + #13#10 +
             '[作成日]     ' + DateTimeToStr(CrDay) + #13#10 +
             '[更新日]     ' + DateTimeToStr(UpDay) + #13#10 +
             '[表示形式]  ' + strDsp + #13#10 +
             '[発見位置]' + #13#10 +
             '----------------------------------------------------' + #13#10 +
             TrimRight(FindStr(RichEdit, iLine, 7)) + #13#10 +
             '----------------------------------------------------';

        HintStr := s;
        HintInfo.ReshowTimeout := 0;

      end else
        TreeViewForSearch.Cursor := crDefault;
    end;
  end;
end;

procedure TMainForm.SearchShowHint(var HintStr: string;
  var CanShow: Boolean; var HintInfo: THintInfo);
var
  P: TPoint;
  Style: DWORD;
  Item: TListItem;
  R: TRect;
  s, sn, sa, strDsp: String;
  Node: TTreeNode;
  CrDay, UpDay: TDateTime;
begin
  if HintInfo.HintControl = SearchListView then
  begin
    // ContentsListViewのコントロール内にTTreeNode.Textが収まりきらないヒントを消す
    Style := GetWindowLong(SearchListView.Handle, GWL_STYLE);
    Style := Style or TVS_NOTOOLTIPS; //uses + commctrl
    SetWindowLong(SearchListView.Handle, GWL_STYLE, Style);
    //Item取得
    GetCursorPos(P);
    P := SearchListView.ScreenToClient(P);
    Item := SearchListView.GetItemAt(P.X, P.Y);
    if Item = nil then Exit;

    r := Item.DisplayRect(drBounds);
    HintInfo.CursorRect := R;
    HintInfo.HideTimeout := 20000;
    HintInfo.ReshowTimeout := 500;
    HintInfo.HintMaxWidth := 800;

//    ShowMessage(Item.SubItems[1])
//    Exit;
    Node := TreeView.Items[Integer(Item.Data)];
    sn := TTextItem(Node.Data).Name + TTextItem(Node.Data).Extension;
    sa := TTextItem(Node.Data).FullName;
    CrDay := TTextItem(Node.Data).CreationDay;
    UpDay := TTextItem(Node.Data).UpdateDay;
    strDsp := TTextItem(Node.Data).DspType;

    if Item.SubItems[1] = TITLE_SEARCH then
    begin
      s := '[ファイル名]    ' + sn + #13#10 +
           '[アドレス]       ' + sa + #13#10 +
           '[作成日]     ' + DateTimeToStr(CrDay) + #13#10 +
           '[更新日]     ' + DateTimeToStr(UpDay) + #13#10 +
           '[表示形式]  ' + strDsp + #13#10 +
           '[発見タイトル] ' + Item.SubItems[2];
      HintStr := s;
      HintInfo.ReshowTimeout := 0;
    end
    else
    begin
//      sl := TStringList.Create;
//      try
////        sl.LoadFromFile(sa);
//        i := StrToInt(Item.SubItems[1]) -1;
        s := '[ファイル名] ' + sn + #13#10 +
             '[アドレス]    ' + sa  + #13#10 +    
             '[作成日]     ' + DateTimeToStr(CrDay) + #13#10 +
             '[更新日]     ' + DateTimeToStr(UpDay) + #13#10 +
             '[表示形式]  ' + strDsp + #13#10 +
             '[発見位置]' + #13#10 +
             '----------------------------------------------------' + #13#10 +
             TrimRight(Item.SubItems[2]) + #13#10 +
             '----------------------------------------------------';
             // + #13#10 +
  //             '[内容]' + #13#10 +
//             sl[i]     + #13#10 +
//             sl[i + 1] + #13#10 +
//             sl[i + 2] + #13#10 +
//             sl[i + 3] + #13#10 +
//             sl[i + 4] + #13#10 +
//             sl[i + 5] + #13#10 +
//             sl[i + 6] + #13#10 +
//             sl[i + 7] + #13#10 +
//             sl[i + 8] + #13#10 +
//             sl[i + 9] + #13#10 +
//             sl[i + 10] + #13#10 +
//             sl[i + 11] + #13#10 +
//             sl[i + 12] + #13#10 +
//             sl[i + 13] + #13#10 +
//             sl[i + 14];
        HintStr := s;
//      finally
//        sl.Free;
//      end;
      HintInfo.ReshowTimeout := 0;

    end;
  end;

end;

procedure TMainForm.SearchListViewMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Application.OnShowHint := SearchShowHint;
end;

procedure TMainForm.GoToTopActionExecute(Sender: TObject);
var
  NowLine : Integer;
begin
  LayoutCheckFalse;
  with RichEdit do
  begin
     NowLine:=Perform(EM_LINEFROMCHAR,SelStart,0);  //カーソル行を取得
     Perform(EM_LINESCROLL,0,-NowLine); //先頭行へスクロール
     SelStart:=0;
     SetFocus;
  end;
end;

procedure TMainForm.GoToButtomActionExecute(Sender: TObject);
//var
//  NowLine  : Integer;
//  LastLine : Integer;
begin           
  LayoutCheckFalse;
  with RichEdit do
  begin
    if Text = '' then Exit;
//    NowLine:=Perform(EM_LINEFROMCHAR,SelStart,0);
//    LastLine:=Perform(EM_GETLINECOUNT,0,0);
//    Perform(EM_LINESCROLL,0,LastLine-NowLine);
//    SelStart:=Perform(EM_LINEINDEX,LastLine-1,0);
//    SetFocus;
      SelStart := SendMessage(Handle, EM_LINEINDEX, ListCount -1, 0);
      SendMessage(Handle, EM_SCROLLCARET, 0, 0);
      SetFocus;
  end;
end;

procedure TMainForm.ContentsListViewMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Application.OnShowHint := ContentsShowHint;
end;



procedure TMainForm.ContentsListViewColumnClick(Sender: TObject;
  Column: TListColumn);
begin
	if FSortIndex = Column.Index then
		FSortOrder := not FSortOrder
	else
		FSortOrder := False;

  TListView(Sender).CustomSort(nil, Column.Index);

  FSortIndex := Column.Index;
end;

procedure TMainForm.ContentsListViewCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  if FSortOrder = False then
  begin
    case Data of
      0: Compare := Item1.ImageIndex - Item2.ImageIndex;
      1: Compare := StrToInt(Item1.SubItems[Data -1]) - StrToInt(Item2.SubItems[Data -1]);
      2: Compare := AnsiCompareText(Item1.SubItems[Data -1], Item2.SubItems[Data -1]);
    end;
  end
  else
  begin
    case Data of
      0: Compare := Item2.ImageIndex - Item1.ImageIndex;
      1: Compare := StrToInt(Item2.SubItems[Data -1]) - StrToInt(Item1.SubItems[Data -1]);
      2: Compare := AnsiCompareText(Item2.SubItems[Data -1], Item1.SubItems[Data -1]);
    end;
  end;


end;

procedure TMainForm.SearchListViewCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);

  function Change(s: String): String;
  begin
    if s = TITLE_SEARCH then
      Result := '0'
    else
      Result := s;
  end;

begin
  if FSortOrder = False then
  begin
    case Data of
      0: Compare := 0;
      1, 3: Compare := AnsiCompareText(Item1.SubItems[Data -1], Item2.SubItems[Data -1]);
      2: Compare := StrToInt(Change(Item1.SubItems[Data -1])) -
                      StrToInt(Change(Item2.SubItems[Data -1]));
      4: Compare := AnsiCompareFileName(Item1.SubItems[Data -1], Item2.SubItems[Data -1]);
    end;

  end
  else
  begin
    case Data of
      0: Compare := 0;
      1, 3: Compare := AnsiCompareText(Item2.SubItems[Data -1], Item1.SubItems[Data -1]);
      2: Compare := StrToInt(Change(Item2.SubItems[Data -1])) -
                      StrToInt(Change(Item1.SubItems[Data -1]));
      4: Compare := AnsiCompareFileName(Item2.SubItems[Data -1], Item1.SubItems[Data -1]);
    end;

  end;

end;

procedure TMainForm.ListViewCompare(Sender: TObject; Item1,
  Item2: TListItem; Data: Integer; var Compare: Integer);
begin
  if FSortOrder = False then
  begin
    case Data of
      0: Compare := Item1.ImageIndex - Item2.ImageIndex;
      1, 2, 3, 4: Compare := AnsiCompareText(Item1.SubItems[Data -1], Item2.SubItems[Data -1]);
      5: Compare := AnsiCompareFileName(Item1.SubItems[Data -1], Item2.SubItems[Data -1]);
    end;

  end
  else
  begin
    case Data of
      0: Compare := Item2.ImageIndex - Item1.ImageIndex;
      1, 2, 3, 4: Compare := AnsiCompareText(Item2.SubItems[Data -1], Item1.SubItems[Data -1]);
      5: Compare := AnsiCompareFileName(Item2.SubItems[Data -1], Item1.SubItems[Data -1]);
    end;

  end;
end;

procedure TMainForm.SearchListViewMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  Item: TListItem;
begin
  Item := SearchListView.GetItemAt(X, Y);
  if Item = nil then Exit;
  Screen.Cursor := crHourGlass;
  try
    SearchJump(Item);
  finally
    Screen.Cursor := crDefault;
  end;
end;

//procedure TMainForm.SetMargin; 
//const
//  Indent: integer = 30;
//var
//  Rect: TRect;
//begin
//  Rect := RichEdit.ClientRect;
//  with Rect do
//  begin
//    Left := Rect.Left + Indent;
//    Top := Top + 2;
//    Bottom := Bottom - 2;
//    Right := Right - Indent;
//  end;
//  SendMessage(RichEdit.Handle, EM_SETRECT, 0, LongInt(@Rect));
//end;
procedure TMainForm.SetWordWrapColCount;
begin
  RichEdit.WrapOption.WrapByte := RichEdit.ColCount -1;
end;

procedure TMainForm.FormResize(Sender: TObject);
begin
//  ShowMessage('FormResize');
  if FCreateFlag then Exit;
  if FCloseFlag then Exit;
//  if OptionSetting = nil then Exit;
  if TreeView.Selected.Data = nil then Exit;

//  if RichEdit.Text = '' then Exit;
//  if CloseQuery then Exit;
  SetWordWrapColCount;
  if (OptionSetting.Standard.ContentsDsp) and
     (WordWrapAction.Checked) and
     (SearchStyle = ssNone) then
  begin
    ContentsPageControl.ActivePage := ContentsDspTabSheet;
    AddBookMarkToListView(TreeView.Selected);
  end;

  if (TObject(TreeView.Selected.Data) is TTextItem) and
     (OptionSetting.Standard.ContentsDsp) and
     (WordWrapAction.Checked) and
     (SearchStyle = ssNone) then
  begin
    ContentsPageControl.ActivePage := ContentsDspTabSheet;
    AddContentsToListView(TreeView.Selected);
  end;

  if SearchStyle <> ssNone then TreeViewForSearch.Refresh;
  FCreateFlag := False;
end;


procedure TMainForm.TreeViewCompare(Sender: TObject; Node1,
  Node2: TTreeNode; Data: Integer; var Compare: Integer);

  function FolderCompare(N1, N2: TTreeNode): Integer;
  const
    FOLDER_ITEM = 0;
    TEXT_ITEM = 5;
  var
    No1, No2: Integer;
  begin
    if TObject(N1.Data) is TTextItem then
      No1 := TEXT_ITEM
    else
      No1 := FOLDER_ITEM;
    if TObject(N2.Data) is TTextItem then
      No2 := TEXT_ITEM
    else
      No2 := FOLDER_ITEM;

    Result := No1 - No2;
  end;

  function CreateDayCompare(N1, N2: TTreeNode): Integer;
  var
    No1, No2: TDateTime;
  begin
    if TObject(N1.Data) is TTextItem then
      No1 := TTextItem(N1.Data).CreationDay
    else
      No1 := TFolderItem(N1.Data).CreationDay;
    if TObject(N2.Data) is TTextItem then
      No2 := TTextItem(N2.Data).CreationDay
    else
      No2 := TFolderItem(N2.Data).CreationDay;

    Result := DateTimeToFileDate(No1) - DateTimeToFileDate(No2);
  end;

  function UpdateDayCompare(N1, N2: TTreeNode): Integer;
  var
    No1, No2: TDateTime;
//    D: Double;
  begin
    if TObject(N1.Data) is TTextItem then
      No1 := TTextItem(N1.Data).UpdateDay
    else
      No1 := 0;
    if TObject(N2.Data) is TTextItem then
      No2 := TTextItem(N2.Data).UpdateDay
    else
      No2 := 0;
//    D := No1 - No2;
//    if D = 0 then Result := 0 else
//      if D > 0 then Result := 1 else
//      Result := -1;
    Result := DateTimeToFileDate(No1) - DateTimeToFileDate(No2);
  end;

  function ExtCompare(N1, N2: TTreeNode): Integer;
  var
    No1, No2: String;
  begin
    if TObject(N1.Data) is TTextItem then
      No1 := TTextItem(N1.Data).Extension
    else
      No1 := '.';
    if TObject(N2.Data) is TTextItem then
      No2 := TTextItem(N2.Data).Extension
    else
      No2 := '.';

    Result := AnsiCompareStr(No1, No2);
  end;

  function DspTypeCompare(N1, N2: TTreeNode): Integer;
  var
    No1, No2: String;
  begin
    if TObject(N1.Data) is TTextItem then
      No1 := TTextItem(N1.Data).DspType
    else
      No1 := '';
    if TObject(N2.Data) is TTextItem then
      No2 := TTextItem(N2.Data).DspType
    else
      No2 := '';

    Result := AnsiCompareStr(No1, No2);
  end;
begin
  //TreeView.Visible := false;
  case TSortMode(Data) of
    smNone:      Compare := 0;
    smFolder:    Compare := FolderCompare(Node1, Node2);
    smAlphaUp:   Compare := AnsiCompareStr(Node1.Text, Node2.Text);
    smAlphaDown: Compare := AnsiCompareStr(Node2.Text, Node1.Text);
    smDayUp:     Compare := CreateDayCompare(Node1, Node2);
    smDayDown:   Compare := CreateDayCompare(Node2, Node1);
    smUpDayUp:   Compare := UpdateDayCompare(Node1, Node2);
    smUpDayDown: Compare := UpdateDayCompare(Node2, Node1);
    smExt:       Compare := ExtCompare(Node1, Node2);
    smDspType:   Compare := DspTypeCompare(Node1, Node2);
  end;


  //TreeView.Visible := true;
end;

procedure TMainForm.SortAlphaUpActionExecute(Sender: TObject);
begin
  TreeView.Items.BeginUpdate;
  TreeView.CustomSort(nil, Ord(smAlphaUp));
  TreeView.Items.EndUpdate;
  Application.ProcessMessages;
  FolderSort;
end;

procedure TMainForm.SortAlphaDownActionExecute(Sender: TObject);
begin
  TreeView.Items.BeginUpdate;
  TreeView.CustomSort(nil, Ord(smAlphaDown));
//  TreeView.CustomSort(nil, Ord(ssFolder));
  TreeView.Items.EndUpdate;
  Application.ProcessMessages;
  FolderSort;
end;

procedure TMainForm.FolderSort;
begin
  TreeView.Items.BeginUpdate;
  TreeView.CustomSort(nil, Ord(smFolder));
  TreeView.Items.EndUpdate;
end;


procedure TMainForm.SortDayUoActionExecute(Sender: TObject);
begin
  TreeView.Items.BeginUpdate;
  TreeView.CustomSort(nil, Ord(smDayUp));
  TreeView.Items.EndUpdate;
  Application.ProcessMessages;
  FolderSort;
end;

procedure TMainForm.SortDayDownActionExecute(Sender: TObject);
begin
  TreeView.Items.BeginUpdate;
  TreeView.CustomSort(nil, Ord(smDayDown));
  TreeView.Items.EndUpdate;
  Application.ProcessMessages;
  FolderSort;
end;

procedure TMainForm.SortUpDayUpActionExecute(Sender: TObject);
begin
  TreeView.Items.BeginUpdate;
  TreeView.CustomSort(nil, Ord(smUpDayUp));
  TreeView.Items.EndUpdate;
end;

procedure TMainForm.SortUpDayDownActionExecute(Sender: TObject);
begin
  TreeView.Items.BeginUpdate;
  TreeView.CustomSort(nil, Ord(smUpDayDown));
  TreeView.Items.EndUpdate;
end;

procedure TMainForm.SortExtActionExecute(Sender: TObject);
begin
  TreeView.Items.BeginUpdate;
  TreeView.CustomSort(nil, Ord(smExt));
  TreeView.Items.EndUpdate;
end;

procedure TMainForm.SortDspTypeActionExecute(Sender: TObject);
begin
  TreeView.Items.BeginUpdate;
  TreeView.CustomSort(nil, Ord(smDspType));
  TreeView.Items.EndUpdate;
end;

procedure TMainForm.LayoutDocumentAreaActionExecute(Sender: TObject);
begin
  if LayoutListViewAreaAction.Checked then
  begin
    LayoutListViewAreaAction.Checked := False;
    LayoutDocumentAreaAction.Checked := True;
    if LayoutDocumentAreaAction.Checked then
    begin
      PanelL.Visible := False;
      SplitterL.Visible := False;

      PanelM.Visible := True;
    end;
  end
  else
  begin
    LayoutDocumentAreaAction.Checked := not LayoutDocumentAreaAction.Checked;
    if LayoutDocumentAreaAction.Checked then
    begin
      //Doc最大化
      PanelL.Visible := False;
      SplitterL.Visible := False;
    end
    else
    begin
      //戻す
      PanelL.Align := alTop;
      PanelL.Height := OldListViewPanelWidth;
      PanelL.Visible := True;
      SplitterL.Visible := True;
      SplitterL.Top := PanelL.Height;
    end;
  end;
end;

procedure TMainForm.LayoutListViewAreaActionExecute(Sender: TObject);
begin
  if LayoutDocumentAreaAction.Checked then
  begin
    LayoutDocumentAreaAction.Checked := False;
    LayoutListViewAreaAction.Checked := True;
    if LayoutListViewAreaAction.Checked then
    begin
      PanelM.Visible := False;
      SplitterL.Visible := False;

//      OldListViewPanelWidth := pa
      PanelL.Align := alClient;
      PanelL.Visible := True;
    end;


  end
  else
  begin
    LayoutListViewAreaAction.Checked := not LayoutListViewAreaAction.Checked;

    if LayoutListViewAreaAction.Checked then
    begin
      //リスト最大化
      //Doc
      PanelM.Visible := False;
      SplitterL.Visible := False;
      //List
      OldListViewPanelWidth := PanelL.Height;
      PanelL.Align := alClient;
    end
    else
    begin
      //戻す
      //Doc
      PanelM.Visible := True;
      //List
      PanelL.Align := alTop;
      PanelL.Height := OldListViewPanelWidth;
      SplitterL.Visible := True;
      SplitterL.Top := PanelL.Height;
    end;
  end;
end;

procedure TMainForm.LayoutCheckFalse;
begin
  if LayoutListViewAreaAction.Checked then
    LayoutListViewAreaAction.Execute;
//  if LayoutDocumentAreaAction.Checked then
//    LayoutDocumentAreaAction.Execute;
end;

procedure TMainForm.EndTimerTimer(Sender: TObject);
begin
//  UpTimer.Enabled := False;
//  DownTimer.Enabled := False;
//  LeftTimer.Enabled := False;
//  RightTimer.Enabled := False;

end;

procedure TMainForm.AboutActionExecute(Sender: TObject);
begin
  AboutForm := TAboutForm.Create(Self);
  try
    AboutForm.ShowModal;
  finally
    AboutForm.Free;
  end;

end;

procedure TMainForm.EditUndoActionExecute(Sender: TObject);
begin
  RichEdit.Undo;
  EditUndoAction.Enabled := RichEdit.CanUndo;
end;

procedure TMainForm.EditRedoActionExecute(Sender: TObject);
begin
  RichEdit.Redo;
  EditRedoAction.Enabled := RichEdit.CanRedo;
end;

procedure TMainForm.RichEditChange(Sender: TObject);
  procedure DeleteContentsMark;
  var
    i: Integer;
  begin
    for i := 0  to RichEdit.ListCount -1 do
      RichEdit.DeleteRowMark(i, rm11);
  end;

begin
  EditActionEnable;
  if (ContentsListView.Items.Count <> 0) and RichEdit.CanUndo then
  begin
    DeleteContentsMark;
    ContentsListView.Clear;
  end;
  if (SearchListView.Items.Count <> 0) and RichEdit.CanUndo then
//    ContentsPageControl.ActivePage := ContentsDspTabSheet;
  SearchListView.Clear;
end;


procedure TMainForm.RichEditCaretMoved(Sender: TObject);
var
  Line, Plase: Integer;
begin
  EditActionEnable;
  with RichEdit do
  begin
    Line := Perform(EM_LINEFROMCHAR, SelStart, 0);    //カーソル行
    Plase := SelStart - Perform(EM_LINEINDEX, -1, 0); //桁位置
    //ShowMessage(IntToStr(Line) + ',' + IntToStr(Plase));
    StatusBar.Panels[3].Text := IntToStr(Line + 1) + ', ' + IntToStr(Plase + 1);
  end;
end;
function TMainForm.HeadLine(Line: Integer): Integer;
var
  i: Integer;
  ra: TRowAttributeData;
begin
  Result := 0;
  for i := Line downto 0 do
  begin
    ra := RichEdit.ListData[i];
    if ra.PrevRowAttribute = raCrlf then
    begin
      Result := i;
      Break;
    end;
  end;

end;

procedure TMainForm.SetBookMarkActionExecute(Sender: TObject);
var
  hLine: Integer;
//  sl: TStringList;
begin
  with RichEdit do
  begin
    if RichEdit.Lines.Text = '' then Exit;
    hLine := HeadLine(Row);
    PutRowMark(hLine, rm10);
//    sl := TTextItem(TreeView.Selected.Data).Bookmarker;
//    sl.Add(IntToStr(hLine) + ',' + Lines[hLine]);
//    ShowMessage(sl.Text);
  end;
end;



procedure TMainForm.DeleteBookMarkActionExecute(Sender: TObject);
var
  hLine: Integer;
begin
  with RichEdit do
  begin
    if RichEdit.Lines.Text = '' then Exit;
    hLine := HeadLine(Row);
    DeleteRowMark(hLine, rm10);
  end;
end;                    

procedure TMainForm.MarkerActionExecute(Sender: TObject);
begin
  if Trim(SearchComboBox.Text) = '' then Exit;
  MarkerAction.Checked := not MarkerAction.Checked;
  if MarkerAction.Checked then begin
    SearchString := SearchComboBox.Text;
    SearchString := Trim(AnsiLowerCase(SearchString));
  	AddComboBox(Trim(SearchComboBox.Text), SearchComboBox);
//    Application.ProcessMessages;
    RichEdit.FindString := SearchString;
  end else begin
    RichEdit.FindString := '';
  end;


end;

procedure TMainForm.SearchComboBoxChange(Sender: TObject);
begin
  MarkerAction.Checked := False;
  RichEdit.FindString := '';
end;

procedure TMainForm.RichEditSelectionChange(Sender: TObject;
  Selected: Boolean);
begin
  EditActionEnable;
end;

procedure TMainForm.EditSelectAllActionExecute(Sender: TObject);
begin
  if RichEdit.SelText = '' then
    RichEdit.SelectAll
  else
    RichEdit.SelLength := 0;
end;

procedure TMainForm.CloseActionExecute(Sender: TObject);
begin
  Close;
end;

procedure TMainForm.DeleteAllBookMarkActionExecute(Sender: TObject);
var
  Msg: String;
begin
  Msg := 'このドキュメントに設定されているしおりを全て削除していいですか？';
  if Application.MessageBox(PChar(Msg), '確認',
    MB_ICONQUESTION or MB_YESNO or MB_DEFBUTTON2) = IDNO then Exit;

  DeleteAllBookMark;
end;

procedure TMainForm.DeleteAllBookMark;
var
  i: Integer;
begin
  with RichEdit do
    for i := 0 to ListCount -1 do
      DeleteRowMark(i , rm10);

end;

procedure TMainForm.RichEditMouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
  if Sender is TEditor then
    with Sender as TEditor do
      case TokenFromPos(Point(X, Y)) of
        toUrl:
          begin
            Cursor := crHandPoint;
            StatusBar.Panels[0].Text := TokenStringFromPos(Point(X, Y));
          end;
        toMail:
          begin
            Cursor := crHandPoint;
            StatusBar.Panels[0].Text := 'mailto:' + TokenStringFromPos(Point(X, Y));
          end;
      else
        StatusBar.Panels[0].Text := '';
        case CursorState of
          mcClient: Cursor := Caret.Cursors.DefaultCursor;
          mcLeftMargin: Cursor := Caret.Cursors.LeftMarginCursor;
          mcInSel: Cursor := Caret.Cursors.InSelCursor;
          mcDragging: Windows.SetCursor(Screen.Cursors[Caret.Cursors.DragSelCursor]);
          mcDraggingCopy: Windows.SetCursor(Screen.Cursors[Caret.Cursors.DragSelCopyCursor]);
        end;
      end;
end;

procedure TMainForm.RichEditDblClick(Sender: TObject);
var
  S: String;
  C: Char;
  Editor: TEditor;
  P: TPoint;
  NowLine: Integer;
begin
//  inherited
  if Sender is TEditor then
  begin
    Editor := Sender as TEditor;
    C := Editor.TokenFromCaret;
    if (C = toUrl) or (C = toMail) then
    begin
      if C = toUrl then
        S := Editor.TokenStringFromCaret
      else
        S := 'mailto:' + Editor.TokenStringFromCaret;
      ShellExecute(Handle, 'OPEN', PChar(S), '', '', SW_SHOW);
    end;
//    else
//      Editor.SelectTokenFromCaret;
  end;
  GetCursorPos(P);
  with RichEdit do begin
    P := ScreenToClient(P);
    NowLine := Perform(EM_LINEFROMCHAR, SelStart, 0);  //カーソル行を取得
    if P.X < 25 then begin
      if rm10 in ListRowMarks[NowLine] then begin
        DeleteBookMarkActionExecute(nil);
      end else begin
        SetBookMarkActionExecute(nil);
      end;
    end;
  end;

  
end;

procedure TMainForm.TreeViewForSearchMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);//
//var
//  Node: TTreeNode;
begin
//  Node := TreeViewForSearch.GetNodeAt(X, Y);
//  JumpSeafchTree(Node);
end;

procedure TMainForm.JumpSeafchTree(Node: TTreeNode);
begin
  Screen.Cursor := crHourGlass;
  try
    case Node.Level of
      0: JumpTreeLevel0(Node);
      1: JumpTreeLevel1(Node);
    end;
  finally
    Screen.Cursor := crDefault;
  end;

end;

function TMainForm.GetTreeItemIndex(s: String): Integer; 
var
  Index, Count: Integer;
  sLine: String;
begin
  Index := Pos('.', s) + 1;
  Count := Pos(':', s) - Index;
  sLine := Copy(s, Index, Count);
  Result := StrToInt(sLine)
end;

procedure TMainForm.JumpTreeLevel0(Node: TTreeNode);
var
  iLine: Integer;
  s: String;
  Node1: TTreeNode;
begin
  if Node = nil then Exit;
  if TreeView.Items.Count = 0 then Exit;
  s := Node.Text;

  iLine := GetTreeItemIndex(s);

  Node1 := TreeView.Items[iLine];
//  if TreeView.Selected.Parent <> Node1.Parent then
//    TreeView.FullCollapse;
  TreeView.Selected := Node1;
end;

function TMainForm.GetLineIndex(s: String): Integer;
var
  Count: Integer;
  sLine: String;
begin
  Count := Pos(':', s) - 1;
  sLine := Copy(s, 1, Count);
  Result := StrToInt(sLine) -1;
end;

procedure TMainForm.JumpTreeLevel1(Node: TTreeNode);
var
  iLine: Integer;
  s: String;
begin
  if Node = nil then Exit;
  if TreeView.Items.Count = 0 then Exit;
  JumpTreeLevel0(Node.Parent);
  s := Node.Text;

  iLine := GetLineIndex(s);
  JumpSearchStr(iLine);
//  ShowMessage(sLine);
end;

procedure TMainForm.JumpSearchStr(Line: Integer);
var
//  NowLine : Integer;
  ToLine : Integer;
  LinePos: Integer;
  s: String;
begin
  with RichEdit do
  begin
//    NowLine:=Perform(EM_LINEFROMCHAR,SelStart,0)
    ToLine := LinesToRow(Line);
    SelStart := SendMessage(Handle, EM_LINEINDEX, ToLine, 0);
    SendMessage(Handle, EM_SCROLLCARET, 0, 0);

    Application.ProcessMessages; 
    if SearchStyle <> ssNone then
    begin
      s := AnsiLowerCase(RichEdit.Lines[Line]);
      LinePos := AnsiPos(SearchString, s) -1;
      SelStart := SelStart + LinePos;
      SelLength := Length(SearchString);
      LayoutCheckFalse;
      Application.ProcessMessages;
      SetFocus;
    end
    else
    begin
      SelLength := Length(ListString[ToLine]);
      LayoutCheckFalse;
      Application.ProcessMessages;
      SetFocus;
    end;

  end;
end;

procedure TMainForm.TreeViewForSearchExpanding(Sender: TObject;
  Node: TTreeNode; var AllowExpansion: Boolean);
begin
  TreeViewForSearch.FullCollapse;
  
end;

procedure TMainForm.TreeViewForSearchExpanded(Sender: TObject;
  Node: TTreeNode);
begin
  JumpSeafchTree(Node);
end;

procedure TMainForm.TreeViewForSearchAdvancedCustomDrawItem(
  Sender: TCustomTreeView; Node: TTreeNode; State: TCustomDrawState;
  Stage: TCustomDrawStage; var PaintImages, DefaultDraw: Boolean);
var
  r, r2: TRect;
  DspText, TempText, HitText: WideString;
  DspWidth: Integer;
  i: Integer;
  s: String;
begin
//  Stage := cdPostPaint;
  s := AnsiLowerCase(Node.Text);
  r := Node.DisplayRect(True);
  r2 := Node.DisplayRect(False);
  if Node.Level = 0 then
  begin
    with TreeViewForSearch.Canvas do
    begin
//      TreeViewForSearch.HotTrack := False;
      Pen.Color := clBtnShadow;
      Brush.Color := clBtnFace;
      Rectangle(r2);


//      Font.Color := clBlack;
      Font.Size := TreeViewForSearch.Font.Size;
      DspText := Node.Text;
      DspWidth  := TreeViewForSearch.Width - 200;
      if TextWidth(DspText) > DspWidth then begin
        for i := Length(DspText) downto 1 do begin
          TempText := Copy(DspText, 1, i) + '...]';
          if TextWidth(TempText) < DspWidth then begin
            DspText := TempText;
            Break;
          end;
        end;
      end else begin
        DspText := Node.Text;
      end;
//      TextOut(r.Left + 2, r.Top + 2, DspText);

      if Node.Count <> 0 then begin
        if (AnsiPos(SearchString, s) > 0) {or (Pos(SearchString, s) > 0)} then begin
          Font.Color := clRed;
          HitText := 'Title and ' + IntToStr(Node.Count) + ' matches';
        end else begin
          Font.Color := clBlack;
          HitText := IntToStr(Node.Count) + ' matches';
        end;


        TextOut(r2.Right - TextWidth(HitText) - 3, r.Top + 1, HitText);
//        Font.Color := clBlack;
        if Node.Expanded then
          TextOut(r2.Left + 5, r2.Top + 2, '-')
        else
          TextOut(r2.Left + 5, r2.Top + 2, '+');
          TextOut(r.Left + 2, r.Top + 2, DspText);
      end else begin
        Font.Color := clBlue;
        HitText := 'Title matches';
        TextOut(r2.Right - TextWidth(HitText) - 3, r.Top + 1, HitText);
        TextOut(r.Left + 2, r.Top + 2, DspText);
      end;
    end;
  end else begin
//    TreeViewForSearch.HotTrack := True;
//    if cdsHot in State  then begin
//      Font.Color := clBlue;
//      Font.Style := [fsUnderline];
//      TreeViewForSearch.Canvas.TextOut(r.Left + 2, r.Top + 2, Node.Text);
//    end;
  end;

//
//  s := Node.Text;
//  s := AnsiLowerCase(s);
//  if AnsiPos(SearchString, s) > 0 then
//  begin
//    with TreeViewForSearch.Canvas do
//    begin
//      l := r.Left + TextWidth(Copy(s, 1, Length(SearchString)));
////      t := r.Top;
////      ri := l + TextWidth(SearchString);
////      bo := r.Bottom;
////      rr := Rect(l, t, ri, bo);
//      Pen.Color := clRed;
//      Pen.Width := 3;
//      LineTo(l, r.Bottom);
//      MoveTo(l + TextWidth(SearchString), r.Bottom);
////      Brush.Color := clNavy;
////      Rectangle(rr);
//    end;
//  end;



end;

procedure TMainForm.PrintActionExecute(Sender: TObject);
begin
//  plPrevForm1 := TplPrevForm1.Create(Self);
//  try
//    Screen.Cursor := crHourGlass;
//    PrintPreviewSet;
//    Screen.Cursor := crDefault;
//    plPrev1.ShowModal;
//  finally
//    Screen.Cursor := crDefault;
//    plPrevForm1.Free;
//  end;
end;

procedure TMainForm.PrintSetActionExecute(Sender: TObject);
begin
  plSetPrinter1.ShowDialog;
end;

procedure TMainForm.TreeViewForSearchChange(Sender: TObject;
  Node: TTreeNode);
begin
  JumpSeafchTree(Node);

end;

//procedure TMainForm.PrintPreviewSet;
//var
//  i, p, j: Integer;
//  ListCount, PageCount: Integer;
//  ViewWidth, ViewHeight: Integer;
//  FontHeight, TopMargin, LeftMargin, RowH: Integer;
//  TempSL: TStringList;
//  LastCount: Integer;
//  Tab: String;
//  s: String;
//  sl: TStringList;
//const
//  LINE_COUNT = 64;
//  COL_COUNT  = 90;
//begin
//  if RichEdit.ListCount < 1 then begin
//    Application.MessageBox('ドキュメントが表示されていません。', PChar(Application.Title),
//      MB_ICONINFORMATION);
//    Abort;
//  end;
//  TempSL := TStringList.Create;
//  Tab := TabString(RichEdit.Caret.TabSpaceCount);
//  for i := 0 to RichEdit.Lines.Count -1 do begin
//    s := RichEdit.Lines[i];
//    s := StringReplace(s, #09, Tab, [rfReplaceAll]);
//    if Length(s) > COL_COUNT then begin
//      s := LineCut(s, COL_COUNT);
//      sl := TStringList.Create;
//      try
//        sl.Text := s;
//        for j := 0 to sl.Count -1 do
//          TempSL.Add(sl[j]);
//      finally
//        sl.Free;
//      end;
//    end
//    else
//      TempSL.Add(s);
//  end; 
//  ListCount := TempSL.Count;
//  PageCount := (ListCount div LINE_COUNT) + 1;
//
//  ViewWidth  := plPrev1.PaperWidth;
//  ViewHeight := plPrev1.PaperHeight;
//  FontHeight := ViewHeight div  90;
//  TopMargin  := ViewHeight div  15;
//  LeftMargin := ViewWidth  div  15;
//  RowH       := ViewHeight div 300;
//
//  plPrev1.BeginDoc;
//
//  plPrev1.Title := TreeView.Selected.Text;
//  plPrev1.FontName('ＭＳ Ｐゴシック');
//  plPrev1.FontHeight(FontHeight);
//
//  for p := 0 to PageCount -1 do begin
//    plPrev1.TextOut(100, 100, plPrev1.Title + ' (' + IntToStr(p + 1) + '/' + IntToStr(PageCount) + ')');
//    LastCount := LineEndCount(LINE_COUNT, PageCount, p + 1, ListCount);
////    ShowMessage(IntToStr(LastCount));
//    for i := 0 to LastCount -1 do begin
//      plPrev1.TextOut(LeftMargin, TopMargin + (FontHeight + RowH) * i, TempSL[i  + (p * LINE_COUNT)]);
////      plPrev1.TextOut(LeftMargin, TopMargin + (FontHeight + RowH) * i, RichEdit.ListString[i  + (p * LINE_COUNT)]);
//    end;
//    if p = PageCount -1 then Break;
//    plPrev1.NewPage;
//  end;
//
//  plPrev1.EndDoc;
//
////  plPrev1.ShowModal;
//
//  TempSL.Free;
//end;

//procedure TMainForm.PrintPreviewActionExecute(Sender: TObject);
//begin
//  plPrevForm1 := TplPrevForm1.Create(Self);
//  try
//    PrintPreviewSet;
//    plPrev1.ShowModal;
//  finally
//    plPrevForm1.Free;
//  end;
//end;
//
//function TMainForm.LineCut(s: String; CutCount: Integer): String;
//var
//  i, Cut: Integer;
//  ss: String;
//  List: TList;
//begin
//  Cut := 1;
//  ss := s;
//  List := TList.Create;
//  try
//    for i := 1 to Length(s) do begin
//      if i = (CutCount * Cut) then begin
//        case ByteType(s, i) of
//          mbSingleByte, mbLeadByte: List.Add(Pointer(i));
//          mbTrailByte:              List.Add(Pointer(i-1));
//        end;
//        Inc(Cut);
//      end;
//    end;
//    for i := List.Count -1 downto 0 do begin
//      Insert(#13#10, ss, Integer(List[i]));
//    end;
//  finally
//    List.Free;
//  end;
////  ShowMessage(ss);
//  Result := ss;
//end;
//
//function TMainForm.LineEndCount(lCount, pCount, nowpCount, slCount:Integer): Integer;
//begin
//  Result := lCount;
//  if nowpCount = pCount then begin
//    if pCount = 1 then
//      Result := slCount
//    else
//      Result := slCount mod lCount;
//  end;
//end;
//
//function TMainForm.TabString(TabCount: Integer): String;
//var
//  s: String;
//  i: Integer;
//begin
//  s := '';
//  for i := 0 to TabCount -1 do begin
//    s := s + ' ';
//  end;
//  Result := s;
//end;


procedure TMainForm.RichEditExit(Sender: TObject);
begin
  StatusBar.Panels[3].Text := '';
end;

procedure TMainForm.PageSearchDownActionExecute(Sender: TObject);
begin
  PageSearch(True);
end;

procedure TMainForm.PageSearchUpActionExecute(Sender: TObject);
begin
  PageSearch(False);
end;

procedure TMainForm.PageSearch(Down: Boolean);
var
  Res: Boolean;
  Msg: String;
begin
  SearchString := Trim(AnsiLowerCase(SearchComboBox.Text));
  if Trim(SearchString) = '' then Exit;
  if RichEdit.Lines.Text = '' then Exit;
  if Down then
    Res := RichEdit.Search(SearchString, [sfrDown, sfrIncludeCRLF, sfrIncludeSpace])
  else
    Res := RichEdit.Search(SearchString, [sfrIncludeCRLF, sfrIncludeSpace]);

  if Res = False then begin
    if Down then
      Msg := 'これより下に "' + SearchString  + '" は存在しません。'
    else
      Msg := 'これより上に "' + SearchString  + '" は存在しません。';

    Application.MessageBox(PChar(Msg), PChar(Application.Title), MB_ICONINFORMATION);
  end;
end;
procedure TMainForm.TreeViewForSearchMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  Application.OnShowHint := SearchTreeShowHint;
end;


procedure TMainForm.AllExpandActionExecute(Sender: TObject);
begin
  TreeView.FullExpand;
end;

procedure TMainForm.AllCollapceActionExecute(Sender: TObject);
begin
  TreeView.FullCollapse;
end;

procedure TMainForm.BookMarkManagerActionExecute(Sender: TObject);
begin
  GetBookMark;
  if MainForm.TreeViewForSearch.Items.Count <> 0 then
    MainForm.TreeViewForSearch.FullCollapse;

  BookMarkForm := TBookMarkForm.Create(Self);
  try
    BookMarkForm.ShowModal;
  finally
    BookMarkForm.Free;
  end;

end;


procedure TMainForm.RefleshContentsActionExecute(Sender: TObject);
var
  Node: TTreeNode;
begin
  Node := TreeView.Selected;
  if TObject(Node.Data) is TTextItem then begin
    EmphasisDsp(Node);
    GetBookMark;
    AddBookMarkToListView(Node);
    if OptionSetting.Standard.ContentsDsp then
      AddContentsToListView(Node);
  end;
end;

procedure TMainForm.TreeViewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);       
var
  Node: TTreeNode;
begin
//  ShowMessage('key');
  Node := TreeView.Selected;
  if Node = nil then Exit;
  
  case Key of
    VK_BACK, Windows.VK_DELETE:
    begin
      if not (TObject(Node.Data) is TRootFolderItem) then begin
        DeleteItemActionExecute(nil);
      end;
//      ShowMessage('del');
    end;
    VK_RETURN:
    begin
      if (not (TObject(Node.Data) is TTextItem)) and
         (not (TObject(Node.Data) is TRootFolderItem)) then begin
        if Node.Expanded then
          Node.Collapse(False)
        else
          Node.Expand(False);
      end;
    end;
  end;

end;

procedure TMainForm.SearchCancelToolButtonMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
//  Abort;
//  StatusBar.Panels[0].Text := 'キャンセル';
//  CancelSearchTimer.Enabled := True;
//  Application.MessageBox('キャンセルしました。', PChar(Application.Title), MB_ICONINFORMATION);
//  Application.HandleMessage;
  while FSearchCancel = False do begin
    FSearchCancel := True;
    Application.HandleMessage;
  end;
//  SearchCancelAction.Enabled := True;
//  SearchCancelToolButton.Visible := True;
end;

procedure TMainForm.CreateWnd;
begin
  inherited CreateWnd;
  DragAcceptFiles(Handle, True);
//  DragAcceptFiles(RichEdit.Handle, True);
end;

function TMainForm.SelectNode: TTreeNode;
begin
  if TObject(TreeView.Selected.Data) is TTextItem then begin
    Result := TreeView.Selected.Parent;
  end else begin
    Result := TreeView.Selected;
  end;
end;

procedure TMainForm.DragFileProc(FileName: String);
var
  SR: TSearchRec;
  M: String;
  mbResult: Integer;
  NName: String;
  Node: TTreeNode;
begin
  FindFirst(FileName, faAnyFile, SR);
  try
    if (SR.Attr and SysUtils.faDirectory > 0) then begin
      Node := SelectNode;
      M := '"' + FileName + '" フォルダを現在選択されているフォルダアイテム "' + Node.Text + '" にインポートします。サブフォルダを含めてインポートしますか？';
      mbResult := Application.MessageBox(PChar(M), PChar(Application.Title),
        MB_ICONINFORMATION or MB_YESNOCANCEL or MB_DEFBUTTON2);
      NName := IncludeTrailingPathDelimiter(TFolderItem(Node.Data).FullName) +
        ExtractFileName(FileName);
      case mbResult of
        IDYES: FolderImportEx(FileName, NName, Node, TFolderItem(Node.Data), True);
        IDNO: FolderImportEx(FileName, NName, Node, TFolderItem(Node.Data), False);
        IDCANCEL: Abort;
      end;
      Abort;
    end else begin
      if OptionSetting.ExtensionList.IndexOf(ExtractFileExt(FileName)) > -1 then begin
        Node := SelectNode;
        NName := IncludeTrailingPathDelimiter(TFolderItem(Node.Data).FullName) +
          ExtractFileName(FileName);
        TextFileImport(FileName, NName, Node, TFolderItem(Node.Data));
      end;
    end;
  finally
    FindClose(SR);
  end;
end;

procedure TMainForm.WMDropFiles(var Msg: TWMDropFiles);

var
  I, Count: Cardinal;
  FileName: TFileName;
begin
  if FDragCancel then begin
    FDragCancel := False;
    Exit;
  end;
  Count := DragQueryFile(Msg.Drop, $FFFFFFFF, nil, 0);
  for I := 0 to Count - 1 do
  begin
    SetLength(FileName, MAX_PATH + 1);
    DragQueryFile(Msg.Drop, I, PChar(FileName), MAX_PATH);
    SetLength(FileName, StrLen(PChar(FileName)));
    //各ファイル毎の処理をここに書く
    DragFileProc(FileName);

    //ShowMessage(IntToStr(Count));
  end;
  DragFinish(Msg.Drop);
  FDragCancel := False;

end;

procedure TMainForm.RichEditDropFiles(Sender: TObject; Drop,
  KeyState: Integer; Point: TPoint);
var
  i: Integer;      
//  SR: TSearchRec;
begin
  FDragCancel := True;
  for i := 0 to RichEdit.DropFileNames.Count -1 do begin
    DragFileProc(RichEdit.DropFileNames[i]);

  end;
  DragFinish(Drop);
  //
end;


//procedure TMainForm.SetEditorImageRect;
//var
//  r: TRect;
//const
//  IM_MARGIN = 25;
//begin
//  with RichEdit do begin
//    r := Rect(0, 0, IM_MARGIN, ClientHeight);
//    with RichEdit.Canvas do begin
//      Pen.Width := 0;
//      Brush.Style := bsSolid;
//      Brush.Color := clBtnFace;
//      Rectangle(r);
//    end;
//  end;
//
//end;


procedure TMainForm.HelpActionExecute(Sender: TObject);
begin
  HelpFinderDisplay;
end;

procedure TMainForm.HelpFinderDisplay;
var
   Msg: String;
begin
  if FileExists(HelpFile) then begin
    Application.HelpFile := HelpFile;
    Application.HelpCommand(HELP_FINDER,0);
  end else begin
    Msg := 'ヘルプファイルが存在しません。削除または移動された可能性があります。';
    Application.MessageBox(PChar(Msg), PChar(Application.Title), MB_ICONEXCLAMATION);
  end;
end;

procedure TMainForm.HelpHelpContextDisplay(Context: THelpContext);
var
   Msg: String;
begin
  if FileExists(HelpFile) then begin
    Application.HelpFile := HelpFile;
    Application.HelpCommand(HELP_CONTEXT, Context);
  end else begin
    Msg := 'ヘルプファイルが存在しません。削除または移動された可能性があります。';
    Application.MessageBox(PChar(Msg), PChar(Application.Title), MB_ICONEXCLAMATION);
  end;
end;

procedure TMainForm.SearchComboBoxEnter(Sender: TObject);
begin
  EditPasteAction.ShortCut := 0;
  EditCopyAction.ShortCut := 0;
  EditCutAction.ShortCut := 0;
end;

procedure TMainForm.SearchComboBoxExit(Sender: TObject);
begin
  EditPasteAction.ShortCut := TextToShortCut('ctrl+v');
  EditCopyAction.ShortCut := TextToShortCut('ctrl+c');
  EditCutAction.ShortCut := TextToShortCut('ctrl+x');
end;


procedure TMainForm.SearchDspTextActionExecute(Sender: TObject);
begin
  StartSearchSet;
  try

    SearchString := Trim(AnsiLowerCase(RichEdit.SelText));
    SearchNode := TreeView.Selected;
    SearchListView.Items.BeginUpdate;
    SearchListView.Clear;
    SearchListView.Items.EndUpdate;
    TreeViewForSearch.Items.BeginUpdate;
    TreeViewForSearch.Items.Clear;
    TreeViewForSearch.Items.EndUpdate;
    ContentsPageControl.ActivePage := SearchTabSheet;

    //表示中のテキスト検索
    SearchText;

    SearchTabSheet.Caption := '"' + SearchString + '" の検索結果';
  finally
    EndSearchSet;
  end;

end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FCloseFlag := True;  
  FSearchCancel := True;
  Application.ProcessMessages;
  NodeTextSave(TreeView.Selected);
  AddressComboBox.Items.SaveToFile(MySettingPath + 'Address.txt');
  SearchComboBox.Items.SaveToFile(MySettingPath + 'Search.txt');
  WriteWindow;
  OptionSaveToFile;
  SaveTreeView;
end;

procedure TMainForm.RichEditMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin                     
  if ssCtrl in Shift then
    SendMessage(RichEdit.Handle, WM_VSCROLL, SB_PAGEDOWN, 0)
  else
    SendMessage(RichEdit.Handle, WM_VSCROLL, SB_LINEDOWN, 0);
end;

procedure TMainForm.RichEditMouseWheelUp(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  if ssCtrl in Shift then
    SendMessage(RichEdit.Handle, WM_VSCROLL, SB_PAGEUP, 0)
  else
    SendMessage(RichEdit.Handle, WM_VSCROLL, SB_LINEUP, 0);
end;

procedure TMainForm.EditorOptionActionExecute(Sender: TObject);
begin
  EditEditor(RichEdit, nil)
end;

end.



