object fmFont: TfmFont
  Left = 249
  Top = 261
  AutoScroll = False
  Caption = '������'
  ClientHeight = 383
  ClientWidth = 545
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    545
    383)
  PixelsPerInch = 96
  TextHeight = 13
  object lblFontType: TLabel
    Left = 231
    Top = 12
    Width = 79
    Height = 13
    Anchors = [akTop, akRight]
    Caption = '����� ������:'
  end
  object Memo: TMemo
    Left = 8
    Top = 40
    Width = 369
    Height = 337
    Anchors = [akLeft, akTop, akRight, akBottom]
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssVertical
    TabOrder = 1
    WordWrap = False
  end
  object btnGetFontMetrics: TButton
    Left = 391
    Top = 8
    Width = 145
    Height = 25
    Hint = '��������� ������'
    Anchors = [akTop, akRight]
    Caption = '��������� ������'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = btnGetFontMetricsClick
  end
  object btnGetFontsMetrics: TButton
    Left = 391
    Top = 40
    Width = 145
    Height = 25
    Hint = '��������� �������'
    Anchors = [akTop, akRight]
    Caption = '��������� �������'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = btnGetFontsMetricsClick
  end
  object seFontType: TSpinEdit
    Left = 320
    Top = 8
    Width = 56
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 0
    Value = 1
  end
end
