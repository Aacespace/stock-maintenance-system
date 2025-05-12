object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object btnCreateDatabase: TButton
    Left = 168
    Top = 336
    Width = 99
    Height = 25
    Caption = 'Create Database'
    TabOrder = 0
    OnClick = btnCreateDatabaseClick
  end
  object btnCreateTables: TButton
    Left = 296
    Top = 336
    Width = 83
    Height = 25
    Caption = 'Create Tables'
    TabOrder = 1
    OnClick = btnCreateTablesClick
  end
  object btnInsertUser: TButton
    Left = 32
    Top = 336
    Width = 115
    Height = 25
    Caption = 'Insert Default Users'
    TabOrder = 2
    OnClick = btnInsertUserClick
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 8
    Width = 177
    Height = 97
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object btnLoadUsers: TButton
    Left = 0
    Top = 111
    Width = 75
    Height = 25
    Caption = 'Load Users'
    TabOrder = 4
    OnClick = btnLoadUsersClick
  end
  object btnTestConnect: TButton
    Left = 408
    Top = 336
    Width = 81
    Height = 25
    Caption = 'Test Connect'
    TabOrder = 5
    OnClick = btnTestConnectClick
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      
        'Database=C:\DelphiProjects\stock-maintenance-system\db\StockDB.f' +
        'db'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    Left = 448
    Top = 264
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 504
    Top = 176
  end
  object DataSource1: TDataSource
    Left = 200
    Top = 8
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 192
    Top = 64
  end
end
