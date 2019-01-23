object FolderSetDlg: TFolderSetDlg
  Left = 245
  Top = 108
  BorderStyle = bsDialog
  Caption = #12501#12457#12523#12480#12458#12503#12471#12519#12531
  ClientHeight = 293
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
    Height = 241
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
  object IconLabel: TLabel
    Left = 16
    Top = 176
    Width = 52
    Height = 12
    Caption = #12450#12452#12467#12531'(&I)'
    FocusControl = IconComboBoxEx
  end
  object CreationDayLabel: TLabel
    Left = 176
    Top = 16
    Width = 90
    Height = 12
    Caption = 'CreationDayLabel'
  end
  object CancelBtn: TButton
    Left = 159
    Top = 260
    Width = 75
    Height = 25
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    ModalResult = 2
    TabOrder = 5
    OnClick = CancelBtnClick
  end
  object NameLabeledEdit: TLabeledEdit
    Left = 16
    Top = 32
    Width = 281
    Height = 20
    EditLabel.Width = 40
    EditLabel.Height = 12
    EditLabel.Caption = #21517#21069'(&N)'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 0
    OnChange = NameLabeledEditChange
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
    OnKeyDown = NameLabeledEditKeyDown
  end
  object IconComboBoxEx: TComboBoxEx
    Left = 16
    Top = 192
    Width = 281
    Height = 22
    ItemsEx.CaseSensitive = False
    ItemsEx.SortType = stNone
    ItemsEx = <
      item
        Caption = #12487#12501#12457#12523#12488
        ImageIndex = 0
        SelectedImageIndex = 0
      end
      item
        Caption = #12502#12523#12540
        ImageIndex = 1
        SelectedImageIndex = 1
      end
      item
        Caption = #12524#12483#12489
        ImageIndex = 2
        SelectedImageIndex = 2
      end
      item
        Caption = #12502#12521#12483#12463
        ImageIndex = 3
        SelectedImageIndex = 3
      end
      item
        Caption = #12464#12522#12540#12531
        ImageIndex = 4
        SelectedImageIndex = 4
      end
      item
        Caption = #12507#12527#12452#12488
        ImageIndex = 5
        SelectedImageIndex = 5
      end>
    Style = csExDropDownList
    StyleEx = []
    ItemHeight = 16
    TabOrder = 2
    OnKeyDown = NameLabeledEditKeyDown
    Images = MainForm.TreeItemImageList
    DropDownCount = 15
  end
  object ReadOnlyCheckBox: TCheckBox
    Left = 16
    Top = 224
    Width = 281
    Height = 17
    Caption = #19979#20301#12450#12452#12486#12512#20840#12390#35501#12415#12392#12426#23554#29992'(&R)'
    TabOrder = 3
    OnKeyDown = NameLabeledEditKeyDown
  end
  object OKBtn: TButton
    Left = 80
    Top = 260
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 4
    OnClick = OKBtnClick
  end
end
