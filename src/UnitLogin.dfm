object FormLogin: TFormLogin
  Left = 0
  Top = 0
  Caption = 'FormLogin'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object lblUsername: TLabel
    Left = 32
    Top = 35
    Width = 56
    Height = 15
    Caption = 'Username:'
  end
  object lblPassword: TLabel
    Left = 32
    Top = 64
    Width = 53
    Height = 15
    Caption = 'Password:'
  end
  object EditUsername: TEdit
    Left = 136
    Top = 32
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object EditPassword: TEdit
    Left = 136
    Top = 61
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object btnLogin: TButton
    Left = 312
    Top = 60
    Width = 75
    Height = 25
    Caption = 'Login'
    TabOrder = 2
    OnClick = btnLoginClick
  end
  object FDQuery1: TFDQuery
    Left = 184
    Top = 208
  end
end
