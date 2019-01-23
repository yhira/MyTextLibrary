object ListEditDlg: TListEditDlg
  Left = 245
  Top = 108
  BorderStyle = bsDialog
  Caption = #32232#38598
  ClientHeight = 474
  ClientWidth = 347
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnActivate = FormActivate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 12
  object OKBtn: TButton
    Left = 191
    Top = 444
    Width = 75
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
    OnClick = OKBtnClick
  end
  object CancelBtn: TButton
    Left = 271
    Top = 444
    Width = 75
    Height = 25
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    ModalResult = 2
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 8
    Top = 48
    Width = 329
    Height = 385
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 329
    Height = 33
    BevelOuter = bvLowered
    TabOrder = 3
    object Label1: TLabel
      Left = 8
      Top = 2
      Width = 261
      Height = 12
      Caption = #30331#37682#12375#12383#12356#25991#23383#12399#25913#34892#12391#21306#20999#12387#12390#30331#37682#12375#12390#12367#12384#12373#12356#12290
    end
    object Label2: TLabel
      Left = 8
      Top = 18
      Width = 261
      Height = 12
      Caption = #21516#19968#12398#12487#12540#12479#12289#25991#23383#12398#21069#24460#12398#31354#30333#12399#21066#38500#12373#12428#12414#12377#12290
    end
  end
end
