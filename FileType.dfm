object FileTypeDlg: TFileTypeDlg
  Left = 245
  Top = 108
  BorderStyle = bsDialog
  Caption = #12501#12449#12452#12523#35373#23450
  ClientHeight = 366
  ClientWidth = 389
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object CancelBtn: TButton
    Left = 227
    Top = 340
    Width = 75
    Height = 25
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    ModalResult = 2
    TabOrder = 1
  end
  object OKBtn: TButton
    Left = 144
    Top = 340
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 0
    OnClick = OKBtnClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 389
    Height = 81
    Align = alTop
    Font.Charset = SHIFTJIS_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object Label2: TLabel
      Left = 8
      Top = 12
      Width = 92
      Height = 12
      Caption = #12501#12449#12452#12523#12398#31278#39006'(&F)'
      FocusControl = FiletypeEdit
    end
    object Label1: TLabel
      Left = 24
      Top = 44
      Width = 75
      Height = 12
      Caption = #30331#37682#25313#24373#23376'(&T)'
      FocusControl = ExtensionEdit
    end
    object Label3: TLabel
      Left = 224
      Top = 64
      Width = 156
      Height = 12
      Caption = #65288#20363#65306'*.txt,*.html,*.htm'#65289
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = #65325#65331' '#12468#12471#12483#12463
      Font.Style = []
      ParentFont = False
    end
    object FiletypeEdit: TEdit
      Left = 112
      Top = 8
      Width = 265
      Height = 20
      TabOrder = 0
      Text = 'FiletypeEdit'
      OnKeyDown = FiletypeEditKeyDown
    end
    object ExtensionEdit: TEdit
      Left = 112
      Top = 40
      Width = 265
      Height = 21
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = #65325#65331' '#12468#12471#12483#12463
      Font.Style = []
      ImeMode = imClose
      ParentFont = False
      TabOrder = 1
      Text = 'ExtensionEdit'
      OnKeyDown = FiletypeEditKeyDown
      OnKeyPress = ExtensionEditKeyPress
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 81
    Width = 389
    Height = 256
    Align = alTop
    Caption = 'Panel2'
    TabOrder = 3
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 387
      Height = 254
      ActivePage = ContentsTabSheet
      Align = alClient
      HotTrack = True
      TabIndex = 0
      TabOrder = 0
      object ContentsTabSheet: TTabSheet
        Caption = #30446#27425
        Font.Charset = SHIFTJIS_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
        Font.Style = []
        ParentFont = False
        object ContentsDisplayCheckBox: TCheckBox
          Left = 8
          Top = 8
          Width = 185
          Height = 17
          Caption = #30446#27425#27231#33021#26377#21177'(&C)'
          TabOrder = 1
          OnClick = ContentsDisplayCheckBoxClick
        end
        object ContentsGroupBox: TGroupBox
          Left = 0
          Top = 32
          Width = 377
          Height = 193
          Caption = #30446#27425#23550#35937#20808#38957#25991#23383#12398#35373#23450
          Enabled = False
          TabOrder = 0
          object BlankDeletionCheckBox: TCheckBox
            Left = 8
            Top = 168
            Width = 185
            Height = 17
            Caption = #34892#38957#12398#31354#30333#12434#21066#38500'(&R)'
            TabOrder = 1
          end
          object NumberContentsCheckBox: TCheckBox
            Left = 8
            Top = 150
            Width = 185
            Height = 17
            Caption = #25968#23383#12434#30446#27425#23550#35937#12395#12377#12427'(&N)'
            TabOrder = 0
          end
          object ContentsListBox: TListBox
            Left = 8
            Top = 16
            Width = 257
            Height = 129
            TabStop = False
            ItemHeight = 12
            TabOrder = 7
          end
          object AddContentsButton: TButton
            Left = 280
            Top = 16
            Width = 90
            Height = 25
            Caption = #36861#21152'(&A)'
            TabOrder = 2
            OnClick = AddContentsButtonClick
          end
          object EditContentsButton: TButton
            Left = 280
            Top = 56
            Width = 90
            Height = 25
            Caption = #32232#38598'(&E)'
            TabOrder = 3
            OnClick = EditContentsButtonClick
          end
          object EditAllContentsButton: TButton
            Left = 280
            Top = 88
            Width = 90
            Height = 25
            Caption = #12414#12392#12417#12390#32232#38598'(&L)'
            TabOrder = 4
            OnClick = EditAllContentsButtonClick
          end
          object DeleteContentsButton: TButton
            Left = 280
            Top = 128
            Width = 90
            Height = 25
            Caption = #21066#38500'(&D)'
            TabOrder = 5
            OnClick = DeleteContentsButtonClick
          end
          object DeleteAllContentsButton: TButton
            Left = 280
            Top = 160
            Width = 90
            Height = 25
            Caption = #20840#12390#12434#21066#38500'(&W)'
            TabOrder = 6
            OnClick = DeleteAllContentsButtonClick
          end
        end
      end
      object EmphasisTabSheet: TTabSheet
        Caption = #24375#35519#34920#31034
        ImageIndex = 1
        object EmphasisDisplayCheckBox: TCheckBox
          Left = 8
          Top = 10
          Width = 169
          Height = 17
          Caption = #24375#35519#34920#31034#27231#33021#26377#21177'(&C)'
          TabOrder = 0
          OnClick = EmphasisDisplayCheckBoxClick
        end
        object EmphasisGroupBox: TGroupBox
          Left = 0
          Top = 32
          Width = 377
          Height = 193
          Caption = #24375#35519#34920#31034#23550#35937#25991#23383'('#20104#32004#35486')'#12398#35373#23450
          TabOrder = 1
          object EmphasisListBox: TListBox
            Left = 8
            Top = 16
            Width = 257
            Height = 169
            TabStop = False
            ItemHeight = 12
            TabOrder = 0
          end
          object AddEmphasisButton: TButton
            Left = 280
            Top = 16
            Width = 90
            Height = 25
            Caption = #36861#21152'(&A)'
            TabOrder = 1
            OnClick = AddEmphasisButtonClick
          end
          object EditEmphasisButton: TButton
            Left = 280
            Top = 56
            Width = 90
            Height = 25
            Caption = #32232#38598'(&E)'
            TabOrder = 2
            OnClick = EditEmphasisButtonClick
          end
          object EditAllEmphasisButton: TButton
            Left = 280
            Top = 88
            Width = 90
            Height = 25
            Caption = #12414#12392#12417#12390#32232#38598'(&L)'
            TabOrder = 3
            OnClick = EditAllEmphasisButtonClick
          end
          object DeleteEmphasisButton: TButton
            Left = 280
            Top = 128
            Width = 90
            Height = 25
            Caption = #21066#38500'(&D)'
            TabOrder = 4
            OnClick = DeleteEmphasisButtonClick
          end
          object DeleteAllEmphasisButton: TButton
            Left = 280
            Top = 160
            Width = 90
            Height = 25
            Caption = #20840#12390#12434#21066#38500'(&W)'
            TabOrder = 5
            OnClick = DeleteAllEmphasisButtonClick
          end
        end
      end
    end
  end
  object HelpButton: TButton
    Left = 312
    Top = 340
    Width = 75
    Height = 25
    Caption = #12504#12523#12503
    TabOrder = 4
    OnClick = HelpButtonClick
  end
end
