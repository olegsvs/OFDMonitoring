object fmAbout: TfmAbout
  Left = 387
  Top = 230
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = #1054' '#1087#1088#1086#1075#1088#1072#1084#1084#1077
  ClientHeight = 232
  ClientWidth = 335
  Color = clBtnFace
  Constraints.MinHeight = 259
  Constraints.MinWidth = 343
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  DesignSize = (
    335
    232)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 4
    Top = 8
    Width = 79
    Height = 177
    Anchors = [akLeft, akTop, akBottom]
  end
  object bvlInfo: TBevel
    Left = 88
    Top = 34
    Width = 241
    Height = 57
    Anchors = [akLeft, akTop, akRight]
  end
  object lblAddress: TLabel
    Left = 92
    Top = 50
    Width = 192
    Height = 26
    Caption = 
      '115280 '#1075'. '#1052#1086#1089#1082#1074#1072', '#1091#1083'.'#1052#1072#1089#1090#1077#1088#1082#1086#1074#1072', '#1076'.4'#13#10#1090#1077#1083'/'#1092#1072#1082#1089'. (095) 787-6090, ' +
      '787-6099'
    Color = clActiveBorder
    ParentColor = False
    Transparent = True
  end
  object lblURL: TLabel
    Left = 192
    Top = 146
    Width = 145
    Height = 13
    Cursor = crHandPoint
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 'http://www.shtrih-m.ru'
    Color = clBtnFace
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsUnderline]
    ParentColor = False
    ParentFont = False
    Transparent = True
    OnClick = lblURLClick
  end
  object lblWebSite: TLabel
    Left = 88
    Top = 146
    Width = 97
    Height = 13
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = #1053#1072#1096' Web-'#1089#1072#1081#1090':'
    Transparent = True
  end
  object lblSupport: TLabel
    Left = 88
    Top = 162
    Width = 97
    Height = 13
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = #1058#1077#1093'. '#1087#1086#1076#1076#1077#1088#1078#1082#1072':'
    Transparent = True
  end
  object lblSupportMail: TLabel
    Left = 192
    Top = 162
    Width = 145
    Height = 13
    Cursor = crHandPoint
    Anchors = [akLeft, akBottom]
    AutoSize = False
    Caption = 'support@shtrih-m.ru'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Transparent = True
    OnClick = lblSupportMailClick
  end
  object NameLabel: TLabel
    Left = 88
    Top = 4
    Width = 249
    Height = 25
    AutoSize = False
    Caption = #1053#1072#1079#1074#1072#1085#1080#1077' '#1087#1088#1086#1075#1088#1072#1084#1084#1099
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clNavy
    Font.Height = -21
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object lblFirmName: TLabel
    Left = 93
    Top = 37
    Width = 225
    Height = 13
    AutoSize = False
    Caption = #1056#1072#1079#1088#1072#1073#1086#1090#1082#1072': '#1053#1058#1062' "'#1064#1090#1088#1080#1093'-'#1052'"'
    Font.Charset = RUSSIAN_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
  end
  object Image: TImage
    Left = 9
    Top = 16
    Width = 69
    Height = 61
    AutoSize = True
    Picture.Data = {
      07544269746D61700A090000424D0A0900000000000076000000280000004500
      00003D0000000100040000000000940800000000000000000000100000000000
      0000000000000000800000800000008080008000000080008000808000008080
      8000C0C0C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
      FF00FFFFFFFF0000000000FFFF00FFFF00FFFFFFF00FFF00FF00FFF00FFFFFF0
      0FF0FF00F000FFFFFFFF00FF00FF00FFFF00FFFF00FFFFFFF00FFF00FF00FFF0
      0FFFFFF00F000F00F000FFFFFFFF00FF00FF00FFFF00FFFF00FFFFFFF000FF00
      FFF00F00FFFFFFF00F000F00F000FFFFFFFF00FF00FF00FFFF00FFFF00FFFFFF
      F000FF00FFFF000FFFFFFFF00F0F0F00F000FFFFFFFF00FF00FF00FFFF00FFFF
      000000FFF0000F00FFFF000FFFF00FF00F0F0F00F00000FF00FF00FF00FF00FF
      FF00FFFF00FFF00FF00F0F00FFFF000FFFF00FF00F0F0F00F00000FF00FF00FF
      00FF00FFFF00FFFF00FFF00FF00F0000FFFF000FFFFFFFF0000F0000F00000FF
      00FF00FF00FF00FFFF00FFFF00FFF00FF00FF000FFF00F00FFFFFFF0000F0000
      F00000FF00FF00FF00FF00FFFF00FFFF00FFF00FF00FF000FF00FFF00FFFFFF0
      00FFF000F00000FF00FF00FF00FF00F00000000F000000FFF00FFF00FF00FFF0
      0FFFFFF000FFF000F00000FF00FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFF00FF00FFFFFFFFFF00000FF00FF00FF00FFF0FFFFFF00FF0FFFFFFF
      0FFFF00F00FFF00FF00FF00FFFFFFFFFF00000FF00FF00FF00FFF0FF00FF00FF
      0FF000FF0FFFF0FF00FFF00FF00FF00FFFFFFFFFF00000FF00FF00FF00FFF0FF
      00FF00FF0FF000FF0FFFFFFF00FFF00FF00FF00FFFFFFFFFF00000FF00FF00FF
      00FFF0FF00FF00FF0FF000FF0FFFF00F00FFF00FF00FF00FFFFFFFFFF00000FF
      00FF00FF00FFF0FF00FF00FF0FF000FF0FFF000F00FFF00FF00FF00FFFFFFFFF
      F00000FF00FF00FF00FFF0FF00FF00FF0FF000FF0FF0000F00FFF00FF00FF00F
      FFFFFFFFF00000FF00FF00FF00FFF0FF00FF00FF0FF000FF0F00FF0FF0FFF00F
      F00FF00FFFFFFFFFF00000FF00FF00FF00FFF0FF00FF00FF0FF000FFF000FF00
      F0FFF00FF00FF00FFFFFFFFFF00000FF00FF00FF00FFF0FF00FF00FF0FF000FF
      000F0FF0F0FFF00FF00FF00FFFFFFFFFF00000FF00FF00FF00FFF0FF00FF00FF
      0FF000F000FF00F00FFFF00FF00FF00FFFFFFFFFF00000FF00FF00FF00FFF0FF
      00FF00FF0FF00FF000FF00FF0FFFF00FF00FF00FFFFFFFFFF00000FF00FF00FF
      00FFF0FF00FF00FF0FF00F0000FF00F0F0FFF00FF00FF00FFFFFFFFFF00000FF
      00FF00FF00FFF0FF00FF00FF0FF0F000000FF0F0FFFFF00FF00FF00FFFFFFFFF
      F00000FF00FFFFFFF0FFF0FF00FF00FF0FFFF0F0FF00FF0F0F0FF00FF00FF00F
      FFFFFFFFF00000FF0FF00000F0FFF0FF00FF00FF0FFF00F0FFF00F0F0FFFF00F
      F00FF00FFFFFFFFFF00000FFFF0000000FFFF0FF00FF00FF0FFF00F00FF0000F
      F0F0F00FF00FF00FFFFFFFFFF00000FFF00000000FFFF0FF00FF00FF0FFF0000
      0FFF0000F0FFF00FF00FF00FFFFFFFFFF00000FF000000000000FFFF00FF00FF
      0FF0000000FF0000FF0F0F0FF00FF00FFFFFFFFFF00000FF0000F0FF0FFFF000
      FFFF00FFF0000FF000FFF000FF0FFFFFF00FF00FFFFFFFFFF00000FF00000000
      00000000000FF0FFF0000FF0000FF0000F00F0FFF00FF00FFFFFFFFFF00000FF
      000FFFF0FF0F0FF0F000FFFF00F00FF0000FFF000FF0F0FFF00FF00FFFFFFFFF
      F00000FFF000000FF0F00FFFF0FF0000F0F000F00000FFF000F0FF0FF00FF00F
      FFFFFFFFF00000FF0F00FFF00FFF0FFFF0F0F0FFF0F000FF00000FF000FF0F0F
      FF0FF00FFFFFFFFFF00000FF0F000000FF0F0F0FF0FFF0F0F0F000FFF00000FF
      00FF00F0F0FFF00FFFFFFFFFF00000FF0FF0000F00F00FFF0F0FFF00F0FF000F
      F00000FFF00FF0FF00FFF00FFFFFFFFFF00000FF00FF00000FF0F0FFFF0F0F00
      F0FF000FF000000FF000FF0FF00FF00FFFFFFFFFF00000FF00FFF0000F0FF0F0
      FFFFFF0FF00FF000FFFFF000FF00FFF0F00FF00FFFFFFFFFF00000FF00FFFF00
      0FF00F0FF0F00F0F0000F000FF0FFF000FF00FF00F0FF00FFFFFFFFFF00000FF
      00FF0FF000000F0F0F0FFF0F0F00FF000F00FF0000F000F00FFFF00FFFFFFFFF
      F00000FF00FF00FF0FF0F00F0F0F0F0F0F000FF00FF00FF000FF00FF0FFFF00F
      FFFFFFFFF00000FF00FF00FFF0F0F00F0F0FF00F00F000FF00FF00FF00FFF00F
      00FFF00FFFFFFFFFF00000FF00FF00FFF0000FFF0F0F0FFFF0FF00FF000F00FF
      F00FF00F0FFFF00FFFFFFFFFF00000FF00FF00FFF0000FF00FF00F0FF00FF00F
      F00FF00FFF0FFF000F0FF00FFFFFFFFFF00000FF00FF00FF0FFF0000FFF00FF0
      FF00FF0FF00FFF0FFF00FF00F00FF00FFFFFFFFFF00000FF00FF00FF0F0000FF
      FFF000F00FF00F00FF000F00FFF00FFFF00FF00FFFFFFFFFF00000FF00FF00FF
      00F00FFFF0FF00FF00FF0FF00F000FF00FF00FFFF00FF00FFFFFFFFFF00000FF
      00FF00FF00FF0000F00FF0FFFF0F00F00FF00FF00FFF0FFFF00FF00FFFFFFFFF
      F00000FF00FF00FF00FFF00000FFFF0FFFFFF0FF00FF00FF000FFF0FF00FF00F
      FFFFFFFFF00000FF00FF00FF00FFF0000FFFFF0FFFF0F00F000FF00F00FFF00F
      F00FF00FFFFFFFFFF00000FF00FF00FF00FF0FF00FFFFFFFF0F0FF00F00FF000
      FFFFF00FF00FF00FFFFF0FFFF00000FF00FF00FF0FF0FFFFFFFFF0F0F0F00FF0
      FF00000FF0FFF00FF00FF00FFF00F00FF00000FF00FF00FF0F0FFFFFFFFFF0F0
      F0000FF00F000FFF00FFF00FF00FF00FF0FFFFF0F00000FF00FF00FFF0FFFFFF
      FF00F0F00F0F0FF00000F00F00FFF00FF00FF00FF0F0F0F0F00000FF00FF00FF
      F0FFFFFF000000000F0F00F0000FF00F00FFF00FF00FF00F0FF0F0FF000000FF
      00FF00FFF00FFF000000000000000000FFFFF00F00FFF00FF00FF00F0FF00FFF
      000000FF00FF00FFF000FFFF00000000000FFFFF0FFFF00F00FFF00FF00FF00F
      0FF0F0FF000000FF00FF00FFFFFFF0FFF0000000000F00FF0FFFF00F00FFF00F
      F00FF00FF0F000F0F00000FF00FF00FF00FFF0FF00FFFFFFFFF000FF0FFFF00F
      00FFF00FF00FF00FF0FFFFF0F00000FF00FF00FF00FFF0FF00FF00FF0FF000FF
      0FFFF00F00FFF00FF00FF00FFF00F00FF00000FF00FF00FF00FFF0FF00FF00FF
      0FF000FF0FFFF00F00FFF00FF00FF00FFFFF0FFFF000}
  end
  object Bevel2: TBevel
    Left = 4
    Top = 192
    Width = 327
    Height = 14
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object btnOK: TButton
    Left = 240
    Top = 200
    Width = 89
    Height = 25
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object lbVersion: TListBox
    Left = 88
    Top = 96
    Width = 241
    Height = 45
    TabStop = False
    Anchors = [akLeft, akTop, akRight, akBottom]
    Color = clWhite
    ItemHeight = 13
    TabOrder = 1
  end
end
