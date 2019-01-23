object TextSetDlg: TTextSetDlg
  Left = 245
  Top = 108
  BorderStyle = bsDialog
  Caption = #12458#12503#12471#12519#12531
  ClientHeight = 339
  ClientWidth = 313
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = True
  Position = poMainFormCenter
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object Bevel1: TBevel
    Left = 8
    Top = 8
    Width = 297
    Height = 289
    Shape = bsFrame
  end
  object CommentLabel: TLabel
    Left = 16
    Top = 96
    Width = 53
    Height = 12
    Caption = #12467#12513#12531#12488'(&C)'
    FocusControl = CommentMemo
  end
  object CreationDayLabel: TLabel
    Left = 16
    Top = 272
    Width = 90
    Height = 12
    Caption = 'CreationDayLabel'
  end
  object UpdateDayLabel: TLabel
    Left = 16
    Top = 248
    Width = 83
    Height = 12
    Caption = 'UpdateDayLabel'
  end
  object ExtensionLabel: TLabel
    Left = 264
    Top = 40
    Width = 77
    Height = 12
    Caption = 'ExtensionLabel'
  end
  object Label1: TLabel
    Left = 16
    Top = 176
    Width = 48
    Height = 12
    Caption = #34920#31034#24418#24335
  end
  object CancelBtn: TButton
    Left = 159
    Top = 308
    Width = 75
    Height = 25
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    ModalResult = 2
    TabOrder = 5
  end
  object NameLabeledEdit: TLabeledEdit
    Left = 16
    Top = 32
    Width = 241
    Height = 20
    BevelInner = bvNone
    BevelOuter = bvNone
    EditLabel.Width = 40
    EditLabel.Height = 12
    EditLabel.Caption = #21517#21069'(&N)'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 0
    OnKeyDown = NameLabeledEditKeyDown
    OnMouseMove = NameLabeledEditMouseMove
  end
  object PathLabeledEdit: TLabeledEdit
    Left = 16
    Top = 72
    Width = 281
    Height = 20
    TabStop = False
    Color = clInactiveCaptionText
    EditLabel.Width = 24
    EditLabel.Height = 12
    EditLabel.Caption = #22580#25152
    LabelPosition = lpAbove
    LabelSpacing = 3
    ParentShowHint = False
    ReadOnly = True
    ShowHint = False
    TabOrder = 6
    OnMouseMove = NameLabeledEditMouseMove
  end
  object CommentMemo: TMemo
    Left = 16
    Top = 112
    Width = 281
    Height = 57
    Lines.Strings = (
      'ComentMemo')
    ScrollBars = ssVertical
    TabOrder = 1
  end
  object ReadOnlyCheckBox: TCheckBox
    Left = 16
    Top = 224
    Width = 281
    Height = 17
    Caption = #35501#12415#12392#12426#23554#29992#12395#12377#12427'(&R)'
    TabOrder = 3
    OnKeyDown = NameLabeledEditKeyDown
  end
  object OKBtn: TButton
    Left = 80
    Top = 308
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 4
    OnClick = OKBtnClick
  end
  object DspTypeComboBox: TComboBox
    Left = 16
    Top = 192
    Width = 281
    Height = 20
    Style = csDropDownList
    DropDownCount = 15
    ItemHeight = 12
    TabOrder = 2
    OnKeyDown = NameLabeledEditKeyDown
  end
end
