object fmMasterPayBuffer: TfmMasterPayBuffer
  Left = 262
  Top = 227
  AutoScroll = False
  Caption = #1041#1091#1092#1077#1088
  ClientHeight = 302
  ClientWidth = 552
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    552
    302)
  PixelsPerInch = 96
  TextHeight = 13
  object lblText: TLabel
    Left = 8
    Top = 56
    Width = 86
    Height = 13
    Caption = #1058#1077#1082#1089#1090#1086#1074#1099#1081' '#1073#1083#1086#1082':'
  end
  object lblDataLength_: TLabel
    Left = 280
    Top = 56
    Width = 76
    Height = 13
    Anchors = [akTop, akRight]
    Caption = #1044#1083#1080#1085#1072' '#1076#1072#1085#1085#1099#1093':'
  end
  object lblDataLength: TLabel
    Left = 368
    Top = 56
    Width = 6
    Height = 13
    Anchors = [akTop, akRight]
    Caption = '0'
  end
  object Bevel1: TBevel
    Left = 8
    Top = 199
    Width = 537
    Height = 9
    Anchors = [akLeft, akRight, akBottom]
    Shape = bsTopLine
  end
  object lblBlockNumber: TLabel
    Left = 8
    Top = 167
    Width = 70
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1053#1086#1084#1077#1088' '#1073#1083#1086#1082#1072':'
  end
  object lblMacValue: TLabel
    Left = 8
    Top = 239
    Width = 76
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1047#1085#1072#1095#1077#1085#1080#1077' '#1050#1055#1050':'
  end
  object lblOperatorNumber: TLabel
    Left = 8
    Top = 271
    Width = 93
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1053#1086#1084#1077#1088' '#1086#1087#1077#1088#1072#1090#1086#1088#1072':'
  end
  object lblBlockCount: TLabel
    Left = 8
    Top = 207
    Width = 101
    Height = 13
    Anchors = [akLeft, akBottom]
    Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1073#1083#1086#1082#1086#1074':'
  end
  object Bevel2: TBevel
    Left = 7
    Top = 48
    Width = 537
    Height = 9
    Anchors = [akLeft, akTop, akRight]
    Shape = bsTopLine
  end
  object btnMasterPayClearBuffer: TButton
    Left = 408
    Top = 7
    Width = 137
    Height = 30
    Anchors = [akTop, akRight]
    Caption = #1048#1085#1080#1094#1080#1072#1083#1080#1079#1072#1094#1080#1103' '#1073#1091#1092#1077#1088#1072
    ParentShowHint = False
    ShowHint = False
    TabOrder = 0
    OnClick = btnMasterPayClearBufferClick
  end
  object Memo: TMemo
    Left = 8
    Top = 72
    Width = 393
    Height = 85
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
  object btnOpen: TBitBtn
    Left = 408
    Top = 64
    Width = 137
    Height = 30
    Anchors = [akTop, akRight]
    Caption = #1054#1090#1082#1088#1099#1090#1100
    TabOrder = 4
    OnClick = btnOpenClick
    Glyph.Data = {
      26050000424D26050000000000003604000028000000100000000F0000000100
      080000000000F000000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0C8
      A400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00070707070707
      0707070707070707070700000000000000000000000707070707000003030303
      0303030303000707070700FB000303030303030303030007070700FFFB000303
      0303030303030300070700FBFFFB00030303030303030303000700FFFBFFFB00
      0000000000000000000000FBFFFBFFFBFFFBFFFB00070707070700FFFBFFFBFF
      FBFFFBFF00070707070700FBFFFB000000000000000707070707070000000707
      0707070707070000000707070707070707070707070707000007070707070707
      0707000707070007000707070707070707070700000007070707070707070707
      07070707070707070707}
  end
  object btnClearMemo: TBitBtn
    Left = 407
    Top = 104
    Width = 138
    Height = 30
    Anchors = [akTop, akRight]
    Caption = #1054#1095#1080#1089#1090#1080#1090#1100
    TabOrder = 5
    OnClick = btnClearMemoClick
    Glyph.Data = {
      F6000000424DF600000000000000760000002800000010000000100000000100
      0400000000008000000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      888888888888888888888800000000000888880FFFFFFFFF0888880FFFFFFFFF
      0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFFFFF
      0888880FFFFFFFFF0888880FFFFFFFFF0888880FFFFFF0000888880FFFFFF0F0
      8888880FFFFFF008888888000000008888888888888888888888}
  end
  object btnMasterPayCreateMac: TButton
    Left = 408
    Top = 207
    Width = 137
    Height = 30
    Anchors = [akRight, akBottom]
    Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1050#1055#1050
    ParentShowHint = False
    ShowHint = False
    TabOrder = 7
    OnClick = btnMasterPayCreateMacClick
  end
  object btnMasterPayAddText: TButton
    Left = 408
    Top = 144
    Width = 137
    Height = 30
    Hint = 'MasterPayAddText'
    Anchors = [akTop, akRight]
    Caption = #1055#1077#1088#1077#1076#1072#1090#1100' '#1073#1083#1086#1082
    ParentShowHint = False
    ShowHint = False
    TabOrder = 6
    OnClick = btnMasterPayAddTextClick
  end
  object edtMacValue: TEdit
    Left = 120
    Top = 239
    Width = 281
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 8
  end
  object edtOperatorNumber: TEdit
    Left = 120
    Top = 271
    Width = 281
    Height = 21
    Anchors = [akLeft, akRight, akBottom]
    Color = clBtnFace
    ReadOnly = True
    TabOrder = 9
  end
  object seBlockNumber: TSpinEdit
    Left = 120
    Top = 168
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 2
    Value = 0
  end
  object seBlockCount: TSpinEdit
    Left = 120
    Top = 208
    Width = 121
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 0
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'txt'
    Filter = #1058#1077#1082#1089#1090#1086#1074#1099#1077' '#1092#1072#1081#1083#1099' (*.txt)|*.txt|'#1042#1089#1077' '#1092#1072#1081#1083#1099' (*.*)|*.*'
    Left = 16
    Top = 128
  end
end
