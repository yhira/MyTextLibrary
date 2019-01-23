object MainForm: TMainForm
  Left = 228
  Top = 122
  Width = 741
  Height = 480
  Caption = 'MainForm'
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnPaint = FormPaint
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 12
  object SplitterT: TSplitter
    Left = 185
    Top = 113
    Height = 302
  end
  object CoolBar1: TCoolBar
    Left = 0
    Top = 0
    Width = 733
    Height = 113
    BandMaximize = bmNone
    Bands = <
      item
        Control = FileToolBar
        ImageIndex = -1
        Width = 168
      end
      item
        Break = False
        Control = DisplayToolBar
        ImageIndex = -1
        Width = 101
      end
      item
        Break = False
        Control = SettingToolBar
        ImageIndex = -1
        Width = 456
      end
      item
        Control = AddressToolBar
        ImageIndex = -1
        MinHeight = 22
        Width = 729
      end
      item
        Control = SearchToolBar
        ImageIndex = -1
        Width = 729
      end>
    object FileToolBar: TToolBar
      Left = 9
      Top = 0
      Width = 155
      Height = 25
      Caption = 'FileToolBar'
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = ToolImageList
      TabOrder = 0
      object NewFileToolButton: TToolButton
        Left = 0
        Top = 0
        Action = NewFileAction
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton3: TToolButton
        Left = 23
        Top = 0
        Action = NewFolderAction
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton5: TToolButton
        Left = 46
        Top = 0
        Width = 8
        Caption = 'ToolButton5'
        ImageIndex = 3
        Style = tbsSeparator
      end
      object FileOpenToolButton: TToolButton
        Left = 54
        Top = 0
        Action = FileOpenAction
        ParentShowHint = False
        ShowHint = True
      end
      object FolderOpenToolButton: TToolButton
        Left = 77
        Top = 0
        Action = FolderOpenAction
        ParentShowHint = False
        ShowHint = True
      end
    end
    object DisplayToolBar: TToolBar
      Left = 179
      Top = 0
      Width = 88
      Height = 25
      Caption = 'DisplayToolBar'
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = ToolImageList
      TabOrder = 1
      object WordWrapToolButton: TToolButton
        Left = 0
        Top = 0
        Hint = #21491#31471#12391#25240#12426#36820#12377
        Action = WordWrapAction
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Caption = 'ToolButton2'
        ImageIndex = 12
        Style = tbsSeparator
      end
      object ToolButton16: TToolButton
        Left = 31
        Top = 0
        Hint = #12522#12473#12488#12499#12517#12540#12456#12522#12450#12398#25313#22823
        Action = LayoutListViewAreaAction
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton17: TToolButton
        Left = 54
        Top = 0
        Hint = #12489#12461#12517#12513#12531#12488#12456#12522#12450#12398#25313#22823
        Action = LayoutDocumentAreaAction
        ParentShowHint = False
        ShowHint = True
      end
    end
    object SearchToolBar: TToolBar
      Left = 9
      Top = 51
      Width = 716
      Height = 25
      Caption = 'SearchToolBar'
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = ToolImageList
      TabOrder = 2
      OnResize = SearchToolBarResize
      object SearchLabel: TLabel
        Left = 0
        Top = 0
        Width = 39
        Height = 22
        Caption = #26908#32034'(&E)'
        FocusControl = SearchComboBox
        Layout = tlCenter
      end
      object SearchComboBox: TComboBox
        Left = 39
        Top = 1
        Width = 145
        Height = 20
        BevelKind = bkFlat
        DropDownCount = 30
        ItemHeight = 12
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        Text = 'SearchComboBox'
        OnChange = SearchComboBoxChange
        OnEnter = SearchComboBoxEnter
        OnExit = SearchComboBoxExit
        OnKeyDown = SearchComboBoxKeyDown
      end
      object SearchSelectComboBox: TComboBox
        Left = 184
        Top = 1
        Width = 153
        Height = 20
        BevelKind = bkFlat
        Style = csDropDownList
        ItemHeight = 12
        ItemIndex = 1
        TabOrder = 1
        Text = #36984#25246#20013#12398#12501#12457#12523#12480#12363#12425#26908#32034
        OnKeyDown = SearchComboBoxKeyDown
        Items.Strings = (
          #12450#12452#12486#12512#21517#12363#12425#12398#12415#26908#32034
          #36984#25246#20013#12398#12501#12457#12523#12480#12363#12425#26908#32034
          #34920#31034#20013#12398#12486#12461#12473#12488#12363#12425#26908#32034
          #12377#12409#12390#12434#26908#32034)
      end
      object SearchToolButton: TToolButton
        Left = 337
        Top = 0
        Hint = #12501#12449#12452#12523#12398#26908#32034
        Action = SearchAction
        ParentShowHint = False
        ShowHint = True
      end
      object SearchCancelToolButton: TToolButton
        Left = 360
        Top = 0
        Hint = #26908#32034#12461#12515#12531#12475#12523
        Action = SearchCancelAction
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnMouseDown = SearchCancelToolButtonMouseDown
      end
      object SpaSearchToolButton: TToolButton
        Left = 383
        Top = 0
        Width = 8
        Caption = 'SpaSearchToolButton'
        ImageIndex = 24
        Style = tbsSeparator
      end
      object PageSearchUpToolButton: TToolButton
        Left = 391
        Top = 0
        Hint = #27425#12434#12506#12540#12472#26908#32034
        Action = PageSearchDownAction
        ParentShowHint = False
        ShowHint = True
      end
      object PageSearchDownToolButton: TToolButton
        Left = 414
        Top = 0
        Hint = #21069#12434#12506#12540#12472#26908#32034
        Action = PageSearchUpAction
        ParentShowHint = False
        ShowHint = True
      end
      object SearchMarkToolButton: TToolButton
        Left = 437
        Top = 0
        Hint = #19979#32218#12434#24341#12367
        Action = MarkerAction
        ParentShowHint = False
        ShowHint = True
      end
    end
    object AddressToolBar: TToolBar
      Left = 9
      Top = 27
      Width = 716
      Height = 22
      AutoSize = True
      Caption = 'AddressToolBar'
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = ToolImageList
      TabOrder = 3
      OnResize = AddressToolBarResize
      object AddressLabel: TLabel
        Left = 0
        Top = 0
        Width = 56
        Height = 22
        AutoSize = False
        Caption = #12450#12489#12524#12473'(&D)'
        FocusControl = AddressComboBox
        Layout = tlCenter
      end
      object AddressComboBox: TComboBox
        Left = 56
        Top = 1
        Width = 145
        Height = 20
        BevelInner = bvNone
        BevelKind = bkFlat
        DropDownCount = 30
        ItemHeight = 12
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        Text = 'AddressComboBox'
        OnChange = GoAddressActionExecute
      end
      object AddressToolButton: TToolButton
        Left = 201
        Top = 0
        Hint = #31227#21205
        Action = GoAddressAction
        ParentShowHint = False
        ShowHint = True
      end
    end
    object SettingToolBar: TToolBar
      Left = 282
      Top = 0
      Width = 443
      Height = 25
      Caption = 'SettingToolBar'
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = ToolImageList
      TabOrder = 4
      object ToolButton18: TToolButton
        Left = 0
        Top = 0
        Hint = 'TextLibrary'#12458#12503#12471#12519#12531
        Action = SettingAction
        ParentShowHint = False
        ShowHint = True
      end
      object ToolButton19: TToolButton
        Left = 23
        Top = 0
        Hint = #12375#12362#12426#12510#12493#12540#12472#12515#12540
        Action = BookMarkManagerAction
        ParentShowHint = False
        ShowHint = True
      end
    end
  end
  object StatusBar: TStatusBar
    Left = 0
    Top = 415
    Width = 733
    Height = 19
    Panels = <
      item
        Bevel = pbNone
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 50
      end
      item
        Width = 50
      end>
    OnResize = StatusBarResize
  end
  object PanelT: TPanel
    Left = 0
    Top = 113
    Width = 185
    Height = 302
    Align = alLeft
    BevelOuter = bvNone
    Caption = 'PanelT'
    Color = clWindow
    TabOrder = 2
    object TreeView: TTreeView
      Left = 2
      Top = 0
      Width = 183
      Height = 302
      Align = alRight
      AutoExpand = True
      ChangeDelay = 50
      DragMode = dmAutomatic
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      HideSelection = False
      Images = TreeItemImageList
      Indent = 19
      ParentFont = False
      ParentShowHint = False
      PopupMenu = TreeViewPopup
      ReadOnly = True
      RightClickSelect = True
      ShowHint = True
      ShowRoot = False
      TabOrder = 0
      TabStop = False
      ToolTips = False
      OnAddition = TreeViewAddition
      OnChange = TreeViewChange
      OnChanging = TreeViewChanging
      OnCollapsing = TreeViewCollapsing
      OnCompare = TreeViewCompare
      OnDragDrop = TreeViewDragDrop
      OnDragOver = TreeViewDragOver
      OnKeyDown = TreeViewKeyDown
      OnMouseDown = TreeViewMouseDown
      OnMouseMove = TreeViewMouseMove
    end
  end
  object PanelMain: TPanel
    Left = 188
    Top = 113
    Width = 545
    Height = 302
    Align = alClient
    BevelOuter = bvNone
    Caption = 'PanelMain'
    ParentColor = True
    TabOrder = 3
    object SplitterL: TSplitter
      Left = 0
      Top = 192
      Width = 545
      Height = 3
      Cursor = crVSplit
      Align = alTop
      Color = clBtnFace
      ParentColor = False
    end
    object PanelM: TPanel
      Left = 0
      Top = 195
      Width = 545
      Height = 107
      Align = alClient
      BevelOuter = bvNone
      Caption = 'PanelM'
      ParentColor = True
      TabOrder = 0
      object TextAreaPanel: TPanel
        Left = 0
        Top = 0
        Width = 545
        Height = 24
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object DocumentNameLabel: TLabel
          Left = 2
          Top = 2
          Width = 142
          Height = 16
          Caption = 'DocumentNameLabel'
          Font.Charset = SHIFTJIS_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
          Font.Style = []
          ParentFont = False
        end
        object Panel1: TPanel
          Left = 341
          Top = 0
          Width = 204
          Height = 24
          Align = alRight
          BevelOuter = bvNone
          Caption = 'Panel1'
          TabOrder = 0
          object EditToolBar: TToolBar
            Left = 0
            Top = 0
            Width = 204
            Height = 24
            Caption = 'EditToolBar'
            EdgeBorders = []
            Flat = True
            Images = ToolImageList
            TabOrder = 0
            object ToolButton6: TToolButton
              Left = 0
              Top = 0
              Hint = #20803#12395#25147#12377
              Action = EditUndoAction
              ParentShowHint = False
              ShowHint = True
            end
            object ToolButton7: TToolButton
              Left = 23
              Top = 0
              Hint = #12420#12426#30452#12375
              Action = EditRedoAction
              ParentShowHint = False
              ShowHint = True
            end
            object ToolButton8: TToolButton
              Left = 46
              Top = 0
              Width = 8
              Caption = 'ToolButton4'
              ImageIndex = 7
              Style = tbsSeparator
            end
            object ToolButton9: TToolButton
              Left = 54
              Top = 0
              Hint = #20999#12426#21462#12426
              Action = EditCutAction
              ParentShowHint = False
              ShowHint = True
            end
            object ToolButton10: TToolButton
              Left = 77
              Top = 0
              Hint = #12467#12500#12540
              Action = EditCopyAction
              ParentShowHint = False
              ShowHint = True
            end
            object ToolButton11: TToolButton
              Left = 100
              Top = 0
              Hint = #36028#12426#20184#12369
              Action = EditPasteAction
              ParentShowHint = False
              ShowHint = True
            end
            object ToolButton12: TToolButton
              Left = 123
              Top = 0
              Hint = #21066#38500
              Action = EditDeleteAction
              ParentShowHint = False
              ShowHint = True
            end
            object ToolButton4: TToolButton
              Left = 146
              Top = 0
              Width = 8
              Caption = 'ToolButton4'
              ImageIndex = 8
              Style = tbsSeparator
            end
            object ToolButton13: TToolButton
              Left = 154
              Top = 0
              Hint = #25991#38957#12395#31227#21205
              Action = GoToTopAction
              ParentShowHint = False
              ShowHint = True
            end
            object ToolButton14: TToolButton
              Left = 177
              Top = 0
              Hint = #25991#26411#12395#31227#21205
              Action = GoToButtomAction
              ParentShowHint = False
              ShowHint = True
            end
          end
        end
      end
      object RichEdit: TEditorEx
        Left = 0
        Top = 24
        Width = 545
        Height = 83
        Cursor = crIBeam
        Align = alClient
        Caret.AutoCursor = True
        Caret.AutoIndent = True
        Caret.BackSpaceUnIndent = True
        Caret.Cursors.DefaultCursor = crIBeam
        Caret.Cursors.DragSelCursor = crDrag
        Caret.Cursors.DragSelCopyCursor = 14
        Caret.Cursors.InSelCursor = crDefault
        Caret.Cursors.LeftMarginCursor = 13
        Caret.Cursors.TopMarginCursor = crDefault
        Caret.FreeCaret = True
        Caret.FreeRow = True
        Caret.InTab = False
        Caret.KeepCaret = False
        Caret.LockScroll = False
        Caret.NextLine = True
        Caret.PrevSpaceIndent = False
        Caret.RowSelect = True
        Caret.SelDragMode = dmManual
        Caret.SelMove = True
        Caret.SoftTab = False
        Caret.Style = csDefault
        Caret.TabIndent = True
        Caret.TabSpaceCount = 2
        Caret.TokenEndStop = False
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'FixedSys'
        Font.Style = []
        HitStyle = hsDraw
        Imagebar.DigitWidth = 0
        Imagebar.LeftMargin = 2
        Imagebar.MarkWidth = 15
        Imagebar.RightMargin = 2
        Imagebar.Visible = True
        ImageDigits = HitImageList
        ImageMarks = HitImageList
        Lines.Strings = (
          'RichEdit')
        Marks.EofMark.Color = clGray
        Marks.EofMark.Visible = False
        Marks.RetMark.Color = clGray
        Marks.RetMark.Visible = False
        Marks.WrapMark.Color = clGray
        Marks.WrapMark.Visible = False
        Marks.HideMark.Color = clGray
        Marks.HideMark.Visible = True
        Marks.Underline.Color = clNone
        Marks.Underline.Visible = False
        Margin.Character = 0
        Margin.Left = 10
        Margin.Line = 0
        Margin.Top = 2
        Leftbar.BkColor = clSilver
        Leftbar.Color = clSilver
        Leftbar.Column = 1
        Leftbar.Edge = True
        Leftbar.LeftMargin = 0
        Leftbar.RightMargin = 4
        Leftbar.ShowNumber = True
        Leftbar.ShowNumberMode = nmRow
        Leftbar.Visible = True
        Leftbar.ZeroBase = False
        Leftbar.ZeroLead = False
        PopupMenu = RichEditPopup
        ReadOnly = False
        Ruler.BkColor = clWhite
        Ruler.Color = clBlack
        Ruler.Edge = True
        Ruler.GaugeRange = 10
        Ruler.MarkColor = clBlack
        Ruler.Visible = False
        ScrollBars = ssBoth
        Speed.CaretVerticalAc = 2
        Speed.InitBracketsFull = False
        Speed.PageVerticalRange = 2
        Speed.PageVerticalRangeAc = 2
        TabOrder = 1
        TabStop = False
        UndoListMax = 64
        View.Brackets = <>
        View.Colors.Ank.BkColor = clNone
        View.Colors.Ank.Color = clBlack
        View.Colors.Ank.Style = []
        View.Colors.Comment.BkColor = clNone
        View.Colors.Comment.Color = clBlack
        View.Colors.Comment.Style = []
        View.Colors.DBCS.BkColor = clNone
        View.Colors.DBCS.Color = clBlack
        View.Colors.DBCS.Style = []
        View.Colors.Hit.BkColor = clTeal
        View.Colors.Hit.Color = clNone
        View.Colors.Hit.Style = []
        View.Colors.Int.BkColor = clNone
        View.Colors.Int.Color = clBlack
        View.Colors.Int.Style = []
        View.Colors.Mail.BkColor = clNone
        View.Colors.Mail.Color = clBlue
        View.Colors.Mail.Style = [fsUnderline]
        View.Colors.Reserve.BkColor = clNone
        View.Colors.Reserve.Color = clNavy
        View.Colors.Reserve.Style = [fsBold]
        View.Colors.Select.BkColor = clNavy
        View.Colors.Select.Color = clWhite
        View.Colors.Select.Style = []
        View.Colors.Str.BkColor = clNone
        View.Colors.Str.Color = clBlack
        View.Colors.Str.Style = []
        View.Colors.Symbol.BkColor = clNone
        View.Colors.Symbol.Color = clBlack
        View.Colors.Symbol.Style = []
        View.Colors.Url.BkColor = clNone
        View.Colors.Url.Color = clBlue
        View.Colors.Url.Style = [fsUnderline]
        View.ControlCode = False
        View.Mail = True
        View.Url = True
        WantReturns = True
        WantTabs = True
        WordWrap = False
        WrapOption.FollowRetMark = True
        WrapOption.FollowPunctuation = True
        WrapOption.FollowStr = #12289#12290#65292#65294#12539#65311#65281#12443#12444#12541#12542#12445#12446#12293#12540#65289#65341#65373#12301#12303'!),.:;?]}'#65377#65379#65380#65381#65392#65438#65439
        WrapOption.Leading = True
        WrapOption.LeadStr = #65288#65339#65371#12300#12302'([{'#65378
        WrapOption.PunctuationStr = #12289#12290#65292#65294',.'#65377#65380
        WrapOption.WordBreak = True
        WrapOption.WrapByte = 80
        OnCaretMoved = RichEditCaretMoved
        OnChange = RichEditChange
        OnDblClick = RichEditDblClick
        OnExit = RichEditExit
        OnMouseMove = RichEditMouseMove
        OnSelectionChange = RichEditSelectionChange
        OnMouseWheelDown = RichEditMouseWheelDown
        OnMouseWheelUp = RichEditMouseWheelUp
        OnDropFiles = RichEditDropFiles
        ExMarks.DBSpaceMark.Color = clSilver
        ExMarks.DBSpaceMark.Visible = False
        ExMarks.SpaceMark.Color = clSilver
        ExMarks.SpaceMark.Visible = False
        ExMarks.TabMark.Color = clSilver
        ExMarks.TabMark.Visible = False
        ExMarks.FindMark.Color = clRed
        ExMarks.FindMark.Visible = True
        ExMarks.Hit.BkColor = clNone
        ExMarks.Hit.Color = clNone
        ExMarks.Hit.Style = []
        ExMarks.ParenMark.Color = clGray
        ExMarks.ParenMark.Visible = False
        ExMarks.CurrentLine.Color = clGray
        ExMarks.CurrentLine.Visible = False
        ExMarks.DigitLine.Color = clGray
        ExMarks.DigitLine.Visible = False
        ExMarks.ImageLine.Color = clGray
        ExMarks.ImageLine.Visible = False
        ExMarks.Img0Line.Color = clGray
        ExMarks.Img0Line.Visible = False
        ExMarks.Img1Line.Color = clGray
        ExMarks.Img1Line.Visible = False
        ExMarks.Img2Line.Color = clGray
        ExMarks.Img2Line.Visible = False
        ExMarks.Img3Line.Color = clGray
        ExMarks.Img3Line.Visible = False
        ExMarks.Img4Line.Color = clGray
        ExMarks.Img4Line.Visible = False
        ExMarks.Img5Line.Color = clGray
        ExMarks.Img5Line.Visible = False
        ExMarks.EvenLine.Color = clGray
        ExMarks.EvenLine.Visible = False
        ExSearchOptions = []
        FindLineFeedCount = 5
        VerticalLines = <>
      end
    end
    object PanelL: TPanel
      Left = 0
      Top = 0
      Width = 545
      Height = 192
      Align = alTop
      BevelOuter = bvNone
      Caption = 'PanelL'
      ParentColor = True
      TabOrder = 1
      object ContentsPageControl: TPageControl
        Left = 0
        Top = 0
        Width = 545
        Height = 192
        ActivePage = ContentsDspTabSheet
        Align = alClient
        Style = tsFlatButtons
        TabOrder = 0
        object FileDspTabSheet: TTabSheet
          Caption = #12450#12452#12486#12512
          object ListView: TListView
            Left = 0
            Top = 0
            Width = 537
            Height = 162
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            Columns = <
              item
                Width = 25
              end
              item
                Caption = #12450#12452#12486#12512#21517
                Width = 200
              end
              item
                Caption = #34920#31034#24418#24335
                Width = 100
              end
              item
                Caption = #20316#25104#26085#26178
                Width = 120
              end
              item
                Caption = #26356#26032#26085#26178
                Width = 120
              end
              item
                Caption = #12450#12489#12524#12473
                Width = 250
              end>
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            FlatScrollBars = True
            HideSelection = False
            HotTrackStyles = [htHandPoint, htUnderlineHot]
            ReadOnly = True
            RowSelect = True
            ParentFont = False
            SmallImages = TreeItemImageList
            TabOrder = 0
            ViewStyle = vsReport
            OnColumnClick = ContentsListViewColumnClick
            OnCompare = ListViewCompare
            OnMouseDown = ListViewMouseDown
          end
        end
        object ContentsDspTabSheet: TTabSheet
          Caption = #30446#27425
          ImageIndex = 1
          object ContentsListView: TListView
            Left = 0
            Top = 0
            Width = 537
            Height = 162
            Align = alClient
            BevelInner = bvNone
            BevelOuter = bvNone
            Columns = <
              item
                Width = 25
              end
              item
                Caption = #34892#30058#21495
              end
              item
                Caption = #20869#23481
                Width = 400
              end>
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            FlatScrollBars = True
            HideSelection = False
            HotTrackStyles = [htHandPoint, htUnderlineHot]
            ReadOnly = True
            RowSelect = True
            ParentFont = False
            ParentShowHint = False
            PopupMenu = ContentsPopupMenu
            ShowHint = True
            SmallImages = HitImageList
            TabOrder = 0
            ViewStyle = vsReport
            OnColumnClick = ContentsListViewColumnClick
            OnCompare = ContentsListViewCompare
            OnMouseDown = ContentsListViewMouseDown
            OnMouseMove = ContentsListViewMouseMove
            OnSelectItem = ContentsListViewSelectItem
          end
        end
        object SearchTabSheet: TTabSheet
          Caption = #26908#32034#32080#26524
          ImageIndex = 2
          ParentShowHint = False
          ShowHint = True
          object SearchListView: TListView
            Left = 0
            Top = 0
            Width = 537
            Height = 162
            Align = alClient
            Columns = <
              item
                Width = 25
              end
              item
                Caption = #30330#35211#12501#12449#12452#12523
                Width = 150
              end
              item
                Caption = #30330#35211#34892
                Width = 60
              end
              item
                Caption = #20869#23481
                Width = 350
              end
              item
                Caption = #12450#12489#12524#12473
                Width = 300
              end>
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            HideSelection = False
            HotTrackStyles = [htHandPoint, htUnderlineHot]
            LargeImages = TreeItemImageList
            ReadOnly = True
            RowSelect = True
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            SmallImages = TreeItemImageList
            TabOrder = 0
            ViewStyle = vsReport
            OnColumnClick = ContentsListViewColumnClick
            OnCompare = SearchListViewCompare
            OnMouseDown = SearchListViewMouseDown
            OnMouseMove = SearchListViewMouseMove
          end
          object TreeViewForSearch: TTreeView
            Left = 0
            Top = 0
            Width = 537
            Height = 162
            Align = alClient
            AutoExpand = True
            Font.Charset = SHIFTJIS_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
            Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
            Font.Style = []
            HideSelection = False
            Indent = 19
            ParentFont = False
            ReadOnly = True
            RowSelect = True
            ShowLines = False
            TabOrder = 1
            ToolTips = False
            OnAdvancedCustomDrawItem = TreeViewForSearchAdvancedCustomDrawItem
            OnChange = TreeViewForSearchChange
            OnExpanding = TreeViewForSearchExpanding
            OnExpanded = TreeViewForSearchExpanded
            OnMouseDown = TreeViewForSearchMouseDown
            OnMouseMove = TreeViewForSearchMouseMove
          end
        end
      end
    end
  end
  object MainMenu1: TMainMenu
    Images = ToolImageList
    Left = 696
    object File1: TMenuItem
      Caption = #12501#12449#12452#12523'(&F)'
      object New1: TMenuItem
        Action = NewFileAction
        SubMenuImages = ToolImageList
      end
      object C1: TMenuItem
        Action = NewFolderAction
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object O1: TMenuItem
        Action = FileOpenAction
        SubMenuImages = ToolImageList
      end
      object F1: TMenuItem
        Action = FolderOpenAction
      end
      object N12: TMenuItem
        Action = FolderOpenIncludeSubAction
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Action = CloseAction
        SubMenuImages = ToolImageList
      end
    end
    object Edit1: TMenuItem
      Caption = #32232#38598'(&E)'
      SubMenuImages = ToolImageList
      object Undo1: TMenuItem
        Action = EditUndoAction
        SubMenuImages = ToolImageList
      end
      object Repeat1: TMenuItem
        Action = EditRedoAction
        SubMenuImages = ToolImageList
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object Cut1: TMenuItem
        Action = EditCutAction
        SubMenuImages = ToolImageList
      end
      object Copy1: TMenuItem
        Action = EditCopyAction
        SubMenuImages = ToolImageList
      end
      object Paste1: TMenuItem
        Action = EditPasteAction
        SubMenuImages = ToolImageList
      end
      object Delete1: TMenuItem
        Action = EditDeleteAction
        SubMenuImages = ToolImageList
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object A1: TMenuItem
        Action = EditSelectAllAction
        SubMenuImages = ToolImageList
      end
    end
    object Show1: TMenuItem
      Caption = #34920#31034'(&V)'
      object T1: TMenuItem
        Caption = #12484#12540#12523#12496#12540'(&T)'
        object F2: TMenuItem
          Action = tbFileAction
        end
        object Show2: TMenuItem
          Action = tbDisplayAction
        end
        object Find1: TMenuItem
          Action = tbSearchAction
        end
        object A2: TMenuItem
          Action = tbAddressAction
        end
        object tbSettigAction1: TMenuItem
          Action = tbSettigAction
        end
      end
      object N9: TMenuItem
        Caption = '-'
      end
      object R2: TMenuItem
        Action = WordWrapAction
      end
      object N8: TMenuItem
        Caption = '-'
      end
      object N6: TMenuItem
        Action = LayoutListViewAreaAction
        SubMenuImages = ToolImageList
      end
      object N7: TMenuItem
        Action = LayoutDocumentAreaAction
        SubMenuImages = ToolImageList
      end
      object N41: TMenuItem
        Caption = '-'
      end
      object S3: TMenuItem
        Caption = #12484#12522#12540#12398#20006#12409#26367#12360'(&S)'
        object N40: TMenuItem
          Action = SortAlphaUpAction
        end
        object N39: TMenuItem
          Action = SortAlphaDownAction
        end
        object N38: TMenuItem
          Caption = '-'
        end
        object N37: TMenuItem
          Action = SortDayUoAction
        end
        object N36: TMenuItem
          Action = SortDayDownAction
        end
        object N35: TMenuItem
          Caption = '-'
        end
        object N34: TMenuItem
          Action = SortUpDayUpAction
        end
        object N33: TMenuItem
          Action = SortUpDayDownAction
        end
        object N32: TMenuItem
          Caption = '-'
        end
        object N31: TMenuItem
          Action = SortExtAction
        end
        object N30: TMenuItem
          Action = SortDspTypeAction
        end
      end
      object I1: TMenuItem
        Caption = #12450#12452#12486#12512#12398#20280#32302'(&I)'
        object O4: TMenuItem
          Action = AllExpandAction
        end
        object C4: TMenuItem
          Action = AllCollapceAction
        end
      end
    end
    object Find2: TMenuItem
      Caption = #26908#32034'(&S)'
      object Find3: TMenuItem
        Action = SearchAction
        SubMenuImages = ToolImageList
      end
      object N17: TMenuItem
        Caption = '-'
      end
      object N45: TMenuItem
        Action = PageSearchDownAction
      end
      object P1: TMenuItem
        Action = PageSearchUpAction
      end
      object N44: TMenuItem
        Caption = '-'
      end
      object J1: TMenuItem
        Caption = #12472#12515#12531#12503'(&J)'
        object GoToTopAction1: TMenuItem
          Action = GoToTopAction
        end
        object GoToButtomAction1: TMenuItem
          Action = GoToButtomAction
        end
      end
    end
    object ool1: TMenuItem
      Caption = #12484#12540#12523'(&T)'
      object extLibraryS1: TMenuItem
        Action = SettingAction
      end
      object E1: TMenuItem
        Action = EditorOptionAction
      end
      object B2: TMenuItem
        Action = BookMarkManagerAction
      end
    end
    object Help1: TMenuItem
      Caption = #12504#12523#12503'(&H)'
      object O2: TMenuItem
        Action = HelpAction
        SubMenuImages = ToolImageList
      end
      object B1: TMenuItem
        Action = BugReportAction
        SubMenuImages = ToolImageList
      end
      object About1: TMenuItem
        Action = AboutAction
        SubMenuImages = ToolImageList
      end
    end
  end
  object ActionList1: TActionList
    Images = ToolImageList
    Left = 152
    Top = 144
    object FileOpenAction: TAction
      Category = 'Tree'#12501#12449#12452#12523
      Caption = #12501#12449#12452#12523#12434#21462#12426#36796#12416'(&O)'
      Hint = #36984#25246#20013#12398#12501#12457#12523#12480#12395#12501#12449#12452#12523#12434#36861#21152
      ImageIndex = 0
      OnExecute = FileOpenActionExecute
    end
    object EditCopyAction: TAction
      Category = #32232#38598
      Caption = #12467#12500#12540'(&C)'
      Hint = #20999#12426#21462#12426'|'#36984#25246#37096#20998#12434#20999#12426#21462#12426#12289#12463#12522#12483#12503#12508#12540#12489#12395#36865#12427
      ImageIndex = 4
      OnExecute = EditCopyActionExecute
    end
    object FolderOpenAction: TAction
      Category = 'Tree'#12501#12449#12452#12523
      Caption = #12501#12457#12523#12480#12372#12392#21462#12426#36796#12416'(&F)'
      Hint = #36984#25246#20013#12398#12501#12457#12523#12480#12395#12501#12457#12523#12480#12372#12392#12501#12449#12452#12523#12434#38283#12367
      ImageIndex = 1
      OnExecute = FolderOpenActionExecute
    end
    object PrintAction: TAction
      Category = #12501#12449#12452#12523
      Caption = #21360#21047'(&P)'
      Hint = #12489#12461#12517#12513#12531#12488#12398#21360#21047
      ImageIndex = 2
      OnExecute = PrintActionExecute
    end
    object PrintPreviewAction: TAction
      Category = #12501#12449#12452#12523
      Caption = #21360#21047#12503#12524#12499#12517#12540'(&R)'
      Hint = #21360#21047#12398#12503#12524#12499#12517#12540#12434#34920#31034#12375#12414#12377
    end
    object PrintSetAction: TAction
      Category = #12501#12449#12452#12523
      Caption = #12503#12522#12531#12479#12398#35373#23450'(&S)'
      Hint = #12503#12522#12531#12479#12398#35373#23450#12434#22793#26356#12375#12414#12377
      OnExecute = PrintSetActionExecute
    end
    object CloseAction: TAction
      Category = #12501#12449#12452#12523
      Caption = #32066#20102'(&X)'
      Hint = #12477#12501#12488#12434#32066#20102#12375#12414#12377
      OnExecute = CloseActionExecute
    end
    object EditCutAction: TAction
      Category = #32232#38598
      Caption = #20999#12426#21462#12426'(&T)'
      Hint = #20999#12426#21462#12426'|'#36984#25246#37096#20998#12434#20999#12426#21462#12426#12289#12463#12522#12483#12503#12508#12540#12489#12395#36865#12427
      ImageIndex = 3
      OnExecute = EditCutActionExecute
    end
    object EditSelectAllAction: TEditSelectAll
      Category = #32232#38598
      Caption = #12377#12409#12390#12434#36984#25246'(&A)'
      Hint = #12377#12409#12390#12434#36984#25246'|'#12489#12461#12517#12513#12531#12488#20840#20307#12434#36984#25246#12377#12427
      OnExecute = EditSelectAllActionExecute
    end
    object NewFileAction: TAction
      Category = 'Tree'#12501#12449#12452#12523
      Caption = #12501#12449#12452#12523#12398#26032#35215#20316#25104'(&N)'
      Hint = #26032#35215#12501#12449#12452#12523#12450#12452#12486#12512#12398#12398#20316#25104
      ImageIndex = 9
      OnExecute = NewFileActionExecute
    end
    object EditRedoAction: TAction
      Category = #32232#38598
      Caption = #12420#12426#30452#12375'(&R)'
      Hint = #22793#26356#12434#12420#12426#30452#12377
      ImageIndex = 12
      ShortCut = 24666
      OnExecute = EditRedoActionExecute
    end
    object WordWrapAction: TAction
      Category = #34920#31034
      Caption = #21491#31471#12391#25240#12426#36820#12377'(&R)'
      Hint = #12486#12461#12473#12488#12456#12522#12450#12398#12489#12461#12517#12513#12531#12488#12434#21491#31471#12391#25240#12426#36820#12375#12414#12377
      ImageIndex = 14
      OnExecute = WordWrapActionExecute
    end
    object SettingAction: TAction
      Category = #12484#12540#12523
      Caption = 'TextLibrary'#12458#12503#12471#12519#12531'(&S)'
      Hint = 'TextLibrary'#12398#12458#12503#12471#12519#12531#12434#34920#31034#12375#12414#12377
      ImageIndex = 22
      OnExecute = SettingActionExecute
    end
    object HelpAction: THelpContents
      Category = #12504#12523#12503
      Caption = #12504#12523#12503'(&T)'
      Enabled = False
      Hint = 'TextLibrary'#12398#12504#12523#12503
      ImageIndex = 15
      OnExecute = HelpActionExecute
    end
    object BugReportAction: TAction
      Category = #12504#12523#12503
      Caption = #12496#12464#12524#12509#12540#12488'(&B)'
      Hint = #12496#12464#22577#21578#26178#12398#12486#12531#12503#12524#12540#12488
      OnExecute = BugReportActionExecute
    end
    object AboutAction: TAction
      Category = #12504#12523#12503
      Caption = #12496#12540#12472#12519#12531#24773#22577'(&B)'
      ImageIndex = 29
      OnExecute = AboutActionExecute
    end
    object tbFileAction: TAction
      Category = #34920#31034
      Caption = #12501#12449#12452#12523'(&F)'
      Checked = True
      Hint = #12501#12449#12452#12523#12496#12540#12398#34920#31034#20999#12426#26367#12360
      OnExecute = tbFileActionExecute
    end
    object tbEditAction: TAction
      Category = #34920#31034
      Caption = #32232#38598'(&E)'
      Checked = True
      Hint = #32232#38598#12496#12540#12398#34920#31034#20999#12426#26367#12360
      OnExecute = tbEditActionExecute
    end
    object tbDisplayAction: TAction
      Category = #34920#31034
      Caption = #34920#31034'(&D)'
      Checked = True
      Hint = #34920#31034#12496#12540#12398#34920#31034#20999#12426#26367#12360
      OnExecute = tbDisplayActionExecute
    end
    object tbAddressAction: TAction
      Category = #34920#31034
      Caption = #12450#12489#12524#12473'(&A)'
      Checked = True
      Hint = #12450#12489#12524#12473#12496#12540#12398#34920#31034#20999#12426#26367#12360
      OnExecute = tbAddressActionExecute
    end
    object tbSearchAction: TAction
      Category = #34920#31034
      Caption = #26908#32034'(&S)'
      Checked = True
      Hint = #26908#32034#12496#12540#12398#34920#31034#20999#12426#26367#12360
      OnExecute = tbSearchActionExecute
    end
    object SearchAction: TAction
      Category = #26908#32034
      Caption = #12501#12449#12452#12523#26908#32034'(&F)'
      Hint = #12501#12449#12452#12523#12434#12434#26908#32034#12375#12414#12377
      ImageIndex = 13
      ShortCut = 16454
      OnExecute = SearchActionExecute
    end
    object NewFolderAction: TAction
      Category = 'Tree'#12501#12449#12452#12523
      Caption = #12501#12457#12523#12480#12398#26032#35215#20316#25104'(&C)'
      Hint = #26032#35215#12501#12457#12523#12480#12450#12452#12486#12512#12398#20316#25104
      ImageIndex = 17
      OnExecute = NewFolderActionExecute
    end
    object EditItemAction: TAction
      Category = 'Tree'#12501#12449#12452#12523
      Caption = #12503#12525#12497#12486#12451'(&R)'
      Hint = #12450#12452#12486#12512#12398#20869#23481#12434#32232#38598#12375#12414#12377
      OnExecute = EditItemActionExecute
    end
    object DeleteItemAction: TAction
      Category = 'Tree'#12501#12449#12452#12523
      Caption = #12450#12452#12486#12512#12398#21066#38500'(&D)'
      Hint = #36984#25246#12373#12428#12390#12356#12427#12450#12452#12486#12512#12434#21066#38500#12375#12414#12377
      OnExecute = DeleteItemActionExecute
    end
    object GoAddressAction: TAction
      Category = #12450#12489#12524#12473
      Caption = #12450#12489#12524#12473#12408#31227#21205
      Hint = #12450#12489#12524#12473#12496#12540#12395#26360#12363#12428#12390#12356#12427#12497#12473#12395#31227#21205#12375#12414#12377#12290
      ImageIndex = 16
      OnExecute = GoAddressActionExecute
    end
    object EditUndoAction: TAction
      Category = #32232#38598
      Caption = #20803#12395#25147#12377'(&U)'
      Hint = #20803#12395#25147#12377'|'#30452#21069#12398#22793#26356#12434#20803#12395#25147#12377
      ImageIndex = 6
      ShortCut = 16474
      OnExecute = EditUndoActionExecute
    end
    object EditDeleteAction: TAction
      Category = #32232#38598
      Caption = #21066#38500'(&D)'
      Hint = #21066#38500'|'#36984#25246#37096#20998#12434#21066#38500#12377#12427
      ImageIndex = 7
      OnExecute = EditDeleteActionExecute
    end
    object EditPasteAction: TAction
      Category = #32232#38598
      Caption = #36028#12426#20184#12369'(&P)'
      Hint = #36028#12426#20184#12369'|'#12463#12522#12483#12503#12508#12540#12489#12398#20869#23481#12434#36028#12426#20184#12369#12427
      ImageIndex = 5
      ShortCut = 16470
      OnExecute = EditPasteActionExecute
    end
    object OpenFromEditerAction: TAction
      Category = 'Tree'#12501#12449#12452#12523
      Caption = #12456#12487#12451#12479#12391#38283#12367'(&O)'
    end
    object ClipToFileAction: TAction
      Category = 'Tree'#12501#12449#12452#12523
      Caption = #12463#12522#12483#12503#12508#12540#12489#12363#12425#30452#25509#36861#21152'(&C)'
      Hint = #12463#12522#12483#12503#12508#12540#12489#12398#65297#34892#30446#12434#12450#12452#12486#12512#21517#12392#12375#12390#12450#12452#12486#12512#12434#36861#21152#12375#12414#12377#12290
      OnExecute = ClipToFileActionExecute
    end
    object GoToTopAction: TAction
      Category = #26908#32034
      Caption = #25991#38957#12395#31227#21205'(&T)'
      Hint = #25991#38957#12395#12472#12515#12531#12503#12375#12414#12377
      ImageIndex = 18
      ShortCut = 16468
      OnExecute = GoToTopActionExecute
    end
    object GoToButtomAction: TAction
      Category = #26908#32034
      Caption = #25991#26411#12395#31227#21205'(&B)'
      Hint = #25991#26411#12395#12472#12515#12531#12503#12375#12414#12377
      ImageIndex = 19
      ShortCut = 16450
      OnExecute = GoToButtomActionExecute
    end
    object SortAlphaDownAction: TAction
      Category = #12477#12540#12488
      Caption = #12450#12523#12501#12449#12505#12483#12488#38477#38918
      Hint = #12484#12522#12540#12398#12450#12452#12486#12512#12434#12450#12523#12501#12449#12505#12483#12488#38477#38918#12395#12477#12540#12488#12375#12414#12377
      OnExecute = SortAlphaDownActionExecute
    end
    object SortAlphaUpAction: TAction
      Category = #12477#12540#12488
      Caption = #12450#12523#12501#12449#12505#12483#12488#26119#38918
      Hint = #12484#12522#12540#12398#12450#12452#12486#12512#12434#12450#12523#12501#12449#12505#12483#12488#26119#38918#12395#12477#12540#12488#12375#12414#12377
      OnExecute = SortAlphaUpActionExecute
    end
    object SortDayUoAction: TAction
      Category = #12477#12540#12488
      Caption = #20316#25104#26085#26178#26119#38918
      Hint = #12484#12522#12540#12398#12450#12452#12486#12512#12434#20316#25104#26085#26178#26119#38918#12395#12477#12540#12488#12375#12414#12377
      OnExecute = SortDayUoActionExecute
    end
    object SortDayDownAction: TAction
      Category = #12477#12540#12488
      Caption = #20316#25104#26085#26178#38477#38918
      Hint = #12484#12522#12540#12398#12450#12452#12486#12512#12434#20316#25104#26085#26178#38477#38918#12395#12477#12540#12488#12375#12414#12377
      OnExecute = SortDayDownActionExecute
    end
    object SortExtAction: TAction
      Category = #12477#12540#12488
      Caption = #25313#24373#23376#38918
      Hint = #12484#12522#12540#12398#12450#12452#12486#12512#12434#25313#24373#23376#38918#12395#12477#12540#12488#12375#12414#12377
      OnExecute = SortExtActionExecute
    end
    object SortDspTypeAction: TAction
      Category = #12477#12540#12488
      Caption = #34920#31034#24418#24335#38918
      Hint = #12484#12522#12540#12398#12450#12452#12486#12512#12434#34920#31034#24418#24335#38918#12395#12477#12540#12488#12375#12414#12377
      OnExecute = SortDspTypeActionExecute
    end
    object SortUpDayUpAction: TAction
      Category = #12477#12540#12488
      Caption = #26356#26032#26085#26178#26119#38918
      Hint = #12484#12522#12540#12398#12450#12452#12486#12512#12434#26356#26032#26085#26178#26119#38918#12395#12477#12540#12488#12375#12414#12377
      OnExecute = SortUpDayUpActionExecute
    end
    object SortUpDayDownAction: TAction
      Category = #12477#12540#12488
      Caption = #26356#26032#26085#26178#38477#38918
      Hint = #12484#12522#12540#12398#12450#12452#12486#12512#12434#26356#26032#26085#26178#38477#38918#12395#12477#12540#12488#12375#12414#12377
      OnExecute = SortUpDayDownActionExecute
    end
    object LayoutDocumentAreaAction: TAction
      Category = #34920#31034
      Caption = #12489#12461#12517#12513#12531#12488#12456#12522#12450#12398#25313#22823'(&L)'
      Hint = #12489#12461#12517#12513#12531#12488#12456#12522#12450#12434#25313#22823#12289#21448#12399#20803#12395#25147#12375#12414#12377
      ImageIndex = 21
      ShortCut = 16452
      OnExecute = LayoutDocumentAreaActionExecute
    end
    object LayoutListViewAreaAction: TAction
      Category = #34920#31034
      Caption = #12522#12473#12488#12499#12517#12540#12456#12522#12450#12398#25313#22823'(&D)'
      Hint = #12522#12473#12488#12499#12517#12540#12456#12522#12450#12434#25313#22823#12289#21448#12399#20803#12395#25147#12375#12414#12377
      ImageIndex = 20
      ShortCut = 16460
      OnExecute = LayoutListViewAreaActionExecute
    end
    object SetBookMarkAction: TAction
      Category = #26908#32034
      Caption = #12371#12398#25991#12434#12375#12362#12426#12395#36861#21152'(&T)'
      Hint = #29694#22312#12461#12515#12524#12483#12488#12364#12354#12427#34892#12398#25991#31456#12398#20808#38957#12434#12375#12362#12426#12395#36861#21152#12375#12414#12377
      ImageIndex = 24
      ShortCut = 16468
      OnExecute = SetBookMarkActionExecute
    end
    object DeleteBookMarkAction: TAction
      Category = #26908#32034
      Caption = #12371#12398#25991#12434#12375#12362#12426#12363#12425#21066#38500'(&G)'
      Hint = #29694#22312#12461#12515#12524#12483#12488#12364#12354#12427#34892#12398#25991#31456#12398#20808#38957#12434#12375#12362#12426#12363#12425#21066#38500#12375#12414#12377
      ShortCut = 16455
      OnExecute = DeleteBookMarkActionExecute
    end
    object MarkerAction: TAction
      Category = #26908#32034
      Caption = #19979#32218#12434#24341#12367'(&L)'
      Hint = #26908#32034#25991#23383#12395#19979#32218#12434#24341#12365#12414#12377
      ImageIndex = 23
      OnExecute = MarkerActionExecute
    end
    object DeleteAllBookMarkAction: TAction
      Category = #26908#32034
      Caption = #12371#12398#12501#12449#12452#12523#12398#12375#12362#12426#12434#20840#12390#21066#38500'(&M)'
      OnExecute = DeleteAllBookMarkActionExecute
    end
    object FolderOpenIncludeSubAction: TAction
      Category = 'Tree'#12501#12449#12452#12523
      Caption = #12469#12502#12501#12457#12523#12480#12418#21547#12417#12390#12501#12457#12523#12480#12434#21462#12426#36796#12416
      Hint = #36984#25246#20013#12398#12501#12457#12523#12480#12395#12469#12502#12501#12457#12523#12480#12418#21547#12417#12390#12501#12457#12523#12480#12434#21462#12426#36796#12416
      OnExecute = FolderOpenIncludeSubActionExecute
    end
    object PageSearchDownAction: TAction
      Category = #26908#32034
      Caption = #27425#12434#12506#12540#12472#26908#32034'(&N)'
      Hint = #12459#12540#12477#12523#12363#12425#19979#12434#26908#32034#12375#12414#12377
      ImageIndex = 25
      ShortCut = 114
      OnExecute = PageSearchDownActionExecute
    end
    object PageSearchUpAction: TAction
      Category = #26908#32034
      Caption = #21069#12434#12506#12540#12472#26908#32034'(&P)'
      Hint = #12459#12540#12477#12523#12363#12425#19978#12434#12506#12540#12472#26908#32034#12375#12414#12377
      ImageIndex = 26
      ShortCut = 8306
      OnExecute = PageSearchUpActionExecute
    end
    object SearchCancelAction: TAction
      Category = #26908#32034
      Caption = #26908#32034#12461#12515#12531#12475#12523
      Hint = #26908#32034#12434#36884#20013#12391#12461#12515#12531#12475#12523#12375#12414#12377
      ImageIndex = 27
    end
    object AllExpandAction: TAction
      Category = #20280#32302
      Caption = #12377#12409#12390#38283#12367'(&O)'
      Hint = #12484#12522#12540#12499#12517#12540#12450#12452#12486#12512#12434#20840#12390#38283#12365#12414#12377
      OnExecute = AllExpandActionExecute
    end
    object AllCollapceAction: TAction
      Category = #20280#32302
      Caption = #12377#12409#12390#38281#12376#12427'(&C)'
      Hint = #12484#12522#12540#12499#12517#12540#12450#12452#12486#12512#12434#12377#12409#12390#38281#12376#12414#12377
      OnExecute = AllCollapceActionExecute
    end
    object BookMarkManagerAction: TAction
      Category = #12484#12540#12523
      Caption = #12375#12362#12426#12510#12493#12540#12472#12515#12540'(&B)'
      Hint = #12375#12362#12426#12398#19968#25324#34920#31034#12289#32232#38598#12394#12393
      ImageIndex = 28
      OnExecute = BookMarkManagerActionExecute
    end
    object RefleshContentsAction: TAction
      Category = #30446#27425#12289#12375#12362#12426
      Caption = #12375#12362#12426#12289#30446#27425#12398#20877#21462#24471
      OnExecute = RefleshContentsActionExecute
    end
    object tbSettigAction: TAction
      Category = #34920#31034
      Caption = #12484#12540#12523
      Checked = True
      OnExecute = tbSettigActionExecute
    end
    object SearchDspTextAction: TAction
      Category = #26908#32034
      Caption = #36984#25246#20013#12398#12486#12461#12473#12488#12434#12522#12473#12488#12450#12483#12503'(&L)'
      Hint = #36984#25246#20013#12398#12486#12461#12473#12488#12434#12522#12473#12488#12450#12483#12503
      OnExecute = SearchDspTextActionExecute
    end
    object EditorOptionAction: TAction
      Category = #12484#12540#12523
      Caption = #12456#12487#12451#12479#35443#32048#35373#23450'(&E)'
      OnExecute = EditorOptionActionExecute
    end
  end
  object TreeItemImageList: TImageList
    Left = 56
    Top = 400
    Bitmap = {
      494C010108000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000001094520000734A000073
      4A0000734A0000734A0000734A0000734A0000734A0000734A0000734A000073
      4A0000734A0000734A00109452000000000000000000B57B7B00844200008442
      0000844200008442000084420000844200008442000084420000844200008442
      00008442000084420000B57B7B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000311008003118
      0800311808003118080031180800311808003118080031180800311808003118
      08003118080031100800520000000000000010945200109C5200109C5200109C
      5200109C5200109C5200109C5200109C5200109C5200109C5200109C5200109C
      5200109C5200109C5200109C520010945200B57B7B00DE949400DE949400DE94
      9400DE949400DE949400DE949400DE949400DE949400DE949400DE949400DE94
      9400DE949400DE949400DE949400B57B7B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D69C9400CE94
      8C00C6948C00C6948C00C6948C00C6948C00C6948C00C6948C00C6948C00C694
      8C00C6948C00311808004210100000000000109C520010B5730010B5730010B5
      730010B5730010B5730010B5730010B5730010B5730010B5730010B5730010B5
      730010B5730010B57300109C520000734A00DE949400F7B5B500F7B5B500F7B5
      B500F7B5B500F7B5B500F7B5B500F7B5B500F7B5B500F7B5B500F7B5B500F7B5
      B500F7B5B500F7B5B500DE949400844200000000000000000000000000001818
      1800BDAD9C00EFDECE00F7F7E700F7F7EF00F7F7E700EFD6BD00C6A584002921
      2100000000000000000000000000000000000000000000000000E7E7E700FFDE
      CE00FFDEC600FFDEC600FFDEBD00FFDEBD00FFD6BD00FFD6B500FFD6B500FFD6
      AD00FFD6BD00311808003110100000000000109C520008E7A50008E7A50008E7
      A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7
      A50008E7A50008E7A500109C520000734A00DE94940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DE94940084420000000000000000000052524A00E7CE
      B500F7F7EF00FFF7F700FFF7EF00FFF7EF00FFF7EF00F7F7C600F7EFBD00DEBD
      840073635A000000000000000000000000000000000000000000E7E7E700FFE7
      CE00FFE7CE00FFDEC600FFDEC600FFDEBD00FFDEBD00FFD6BD00FFD6B500FFD6
      B500FFD6BD00311808003110100000000000109C520008E7A50008E7A50008E7
      A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7
      A50008E7A50008E7A500109C520000734A00DE94940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DE949400844200000000000029212100DEBD9C00F7E7
      D600F7E7DE00F7E7DE00F7E7DE00F7E7DE00EFDEAD00EFDEA500EFDEA500EFDE
      9C00CEA563004221210000000000000000000000000000000000E7E7E700FFE7
      CE00FFE7CE00FFE7CE00FFDEC600FFDEC600FFDEC600FFDEBD00FFDEBD00FFD6
      B500FFD6BD00311808003110100000000000109C520008E7A50008E7A50008E7
      A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7
      A50008E7A50008E7A500109C520000734A00DE94940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DE9494008442000000000000CEA57300DEBD9400EFD6
      B500EFD6B500EFD6B500EFD6AD00E7CE8400E7C68400E7C68400E7C68400DEC6
      7300CEAD6B00C6945A0000000000000000000000000000000000EFEFEF00FFE7
      D600FFE7D600FFE7CE00FFE7CE00FFDEC600FFDEC600FFDEC600FFDEBD00FFDE
      BD00FFD6BD00311808003110100000000000109C520008E7A50008E7A50008E7
      A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7
      A50008E7A50008E7A500109C520000734A00DE94940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DE949400844200004A292900D6AD7B00D6AD7B00DEBD
      8C00D6B57300CEAD5A00CEA55200CEA55200CEA55200CEA55200CEA55200CEA5
      5200C6944A00BD844A005A312100000000000000000000000000EFEFEF00FFEF
      DE00FFE7D600FFE7D600FFE7CE00FFE7CE00FFE7CE00FFDEC600FFDEC600FFDE
      C600FFD6BD00311808003110100000000000109C520008E7A50008E7A50008E7
      A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7
      A50008E7A50008E7A500109C520000734A00DE94940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DE94940084420000A57B6B00DEB59400D6AD8400CEA5
      6B00C6944A00BD944A00BD944A00BD944A00BD944A00B58C4200BD8C4200BD8C
      4A00AD7B3900AD733100945A2900000000000000000000000000EFEFEF00FFEF
      DE00FFEFDE00FFE7D600FFE7D600FFE7D600FFE7CE00FFE7CE00FFDEC600FFDE
      C600FFD6BD00311808003110100000000000109C520008E7A50008E7A50008E7
      A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7
      A50008E7A50008E7A500109C520000734A00DE94940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DE94940084420000A5734200AD7B4200AD7B4200AD7B
      4200AD7B4200AD7B4200A57B4200A57B4200A57339009C6B3100AD7B4200B584
      5200AD845200AD845200AD7B4A00000000000000000000000000EFEFEF00FFEF
      E700FFEFDE00FFEFDE00FFEFDE00FFE7D600FFE7D600FFE7CE00FFE7CE00FFDE
      CE00FFD6BD00311808003110100000000000109C520008E7A50008E7A50008E7
      A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7
      A50008E7A50008E7A500109C520000734A00DE94940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DE94940084420000946B42009C7342009C7342009473
      42009C734A009C734A009C734A00946B3900946B39009C734A00A57B5200A57B
      52009C7B4A009C734A0094734A00000000000000000000000000F7F7F700FFF7
      E700FFEFE700FFEFDE00FFEFDE00FFEFDE00FFE7D600FFE7D600FFE7D600FFE7
      CE00FFD6BD00311808003110100000000000109C520008E7A50008E7A50008E7
      A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7
      A50008E7A50008E7A500109C520000734A00DE94940000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DE94940084420000845A42008C6B4A00846B42009C84
      63009C846300947B5A0094735200947B5A009C8463009C846B009C846B009C84
      6B0084634200846342007B523900000000000000000000000000F7F7F700FFF7
      EF00FFF7E700FFEFE700FFEFDE00FFEFDE00FFEFDE00FFEFD600FFE7D600FFE7
      D600FFD6BD00311808003110100000000000109C52000000000008E7A50008E7
      A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7A50008E7
      A50008E7A50008E7A500109C520000734A00DE949400FFF7EF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000DE949400844200007B4A42006B5A420084735A009C8C
      7B009C8C7B009C8C7B009C8C7B00A5948400A5948400A5948400A5948400A594
      8400846B5A00635231006B423100000000000000000000000000F7F7F700FFF7
      EF00FFF7EF00FFF7E700FFF7E700FFEFE700FFEFDE00FFEFDE00FFEFDE00FFE7
      D600FFD6BD0031180800311010000000000008E7A500109C5200109C5200109C
      5200109C5200109C5200109C5200109C520010945200109C5200109C5200109C
      5200109C5200109C5200109452000000000000000000DE949400DE949400DE94
      9400DE949400DE949400DE949400DE949400B57B7B00DE949400DE949400DE94
      9400DE949400DE949400B57B7B000000000000000000524231008C7B7300ADA5
      9C00ADA59C00ADA59C00ADA59C00ADA59C00ADA5A500ADA5A500ADA59C00ADA5
      9C00847B6B004A39210000000000000000000000000000000000FFFFFF00FFF7
      F700FFF7EF00FFF7EF00FFF7EF00FFF7E700FFEFE700FFEFDE00FFEFDE00FFEF
      DE00FFD6BD0031181000312110000000000008E7A500109C520008E7A50008E7
      A50008E7A50008E7A50010B573001094520008E7A500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000DE949400000000000000
      00000000000000000000F7B5B500B57B7B0000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000008452420031312900D6D6
      D600C6C6BD00C6C6BD00C6C6BD00C6C6C600C6C6C600C6C6C600C6C6BD00D6D6
      D600312921007342310000000000000000000000000000000000FFFFFF00FFFF
      F700FFFFF700FFF7EF00FFF7EF00FFF7EF00FFF7E700FFEFE700E7B59400E794
      3900D68431004A2921003939180000000000FFFFFF0008E7A500109C5200109C
      5200109C5200109C52001094520008E7A500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000DE949400DE94
      9400DE949400DE949400B57B7B0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000007B4A39004A4A
      4A00FFF7F700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700F7F7F7004A4A
      4A00633929000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFF700FFFFF700FFF7F700FFF7EF00FFF7EF00FFF7E700EFC6AD00FFB5
      52005A4231005A3931000000000000000000FFFFFF00FFFFFF0008E7A50008E7
      A50008E7A50008E7A50008E7A500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000005A31
      21003121180073737300CECECE00EFEFEF00CECECE006B737300292118004A31
      2100000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00F7FFF700F7F7F700EFF7F700EFEFEF00EFEFEF00E7E7E700EFD6B5005A39
      31005A423100000000000000000000000000000000000073A500006394000063
      9400006394000063940000639400006394000063940000639400006394000063
      940000639400006394000073A5000000000000000000C6520000844200008442
      0000844200008442000084420000844200008442000084420000844200008442
      00008442000084420000C6520000000000000000000018009C00000084000000
      8400000084000000840000008400000084000000840000008400000084000000
      8400000084000000840018009C0000000000000000004A4A4A00292929002929
      2900292929002929290029292900292929002929290029292900292929002929
      2900292929002929290029292900000000000073A50000ADDE0000ADDE0000AD
      DE0000ADDE0000ADDE0000ADDE0000ADDE0000ADDE0000ADDE0000ADDE0000AD
      DE0000ADDE0000ADDE0000ADDE000073A500C6520000FF941800FF941800FF94
      1800FF941800FF941800FF941800FF941800FF941800FF941800FF941800FF94
      1800FF941800FF941800FF941800C652000018009C009C8CFF009C8CFF009C8C
      FF009C8CFF009C8CFF009C8CFF009C8CFF009C8CFF009C8CFF009C8CFF009C8C
      FF009C8CFF009C8CFF009C8CFF0018009C004A4A4A0029292900292929002929
      2900292929002929290029292900292929002929290029292900292929002929
      29002929290029292900292929002929290000ADDE0073D6FF0073D6FF0073D6
      FF0073D6FF0073D6FF0073D6FF0073D6FF0073D6FF0073D6FF0073D6FF0073D6
      FF0073D6FF0073D6FF0000ADDE0000639400FF941800F7BD8C00F7BD8C00F7BD
      8C00F7BD8C00F7BD8C00F7BD8C00F7BD8C00F7BD8C00F7BD8C00F7BD8C00F7BD
      8C00F7BD8C00F7BD8C00FF941800844200009C8CFF00B59CFF00B59CFF00B59C
      FF00B59CFF00B59CFF00B59CFF00B59CFF00B59CFF00B59CFF00B59CFF00B59C
      FF00B59CFF00B59CFF009C8CFF0000008400292929004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A00292929002929290000ADDE009CEFFF009CEFFF009CEF
      FF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEF
      FF009CEFFF009CEFFF0000ADDE0000639400FF94180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF941800844200009C8CFF00CEB5FF00CEB5FF00CEB5
      FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5
      FF00CEB5FF00CEB5FF009C8CFF00000084004A4A4A006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B00292929002929290000ADDE009CEFFF009CEFFF009CEF
      FF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEF
      FF009CEFFF009CEFFF0000ADDE0000639400FF94180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF941800844200009C8CFF00CEB5FF00CEB5FF00CEB5
      FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5
      FF00CEB5FF00CEB5FF009C8CFF00000084004A4A4A006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B00292929002929290000ADDE009CEFFF009CEFFF009CEF
      FF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEF
      FF009CEFFF009CEFFF0000ADDE0000639400FF94180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF941800844200009C8CFF00CEB5FF00CEB5FF00CEB5
      FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5
      FF00CEB5FF00CEB5FF009C8CFF00000084004A4A4A006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B00292929002929290000ADDE009CEFFF009CEFFF009CEF
      FF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEF
      FF009CEFFF009CEFFF0000ADDE0000639400FF94180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF941800844200009C8CFF00CEB5FF00CEB5FF00CEB5
      FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5
      FF00CEB5FF00CEB5FF009C8CFF00000084004A4A4A006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B00292929002929290000ADDE009CEFFF009CEFFF009CEF
      FF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEF
      FF009CEFFF009CEFFF0000ADDE0000639400FF94180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF941800844200009C8CFF00CEB5FF00CEB5FF00CEB5
      FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5
      FF00CEB5FF00CEB5FF009C8CFF00000084004A4A4A006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B00292929002929290000ADDE009CEFFF009CEFFF009CEF
      FF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEF
      FF009CEFFF009CEFFF0000ADDE0000639400FF94180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF941800844200009C8CFF00CEB5FF00CEB5FF00CEB5
      FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5
      FF00CEB5FF00CEB5FF009C8CFF00000084004A4A4A006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B00292929002929290000ADDE009CEFFF009CEFFF009CEF
      FF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEF
      FF009CEFFF009CEFFF0000ADDE0000639400FF94180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF941800844200009C8CFF00CEB5FF00CEB5FF00CEB5
      FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5
      FF00CEB5FF00CEB5FF009C8CFF00000084004A4A4A006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B00292929002929290000ADDE009CEFFF009CEFFF009CEF
      FF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEF
      FF009CEFFF009CEFFF0000ADDE0000639400FF94180000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF941800844200009C8CFF00CEB5FF00CEB5FF00CEB5
      FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5
      FF00CEB5FF00CEB5FF009C8CFF00000084004A4A4A006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B00292929002929290000ADDE00000000009CEFFF009CEF
      FF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEFFF009CEF
      FF009CEFFF009CEFFF0000ADDE0000639400FF941800F7DECE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FF941800844200009C8CFF00EFC6FF00CEB5FF00CEB5
      FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5FF00CEB5
      FF00CEB5FF00CEB5FF009C8CFF00000084004A4A4A008C7373006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B6B006B6B
      6B006B6B6B006B6B6B0029292900292929000073A50000ADDE0000ADDE0000AD
      DE0000ADDE0000ADDE0000ADDE0000ADDE000073A50000ADDE0000ADDE0000AD
      DE0000ADDE0000ADDE000073A50000000000EFAD7300FF941800FF941800FF94
      1800FF941800FF941800FF941800FF941800C6520000FF941800FF941800FF94
      1800FF941800FF941800C652000000000000B59CFF009C8CFF009C8CFF009C8C
      FF009C8CFF009C8CFF009C8CFF009C8CFF0018009C009C8CFF009C8CFF009C8C
      FF009C8CFF009C8CFF0018009C0000000000292929004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A00000000009CEFFF0000ADDE009CEFFF009CEF
      FF009CEFFF009CEFFF0073D6FF000073A5009CEFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF941800000000000000
      00000000000000000000F7BD8C00C652000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEB5FF009C8CFF00CEB5FF00CEB5
      FF00CEB5FF00CEB5FF00B59CFF0018009C00CEB5FF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006B6B6B004A4A4A006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B004A4A4A006B6B6B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CEFFF0000ADDE0000AD
      DE0000ADDE0000ADDE000073A5009CEFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FF941800FF94
      1800FF941800FF941800C652000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEB5FF009C8CFF009C8C
      FF009C8CFF009C8CFF0018009C00CEB5FF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006B6B6B004A4A4A004A4A
      4A004A4A4A004A4A4A004A4A4A006B6B6B00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF009CEFFF009CEF
      FF009CEFFF009CEFFF009CEFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CEB5FF00CEB5
      FF00CEB5FF00CEB5FF00CEB5FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000006B6B6B006B6B
      6B006B6B6B006B6B6B006B6B6B0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080018001F01FC00100000000C007C001
      000000008003C00100007FFC8001C00100007FFC0001C00100007FFC0001C001
      00007FFC0001C00100007FFC0001C00100007FFC0001C00100007FFC0001C001
      00007FFC0001C00140003FFC0001C001000180018001C0010000BC808003C001
      00004100C007C00100003E00E00FC00380018001800180010000000000000000
      000000000000000000007FFC0000000000007FFC0000000000007FFC00000000
      00007FFC0000000000007FFC0000000000007FFC0000000000007FFC00000000
      00007FFC0000000040003FFC0000000000010001000100010000BC8000000000
      000041000000000000003E000000410000000000000000000000000000000000
      000000000000}
  end
  object ToolImageList: TImageList
    Left = 664
    Bitmap = {
      494C01011E002200040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000009000000001002000000000000090
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00F6F6F600F6F6F600F4F2F000F4F2F000F4F4F400F5F5F500FBFB
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000039003900390039003900
      3900390039003900390039003900390039003900390031313100000000006300
      630063006300CE31CE000000000000000000000000000000000000000000F6F6
      F500EEE5D700CEA56900B6791D00AD680000AD680000B6791D00CDA56900ECE3
      D500F3F2F1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6008484
      0000008400008484000000840000848400000084000000000000FFFF0000FFFF
      FF00FFFF00000000000000000000000000000000000000000000F4F4F400D9BC
      9500AC690600AB670000AC680000AD680000AD680000AC680000AB670000AB68
      0600D8BC9400EFEFEF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFFFF000000
      00000000000084848400000000000000000000000000F6F6F500D7BA9500A964
      0000AC680000AE690000C8995000F5EDE100F5EDE100B8845900AE690000AC68
      0000A8630000D6BA9400F1F0F000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFF000084000000FFFF0000FFFF
      FF00FFFF0000FFFFFF00FFFF0000FFFFFF0084848400FFFFFF00FFFF00000000
      0000C6C6C600000000000000000000000000FCFCFC00ECE3D700A7640600AC68
      0000AF6A0000B16C0000CEA15B00FFFFFF00FFFFFF00BB896500B16C0000AF6A
      0000AC680000A7630600E9DFD300FBFAFA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFF0000FFFFFF000000
      000000000000848484000000000000000000F6F6F600C49B6900AC680200AE69
      0000B16C0000B46F0000D0A35B00FFFFFF00FFFFFF00BC8A6500B36E0000B16C
      0000AE690000AC680200C39A6900F1F1F0000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6008484
      0000008400008484000000840000848400000084000000000000FFFF0000FFFF
      FF00FFFF0000000000000000000000000000F6F6F600AD722600B5771900AF6B
      0000B36E0000B26D0000CC9F5B00FFFFFF00FFFFFF00BA886500B16C0000B26E
      0000AF6A0000B5771900AC712600F0EFEF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000084
      0000848400000084000084840000008400008484000084848400000000000000
      000000000000848484000000000000000000F3F2F000A5641100BD863000B371
      0D00A35E0000A05B0000C3975B00FFFFFF00FFFFFF00B5836500A05B0000A35D
      0000B2710D00BD853000A4631100EDEBEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6008484
      0000008400008484000000840000848400000084000084840000000000008484
      840000000000000000000000000000000000F3F2F000A4621100BB843200AC74
      3000A16114009C560000C0935B00FFFFFF00FFFFFF00B38165009B560000A160
      1400AC733000BB843200A3611100ECEAEA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000084
      0000848400000084000084840000008400008484000000840000000000008484
      840000000000000000000000000000000000F4F4F400A86C2800AC733200A66D
      3200A9703200A86E2B00C49C6D00FFFFFF00FFFFFF00B6877100A86D2B00A870
      3200A66C3200AC733200A86C2900EEEDED000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6008484
      0000008400008484000000840000848400000084000084840000000000008484
      840000000000000000000000000000000000F5F5F500BB9070009C5F2E00A368
      3200A56B3200A66D3200AD783F00B7875800B7875800AA723F00A66D3200A56B
      3200A26832009C5F2F00BA8F7100EFEEEE000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6000084
      0000848400000084000084840000008400008484000000840000000000008484
      840000000000000000000000000000000000FBFBFB00E8DED8008F4B26009F63
      3900A1663400A2683200C29C7800FAF7F700FAF7F700B4867500A2683200A065
      35009E633A008E4A2700E3D9D300FAFAFA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84000000000000000000000000000000000000000000F3F2F100CAAB9E008D49
      2D009C6040009E623C00BD947800F3ECE800F3ECE800B18174009E623D009C60
      41008D482D00C9AA9D00EDECEC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400000000000000000000000000000000000000000000000000EFEFEF00C9AA
      9F008A432F00955540009A5D45009A5D44009A5D44009A5C4500955540008A43
      3000C8A99F00EAE9E90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F1F0
      F000E5DAD700B2857B00914E4000853C2E00853C2E00904E4000B2847B00E2D8
      D500EDECEC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FBFAFA00F1F0F000F0EFEF00ECEBEA00ECEAEA00EEEDED00EFEEEE00FAFA
      FA00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F2F6F400D3EDE100B2E3CD00C5E9
      D900ECF6F100FDFDFD0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F2F6F400D3EDE100B2E3CD00C5E9
      D900ECF6F100FDFDFD0000000000000000000000000000000000000000000000
      0000FCFCFC00F6F6F700F6F6F600F1F2F400F0F1F400F4F4F500F5F5F500FBFB
      FC00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FBFAFA00D5D0C900D8D3CC00D8D3
      CD00D8D3CD00D8D3CD00D7D2CC00D7DFD60067D09F0027C1820033C3860024C0
      810045C89000CDEADB00FBFDFC0000000000FBFAFA00D5D0C900D8D3CC00D8D3
      CD00D8D3CD00D8D3CD00D7D2CC00D7DFD60067D09F0027C1820056CE9D0034C2
      840045C89000CDEADB00FBFDFC0000000000000000000000000000000000F5F6
      F700DAE2F6007695EC003258E2001740DE001740DE003258E2007695EC00D8E0
      F400F1F2F4000000000000000000000000000000000000000000C6C6C6008484
      0000008400008484000000840000848400000084000084840000000000000000
      000000000000000000000000000000000000FAFAF900DDD8D200DFDBD500E0DC
      D600E0DCD600E0DCD600E3E0DC0068CD980024C0820049CB9800ECF9F40083D0
      990024C0820039C38500E0F0E60000000000FAFAF900DDD8D200DFDBD500E0DC
      D600E0DCD600E0DCD600E3E0DC0068CD980024C0820024C18300FBFEFD006AC9
      8C0024C1830039C38500E0F0E600000000000000000000000000F4F4F5009FB0
      F0001F3EDD001A30DB001935DC001938DC001938DC001935DC001A30DB001F3C
      DD009FAFF000EFEFF10000000000000000000000000000000000C6C6C6000084
      0000848400000084000084840000008400008484000000840000000000008484
      840000000000000000000000000000000000FBFAFA00E1DED800E4E1DC00E5E2
      DD00E5E2DD00E5E2DD00CDE1CF0035C2830048CB9700EBF9F300FFFFFF00FDFE
      FD007FCF98002CC386009EDAB50000000000FBFAFA00E1DED800E4E1DC00E5E2
      DD00E5E2DD00E5E2DD00CDE1CF0035C283003EC891003AC28300FCFEFD0075CB
      900046C68C002CC387009EDAB5000000000000000000F5F5F7009FACF0001A31
      DB001936DC002945D3001843DE001845DE001845DE001843DE002947D7001A33
      D8001A30DB009FABEF00F0F0F300000000000000000000000000C6C6C6008484
      0000008400008484000000840000848400000084000084840000000000008484
      840000000000000000000000000000000000FBFAFA00E6E3DE00E9E7E200EAE8
      E400EBE8E400EAE8E400B3D8B6004BCB9400DEF4E800CBE6C700FDFEFD00C9E5
      C600FCFDFB0065C7860084D3A100F9FBFA00FBFAFA00E6E3DE00E9E7E200EAE8
      E400EBE8E400EAE8E400B3D8B6004BCB9400DDF4E800CAE6C800FDFEFD00C8E5
      C600FBFDFA0064C8890084D3A100F9FBFA00FCFCFC00DBDDF5002034DC001936
      DC00748AE900EEEEF700465FCB001551E0001551E000446FE400EDF0FB00757F
      D0001A32D8002032DC00D7D9F200FAFAFB000000000000000000C6C6C6000084
      0000848400000084000084840000008400008484000000840000000000008484
      840000000000000000000000000000000000FBFBFA00EAE8E500EFEDEA00F0EE
      EC00F0EEEC00EFEEEB00CDDFC7004DB75D0074C6810064BF7400FCFEFD0089C9
      860078C782005ABB660099D19F0000000000FBFBFA00EAE8E500EFEDEA00F0EE
      EC00F0EEEC00EFEEEB00CDDFC7004DB75D007BC98700F2FAF300FFFFFF00FEFE
      FE009BD095005ABB660099D19F0000000000F6F6F7007980E9001C32DC00284B
      DF00EDF1FC00FFFFFF00EFEFF8004465CC00417AE600EEF2FC00FFFFFF00EDF0
      FB002946D7001C30DB00797FE800F0F0F2000000000000000000C6C6C6008484
      0000008400008484000000840000848400000084000084840000000000008484
      840000000000000000000000000000000000FBFBFA00EFEEEB00F4F3F100F5F4
      F300F6F5F300F5F4F200EEEDED006DB04B005CAF44005CB55700FCFEFC0086C3
      77005CB24D0056A73100D8E6D40000000000FBFBFA00EFEEEB00F4F3F100F5F4
      F300F6F5F300F5F4F200EEEDED006DB04B005CAF44007BC27400F4F9F3009DCD
      8C005CB14C0056A73100D8E6D40000000000F6F6F6003E48DD00314AE0001843
      DE004471E600EEF3FC00FFFFFF00EFEFF800EFF0F900FFFFFF00EEF2FC00446F
      E4001842DE003149E0003E47DD00EFEFF0000000000000000000C6C6C6000084
      0000848400000084000084840000008400008484000000840000000000008484
      840000000000000000000000000000000000FBFBFB00F4F2F100F9F8F700FBFA
      FA00FBFBFA00FAFAF900F8F7F600DAE3D40067A8400059A22D0087BC660067AA
      3D0059A12D00BDD5B000F9FBF80000000000FBFBFB00F4F2F100F9F8F700FBFA
      FA00FBFBFA00FAFAF900F8F7F600DAE3D40067A8400059A22D006AAD42005CA5
      310059A12D00BDD5B000F9FBF80000000000F1F1F4002B37D800465FE300244D
      E000183FDD004665E400EFF1FC00FFFFFF00FFFFFF00EFF0F9004664E200183E
      DD00254CE000465DE3002B36D700EAEAEE000000000000000000C6C6C6008484
      0000008400008484000000840000848400000084000084840000000000008484
      840000000000000000000000000000000000FCFBFB00F8F7F600FCFCFC00FDFD
      FD00FDFDFD00FDFDFD00FCFCFC00F9F9F800ECEDEA00B6CEA70098BE8200A7C5
      9400DCE3D600FAFBFA000000000000000000FCFBFB00F8F7F600FCFCFC00FDFD
      FD00FDFDFD00FDFDFD00FCFCFC00F9F9F800ECEDEA00B6CEA70098BE8200A7C5
      9400DCE3D600FAFBFA000000000000000000F1F1F4002B37D500475EE3004652
      E0002D3EDE00475DE100EFF1FB00FFFFFF00FFFFFF00EFEFF8004755C9002D3D
      DE004651E000475CE2002B36D500EAEAEE000000000000000000C6C6C6000084
      0000848400000084000084840000008400008484000000840000000000008484
      840000000000000000000000000000000000FCFBFB00F9F9F900FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FCFCFC00F8F8F700F4F2F100EEEDEA00E9E7
      E200EEECEA00000000000000000000000000FCFBFB00F9F9F900FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FCFCFC00F8F8F700F4F2F100EEEDEA00E9E7
      E200EEECEA00000000000000000000000000F4F4F5003E48D5004853DA00494F
      DA006B71E300F1F2FC00FFFFFF00F1F2FC00F2F2FD00FFFFFF00EFEFF8005B60
      CA00484FD9004852D9003E47D500EDEDEF000000000000000000C6C6C6008484
      0000008400008484000000840000848400000084000084840000000000008484
      840000000000000000000000000000000000FCFBFB00F9F9F900FDFDFD00FDFD
      FD00FEFEFE00FDFDFD00FDFDFD00FDFDFD00FAFAFA00F5F4F300F0EEEC00EBE8
      E400EFEDEB00000000000000000000000000FCFBFB00F9F9F900FDFDFD00FDFD
      FD00FEFEFE00FDFDFD00FDFDFD00FDFDFD00FAFAFA00F5F4F300F0EEEC00EBE8
      E400EFEDEB00000000000000000000000000F5F5F500797FDB004149CD00555B
      D600F0F1FB00FFFFFF00F1F2FB006C70E2006D71E300F2F2FC00FFFFFF00EEEE
      F7004D53CB004149CC00797FDA00EEEEF0000000000000000000C6C6C6000084
      0000848400000084000084840000008400008484000000840000000000008484
      840000000000000000000000000000000000FCFBFB00F9F9F900FDFDFD00FEFE
      FE00FEFEFE00FEFEFE00FDFDFD00FDFDFD00FBFBFB00F6F5F400F1EFED00EBE9
      E500EFEDEA00000000000000000000000000FCFBFB00F9F9F900FDFDFD00FEFE
      FE00FEFEFE00FEFEFE00FDFDFD00FDFDFD00FBFBFB00F6F5F400F1EFED00EBE9
      E500EFEDEA00000000000000000000000000FBFBFB00D9DAEF003037C000484F
      CC009195E200F0F1FA006C71DB00494FD500494FD5006D72DC00F1F1FB009094
      E000484FCC003037C000D4D6EB00FAFAFA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000000000000000000000000000FCFBFB00F9F9F900FDFDFD00FEFE
      FE00FEFEFE00FEFEFE00FDFDFD00FDFDFD00FBFBFA00F0EFED00EBE9E600E6E3
      DF00F7F7F600000000000000000000000000FCFBFB00F9F9F900FDFDFD00FEFE
      FE00FEFEFE00FEFEFE00FDFDFD00FDFDFD00FBFBFA00F0EFED00EBE9E600E6E3
      DF00F7F7F60000000000000000000000000000000000F1F1F400A0A3E0003139
      BE00484FC800555BCE004950CC004950CD004950CD00494FCC00555BCE00484F
      C8003139BD009FA2DF00ECECEE0000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      840000000000000000000000000000000000FCFBFB00F9F9F900FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FCFCFC00FAF9F900F0EFED00FDFDFC00FAF9
      F80000000000000000000000000000000000FCFBFB00F9F9F900FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FCFCFC00FAF9F900F0EFED00FDFDFC00FAF9
      F800000000000000000000000000000000000000000000000000EFEFF000A0A3
      DE002F37B8004148C000494FC400494FC500494FC500494FC4004148C0002F37
      B8009FA2DD00E9E9EB0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFBFB00F9F9F800FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FBFBFB00F7F6F500EEECEA00F9F8F8000000
      000000000000000000000000000000000000FCFBFB00F9F9F800FDFDFD00FDFD
      FD00FDFDFD00FDFDFD00FDFDFD00FBFBFB00F7F6F500EEECEA00F9F8F8000000
      000000000000000000000000000000000000000000000000000000000000F0F0
      F200D7D8EC00797ECF003E45BA002A33B3002A33B3003D45BA00797ECF00D4D6
      EA00ECECEE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FCFBFB00ECEAE800F0EFED00F1EF
      EE00F1EFEE00F0EFEE00F0EEEC00EDEBE900EAE8E500F1EFEE00000000000000
      000000000000000000000000000000000000FCFBFB00ECEAE800F0EFED00F1EF
      EE00F1EFEE00F0EFEE00F0EEEC00EDEBE900EAE8E500F1EFEE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FAFAFB00F0F0F100EFEFF000EAEAEE00EAEAED00EDEDEF00EEEEF000FAFA
      FA00000000000000000000000000000000000000000000000000EFCEAD00EFCE
      AD00EFCEAD00EFCEAD00EFCEAD00EFCEAD00EFCEAD00EFCEAD00EFCEAD00EFCE
      AD00EFCEAD00EFCEAD00EFCEAD00000000000000000000000000EFCEAD00EFCE
      AD00EFCEAD00EFCEAD00EFCEAD00EFCEAD00EFCEAD00EFCEAD00EFCEAD00EFCE
      AD00EFCEAD00EFCEAD00EFCEAD00000000000000000000000000000000000000
      000000000000DED6CE00D6CECE00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00F7EBDF00F7EBDF00F7EBDF00F7EBDF00F7EB
      DF00F7EBDF00F7EBDF00EFCEAD00000000000000000000000000000000000000
      0000AD9CAD005A3910006B4A4200000000008CA5DE005252730063525A007B63
      6B004A4A42008C84840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00F7EBDF00F7EBDF00F7EBDF00F7EBDF00F7EB
      DF00F7EBDF00F7EBDF00EFCEAD00000000000000000000000000000000000000
      000094847300AD8431006B4A2100C6D6DE00395AC6005263C600C6ADD600C6AD
      B500B5A59C00847B73004A423900A5A5A5000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00F7EBDF00F7EBDF00F7EBDF00F7EBDF00F7EB
      DF00F7EBDF00F7EBDF00EFCEAD00000000000000000000000000000000000000
      0000846B5200C68431006B422900949CBD00315AE7004A7BEF00BD9CCE00947B
      7B00A5848400C6A5A500A5949400948C8C00FFFFFF00FF6B1800FF6B1800FF6B
      1800A5180000A518000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00F7EBDF00F7EBDF00F7EBDF00F7EBDF00F7EB
      DF00F7EBDF00F7EBDF00EFCEAD00000000000000000000000000000000000000
      0000A58C6B00C6632900E7ADBD00CEC6FF003173EF004A94EF00D6BDDE00B59C
      9400AD7B8400947373007B6363009C8C8C00FFDE9C00FFFFFF00FFAD6300FF6B
      1800FF6B1800FF6B1800A5180000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00F7EBDF00F7EBDF00F7EBDF00F7EBDF00F7EB
      DF00F7EBDF00F7EBDF00EFCEAD00000000000000000000000000000000000000
      0000846B4A00BD632900BD8C9400D6CEFF00427BF7005A9CEF00D6B5D600B594
      9400CE949400CE9C9C008C6B6B009C94940063636300FFDE9C00FFFFFF00FFAD
      6300FFAD6300FF6B1800FF6B1800A51800000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00F7EBDF00F7EBDF00F7EBDF00F7EBDF00F7EB
      DF00F7EBDF00F7EBDF00EFCEAD0000000000426B7B00215A730031637B00395A
      6B00BDB58C00945A0800E7BDA500CECEE7007394FF0094B5FF00DEBDDE00BD8C
      9400BD7B8400AD7B84008C6B73009C8C8C000000000063636300FFDE9C00FFFF
      FF00FFDE9C00FFAD6300FF6B1800000000009C9C9C009C9C9C00000000000000
      0000000000000000000000000000000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00EFCEAD00EFCEAD00EFCEAD00EFCEAD00EFCE
      AD00EFCEAD00EFCEAD00EFCEAD00000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00EFCEAD00EFCEAD00EFCEAD00EFCEAD00EFCE
      AD00EFCEAD00EFCEAD00EFCEAD00000000006BBDD60073D6F7007BDEFF00A5DE
      FF009C9484009C7B4200FFDED600CEDEDE004A639400394A6300CEADBD00B57B
      8C00CE8C8C00BD8C940084636300A59C9C00000000000000000063636300FFDE
      9C00FFFFFF00FFDE9C0000000000B5B5B500B5B5B500000000009C9C9C000000
      0000000000000000000000000000000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00F7EBDF00F7EBDF00F7EBDF00F7EBDF00F7EB
      DF00F7EBDF00F7EBDF00EFCEAD00000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD000000000039A5BD0084EFFF0084DEFF009CDE
      FF00394239008C736B00FFDEF700E7E7EF00B5CECE008C947B00CEBDAD00C68C
      9C00B5737300BD848C008C6B6B00A59494000000000000000000000000006363
      6300FFDE9C0063636300CECECE00CECECE00000000009C9C9C009C9C9C009C9C
      9C00000000000000000000000000000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00F7EBDF00F7EBDF00F7EBDF00F7EBDF00F7EB
      DF00F7EBDF00F7EBDF00EFCEAD00000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00000000005AD6D60073ADB500FFFFFF009CAD
      A5006B7B7300C6CECE00B5ADB500FFF7FF00D6CED600CEC6C600FFFFFF00FFE7
      E700D6848C009C5A5A0094636300A58C8C000000000000000000000000000000
      000063636300CECECE00CECECE0063636300C6C6C600B5B5B5009C9C9C009C9C
      9C009C9C9C000000000000000000000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00F7EBDF00F7EBDF00F7EBDF00F7EBDF00F7EB
      DF00F7EBDF00F7EBDF00EFCEAD00000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00000000006BD6E7006B9CAD00B5BDCE00D6E7
      E70073737300C6C6C600C6BDC600949494009C9C9C009C949400F7E7DE00E7C6
      C600EFBDC600BD94940084736B00000000000000000000000000000000000000
      000063636300CECECE0063636300C6C6C600F7F7F700C6C6C600B5B5B5009C9C
      9C009C9C9C000000000000000000000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00F7EBDF00F7EBDF00F7EBDF00F7EBDF00F7EB
      DF00F7EBDF00F7EBDF00EFCEAD00000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00000000007BE7F700A5DEF70094B5C6005A73
      84009CB5BD008C9CAD008CA5AD0073949C0063848400637B73008C8C8400D6C6
      BD00000000000000000000000000000000000000000000000000000000000000
      00000000000063636300D6D6D600E7E7E700C6C6C600F7F7F700C6C6C600B5B5
      B5009C9C9C000000000000000000000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00F7EBDF00F7EBDF00F7EBDF00F7EBDF00F7EB
      DF00F7EBDF00F7EBDF00EFCEAD00000000000000000000000000EFCEAD00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00EFCEAD000000000084E7F70094DEF700ADEFFF00ADF7
      FF00ADFFFF00B5FFFF00ADF7FF00ADFFFF00B5FFFF00C6FFFF00DEF7F7000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000063636300D6D6D600E7E7E700C6C6C600F7F7F700C6C6
      C600B5B5B5000000000000000000000000000000000000000000CE945200CE94
      5200CE945200CE945200CE945200CE945200CE945200CE945200CE945200CE94
      5200CE945200CE945200CE945200000000000000000000000000CE945200CE94
      5200CE945200CE945200CE945200CE945200CE945200CE945200CE945200CE94
      5200CE945200CE945200CE945200000000008CE7F70084D6EF0094EFFF0094F7
      FF009CEFFF0094EFFF009CEFFF009CEFFF00ADEFFF005A848C00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000063636300D6D6D600E7E7E700C6C6C600F7F7
      F700C6C6C6000000000000000000000000000000000000000000E79C4A00E79C
      4A00E79C4A00E79C4A00E79C4A00E79C4A00E79C4A00E79C4A00E79C4A00E79C
      4A00E79C4A00E79C4A00E79C4A00000000000000000000000000E79C4A00E79C
      4A00E79C4A00E79C4A00E79C4A00E79C4A00E79C4A00E79C4A00E79C4A00E79C
      4A00E79C4A00E79C4A00E79C4A0000000000A5E7EF00B5F7FF00ADFFFF00BDFF
      FF008CBDCE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000063636300D6D6D600E7E7E700C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000063636300D6D6D6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF0018572800164F
      2500164F2500164F2500154C2300154C2300154C2300154C2300154C2300154C
      2300154C2300FFFFFF000000000000000000000000000000000046BCEB003DB6
      EB003DB6EB003DB6EB003DB6EB003DB6EB0037B2EB0037B2EB0037B2EB0037B2
      EB0037B2EB0037B2EB0032AEEB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF001C672F0080B48E00CBEF
      D400B8E9C500B8E9C500B8E9C500B8E9C500A1E2B200A1E2B200A1E2B200AFE6
      BD0080B48E00154C2300FFFFFF0000000000000000000000000046BCEB00C4F3
      FD00CFF4FC00CFF4FC00C4F3FD00C3EEFB00BDEAF900B5EAF800B0E6F600AAE3
      F600AAE3F600BDEAF90032AEEB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF001C672F00F4FBF6004DD1
      77004BCF740049CD710047CB6D0044C9690041C665003EC25F003EC25F003EC2
      5F00AFE6BD00154C2300FFFFFF0000000000000000000000000046BCEB00C4F3
      FD00ACEEFC00ACEEFC00A1E9F90097E4F7008DE0F60083DBF30076D5F10069CE
      ED0069CEED00AAE3F60032AEEB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000052956E005597710000000000000000000000
      000000000000000000000000000000000000FFFFFF0021743600E8F8EC004FD3
      7A004DD177004BCF740049CD710047CB6D0041C6650041C665003EC25F003EC2
      5F00A1E2B200154C2300FFFFFF0000000000000000000000000051C6EB00CFF4
      FC00ACEEFC00ACEEFC00ACEEFC00A1E9F90097E4F7008DE0F60083DBF30076D5
      F10076D5F100B0E6F60032AEEB00000000000000000000000000000000000000
      000000000000000000005B9976005B9976005D9A77005D9A7700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005D9A770078CDA20072B58F005B997600000000000000
      000000000000000000000000000000000000FFFFFF0026873E00E8F8EC0052D5
      7D004FD37A004DD17700FFFFFF0049CD710044C9690044C9690041C665003EC2
      5F00A1E2B200154C2300FFFFFF0000000000000000000000000051C6EB00D3F6
      FF00B6F3FE00B6F3FE00ACEEFC00ACEEFC00A1E9F90097E4F7008DE0F60083DB
      F30083DBF300B5EAF80032AEEB00000000000000000000000000000000000000
      000000000000000000005B99760053CD8F005ECD92005D9A7700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000458F63005ECD92005AD799005FCD930059C58B00458F63000000
      000000000000000000000000000000000000FFFFFF0026873E00E8F8EC0054D6
      800052D57D004FD37A00FFFFFF00FFFFFF0047CB6D0044C9690041C6650041C6
      6500A1E2B200154C2300FFFFFF0000000000000000000000000051C6EB00F3FB
      FF00F3FBFF00F3FBFF00E8F7FC00ACEEFC00ACEEFC00A1E9F90097E4F70097E4
      F7008DE0F600C3EEFB0032AEEB00000000000000000000000000000000000000
      000000000000000000005B9A760054CD90005ECD92005D9A7700000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000052956E0052956E005C9A770058D4960069C490005D9B780052956E005295
      6E0000000000000000000000000000000000FFFFFF002CA14900E8F8EC0056D9
      850056D9850054D68000FFFFFF00FFFFFF00FFFFFF0049CD710047CB6D0044C9
      6900B8E9C500164F2500FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0051C6EB00E8F7FC00E8F7FC00E8F7FC00C3EEFB00C3EE
      FB00B5EAF800C4F3FD0032AEEB00000000000000000000000000000000000000
      000052956E0052956E005C9A770058D4960069C490005D9B780052956E005295
      6E00000000000000000000000000000000000000000000000000000000000000
      000000000000000000005B9A760054CD90005ECD92005D9A7700000000000000
      000000000000000000000000000000000000FFFFFF002CA14900E8F8EC0059DB
      890056D9850056D98500FFFFFF00FFFFFF004DD177004BCF740049CD710047CB
      6D00B8E9C500164F2500FFFFFF00000000000000000000000000FFFFFF002DAC
      72002DAC7200FFFFFF00C5F7FF0051C6EB0046BCEB0046BCEB0046BCEB003DB6
      EB003DB6EB0037B2EB0032AEEB00000000000000000000000000000000000000
      000000000000458F63005ECD92005AD799005FCD930059C58B00458F63000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005B99760053CD8F005ECD92005D9A7700000000000000
      000000000000000000000000000000000000FFFFFF002FAA4E00E8F8EC005ADC
      8A0059DB890056D98500FFFFFF0054D680004FD37A004DD177004BCF740049CD
      7100B8E9C50018572800FFFFFF00000000000000000000000000FFFFFF0038B8
      800033B37A00FFFFFF00FFFFFF00FFFFFF00C5F7FF00C5F7FF00C5F7FF00B6F3
      FE00B6F3FE00C5F7FF0031CFEB00000000000000000000000000000000000000
      000000000000000000005D9A770078CDA20072B58F005B997600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000005B9976005B9976005D9A77005D9A7700000000000000
      000000000000000000000000000000000000FFFFFF002FAA4E00E8F8EC005CDE
      8E005ADC8A0059DB890056D9850056D9850052D57D004FD37A004DD177004BCF
      7400B8E9C50018572800FFFFFF0000000000000000002DAC720045C5900040C0
      8B003BBC840037B67E002DAC7200FFFFFF0069CEED0051C6EB0051C6EB0031CF
      EB0031CFEB0031CFEB0031CFEB00000000000000000000000000000000000000
      000000000000000000000000000052956E005597710000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF002FAA4E00F4FBF6005CDE
      8E005CDE8E005ADC8A0059DB890056D9850054D6800052D57D004FD37A004DD1
      7700CBEFD4001C672F00FFFFFF0000000000000000002DAC72004ACA960047C7
      920044C48F003FC089002DAC7200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF002FAA4E0080B48E00F4FB
      F600E8F8EC00E8F8EC00E8F8EC00E8F8EC00E8F8EC00E8F8EC00E8F8EC00F4FB
      F600A1E2B20021743600FFFFFF00000000000000000000000000000000004BCB
      970048C995000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF002FAA4E002FAA
      4E002FAA4E002FAA4E002FAA4E002FAA4E002CA149002CA14900289444002894
      440026873E00FFFFFF0000000000000000000000000000000000000000002DAC
      72002DAC72000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000F4F4F4006A696800969696000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCFCFC00F6F6F600F6F6F600F4F2F000F4F2F000F4F4F400F5F5F500FBFB
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F4F4F40066666500484643005C5C5D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F6F6
      F500EEE5D700CEA56900B6791D00AD680000AD680000B6791D00CDA56900ECE3
      D500F3F2F1000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000F3F3
      F300666665004846430059595900F4F4F4000000000000000000000000000000
      0000000000000000000000000000CEBBBB00B1939300AC8F8F00BCA7A700EEE9
      E900000000000000000000000000000000000000000000000000F4F4F400D9BC
      9500AC690600AB670000AC680000AD680000AD680000AC680000AB670000AB68
      0600D8BC9400EFEFEF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F3F3F3006666
      65004846430059595900F4F4F4000000000000000000E9DDDD00EFE7E7000000
      000000000000E3D6D600AD878700B0848400CAA0A000CBA1A000B98C8C009872
      7200D8CCCC0000000000000000000000000000000000F6F6F500D7BA9500A964
      0000AC680000AE690000D4B07700F5EDE100F5EDE100A7652900AE690000AC68
      0000A8630000D6BA9400F1F0F000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F3F3F300666665004846
      430059595900F4F4F400000000000000000000000000C5A2A200AB7B7B00DAC7
      C600D2BDBD00A87A7A00DBB8BA00F5CFD700F2C2D000E9B9C600EDBEC300DCAD
      AC0090686800EDE8E8000000000000000000FCFCFC00ECE3D700A7640600AC68
      0000AF6A0000B16C0000DBBA8700FFFFFF00FFFFFF00A8662E00B16C0000AF6A
      0000AC680000A7630600E9DFD300FBFAFA000000000000000000000000008400
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000F1F0EE00F0EFEC00FAFAF900000000000000000066666500484643005858
      5900F4F4F40000000000000000000000000000000000C9A4A400ECD5D500B28C
      8B00A97C7B00F1D3D700F4C4D400D69EB300BA859600C38DA100C892A900DDAB
      B300C4959500B19B9B000000000000000000F6F6F600C49B6900AC680200AE69
      0000B16C0000B46F0000C8943F00D7B27800D7B27800B06C1600B36E0000B16C
      0000AE690000AC680200C39A6900F1F1F0000000000000000000848484008400
      0000000000000000000000000000000000000000000084000000840000008400
      0000840000008400000000000000000000000000000000000000E0DEDA00CEC9
      C200DFDCD700E0DDD800D2CEC700D8D5CF00D8D4D000787673005A5A5B00F4F4
      F40000000000000000000000000000000000F3F2F200C09A9A00F6D7D700F7DE
      DD00F1D5D700F0BDC900C48E9C0094656900865958008B5D6000BC879B00CA94
      AB00D3A3A70097727200F3EFEF0000000000F6F6F600AD722600B5771900AF6B
      0000B36E0000B26D0000CDA25F00F5ECDD00F5ECDD00A6622200B16C0000B26E
      0000AF6A0000B5771900AC712600F0EFEF000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000008400
      00008400000084000000000000000000000000000000D6D2CD00DFDCD700F8F7
      F600FBFAF900FAF9F800F7F6F400E5E2DD00D0CCC400DBD9D500000000000000
      000000000000000000000000000000000000EAE4E400BC959500ECC4C400EBB8
      BB00EAB8C400B27F8800885D5D00BFAAA800D1C2C1009D7E7D0096687100D299
      B700CD9AA8009D727000D2C6C60000000000F3F2F000A5641100BD863000B371
      0D00A35E0000A05B0000B8833B00FEFEFE00FFFFFF00D8BFB7009E580D00A35D
      0000B2710D00BD853000A4631100EDEBEA000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000000000008400
      000084000000840000000000000000000000E8E6E300DBD7D200F7F6F500F9F8
      F700FAF9F800F9F8F700F7F5F400F1EFEC00E2DED900D7D4CE00000000000000
      000000000000000000000000000000000000E3DCDC00B2888700E3B2BA00E4AC
      C100EAAECE00C892A60092676900DED4D40000000000CDBFBE008B5E6300D097
      B700CD98AF00976C6C00B29C9B0000000000F3F2F000A4621100BB843200AC74
      3000A16114009C5600009D580000CCA97B00FEFEFE00FFFFFF00E2CFCC009D5C
      2100AC733000BB843200A3611100ECEAEA000000000000000000840000000000
      0000000000000000000000000000000000000000000000000000840000000000
      000084000000840000000000000000000000D2CFC800ECE9E600F6F5F300FAF9
      F800FCFCFC00FBFAFA00F8F7F600F1EFEC00E9E5E100CECAC200FAF9F9000000
      000000000000000000000000000000000000D7CDCD00AA7F8100D5A2AE00CD97
      AC00CA93AC00C18CA0009E6F750080585700E8E1E100D0C3C1008E606600D89C
      C200D39AB90093676A00AC94930000000000F4F4F400A86C2800AC733200A66D
      3200B7875200C7A17500CAA57C0098531300C9A47800FFFFFF00FFFFFF00C099
      9200A66C3200AC733200A86C2900EEEDED000000000000000000848484008400
      0000000000000000000000000000000000008400000084000000000000000000
      000000000000840000000000000000000000CBC6BF00ECE9E500F5F4F200FAF9
      F900FCFBFB00FBFBFA00F9F8F700F0EEEB00E6E2DD00D6D2CB00F0EEEC000000
      000000000000000000000000000000000000C4B2B200845A5B008A5E61008A60
      620090686A00916D6E009D7C7D00AE939300DDD2D200BFABAA0095677000E5A5
      D400D89DC000956A6D00AC93920000000000F5F5F500BB9070009C5F2E00A368
      3200CFB09100FFFFFF00FFFFFF00BD948200C49E7500FFFFFF00FFFFFF00C8A5
      A400A26832009C5F2F00BA8F7100EFEEEE000000000000000000000000008484
      8400840000008400000084000000840000000000000000000000000000000000
      000000000000000000000000000000000000CBC7BF00E8E4E000F5F3F100FAFA
      F900FBFBFA00FBFAFA00F9F8F700F4F2F000E4DFDA00D5D0C900F1F0EE000000
      000000000000000000000000000000000000E0D6D600C2AFAF00D0C2C200DED4
      D400F0ECEB0000000000000000000000000000000000A88C8B00AB798900EBA9
      DD00D59BBB0091666700B5A09F0000000000FBFBFB00E8DED8008F4B26009F63
      3900A9734700F7F2EE00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFAFA00A66F
      5D009E633A008E4A2700E3D9D300FAFAFA000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000D8D4CF00DCD7D000F8F7F600FAF9
      F800FBFAF900FAFAF900F9F8F700F7F6F400E5E1DC00CAC4BD00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F8F6F6008E6A6900AD7B8A00DB9F
      C300B683930082585800D9CDCD000000000000000000F3F2F100CAAB9E008D49
      2D009C604000AD7A5C00DCC7BB00EFE5E000F0E7E300DDC8C100AB7767009C5F
      41008D482D00C9AA9D00EDECEC00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F1F0EE00CDC9C100F5F3F100FDFD
      FC00FDFDFC00FDFDFC00FDFCFC00FBFBFA00D3CEC600DFDDD900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B39A9A00855A5C009669
      6F0082565800B198970000000000000000000000000000000000EFEFEF00C9AA
      9F008A432F00955540009A5D45009A5D44009A5D44009A5C4500955540008A43
      3000C8A99F00EAE9E90000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E7E4E100CFCCC500EEEC
      E900FEFEFE00FFFFFF00F8F7F600D9D5CF00D5D1CB0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B7A0A0009879
      7700CDBDBC00000000000000000000000000000000000000000000000000F1F0
      F000E5DAD700B2857B00914E4000853C2E00853C2E00904E4000B2847B00E2D8
      D500EDECEC000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F2F1EF00D8D4
      CF00CBC6BE00CBC7BF00D2CEC800E9E6E3000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FBFAFA00F1F0F000F0EFEF00ECEBEA00ECEAEA00EEEDED00EFEEEE00FAFA
      FA00000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400FFFFFF00C6C6
      C60084848400C6C6C600FFFFFF00C6C6C6000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      840084848400848484008484840084848400848484008484840084848400FFFF
      FF0084848400FFFFFF00848484008484840000000000B4977600917057009170
      5700917057007B6152007B6152006B5549006B5549005C4B43005C4B43005545
      3E0055453E00433129007B615200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      00000000000000000000848484008484840084848400FFFFFF00FFFFFF00FFFF
      FF00840000008400000084000000840000000000000091705700E4DBD500FAF6
      F200F6F1EC00F5EDE500F5EDE500F0E9E200F0E9E200F0E9E200F0E9E200EFE7
      DE00F6F1EC00D1CCCB0043312900000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008400
      0000FF00000084000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF008400000000000000000000000000000000000000B4977600FAF6F200FDDC
      BB00FCDAB600FCD7B100FBD4AB00FBD4AB00FBD1A400FBCE9E00FBCE9E00FCCA
      9500FCCA9500F6F1EC0055453E00000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008400
      000084000000FF0000008400000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008400000000000000000000000000000000000000B4977600F6F1EC00FDDC
      BB00FCDAB600FCDAB600FCD7B100FBD4AB00FBD1A400FBD1A400FBCE9E00FCCA
      9500FCCA9500EFE7DE0055453E00000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008400
      0000FF00000084000000FF00000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008400000000000000000000000000000000000000B4977600F6F1EC00FDDC
      BB00FDDCBB00FCDAB600FCD7B100FBD4AB00FBD4AB00FBD1A400FBD1A400FBCE
      9E00FBCE9E00F0E9E2005C4B4300000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008400
      000084000000FF0000008400000000000000FFFFFF00FFFF0000FFFFFF00FFFF
      00008400000000000000000000000000000000000000B4977600F6F1EC00FDDF
      C000FDDFC000FDDCBB00FCDAB600FCD7B100FBD4AB00FBD4AB00FBD1A400FBD1
      A400FBCE9E00F5EDE5005C4B4300000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008400
      0000FF00000084000000FF00000000000000FFFF0000FFFFFF00FFFF0000FFFF
      FF008400000000000000000000000000000000000000C8AF8800FAF6F200FDDF
      C000FDDFC000FDDCBB00FCDAB600FCDAB600FCD7B100FBD4AB00FBD4AB00FBD1
      A400FBD1A400F5EDE5006B554900000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008400
      000084000000FF0000008400000000000000FFFFFF00FFFF0000FFFFFF00FFFF
      00008400000000000000000000000000000000000000C8AF8800000000000000
      00000000000000000000FDDCBB00FDDCBB00FCDAB600FCD7B100FCD7B100FBD4
      AB00FBD4AB00FAF6F2006B554900000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008400
      0000FF00000084000000FF00000000000000FFFF0000FFFFFF00FFFF0000FFFF
      FF008400000000000000000000000000000000000000D6C09A00000000002DAC
      72002DAC720000000000FDDFC000FDDFC000FDDCBB00FCDAB600FCDAB600FCD7
      B100FBD4AB00FAF6F2007B615200000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000008400
      0000840000008400000084000000840000008400000084000000840000008400
      00008400000000000000000000000000000000000000000000000000000038B8
      800033B37A00000000000000000000000000FDDFC000FDDCBB00FCDAB600FCDA
      B600FCD7B100FAF6F2007B615200000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002DAC720045C5900040C0
      8B003BBC840037B67E002DAC720000000000FDDFC000FDDCBB00FDDCBB00FAF6
      F200FAF6F200FAF6F2007B615200000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002DAC72004ACA960047C7
      920044C48F003FC089002DAC720000000000FDDFC000FDDFC000FDDFC000FAF6
      F200ECBB8900ECBB890091705700000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000840000008400000084000000840000000000000000
      0000000000000000000000000000000000000000000000000000000000004BCB
      970048C99500000000000000000000000000F5EDE500F5EDE500F5EDE500F5ED
      E500ECBB89009170570000000000C8D0D4000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0E7D500000000002DAC
      72002DAC720000000000D6C09A00C8AF8800C8AF8800B4977600B4977600B497
      7600B497760000000000C8D0D400C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C8D0D400C8D0D400C8D0D4000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      0000840000008400000084000000840000000000000000000000000000000000
      0000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF000000000000000000000000000000
      00000000000000000000FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00000000000000000000000000FFFF
      FF00840000008400000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF00840000000000000000848400848484000084
      8400848484000084840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000000000000840000008400
      0000840000008400000084000000000000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00840000000000000084848400008484008484
      8400008484008484840084000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000000000840000008400
      0000840000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFF
      FF00840000008400000084000000840000000000000000848400848484000084
      8400848484000084840084000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000000000000840000008400
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF0084000000000000000000000084848400008484008484
      8400008484008484840000848400848484000084840084848400008484008484
      8400008484000000000000000000000000000000000000000000840000008400
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000008400000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00840000008400000000000000000000000000000000848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484000000000000000000000000000000000000000000840000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000840000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000840000008400000084000000840000008400
      0000840000000000000000000000000000000000000084848400848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400008484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000848400848484000084
      84000000000000FFFF00000000000000000000FFFF0000000000848484000084
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B4977600917057009170
      5700917057007B6152007B6152006B5549006B5549005C4B43005C4B43005545
      3E0055453E00433129007B61520000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000000000000DBD9D700D1CFCB00E6E5
      E3000000000000000000F9F9F900F3F3F200000000000000000000000000F7F6
      F500EFEDEB00F3F2F10000000000000000000000000000000000000000000000
      0000000000008400000084000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000091705700E4DBD500FAF6
      F200F6F1EC00F5EDE500F5EDE500F0E9E200F0E9E200F0E9E200F0E9E200EFE7
      DE00F6F1EC00D1CCCB004331290000000000FFFFFF0044BAEB0044BAEB0044BA
      EB0044BAEB0035B0EB0035B0EB0035B0EB0035B0EB0035B0EB0035B0EB0035B0
      EB0035B0EB0035B0EB00FFFFFF0000000000CFCDC900DAD8D400E4E2E000DEDB
      D900B2ADA600A4A098008D877E008B847C00B9B5B100E5E4E200F0EFED00F7F6
      F600F2F1EF00EBE9E600F2F1EF00000000000000000000000000000000000000
      0000840000000000000000000000840000000000000000000000840000008400
      00000000000000000000000000000000000000000000B4977600FAF6F200FDDC
      BB00FCDAB600FCD7B100FBD4AB00FBD4AB00FBD1A400FBCE9E00FBCE9E00FCCA
      9500FCCA9500F6F1EC0055453E0000000000FFFFFF0044BAEB00C7F3FB00C7F3
      FB00C7F3FB00C4EDF800C4EDF800B7E7F600B7E7F600AAE1F200AAE1F200AAE1
      F200B7E7F60035B0EB00FFFFFF000000000000000000E3E0DE00A6A09700B4B0
      A900A29D9500888178007D776E006E69610059554F00C0BFBD00FAFAFA00F9F9
      F900F6F6F500F1F0EE00E7E5E200000000000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      00008400000000000000000000000000000000000000B4977600F6F1EC00FDDC
      BB00FCDAB600FCDAB600FCD7B100FBD4AB00FBD1A400FBD1A400FBCE9E00FCCA
      9500FCCA9500EFE7DE0055453E0000000000FFFFFF0044BAEB00C7F3FB00AFEE
      FA00AFEEFA00A4E9F8009EE6F70093E2F5008DD6EF0074D4EF0074D4EF0074D4
      EF00AAE1F20035B0EB00FFFFFF000000000000000000BBB7B1008E877E00847D
      74007772690064605800514E480046443F0045433E00A5A4A200FCFCFC00FCFC
      FC00FCFCFC00F5F5F400F1EFED00F4F3F2000000000000000000000000000000
      0000840000000000000000000000840000000000000084000000000000000000
      00008400000000000000000000000000000000000000B4977600F6F1EC00FDDC
      BB00FDDCBB00FCDAB600FCD7B100FBD4AB00FBD4AB00FBD1A400FBD1A400FBCE
      9E00FBCE9E00F0E9E2005C4B430000000000FFFFFF0053C4EB00D2F6FE00AFEE
      FA00AFEEFA00AFEEFA00A4E9F80093E2F50093E2F5008DD6EF0074D4EF0074D4
      EF00AAE1F20035B0EB00FFFFFF000000000000000000F8F7F700C7C5C2005551
      4C004A47420045433E0045433E0045433E0045433E0062605B00FCFCFC00FFFF
      FF00FFFFFF00FBFBFB00F5F4F300EEECEA000000000000000000000000000000
      0000000000008400000084000000840000000000000084000000000000000000
      00008400000000000000000000000000000000000000B4977600F6F1EC00FDDF
      C000FDDFC000FDDCBB00FCDAB600FCD7B100FBD4AB00FBD4AB00FBD1A400FBD1
      A400FBCE9E00F5EDE5005C4B430000000000FFFFFF0053C4EB00D2F6FE00AFEE
      FA00AFEEFA00AFEEFA00AFEEFA00A4E9F80093E2F50093E2F5008DD6EF008DD6
      EF00B7E7F60035B0EB00FFFFFF000000000000000000EFEEED00908F8C004543
      3E0045433E004C49430055514B005F5A520069635A00726B6100C2BEB900FFFF
      FF00FFFFFF00FEFEFE00F9F9F900EEECEA000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000840000008400
      00000000000000000000000000000000000000000000C8AF8800FAF6F200FDDF
      C000FDDFC000FDDCBB00FCDAB600FCDAB600FCD7B100FBD4AB00FBD4AB00FBD1
      A400FBD1A400F5EDE5006B55490000000000FFFFFF0053C4EB00F4F9FC00F4F9
      FC00F4F9FC00E8F7FB00AFEEFA00AFEEFA00A4E9F8009EE6F70093E2F50093E2
      F500C4EDF80035B0EB00FFFFFF000000000000000000EAE8E50083817D00524F
      49005F5A5300676159006E685E00756E63007C756900837B6E008B837500E2DF
      DC00F1F1EF00F1F0EE00FEFEFE00F9F9F9000000000000000000000000000000
      0000000000000000000000000000840000000000000084000000000000000000
      00000000000000000000000000000000000000000000C8AF8800FAF6F200FEE3
      C700FDDFC000FDDFC000FDDCBB00FDDCBB00FCDAB600FCD7B100FCD7B100FBD4
      AB00FBD4AB00FAF6F2006B55490000000000FFFFFF0053C4EB0053C4EB0053C4
      EB0053C4EB0053C4EB00E8F7FB00E8F7FB00E8F7FB00C4EDF800C4EDF800AFEE
      FA00C4EDF80035B0EB00FFFFFF000000000000000000F0EFED00DDDBD800827D
      7600716B6000787166007F776B00867D700090877900B0A99E00D0CCC500EDEB
      E800F7F7F600F0EFEE00FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6C09A00FAF6F200FEE3
      C700FEE3C700FDDFC000FDDFC000FDDFC000FDDCBB00FCDAB600FCDAB600FCD7
      B100FBD4AB00FAF6F2007B61520000000000FFFFFF008DD6EF00FFFFFF00D4B3
      8900FBF5EF00C7F3FB0053C4EB0053C4EB0044BAEB0044BAEB0044BAEB0044BA
      EB0035B0EB0035B0EB00FFFFFF00000000000000000000000000F3F2F000EEEC
      EA00CBC7C30088837B00A7A29A00E0DEDA00F8F7F700FBFBFB00FBFBFB00FBFB
      FB00F9F9F800E9E8E60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D6C09A00FAF6F200FEE3
      C700FEE3C700FEE3C700FDDFC000FDDFC000FDDFC000FDDCBB00FCDAB600FCDA
      B600FCD7B100FAF6F2007B61520000000000FFFFFF008DD6EF00FFFFFF00D8C4
      9F00F4F9FC00FEE4C800FEE4C800FDDFC000FDDAB600FDDAB600FDDAB600FBF5
      EF008164530038CAEB00FFFFFF00000000000000000000000000000000000000
      0000F8F8F700F2F2F100DCDBD900FCFCFC00FCFCFC00FCFCFC00FCFCFC00FCFC
      FC00FCFCFC00F1F0EE0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DECBA800FAF6F200FEE3
      C700FEE3C700FEE3C700FEE3C700FDDFC000FDDFC000FDDCBB00FDDCBB00FAF6
      F200FAF6F200FAF6F2007B61520000000000FFFFFF008DD6EF00FFFFFF00E3D1
      AD00FBF5EF00FEE4C800FEE4C800FDDFC000FDDFC000FBF5EF00FBF5EF00FBF5
      EF008164530038CAEB00FFFFFF00000000000000000000000000000000000000
      00000000000000000000FBFBFA00F7F6F500FDFDFD00FBFBFB00FCFCFC00FCFC
      FC00FCFCFC00F6F5F40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E3D1B000F5EDE500FEE3
      C700FEE3C700FEE3C700FEE3C700FEE3C700FDDFC000FDDFC000FDDFC000FAF6
      F200ECBB8900ECBB8900917057000000000000000000FFFFFF008DD6EF00E3D1
      AD00F5EDE300FEE4C800FEE4C800FDDFC000FDDFC000FBF5EF00F0BF8C00D4B3
      890094735A00FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000000000000000000000000000E6E5E200FDFDFD00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00F5F3F20000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E5D3AE00F0E7D500F5ED
      E500F6F1EC00F5EDE500F6F1EC00F6F1EC00F5EDE500F5EDE500F5EDE500F5ED
      E500ECBB89009170570000000000C8D0D4000000000000000000FFFFFF00E3D1
      AD00F5EDE300F5EDE300F5EDE300FBF5EF00F5EDE300F5EDE300F0BF8C009473
      5A00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000E6E5E200FEFEFE00FEFEFE00FCFBFB00F8F7
      F500F3F1F000EDEBE800FDFDFD00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F0E7D500E5D3AE00E3D1
      B000DECBA800D6C09A00D6C09A00C8AF8800C8AF8800B4977600B4977600B497
      7600B497760000000000C8D0D400C8D0D4000000000000000000FFFFFF00E8D9
      BE00E3D1AD00E3D1AD00D8C49F00D4B38900B1947300B1947300B1947300FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F9F8F700F9F8F700FAFAF900FCFC
      FB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C8D0D400C8D0D400C8D0D4000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000900000000100010000000000800400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFF00F000000008003E00700000000
      8003C00300000000000380010000000000070000000000000003000000000000
      8003000000000000800300000000000080070000000000008007000000000000
      800700000000000080070000000000008007800100000000C007C00300000000
      E00FE00700000000FFFFF00F00000000FFFFFF03FF03F00F801F00010001E007
      800F00010001C003800700010001800180070000000000008007000100010000
      8007000100010000800700010001000080070003000300008007000700070000
      800700070007000080070007000700008007000700078001C007000F000FC003
      E00F001F001FE007FFFF003F003FF00FC001C001F9FFFFFFC001C001F103FFFF
      C001C001F00003FFC001C001F00001FFC001C001F00000FFC001C001F000003F
      C001C0010000801FC001C0010000C00FC001C0010000E007C001C0010000F007
      C001C0010001F007C001C001000FF807C001C001001FFC07C001C001003FFE07
      C001C00107FFFF0FFFFFFFFFFFFFFF9FFFFFFFFFFFFFFFFFC007FFFFFFFFFFFF
      8003C001FFFFFFFF0001C001FFFFFFFF0001C001FFFFFE7F0001C001FC3FFC3F
      0001C001FC3FF81F0001C001FC3FF00F0001C001F00FFC3F0001C001F81FFC3F
      0001C001FC3FFC3F00018001FE7FFFFF000181FFFFFFFFFF0001E7FFFFFFFFFF
      8003E7FFFFFFFFFFC007FFFFFFFFFFFFFFFFFFF8FFFFF00FFFFFFFF0FFFFE007
      FFFFFFE0FE0FC003FFFFFFC198078001FFFFFF8380030000E7FFF18780030000
      CF83C00F00010000DFC3803F00010000DFE3003F00810000DFD3001F00010000
      CF3B001F00010000E0FF001F07810000FFFF003FFF018001FFFF003FFF83C003
      FFFF807FFFC7E007FFFFC0FFFFFFF00F0000FFFFFFFFFFFF0000800180018001
      0000800180018001E007800180018001E007800180018001E007800180018001
      E007800180018001E007800180018001E007BC0180018001E007A40180018001
      E007E70180018001FFFF810180018001F81F810180018001F81FE70280018001
      F81FA40480018001FFFFFFF8FFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00FFFFFFFF
      FE008000FFFFEFFDFE000000FFFFC7FFFE000000FFFFC3FB80000000FFF7E3F7
      80000001C1F7F1E780000003C3FBF8CF80000003C7FBFC1F80010003CBFBFE3F
      80030003DCF7FC1F80070FC3FF0FF8CF807F0003FFFFE1E780FF8007FFFFC3F3
      81FFF87FFFFFC7FDFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF800100018CE3F9FF
      800100010001F6CF800100018001F6B7800100018000F6B7800100018000F8B7
      800100018000FE8F800100018000FE3F800100018001FF7F80010001C003FE3F
      80010001F003FEBF80010001FC03FC9F80018001FE03FDDF8002C007FE01FDDF
      8004C00FFF0FFDDFFFF8C01FFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object FormIniFileCompo: TIniFileCompo
    CaseSensitive = False
    FileName = 'config.tls'
    Left = 96
    Top = 400
  end
  object RichEditPopup: TPopupMenu
    Images = ToolImageList
    Left = 664
    Top = 376
    object Undo2: TMenuItem
      Action = EditUndoAction
      SubMenuImages = ToolImageList
    end
    object Repeat2: TMenuItem
      Action = EditRedoAction
      SubMenuImages = ToolImageList
    end
    object N10: TMenuItem
      Caption = '-'
    end
    object Cut2: TMenuItem
      Action = EditCutAction
      SubMenuImages = ToolImageList
    end
    object Copy2: TMenuItem
      Action = EditCopyAction
      SubMenuImages = ToolImageList
    end
    object Paste2: TMenuItem
      Action = EditPasteAction
      SubMenuImages = ToolImageList
    end
    object Delete2: TMenuItem
      Action = EditDeleteAction
      SubMenuImages = ToolImageList
    end
    object N11: TMenuItem
      Caption = '-'
    end
    object A3: TMenuItem
      Action = EditSelectAllAction
    end
    object N50: TMenuItem
      Caption = '-'
    end
    object N51: TMenuItem
      Action = SearchDspTextAction
      Hint = #34920#31034#20013#12398#12486#12461#12473#12488#12363#12425#36984#25246#20013#12398#12486#12461#12473#12488#12434#12522#12473#12488#12450#12483#12503#12375#12414#12377#12290
    end
    object N42: TMenuItem
      Caption = '-'
    end
    object N43: TMenuItem
      Action = SetBookMarkAction
    end
    object W1: TMenuItem
      Action = DeleteBookMarkAction
    end
    object M1: TMenuItem
      Action = DeleteAllBookMarkAction
    end
  end
  object TreeViewPopup: TPopupMenu
    Images = ToolImageList
    OnPopup = TreeViewPopupPopup
    Left = 152
    Top = 176
    object C2: TMenuItem
      Action = NewFolderAction
    end
    object New2: TMenuItem
      Action = NewFileAction
    end
    object C3: TMenuItem
      Action = ClipToFileAction
    end
    object N15: TMenuItem
      Caption = '-'
    end
    object O3: TMenuItem
      Action = FileOpenAction
    end
    object F3: TMenuItem
      Action = FolderOpenAction
    end
    object N13: TMenuItem
      Caption = '-'
    end
    object Copy3: TMenuItem
      Action = DeleteItemAction
    end
    object N18: TMenuItem
      Caption = '-'
    end
    object S2: TMenuItem
      Caption = #12484#12522#12540#12398#20006#12409#26367#12360'(&S)'
      object N19: TMenuItem
        Action = SortAlphaUpAction
      end
      object N20: TMenuItem
        Action = SortAlphaDownAction
      end
      object N21: TMenuItem
        Caption = '-'
      end
      object N22: TMenuItem
        Action = SortDayUoAction
      end
      object N23: TMenuItem
        Action = SortDayDownAction
      end
      object N24: TMenuItem
        Caption = '-'
      end
      object N25: TMenuItem
        Action = SortUpDayUpAction
      end
      object N26: TMenuItem
        Action = SortUpDayDownAction
      end
      object N27: TMenuItem
        Caption = '-'
      end
      object N28: TMenuItem
        Action = SortExtAction
      end
      object N29: TMenuItem
        Action = SortDspTypeAction
      end
    end
    object N46: TMenuItem
      Caption = #12450#12452#12486#12512#12398#20280#32302'(&I)'
      object N47: TMenuItem
        Action = AllExpandAction
      end
      object N48: TMenuItem
        Action = AllCollapceAction
      end
    end
    object N16: TMenuItem
      Caption = '-'
    end
    object N14: TMenuItem
      Action = EditItemAction
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 32
    Top = 80
  end
  object OptionIniFileCompo: TIniFileCompo
    CaseSensitive = False
    FileName = 'option.tls'
    Left = 640
    Top = 80
  end
  object FolderDialog1: TFolderDialog
    RootFolder = rfDeskTop
    Title = #12501#12457#12523#12480#12540#12434#36984#25246#12375#12390#19979#12373#12356#12290
    Left = 64
    Top = 80
  end
  object UpTimer: TTimer
    Enabled = False
    Interval = 50
    OnTimer = UpTimerTimer
    Left = 8
    Top = 120
  end
  object DownTimer: TTimer
    Enabled = False
    Interval = 50
    OnTimer = DownTimerTimer
    Left = 8
    Top = 376
  end
  object LeftTimer: TTimer
    Enabled = False
    Interval = 20
    OnTimer = LeftTimerTimer
    Top = 256
  end
  object RightTimer: TTimer
    Enabled = False
    Interval = 20
    OnTimer = RightTimerTimer
    Left = 152
    Top = 256
  end
  object HitImageList: TImageList
    Left = 584
    Top = 368
    Bitmap = {
      494C010106000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EF00EF00EF00
      EF00EF00EF00EF00EF00EF00EF00EF00EF00EF00EF00EF00EF00EF00EF00FF00
      FF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001818
      1800BDAD9C00EFDECE00F7F7E700F7F7EF00F7F7E700EFD6BD00C6A584002921
      21000000000000000000000000000000000000000000EF00EF00000000001010
      100008080000000800000808000000080000000800000808000000000000AD00
      AD00FF00FF00FF00FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000052524A00E7CE
      B500F7F7EF00FFF7F700FFF7EF00FFF7EF00FFF7EF00F7F7C600F7EFBD00DEBD
      840073635A0000000000000000000000000000000000EF00EF0018181800ADB5
      940052840000318400004284000042840000398400004A840000182100001010
      1000B500B500FF00FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000029212100DEBD9C00F7E7
      D600F7E7DE00F7E7DE00F7E7DE00F7E7DE00EFDEAD00EFDEA500EFDEA500EFDE
      9C00CEA5630042212100000000000000000000000000EF00EF00181818009CB5
      9400318400004A84000039840000428400004284000031840000082100006363
      630010101000EF00EF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CEA57300DEBD9400EFD6
      B500EFD6B500EFD6B500EFD6AD00E7CE8400E7C68400E7C68400E7C68400DEC6
      7300CEAD6B00C6945A00000000000000000000000000EF00EF0018181800ADB5
      94004A8400003984000042840000428400003984000042840000182100006363
      630010101000EF00EF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004A292900D6AD7B00D6AD7B00DEBD
      8C00D6B57300CEAD5A00CEA55200CEA55200CEA55200CEA55200CEA55200CEA5
      5200C6944A00BD844A005A3121000000000000000000EF00EF0018181800A5B5
      9400398400004284000039840000428400004284000039840000082100006363
      630010101000EF00EF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A57B6B00DEB59400D6AD8400CEA5
      6B00C6944A00BD944A00BD944A00BD944A00BD944A00B58C4200BD8C4200BD8C
      4A00AD7B3900AD733100945A29000000000000000000EF00EF0018181800A5B5
      9400428400003984000042840000428400003984000042840000102100006363
      630010101000EF00EF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A5734200AD7B4200AD7B4200AD7B
      4200AD7B4200AD7B4200A57B4200A57B4200A57339009C6B3100AD7B4200B584
      5200AD845200AD845200AD7B4A000000000000000000EF00EF0018181800A5B5
      9400398400004284000039840000428400004284000039840000102100006363
      630010101000EF00EF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000946B42009C7342009C7342009473
      42009C734A009C734A009C734A00946B3900946B39009C734A00A57B5200A57B
      52009C7B4A009C734A0094734A000000000000000000EF00EF0018181800A5B5
      9400398400004284000039840000428400004284000039840000082100006363
      630010101000EF00EF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000845A42008C6B4A00846B42009C84
      63009C846300947B5A0094735200947B5A009C8463009C846B009C846B009C84
      6B0084634200846342007B5239000000000000000000EF00EF0018181800ADB5
      9400428400003984000042840000428400003984000042840000102100006363
      630010101000EF00EF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007B4A42006B5A420084735A009C8C
      7B009C8C7B009C8C7B009C8C7B00A5948400A5948400A5948400A5948400A594
      8400846B5A00635231006B4231000000000000000000EF00EF00181818009CB5
      9400318400004284000039840000428400004284000039840000082100006363
      630010101000EF00EF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000524231008C7B7300ADA5
      9C00ADA59C00ADA59C00ADA59C00ADA59C00ADA5A500ADA5A500ADA59C00ADA5
      9C00847B6B004A392100000000000000000000000000EF00EF00000000002129
      2100081800001018000008180000081800001018000008180000000800006363
      630010101000EF00EF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000008452420031312900D6D6
      D600C6C6BD00C6C6BD00C6C6BD00C6C6C600C6C6C600C6C6C600C6C6BD00D6D6
      D6003129210073423100000000000000000000000000FF00FF00B500B5002121
      21009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C009C9C9C008484
      840010101000EF00EF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007B4A39004A4A
      4A00FFF7F700E7E7E700E7E7E700E7E7E700E7E7E700E7E7E700F7F7F7004A4A
      4A006339290000000000000000000000000000000000FF00FF00FF00FF00B500
      B500101010001010100010101000101010001010100010101000101010001010
      1000C600C600FF00FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000005A31
      21003121180073737300CECECE00EFEFEF00CECECE006B737300292118004A31
      21000000000000000000000000000000000000000000FF00FF00FF00FF00FF00
      FF00EF00EF00EF00EF00EF00EF00EF00EF00EF00EF00EF00EF00EF00EF00EF00
      EF00FF00FF00FF00FF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C6C6C6008484
      0000008400008484000000840000848400000084000084840000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001010
      10005263A5003952A500529CFF005A9CFF00528CF7004284FF005A73C6001010
      1800000000000000000000000000000000000000000000000000C6C6C6000084
      0000848400000084000084840000008400008484000000840000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000039394200315A
      E7005A94FF005AADFF005AADFF005AB5FF005AA5FF005AA5FF00529CFF00316B
      F7004A4A63000000000000000000000000000000000000000000C6C6C6008484
      0000008400008484000000840000848400000084000084840000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000101029002942D6005A73
      F7005A7BF7005284E700527BDE00528CF7005A94FF005273DE00529CFF004A8C
      F700295AF7001010310000000000000000000000000000000000C6C6C6000084
      0000848400000084000084840000008400008484000000840000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      000000000000000000000000000000000000000000003152EF004252E7004252
      BD004A6BEF00526BF7004A73DE00428CFF004A84F700528CFF004A73E7004A8C
      FF00396BF700315AEF0000000000000000000000000000000000C6C6C6008484
      0000008400008484000000840000848400000084000084840000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      000000000000000000000000000000000000210818003152E7003942C6004252
      C6004263EF004252D6003963C6004273F7003963D600425ADE004273F700395A
      D6003963F700315AF70021185A00000000000000000000000000C6C6C6000084
      0000848400000084000084840000008400008484000000840000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      00000000000000000000000000000000000029215A00314ADE003142CE003142
      B500314ABD003142AD003952D6003963DE00316BF700316BF700394ACE00315A
      D600314ACE002952F7003142BD00000000000000000000000000C6C6C6008484
      0000008400008484000000840000848400000084000084840000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      00000000000000000000000000000000000029297B002939C60029318C002939
      8C00294AD60029319C002939B5002942A500294ABD00294AB500294ACE003139
      BD002952D6002942AD00294AC600000000000000000000000000C6C6C6000084
      0000848400000084000084840000008400008484000000840000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      00000000000000000000000000000000000021297B0021297B0021319C002131
      8C003142AD0029316B0029318400294294003152C6002952BD00294AC6002131
      9C00213194002942BD0029399400000000000000000000000000C6C6C6008484
      0000008400008484000000840000848400000084000084840000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002110390021297B0018217B004A52
      8C00424A7B00424A8C00424A8400425AA500425AA500425AAD00425AAD004A5A
      AD0018216B001818420029296B00000000000000000000000000C6C6C6000084
      0000848400000084000084840000008400008484000000840000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000031184A0010185200393963006B73
      94006B73A500636B8C00636B8C006B739C006B739C006B73AD006B73A5006B73
      94003131520010185A0021081000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000101039005A6384008C94
      AD009494AD008C94A5008C8C9C008C8C9C008C949C009494AD00949CAD00949C
      B50052527300081031000000000000000000000000000000000000000000C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003118520018183100CECE
      D600BDBDC600B5B5BD00BDBDC600BDBDBD00BDBDC600BDBDC600B5BDC600CED6
      D600101831003110420000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000031184A00424A
      4A00F7F7FF00E7E7E700DEDEE700DEE7E700DEDEE700E7E7E700F7F7F7003942
      4200291852000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001000
      08001810290073737300CECECE00EFEFEF00CECECE006B6B6B00100821001810
      390000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000F01FFFFF00000000C007C00300000000
      8003800300000000800180030000000000018003000000000001800300000000
      0001800300000000000180030000000000018003000000000001800300000000
      0001800300000000000180030000000080018003000000008003800300000000
      C007800300000000E00F800300000000FFFFFFFFFFFFF01F801FFFFFFFFFC007
      800FFFFFFFFF80038007FFFFFFFF80018007FFFFFC7F00018007FC7FF83F0001
      8007F83FF01F00018007F83FF01F00018007F83FF01F00018007FC7FF83F0001
      8007FFFFFC7F00018007FFFFFFFF00018007FFFFFFFF8001C007FFFFFFFF8003
      E00FFFFFFFFFC007FFFFFFFFFFFFE00F00000000000000000000000000000000
      000000000000}
  end
  object DelphiFountain: TDelphiFountain
    FileExtList.Strings = (
      '.dpr'
      '.inc'
      '.pas')
    Brackets = <
      item
        ItemColor.BkColor = clNone
        ItemColor.Color = clGreen
        ItemColor.Style = []
        LeftBracket = '{'
        RightBracket = '}'
      end
      item
        ItemColor.BkColor = clNone
        ItemColor.Color = clGreen
        ItemColor.Style = []
        LeftBracket = '(*'
        RightBracket = '*)'
      end>
    Reserve.BkColor = clNone
    Reserve.Color = clNavy
    Reserve.Style = [fsBold]
    ReserveWordList.Strings = (
      'absolute'
      'abstract'
      'and'
      'array'
      'as'
      'asm'
      'assembler'
      'automated'
      'begin'
      'case'
      'cdecl'
      'class'
      'const'
      'constructor'
      'default'
      'destructor'
      'dispid'
      'dispinterface'
      'div'
      'do'
      'downto'
      'dynamic'
      'else'
      'end'
      'except'
      'export'
      'exports'
      'external'
      'far'
      'file'
      'finalization'
      'finally'
      'for'
      'forward'
      'function'
      'goto'
      'if'
      'implementation'
      'in'
      'inherited'
      'initialization'
      'inline'
      'interface'
      'is'
      'label'
      'library'
      'message'
      'mod'
      'near'
      'nil'
      'nodefault'
      'not'
      'object'
      'of'
      'or'
      'out'
      'overload'
      'override'
      'packed'
      'pascal'
      'private'
      'procedure'
      'program'
      'property'
      'protected'
      'public'
      'published'
      'raise'
      'readonly'
      'record'
      'register'
      'repeat'
      'resident'
      'resourcestring'
      'safecall'
      'set'
      'shl'
      'shr'
      'stdcall'
      'stored'
      'string'
      'then'
      'threadvar'
      'to'
      'try'
      'type'
      'unit'
      'until'
      'uses'
      'var'
      'virtual'
      'while'
      'with'
      'writeonly'
      'xor')
    Ank.BkColor = clNone
    Ank.Color = clBlack
    Ank.Style = []
    AsmBlock.BkColor = clNone
    AsmBlock.Color = clBlack
    AsmBlock.Style = [fsBold]
    Comment.BkColor = clNone
    Comment.Color = clGreen
    Comment.Style = []
    DBCS.BkColor = clNone
    DBCS.Color = clBlack
    DBCS.Style = []
    Int.BkColor = clNone
    Int.Color = clBlack
    Int.Style = []
    Str.BkColor = clNone
    Str.Color = clFuchsia
    Str.Style = []
    Symbol.BkColor = clNone
    Symbol.Color = clBlack
    Symbol.Style = []
    Left = 336
    Top = 80
  end
  object HTMLFountain: THTMLFountain
    FileExtList.Strings = (
      '.htm'
      '.html')
    Brackets = <
      item
        ItemColor.BkColor = clNone
        ItemColor.Color = clGreen
        ItemColor.Style = []
        LeftBracket = '<!--'
        RightBracket = '-->'
      end>
    Reserve.BkColor = clNone
    Reserve.Color = clNavy
    Reserve.Style = [fsBold]
    Ampersand.BkColor = clYellow
    Ampersand.Color = clBlack
    Ampersand.Style = []
    Mail.BkColor = clNone
    Mail.Color = clBlue
    Mail.Style = [fsUnderline]
    Str.BkColor = clNone
    Str.Color = clFuchsia
    Str.Style = []
    TagAttribute.BkColor = clNone
    TagAttribute.Color = clRed
    TagAttribute.Style = []
    TagAttributeValue.BkColor = clNone
    TagAttributeValue.Color = clMaroon
    TagAttributeValue.Style = []
    TagColor.BkColor = clNone
    TagColor.Color = clBlue
    TagColor.Style = []
    TagElement.BkColor = clNone
    TagElement.Color = clPurple
    TagElement.Style = []
    Url.BkColor = clNone
    Url.Color = clBlue
    Url.Style = [fsUnderline]
    Left = 368
    Top = 80
  end
  object PerlFountain: TPerlFountain
    FileExtList.Strings = (
      '.cgi'
      '.pl'
      '.pm'
      '.pod')
    Brackets = <>
    Reserve.BkColor = clNone
    Reserve.Color = clNavy
    Reserve.Style = [fsBold]
    ReserveWordList.Strings = (
      'cmp'
      'do'
      'else'
      'elsif'
      'eq'
      'for'
      'foreach'
      'ge'
      'gt'
      'if'
      'le'
      'lt'
      'ne'
      'package'
      'require'
      'return'
      'sub'
      'unless'
      'until'
      'use'
      'while')
    Ampersand.BkColor = clYellow
    Ampersand.Color = clBlack
    Ampersand.Style = []
    Ank.BkColor = clNone
    Ank.Color = clRed
    Ank.Style = []
    BackQuotation.BkColor = clNone
    BackQuotation.Color = clBlack
    BackQuotation.Style = []
    Comment.BkColor = clNone
    Comment.Color = clGreen
    Comment.Style = []
    DBCS.BkColor = clNone
    DBCS.Color = clBlack
    DBCS.Style = []
    DoubleQuotation.BkColor = clNone
    DoubleQuotation.Color = clFuchsia
    DoubleQuotation.Style = []
    Here.BkColor = clNone
    Here.Color = clBlack
    Here.Style = []
    HereHtml = True
    Int.BkColor = clNone
    Int.Color = clBlack
    Int.Style = []
    LiteralQuotation.BkColor = clNone
    LiteralQuotation.Color = clPurple
    LiteralQuotation.Style = []
    Pattern.BkColor = clNone
    Pattern.Color = clBlack
    Pattern.Style = []
    PerlVar.BkColor = clNone
    PerlVar.Color = clBlue
    PerlVar.Style = []
    SingleQuotation.BkColor = clNone
    SingleQuotation.Color = clFuchsia
    SingleQuotation.Style = []
    Symbol.BkColor = clNone
    Symbol.Color = clBlack
    Symbol.Style = []
    TagAttribute.BkColor = clNone
    TagAttribute.Color = clBlack
    TagAttribute.Style = []
    TagAttributeValue.BkColor = clNone
    TagAttributeValue.Color = clBlack
    TagAttributeValue.Style = []
    TagColor.BkColor = clNone
    TagColor.Color = clBlack
    TagColor.Style = []
    TagElement.BkColor = clNone
    TagElement.Color = clBlack
    TagElement.Style = []
    Left = 400
    Top = 80
  end
  object CppFountain: TCppFountain
    FileExtList.Strings = (
      '.c'
      '.cpp'
      '.h'
      '.hpp')
    Brackets = <
      item
        ItemColor.BkColor = clNone
        ItemColor.Color = clGreen
        ItemColor.Style = []
        LeftBracket = '/*'
        RightBracket = '*/'
      end>
    Reserve.BkColor = clNone
    Reserve.Color = clNavy
    Reserve.Style = [fsBold]
    ReserveWordList.Strings = (
      'asm'
      'auto'
      'break'
      'case'
      'catch'
      'char'
      'class'
      'const'
      'continue'
      'default'
      'delete'
      'do'
      'double'
      'else'
      'enum'
      'extern'
      'float'
      'for'
      'friend'
      'goto'
      'if'
      'inline'
      'int'
      'long'
      'new'
      'operator'
      'private'
      'protected'
      'public'
      'register'
      'return'
      'short'
      'signed'
      'sizeof'
      'static'
      'struct'
      'switch'
      'template'
      'this'
      'throw'
      'try'
      'typedef'
      'union'
      'unsigned'
      'virtual'
      'void'
      'volatile'
      'while')
    Ank.BkColor = clNone
    Ank.Color = clBlack
    Ank.Style = []
    Comment.BkColor = clNone
    Comment.Color = clGreen
    Comment.Style = []
    DBCS.BkColor = clNone
    DBCS.Color = clBlack
    DBCS.Style = []
    Int.BkColor = clNone
    Int.Color = clBlack
    Int.Style = []
    Str.BkColor = clNone
    Str.Color = clFuchsia
    Str.Style = []
    Symbol.BkColor = clNone
    Symbol.Color = clBlack
    Symbol.Style = []
    PreProcessor.BkColor = clNone
    PreProcessor.Color = clPurple
    PreProcessor.Style = []
    Left = 432
    Top = 80
  end
  object JavaFountain: TJavaFountain
    FileExtList.Strings = (
      '.class'
      '.java')
    Brackets = <
      item
        ItemColor.BkColor = clNone
        ItemColor.Color = clGreen
        ItemColor.Style = []
        LeftBracket = '/*'
        RightBracket = '*/'
      end>
    Reserve.BkColor = clNone
    Reserve.Color = clNavy
    Reserve.Style = [fsBold]
    ReserveWordList.Strings = (
      'abstract'
      'boolean'
      'break'
      'byte'
      'case'
      'catch'
      'char'
      'class'
      'const'
      'continue'
      'default'
      'do'
      'double'
      'else'
      'extends'
      'final'
      'finally'
      'float'
      'for'
      'goto'
      'if'
      'implements'
      'import'
      'instanceof'
      'int'
      'interface'
      'long'
      'native'
      'new'
      'package'
      'private'
      'protected'
      'public'
      'return'
      'short'
      'static'
      'super'
      'switch'
      'synchronized'
      'this'
      'throw'
      'throws'
      'transient'
      'try'
      'void'
      'volatile'
      'while')
    Ank.BkColor = clNone
    Ank.Color = clBlack
    Ank.Style = []
    Comment.BkColor = clNone
    Comment.Color = clGreen
    Comment.Style = []
    DBCS.BkColor = clNone
    DBCS.Color = clBlack
    DBCS.Style = []
    Int.BkColor = clNone
    Int.Color = clBlack
    Int.Style = []
    Str.BkColor = clNone
    Str.Color = clFuchsia
    Str.Style = []
    Symbol.BkColor = clNone
    Symbol.Color = clBlack
    Symbol.Style = []
    Left = 464
    Top = 80
  end
  object COBOLFountain: TCOBOLFountain
    FileExtList.Strings = (
      '.cbl'
      '.cob')
    Brackets = <>
    Reserve.BkColor = clNone
    Reserve.Color = clNavy
    Reserve.Style = [fsBold]
    ReserveWordList.Strings = (
      'ACCEPT'
      'ACCESS'
      'ACTUAL'
      'ADD'
      'ADDRESS'
      'ADVANCING'
      'AFTER'
      'ALL'
      'ALPHABET'
      'ALPHABETIC'
      'ALPHABETIC-LOWER'
      'ALPHABETIC-UPPER'
      'ALPHANUMERIC'
      'ALPHANUMERIC-EDITED'
      'ALSO'
      'ALTER'
      'ALTERNATE'
      'AND'
      'ANY'
      'APPLY'
      'ARE'
      'AREA'
      'AREAS'
      'AS'
      'ASCENDING'
      'ASSIGN'
      'AT'
      'AUTHOR'
      'AUTO'
      'AUTOMATIC'
      'BACKGROUND-COLOR'
      'BEFORE'
      'BEGINNING'
      'BELL'
      'BINARY'
      'BIT'
      'BITS'
      'BLANK'
      'BLINK'
      'BLOCK'
      'BOOLEAN'
      'BOTTOM'
      'BY'
      'CALL'
      'CANCEL'
      'CBL'
      'CD'
      'CF'
      'CH'
      'CHANGED'
      'CHARACTER'
      'CHARACTERS'
      'CLASS'
      'CLASS-ID'
      'CLOCK-UNITS'
      'CLOSE'
      'COBOL'
      'CODE'
      'CODE-SET'
      'COLLATING'
      'COLUMN'
      'COMMA'
      'COMMAND'
      'COMMIT'
      'COMMON'
      'COMMUNICATION'
      'COMP'
      'COMP-1'
      'COMP-2'
      'COMP-3'
      'COMP-4'
      'COMP-5'
      'COMPUTATIONAL'
      'COMPUTATIONAL-1'
      'COMPUTATIONAL-2'
      'COMPUTATIONAL-3'
      'COMPUTATIONAL-4'
      'COMPUTATIONAL-5'
      'COMPUTE'
      'COM-REG'
      'CONFIGURATION'
      'CONNECT'
      'CONTAINS'
      'CONTENT'
      'CONTINUE'
      'CONTROL'
      'CONTROLS'
      'CONVERTING'
      'COPY'
      'CORE-INDEX'
      'CORR'
      'CORRESPONDING'
      'COUNT'
      'CRT'
      'CRT-UNDER'
      'CURRENCY'
      'CURRENT'
      'CURSOR'
      'DATA'
      'DATE'
      'DATE-COMPILED'
      'DATE-WRITTEN'
      'DAY'
      'DAY-OF-WEEK'
      'DB'
      'DE'
      'DEBUG-CONTENTS'
      'DEBUGGING'
      'DEBUG-ITEM'
      'DEBUG-LINE'
      'DEBUG-NAME'
      'DEBUG-SUB-1'
      'DEBUG-SUB-2'
      'DEBUG-SUB-3'
      'DECIMAL-POINT'
      'DECLARATIVES'
      'DELETE'
      'DELIMITED'
      'DELIMITER'
      'DEPENDING'
      'DESCENDING'
      'DESTINATION'
      'DETAIL'
      'DISABLE'
      'DISCONNECT'
      'DISPLAY'
      'DIVIDE'
      'DIVISION'
      'DOWN'
      'DUPLICATE'
      'DUPLICATES'
      'DYNAMIC'
      'EGI'
      'EJECT'
      'ELSE'
      'EMI'
      'EMPTY'
      'ENABLE'
      'END'
      'END-ACCEPT'
      'END-ADD'
      'END-CALL'
      'END-COMPUTE'
      'END-DELETE'
      'END-DISPLAY'
      'END-DIVIDE'
      'END-EVALUATE'
      'END-EXEC'
      'END-IF'
      'ENDING'
      'END-INVOKE'
      'END-MULTIPLY'
      'END-OF-PAGE'
      'END-PERFORM'
      'END-READ'
      'END-RECEIVE'
      'END-RETURN'
      'END-REWRITE'
      'END-SEARCH'
      'END-START'
      'END-STRING'
      'END-SUBTRACT'
      'END-UNSTRING'
      'END-WRITE'
      'ENTER'
      'ENTRY'
      'ENVIRONMENT'
      'EOL'
      'EOP'
      'EOS'
      'EQUAL'
      'EQUALS'
      'ERASE'
      'ERROR'
      'ESI'
      'EVALUATE'
      'EVERY'
      'EXAMINE'
      'EXCEEDS'
      'EXCEPTION'
      'EXCLUSIVE'
      'EXEC'
      'EXIT'
      'EXOR'
      'EXTEND'
      'EXTERNAL'
      'FALSE'
      'FD'
      'FETCH'
      'FILE'
      'FILE-CONTROL'
      'FILE-LIMIT'
      'FILE-LIMITS'
      'FILLER'
      'FINAL'
      'FIND'
      'FIRST'
      'FOOTING'
      'FOR'
      'FOREGROUND-COLOR'
      'FORMAT'
      'FREE'
      'FROM'
      'FULL'
      'FUNCTION'
      'GENERATE'
      'GET'
      'GIVING'
      'GLOBAL'
      'GO'
      'GOBACK'
      'GREATER'
      'GRID'
      'GROUP'
      'HEADING'
      'HIGHLIGHT'
      'HIGH-VALUE'
      'HIGH-VALUES'
      'ID'
      'IDENTIFICATION'
      'IF'
      'IN'
      'INCLUDE'
      'INDEX'
      'INDEXED'
      'INDICATE'
      'INHERITS'
      'INITIAL'
      'INITIALIZE'
      'INITIATE'
      'INPUT'
      'INPUT-OUTPUT'
      'INSPECT'
      'INSTALLATION'
      'INTO'
      'INVALID'
      'INVARIANT'
      'INVOKE'
      'I-O'
      'I-O-CONTROL'
      'IS'
      'JUST'
      'JUSTIFIED'
      'KEY'
      'LABEL'
      'LAST'
      'LEADING'
      'LEFT'
      'LEFT-JUSTIFY'
      'LEFTLINE'
      'LENGTH'
      'LESS'
      'LIMIT'
      'LIMITS'
      'LINAGE'
      'LINAGE-COUNTER'
      'LINE'
      'LINE-COUNTER'
      'LINES'
      'LINKAGE'
      'LOCK'
      'LOWLIGHT'
      'LOW-VALUE'
      'LOW-VALUES'
      'MANUAL'
      'MEMBER'
      'MEMORY'
      'MERGE'
      'MESSAGE'
      'METHOD'
      'METHOD-ID'
      'MODE'
      'MODIFY'
      'MODULES'
      'MORE-LABELS'
      'MOVE'
      'MULTIPLE'
      'MULTIPLY'
      'NAMED'
      'NATIONAL'
      'NATIONAL-EDITED'
      'NATIVE'
      'NEGATIVE'
      'NEXT'
      'NO'
      'NOMINAL'
      'NOT'
      'NOTE'
      'NULL'
      'NULLS'
      'NUMBER'
      'NUMERIC'
      'NUMERIC-EDITED'
      'OBJECT'
      'OBJECT-COMPUTER'
      'OCCURS'
      'OF'
      'OFF'
      'OMITTED'
      'ON'
      'ONLY'
      'OPEN'
      'OPTIONAL'
      'OR'
      'ORDER'
      'ORGANIZATION'
      'OTHER'
      'OTHERWISE'
      'OUTPUT'
      'OVERFLOW'
      'OVERLINE'
      'OWNER'
      'PACKED-DECIMAL'
      'PADDING'
      'PAGE'
      'PAGE-COUNTER'
      'PASSWORD'
      'PERFORM'
      'PF'
      'PH'
      'PIC'
      'PICTURE'
      'PLUS'
      'POINTER'
      'POSITION'
      'POSITIONING'
      'POSITIVE'
      'PREVIOUS'
      'PRINTING'
      'PRIOR'
      'PROCEDURE'
      'PROCEDURES'
      'PROCEED'
      'PROCESSING'
      'PROGRAM'
      'PROGRAM-ID'
      'PROMPT'
      'PROPERTY'
      'PROTOTYPE'
      'PURGE'
      'QUEUE'
      'QUOTE'
      'QUOTES'
      'RANDOM'
      'RD'
      'READ'
      'READY'
      'RECEIVE'
      'RECONNECT'
      'RECORD'
      'RECORDING'
      'RECORD-OVERFLOW'
      'RECORDS'
      'REDEFINES'
      'REEL'
      'REFERENCE'
      'REFERENCES'
      'RELATIVE'
      'RELEASE'
      'RELOAD'
      'REMAINDER'
      'REMARKS'
      'REMOVAL'
      'RENAMES'
      'REORG-CRITERIA'
      'REPLACE'
      'REPLACING'
      'REPORT'
      'REPORTING'
      'REPORTS'
      'REPOSITORY'
      'REQUIRED'
      'RERUN'
      'RESERVE'
      'RESET'
      'RETAINING'
      'RETURN'
      'RETURN-CODE'
      'RETURNING'
      'REVERSED'
      'REVERSE-VIDEO'
      'REWIND'
      'REWRITE'
      'RF'
      'RH'
      'RIGHT'
      'RIGHT-JUSTIFY'
      'ROLLBACK'
      'ROUNDED'
      'RUN'
      'SA'
      'SAME'
      'SCREEN'
      'SD'
      'SEARCH'
      'SECTION'
      'SECURE'
      'SECURITY'
      'SEEK'
      'SEGMENT'
      'SEGMENT-LIMIT'
      'SELECT'
      'SELF'
      'SEND'
      'SENTENCE'
      'SEPARATE'
      'SEQUENCE'
      'SEQUENTIAL'
      'SERVICE'
      'SET'
      'SIGN'
      'SIZE'
      'SKIP1'
      'SKIP2'
      'SKIP3'
      'SORT'
      'SORT-CORE-SIZE'
      'SORT-FILE-SIZE'
      'SORT-MERGE'
      'SORT-MESSAGE'
      'SORT-MODE-SIZE'
      'SORT-RETURN'
      'SOURCE'
      'SOURCE-COMPUTER'
      'SPACE'
      'SPACE-FILL'
      'SPACES'
      'SPECIAL-NAMES'
      'STANDARD'
      'STANDARD-1'
      'STANDARD-2'
      'START'
      'STATUS'
      'STOP'
      'STORE'
      'STRING'
      'SUB-QUEUE-1'
      'SUB-QUEUE-2'
      'SUB-QUEUE-3'
      'SUBTRACT'
      'SUM'
      'SUPER'
      'SUPPRESS'
      'SYMBOLIC'
      'SYNC'
      'SYNCHRONIZED'
      'TABLE'
      'TALLY'
      'TALLYING'
      'TAPE'
      'TERMINAL'
      'TERMINATE'
      'TEST'
      'TEXT'
      'THAN'
      'THEN'
      'THROUGH'
      'THRU'
      'TIME'
      'TIMES'
      'TO'
      'TOP'
      'TRACE'
      'TRACK'
      'TRACK-AREA'
      'TRACK-LIMIT'
      'TRACKS'
      'TRAILING'
      'TRAILING-SIGN'
      'TRANSACTION'
      'TRANSCEIVE'
      'TRUE'
      'TYPE'
      'UNDERLINE'
      'UNEQUAL'
      'UNIT'
      'UNIVERSAL'
      'UNLOCK'
      'UNSTRING'
      'UNTIL'
      'UP'
      'UPDATE'
      'UPON'
      'USAGE'
      'USE'
      'USING'
      'VALUE'
      'VALUES'
      'VARYING'
      'WAIT'
      'WHEN'
      'WHEN-COMPILED'
      'WITH'
      'WITHIN'
      'WORDS'
      'WORKING-STORAGE'
      'WRITE'
      'WRITE-ONLY'
      'ZERO'
      'ZEROES'
      'ZERO-FILL'
      'ZEROS')
    Ank.BkColor = clNone
    Ank.Color = clBlack
    Ank.Style = []
    Comment.BkColor = clNone
    Comment.Color = clGreen
    Comment.Style = []
    DBCS.BkColor = clNone
    DBCS.Color = clBlack
    DBCS.Style = []
    Int.BkColor = clNone
    Int.Color = clBlack
    Int.Style = []
    Sequence.BkColor = clNone
    Sequence.Color = clBlack
    Sequence.Style = []
    Str.BkColor = clNone
    Str.Color = clFuchsia
    Str.Style = []
    Symbol.BkColor = clNone
    Symbol.Color = clBlack
    Symbol.Style = []
    Verb.BkColor = clNone
    Verb.Color = clNavy
    Verb.Style = [fsBold]
    VerbList.Strings = (
      'ACCEPT'
      'ADD'
      'ALTER'
      'CALL'
      'CANCEL'
      'CLOSE'
      'COMMIT'
      'COMPUTE'
      'CONNECT'
      'CONTINUE'
      'COPY'
      'DELETE'
      'DISABLE'
      'DISCONNECT'
      'DISPLAY'
      'DIVIDE'
      'ENABLE'
      'END-ACCEPT'
      'END-ADD'
      'END-CALL'
      'END-COMPUTE'
      'END-DELETE'
      'END-DISPLAY'
      'END-DIVIDE'
      'END-EVALUATE'
      'END-EXEC'
      'END-IF'
      'END-INVOKE'
      'END-MULTIPLY'
      'END-OF-PAGE'
      'END-PERFORM'
      'END-READ'
      'END-RECEIVE'
      'END-RETURN'
      'END-REWRITE'
      'END-SEARCH'
      'END-START'
      'END-STRING'
      'END-SUBTRACT'
      'END-UNSTRING'
      'END-WRITE'
      'ENTER'
      'ENTRY'
      'ERASE'
      'EVALUATE'
      'EXAMINE'
      'EXIT'
      'FETCH'
      'FIND'
      'GENERATE'
      'GET'
      'GO'
      'GOBACK'
      'IF'
      'INCLUDE'
      'INITIALIZE'
      'INITIATE'
      'INSPECT'
      'INVOKE'
      'MERGE'
      'MODIFY'
      'MOVE'
      'MULTIPLY'
      'NOTE'
      'OPEN'
      'PERFORM'
      'READ'
      'RECEIVE'
      'RECONNECT'
      'RELEASE'
      'RETURN'
      'REWRITE'
      'ROLLBACK'
      'SEARCH'
      'SELECT'
      'SEND'
      'SET'
      'SORT'
      'START'
      'STOP'
      'STORE'
      'STRING'
      'SUBTRACT'
      'SUPPRESS'
      'TERMINATE'
      'TRANSCEIVE'
      'UNLOCK'
      'UNSTRING'
      'USE'
      'WAIT'
      'WRITE')
    Left = 496
    Top = 80
  end
  object JSPFountain: TJSPFountain
    FileExtList.Strings = (
      '.jsp')
    Brackets = <
      item
        ItemColor.BkColor = clNone
        ItemColor.Color = clGreen
        ItemColor.Style = []
        LeftBracket = '<!--'
        RightBracket = '-->'
      end
      item
        ItemColor.BkColor = clNone
        ItemColor.Color = clGreen
        ItemColor.Style = []
        LeftBracket = '<%--'
        RightBracket = '--%>'
      end>
    Reserve.BkColor = clNone
    Reserve.Color = clNavy
    Reserve.Style = [fsBold]
    ReserveWordList.Strings = (
      'abstract'
      'autoFlush'
      'boolean'
      'break'
      'buffer'
      'byte'
      'case'
      'catch'
      'char'
      'charset'
      'class'
      'const'
      'contentType'
      'continue'
      'default'
      'do'
      'double'
      'else'
      'errorPage'
      'extends'
      'file'
      'final'
      'finally'
      'float'
      'for'
      'goto'
      'if'
      'implements'
      'import'
      'include'
      'info'
      'instanceof'
      'int'
      'interface'
      'isErrorPage'
      'isThreadSafe'
      'language'
      'long'
      'native'
      'new'
      'package'
      'page'
      'prefix'
      'private'
      'protected'
      'public'
      'return'
      'session'
      'short'
      'static'
      'super'
      'switch'
      'synchronized'
      'taglib'
      'this'
      'throw'
      'throws'
      'transient'
      'try'
      'uri'
      'void'
      'volatile'
      'while')
    Ampersand.BkColor = clYellow
    Ampersand.Color = clBlack
    Ampersand.Style = []
    Mail.BkColor = clNone
    Mail.Color = clBlue
    Mail.Style = [fsUnderline]
    Str.BkColor = clNone
    Str.Color = clFuchsia
    Str.Style = []
    TagAttribute.BkColor = clNone
    TagAttribute.Color = clRed
    TagAttribute.Style = []
    TagAttributeValue.BkColor = clNone
    TagAttributeValue.Color = clBlack
    TagAttributeValue.Style = []
    TagColor.BkColor = clNone
    TagColor.Color = clBlack
    TagColor.Style = []
    TagElement.BkColor = clNone
    TagElement.Color = clBlack
    TagElement.Style = []
    Url.BkColor = clNone
    Url.Color = clBlue
    Url.Style = [fsUnderline]
    Script.BkColor = clNone
    Script.Color = clBlack
    Script.Style = []
    Comment.BkColor = clNone
    Comment.Color = clGreen
    Comment.Style = []
    ReserveWordList2.Strings = (
      'forward'
      'getProperty'
      'include'
      'jsp'
      'param'
      'plugin'
      'setProperty'
      'useBean')
    Left = 528
    Top = 80
  end
  object PLSQLFountain: TPLSQLFountain
    FileExtList.Strings = (
      '.sql')
    Brackets = <
      item
        ItemColor.BkColor = clNone
        ItemColor.Color = clGreen
        ItemColor.Style = []
        LeftBracket = '/*'
        RightBracket = '*/'
      end>
    Reserve.BkColor = clNone
    Reserve.Color = clNavy
    Reserve.Style = [fsBold]
    ReserveWordList.Strings = (
      'ABORT'
      'ACCEPT'
      'ACCESS'
      'ADD'
      'ADMIN'
      'ALL'
      'ALTER'
      'AND'
      'ANY'
      'ARRAY'
      'ARRAYLEN'
      'AS'
      'ASC'
      'ASSERT'
      'ASSIGN'
      'AT'
      'AUDIT'
      'AUTHORIZATION'
      'AVG'
      'BASE_TABLE'
      'BEGIN'
      'BETWEEN'
      'BINARY_ARRAY'
      'BODY'
      'BOOLEAN'
      'BY'
      'CASCADE'
      'CASE'
      'CHAR'
      'CHAR_BASE'
      'CHECK'
      'CLOSE'
      'CLUSTER'
      'CLUSTERS'
      'COLAUTH'
      'COLUMN'
      'COMMENT'
      'COMMIT'
      'COMPRESS'
      'CONNECT'
      'CONSTANT'
      'CONSTRAINT'
      'CONSTRAINTS'
      'CONTENTS'
      'CRASH'
      'CREATE'
      'CURRENT'
      'CURRVAL'
      'CURSOR'
      'DATA_BASE'
      'DATABASE'
      'DATAFILE'
      'DATAFILES'
      'DATE'
      'DBA'
      'DEBUGOFF'
      'DEBUGON'
      'DECIMAL'
      'DECLARE'
      'DEFAULT'
      'DEFINE'
      'DEFINITION'
      'DELAY'
      'DELETE'
      'DESC'
      'DIGITS'
      'DISPOSE'
      'DISTINCT'
      'DO'
      'DROP'
      'ELSE'
      'ELSIF'
      'END'
      'ENTRY'
      'EXCEPTION'
      'EXCEPTION_INIT'
      'EXCLUSIVE'
      'EXECUTE'
      'EXISTS'
      'EXIT'
      'FALSE'
      'FETCH'
      'FILE'
      'FLOAT'
      'FOR'
      'FOREIGN'
      'FORM'
      'FROM'
      'FUNCTION'
      'GENERIC'
      'GOTO'
      'GRANT'
      'GROUP'
      'HAVING'
      'IDENTIFIED'
      'IF'
      'IMMEDIATE'
      'IN'
      'INCLUDING'
      'INCREMENT'
      'INDEX'
      'INDEXES'
      'INDICATOR'
      'INITIAL'
      'INSERT'
      'INTEGER'
      'INTERFACE'
      'INTERSECT'
      'INTO'
      'IS'
      'KEY'
      'LEVEL'
      'LIKE'
      'LIMITED'
      'LOCK'
      'LONG'
      'LOOP'
      'MAX'
      'MAXEXTENTS'
      'MIN'
      'MINUS'
      'MLSLABEL'
      'MOD'
      'MODE'
      'NATURAL'
      'NATURALN'
      'NEW'
      'NEXTVAL'
      'NOAUDIT'
      'NOCOMPRESS'
      'NOT'
      'NOWAIT'
      'NULL'
      'NUMBER'
      'NUMBER_BASE'
      'OF'
      'OFFLINE'
      'ON'
      'ONLINE'
      'OPEN'
      'OPTION'
      'OR'
      'ORDER'
      'OTHERS'
      'OUT'
      'PACKAGE'
      'PARTITION'
      'PCTFREE'
      'PLS_INTEGER'
      'POSITIVE'
      'POSITIVEN'
      'PRAGMA'
      'PRIMARY'
      'PRIOR'
      'PRIVATE'
      'PRIVILEGES'
      'PROCEDURE'
      'PUBLIC'
      'RAISE'
      'RANGE'
      'RAW'
      'REAL'
      'RECORD'
      'REF'
      'REFERENCES'
      'RELEASE'
      'REMR'
      'RENAME'
      'REPLACE'
      'RESOURCE'
      'RETURN'
      'REVERSE'
      'REVOKE'
      'ROLLBACK'
      'ROW'
      'ROWID'
      'ROWLABEL'
      'ROWNUM'
      'ROWS'
      'ROWTYPE'
      'RUN'
      'SAVEPOINT'
      'SCHEMA'
      'SELECT'
      'SEPARATE'
      'SEQUENCE'
      'SET'
      'SHARE'
      'SIZE'
      'SMALLINT'
      'SPACE'
      'SQL'
      'SQLCODE'
      'SQLERRM'
      'START'
      'STATE'
      'STATEMENT'
      'STDDEV'
      'SUBTYPE'
      'SUCCESSFUL'
      'SUM'
      'SYNONYM'
      'SYSDATE'
      'TABAUTH'
      'TABLE'
      'TABLES'
      'TABLESPACE'
      'TASK'
      'TERMINATE'
      'THEN'
      'TO'
      'TRIGGER'
      'TRUE'
      'TYPE'
      'UID'
      'UNION'
      'UNIQUE'
      'UPDATE'
      'USE'
      'USER'
      'VALIDATE'
      'VALUES'
      'VARCHAR'
      'VARCHAR2'
      'VARIANCE'
      'VIEW'
      'VIEWS'
      'WHEN'
      'WHENEVER'
      'WHERE'
      'WHILE'
      'WITH'
      'WORK'
      'WRITE'
      'XOR')
    Ank.BkColor = clNone
    Ank.Color = clBlack
    Ank.Style = []
    Comment.BkColor = clNone
    Comment.Color = clGreen
    Comment.Style = []
    Int.BkColor = clNone
    Int.Color = clBlack
    Int.Style = []
    Str.BkColor = clNone
    Str.Color = clBlack
    Str.Style = []
    Symbol.BkColor = clNone
    Symbol.Color = clBlack
    Symbol.Style = []
    Left = 560
    Top = 80
  end
  object RubyFountain: TRubyFountain
    FileExtList.Strings = (
      '.cgi'
      '.rb'
      '.wrb')
    Brackets = <>
    Reserve.BkColor = clNone
    Reserve.Color = clNavy
    Reserve.Style = [fsBold]
    ReserveWordList.Strings = (
      'alias'
      'and'
      'begin'
      'BEGIN'
      'break'
      'case'
      'class'
      'def'
      'defined'
      'do'
      'else'
      'elsif'
      'end'
      'END'
      'ensure'
      'false'
      'for'
      'if'
      'in'
      'module'
      'next'
      'nil'
      'not'
      'or'
      'redo'
      'rescue'
      'retry'
      'return'
      'self'
      'super'
      'then'
      'true'
      'undef'
      'unless'
      'until'
      'when'
      'while'
      'yield')
    Ank.BkColor = clNone
    Ank.Color = clBlack
    Ank.Style = []
    Comment.BkColor = clNone
    Comment.Color = clBlack
    Comment.Style = []
    Int.BkColor = clNone
    Int.Color = clBlack
    Int.Style = []
    Str.BkColor = clNone
    Str.Color = clFuchsia
    Str.Style = []
    Symbol.BkColor = clNone
    Symbol.Color = clBlack
    Symbol.Style = []
    GlobalVar.BkColor = clNone
    GlobalVar.Color = clBlack
    GlobalVar.Style = []
    InstanceVar.BkColor = clNone
    InstanceVar.Color = clBlack
    InstanceVar.Style = []
    ClassVar.BkColor = clNone
    ClassVar.Color = clBlack
    ClassVar.Style = []
    Constant.BkColor = clNone
    Constant.Color = clBlack
    Constant.Style = []
    RubySymbol.BkColor = clNone
    RubySymbol.Color = clBlack
    RubySymbol.Style = []
    Regexp.BkColor = clNone
    Regexp.Color = clBlack
    Regexp.Style = []
    Definition.BkColor = clNone
    Definition.Color = clBlack
    Definition.Style = []
    UserKeyWord.BkColor = clNone
    UserKeyWord.Color = clBlack
    UserKeyWord.Style = []
    Left = 592
    Top = 80
  end
  object EditorExProp: TEditorExProp
    Color = clWhite
    Caret.AutoCursor = True
    Caret.AutoIndent = True
    Caret.BackSpaceUnIndent = True
    Caret.Cursors.DefaultCursor = crIBeam
    Caret.Cursors.DragSelCursor = crDrag
    Caret.Cursors.DragSelCopyCursor = 2
    Caret.Cursors.InSelCursor = crDefault
    Caret.Cursors.LeftMarginCursor = 1
    Caret.Cursors.TopMarginCursor = crDefault
    Caret.FreeCaret = False
    Caret.FreeRow = True
    Caret.InTab = False
    Caret.KeepCaret = False
    Caret.LockScroll = False
    Caret.NextLine = True
    Caret.PrevSpaceIndent = True
    Caret.RowSelect = True
    Caret.SelDragMode = dmAutomatic
    Caret.SelMove = True
    Caret.SoftTab = False
    Caret.Style = csDefault
    Caret.TabIndent = True
    Caret.TabSpaceCount = 2
    Caret.TokenEndStop = False
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clNone
    Font.Height = -12
    Font.Name = 'FixedSys'
    Font.Style = []
    HitStyle = hsSelect
    Imagebar.DigitWidth = 0
    Imagebar.LeftMargin = 2
    Imagebar.MarkWidth = 15
    Imagebar.RightMargin = 2
    Imagebar.Visible = True
    Leftbar.BkColor = clWhite
    Leftbar.Color = clBlack
    Leftbar.Column = 4
    Leftbar.Edge = True
    Leftbar.LeftMargin = 8
    Leftbar.RightMargin = 4
    Leftbar.ShowNumber = True
    Leftbar.ShowNumberMode = nmRow
    Leftbar.Visible = False
    Leftbar.ZeroBase = False
    Leftbar.ZeroLead = False
    Margin.Character = 0
    Margin.Left = 10
    Margin.Line = 0
    Margin.Top = 2
    Marks.EofMark.Color = clGray
    Marks.EofMark.Visible = False
    Marks.RetMark.Color = clGray
    Marks.RetMark.Visible = False
    Marks.WrapMark.Color = clGray
    Marks.WrapMark.Visible = False
    Marks.HideMark.Color = clGray
    Marks.HideMark.Visible = False
    Marks.Underline.Color = clGray
    Marks.Underline.Visible = False
    Ruler.BkColor = clWhite
    Ruler.Color = clBlack
    Ruler.Edge = True
    Ruler.GaugeRange = 10
    Ruler.MarkColor = clBlack
    Ruler.Visible = False
    ScrollBars = ssBoth
    Speed.CaretVerticalAc = 2
    Speed.InitBracketsFull = False
    Speed.PageVerticalRange = 2
    Speed.PageVerticalRangeAc = 2
    View.Brackets = <>
    View.Colors.Ank.BkColor = clNone
    View.Colors.Ank.Color = clBlack
    View.Colors.Ank.Style = []
    View.Colors.Comment.BkColor = clNone
    View.Colors.Comment.Color = clBlack
    View.Colors.Comment.Style = []
    View.Colors.DBCS.BkColor = clNone
    View.Colors.DBCS.Color = clBlack
    View.Colors.DBCS.Style = []
    View.Colors.Hit.BkColor = clNone
    View.Colors.Hit.Color = clNone
    View.Colors.Hit.Style = []
    View.Colors.Int.BkColor = clNone
    View.Colors.Int.Color = clBlack
    View.Colors.Int.Style = []
    View.Colors.Mail.BkColor = clNone
    View.Colors.Mail.Color = clBlue
    View.Colors.Mail.Style = [fsUnderline]
    View.Colors.Reserve.BkColor = clNone
    View.Colors.Reserve.Color = clNavy
    View.Colors.Reserve.Style = [fsBold]
    View.Colors.Select.BkColor = clNavy
    View.Colors.Select.Color = clWhite
    View.Colors.Select.Style = []
    View.Colors.Str.BkColor = clNone
    View.Colors.Str.Color = clBlack
    View.Colors.Str.Style = []
    View.Colors.Symbol.BkColor = clNone
    View.Colors.Symbol.Color = clBlack
    View.Colors.Symbol.Style = []
    View.Colors.Url.BkColor = clNone
    View.Colors.Url.Color = clBlue
    View.Colors.Url.Style = [fsUnderline]
    View.ControlCode = True
    View.Mail = True
    View.Url = True
    WordWrap = False
    WrapOption.FollowRetMark = False
    WrapOption.FollowPunctuation = False
    WrapOption.FollowStr = #12289#12290#65292#65294#12539#65311#65281#12443#12444#12541#12542#12445#12446#12293#12540#65289#65341#65373#12301#12303'!),.:;?]}'#65377#65379#65380#65381#65392#65438#65439
    WrapOption.Leading = False
    WrapOption.LeadStr = #65288#65339#65371#12300#12302'([{'#65378
    WrapOption.PunctuationStr = #12289#12290#65292#65294',.'#65377#65380
    WrapOption.WordBreak = False
    WrapOption.WrapByte = 80
    ExMarks.DBSpaceMark.Color = clSilver
    ExMarks.DBSpaceMark.Visible = False
    ExMarks.SpaceMark.Color = clSilver
    ExMarks.SpaceMark.Visible = False
    ExMarks.TabMark.Color = clSilver
    ExMarks.TabMark.Visible = False
    ExMarks.FindMark.Color = clRed
    ExMarks.FindMark.Visible = True
    ExMarks.Hit.BkColor = clNone
    ExMarks.Hit.Color = clNone
    ExMarks.Hit.Style = []
    ExMarks.ParenMark.Color = clGray
    ExMarks.ParenMark.Visible = False
    ExMarks.CurrentLine.Color = clGray
    ExMarks.CurrentLine.Visible = False
    ExMarks.DigitLine.Color = clGray
    ExMarks.DigitLine.Visible = False
    ExMarks.ImageLine.Color = clGray
    ExMarks.ImageLine.Visible = False
    ExMarks.Img0Line.Color = clGray
    ExMarks.Img0Line.Visible = False
    ExMarks.Img1Line.Color = clGray
    ExMarks.Img1Line.Visible = False
    ExMarks.Img2Line.Color = clGray
    ExMarks.Img2Line.Visible = False
    ExMarks.Img3Line.Color = clGray
    ExMarks.Img3Line.Visible = False
    ExMarks.Img4Line.Color = clGray
    ExMarks.Img4Line.Visible = False
    ExMarks.Img5Line.Color = clGray
    ExMarks.Img5Line.Visible = False
    ExMarks.EvenLine.Color = clGray
    ExMarks.EvenLine.Visible = False
    ExSearchOptions = []
    FindLineFeedCount = 5
    VerticalLines = <>
    Left = 288
    Top = 80
  end
  object ContentsPopupMenu: TPopupMenu
    Left = 568
    Top = 168
    object N49: TMenuItem
      Action = RefleshContentsAction
    end
  end
end
