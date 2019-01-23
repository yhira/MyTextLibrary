object AboutForm: TAboutForm
  Left = 518
  Top = 90
  BorderStyle = bsDialog
  Caption = #12496#12540#12472#12519#12531#24773#22577
  ClientHeight = 155
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 12
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 273
    Height = 113
    BevelOuter = bvLowered
    TabOrder = 0
    object AppIconImage: TImage
      Left = 16
      Top = 16
      Width = 65
      Height = 65
    end
    object AppNameLabel: TLabel
      Left = 80
      Top = 16
      Width = 138
      Height = 20
      Caption = 'AppNameLabel'
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clWindowText
      Font.Height = -20
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = [fsBold]
      ParentFont = False
    end
    object VersionLabel: TLabel
      Left = 80
      Top = 40
      Width = 66
      Height = 12
      Caption = 'VersionLabel'
    end
    object CopyrightLabel: TLabel
      Left = 80
      Top = 64
      Width = 76
      Height = 12
      Caption = 'CopyrightLabel'
    end
    object WebPageLabel: TLabel
      Left = 88
      Top = 88
      Width = 132
      Height = 12
      Caption = 'http://mousist.cside.com/'
      Font.Charset = SHIFTJIS_CHARSET
      Font.Color = clBlue
      Font.Height = -12
      Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
      Font.Style = []
      ParentFont = False
      Transparent = True
      Visible = False
      OnClick = WebPageLabelClick
      OnMouseMove = WebPageLabelMouseMove
      OnMouseLeave = WebPageLabelMouseLeave
    end
  end
  object OKButton: TButton
    Left = 211
    Top = 127
    Width = 75
    Height = 25
    Caption = 'OK'
    TabOrder = 1
    OnClick = OKButtonClick
  end
end
