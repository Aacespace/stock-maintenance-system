object FormProduct: TFormProduct
  Left = 0
  Top = 0
  Caption = 'FormProduct'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object lblBarcode: TLabel
    Left = 24
    Top = 27
    Width = 46
    Height = 15
    Caption = 'Barcode:'
  end
  object lblDescriotion: TLabel
    Left = 22
    Top = 56
    Width = 63
    Height = 15
    Caption = 'Description:'
  end
  object lblSelectDepartment: TLabel
    Left = 24
    Top = 88
    Width = 100
    Height = 15
    Caption = 'Select Department:'
  end
  object lblRetailPrice: TLabel
    Left = 24
    Top = 109
    Width = 61
    Height = 15
    Caption = 'Retail Price:'
  end
  object lblProductCost: TLabel
    Left = 24
    Top = 147
    Width = 56
    Height = 15
    Caption = 'Cost Price:'
  end
  object lblMarkup: TLabel
    Left = 24
    Top = 176
    Width = 114
    Height = 15
    Caption = 'Markup (Admin only)'
  end
  object lblSOH: TLabel
    Left = 24
    Top = 208
    Width = 79
    Height = 15
    Caption = 'Stock on hand:'
  end
  object LblSelectSupplier: TLabel
    Left = 24
    Top = 240
    Width = 80
    Height = 15
    Caption = 'Select Supplier:'
  end
  object lblAddProduct: TLabel
    Left = 24
    Top = 272
    Width = 104
    Height = 15
    Caption = 'Add a new product:'
  end
  object lblUpdateProduct: TLabel
    Left = 24
    Top = 304
    Width = 86
    Height = 15
    Caption = 'Update Product:'
  end
  object lblGridProducts: TLabel
    Left = 22
    Top = 344
    Width = 85
    Height = 15
    Caption = 'List of products:'
  end
  object EditBarcode: TEdit
    Left = 140
    Top = 24
    Width = 121
    Height = 23
    TabOrder = 0
  end
  object EditDescription: TEdit
    Left = 140
    Top = 53
    Width = 121
    Height = 23
    TabOrder = 1
  end
  object ComboDepartment: TComboBox
    Left = 140
    Top = 82
    Width = 145
    Height = 23
    TabOrder = 2
  end
  object EditRetailPrice: TEdit
    Left = 140
    Top = 111
    Width = 121
    Height = 23
    TabOrder = 3
  end
  object EditCostPrice: TEdit
    Left = 140
    Top = 144
    Width = 121
    Height = 23
    TabOrder = 4
  end
  object EditMarkup: TEdit
    Left = 140
    Top = 173
    Width = 121
    Height = 23
    TabOrder = 5
  end
  object EditSOH: TEdit
    Left = 140
    Top = 205
    Width = 121
    Height = 23
    TabOrder = 6
  end
  object ComboSupplier: TComboBox
    Left = 140
    Top = 234
    Width = 145
    Height = 23
    TabOrder = 7
  end
  object btnAddProduct: TButton
    Left = 140
    Top = 268
    Width = 121
    Height = 25
    Caption = 'Add Product'
    TabOrder = 8
    OnClick = btnAddProductClick
  end
  object btnUpdateProduct: TButton
    Left = 140
    Top = 299
    Width = 121
    Height = 25
    Caption = 'Update Product'
    TabOrder = 9
    OnClick = btnUpdateProductClick
  end
  object DBGridProducts: TDBGrid
    Left = 140
    Top = 328
    Width = 401
    Height = 105
    DataSource = DataSourceProducts
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object BtnTestSuppliers: TButton
    Left = 456
    Top = 27
    Width = 113
    Height = 25
    Caption = 'Test Suppliers'
    TabOrder = 11
    OnClick = BtnTestSuppliersClick
  end
  object BtnInsertSuppliers: TButton
    Left = 456
    Top = 58
    Width = 113
    Height = 25
    Caption = 'Insert Test Suppliers'
    TabOrder = 12
    OnClick = BtnInsertSuppliersClick
  end
  object BtnDeleteProduct: TButton
    Left = 547
    Top = 408
    Width = 75
    Height = 25
    Caption = 'Delete Product'
    TabOrder = 13
    OnClick = BtnDeleteProductClick
  end
  object BtnStockReport: TButton
    Left = 456
    Top = 143
    Width = 160
    Height = 25
    Caption = 'Total Stock Value Report'
    TabOrder = 14
  end
  object BtnPrintStockValue: TButton
    Left = 456
    Top = 187
    Width = 160
    Height = 25
    Caption = 'Print Stock Value Report'
    TabOrder = 15
    OnClick = BtnPrintStockValueClick
  end
  object btnExportStockReport: TButton
    Left = 456
    Top = 233
    Width = 160
    Height = 25
    Caption = 'Export Stock Report to PDF'
    TabOrder = 16
    OnClick = btnExportStockReportClick
  end
  object DataSourceProducts: TDataSource
    DataSet = FDQueryProducts
    Left = 344
    Top = 136
  end
  object FDQueryProducts: TFDQuery
    Connection = Form1.FDConnection1
    Left = 344
    Top = 200
  end
  object FDConnectionProduct: TFDConnection
    Params.Strings = (
      'DriverID=FB'
      'User_Name=sysdba'
      'Password=masterkey')
    LoginPrompt = False
    Left = 344
    Top = 72
  end
  object ppReportStock: TppReport
    AutoStop = False
    DataPipeline = plReport
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.PaperName = 'Letter'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.SaveDeviceSettings = False
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 279400
    PrinterSetup.mmPaperWidth = 215900
    PrinterSetup.PaperSize = 1
    Template.FileName = 
      'C:\Users\chane\OneDrive\Documents\GitHub\stock-maintenance-syste' +
      'm\src\Reports\StockValueReport.rtm'
    ArchiveFileName = '($MyDocuments)\ReportArchive.raf'
    DeviceType = 'Screen'
    DefaultFileDeviceType = 'PDF'
    EmailSettings.ReportFormat = 'PDF'
    EmailSettings.ConnectionSettings.MailService = 'SMTP'
    EmailSettings.ConnectionSettings.WebMail.GmailSettings.OAuth2.AuthStorage = [oasAccessToken, oasRefreshToken, oasEncryptTokens]
    EmailSettings.ConnectionSettings.WebMail.GmailSettings.OAuth2.RedirectURI = 'http://localhost'
    EmailSettings.ConnectionSettings.WebMail.GmailSettings.OAuth2.RedirectPort = 0
    EmailSettings.ConnectionSettings.WebMail.GmailSettings.OAuth2.RefreshTokenLifeSpan = 365
    EmailSettings.ConnectionSettings.WebMail.Outlook365Settings.OAuth2.AuthStorage = [oasAccessToken, oasRefreshToken, oasEncryptTokens]
    EmailSettings.ConnectionSettings.WebMail.Outlook365Settings.OAuth2.RedirectURI = 'http://localhost'
    EmailSettings.ConnectionSettings.WebMail.Outlook365Settings.OAuth2.RedirectPort = 0
    EmailSettings.ConnectionSettings.WebMail.Outlook365Settings.OAuth2.RefreshTokenLifeSpan = 365
    EmailSettings.ConnectionSettings.EnableMultiPlugin = False
    EmailSettings.ConnectionSettings.ConnectionStatusInfo = [csiStatusBar]
    LanguageID = 'Default'
    OpenFile = False
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    ThumbnailSettings.Enabled = True
    ThumbnailSettings.Visible = True
    ThumbnailSettings.DeadSpace = 30
    ThumbnailSettings.PageHighlight.Width = 3
    ThumbnailSettings.ThumbnailSize = tsSmall
    PDFSettings.EmbedFontOptions = [efUseSubset]
    PDFSettings.EncryptSettings.AllowCopy = True
    PDFSettings.EncryptSettings.AllowInteract = True
    PDFSettings.EncryptSettings.AllowModify = True
    PDFSettings.EncryptSettings.AllowPrint = True
    PDFSettings.EncryptSettings.AllowExtract = True
    PDFSettings.EncryptSettings.AllowAssemble = True
    PDFSettings.EncryptSettings.AllowQualityPrint = True
    PDFSettings.EncryptSettings.Enabled = False
    PDFSettings.EncryptSettings.KeyLength = kl40Bit
    PDFSettings.EncryptSettings.EncryptionType = etRC4
    PDFSettings.DigitalSignatureSettings.SignPDF = False
    PDFSettings.FontEncoding = feAnsi
    PDFSettings.ImageCompressionLevel = 25
    PDFSettings.PDFAFormat = pafNone
    PDFSettings.Layers = False
    PDFSettings.Outline = False
    PreviewFormSettings.PageBorder.mmPadding = 0
    RTFSettings.AppName = 'ReportBuilder'
    RTFSettings.Author = 'ReportBuilder'
    RTFSettings.DefaultFont.Charset = DEFAULT_CHARSET
    RTFSettings.DefaultFont.Color = clWindowText
    RTFSettings.DefaultFont.Height = -13
    RTFSettings.DefaultFont.Name = 'Arial'
    RTFSettings.DefaultFont.Style = []
    RTFSettings.Title = 'Report'
    TextFileName = '($MyDocuments)\Report.pdf'
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    XLSSettings.AppName = 'ReportBuilder'
    XLSSettings.Author = 'ReportBuilder'
    XLSSettings.Subject = 'Report'
    XLSSettings.Title = 'Report'
    XLSSettings.WorksheetName = 'Report'
    CloudDriveSettings.DropBoxSettings.OAuth2.AuthStorage = [oasAccessToken, oasRefreshToken, oasEncryptTokens]
    CloudDriveSettings.DropBoxSettings.OAuth2.RedirectURI = 'http://localhost'
    CloudDriveSettings.DropBoxSettings.OAuth2.RedirectPort = 0
    CloudDriveSettings.DropBoxSettings.OAuth2.RefreshTokenLifeSpan = 365
    CloudDriveSettings.DropBoxSettings.DirectorySupport = True
    CloudDriveSettings.DropBoxSettings.SharedResources = True
    CloudDriveSettings.GoogleDriveSettings.OAuth2.AuthStorage = [oasAccessToken, oasRefreshToken, oasEncryptTokens]
    CloudDriveSettings.GoogleDriveSettings.OAuth2.RedirectURI = 'http://localhost'
    CloudDriveSettings.GoogleDriveSettings.OAuth2.RedirectPort = 0
    CloudDriveSettings.GoogleDriveSettings.OAuth2.RefreshTokenLifeSpan = 365
    CloudDriveSettings.GoogleDriveSettings.DirectorySupport = False
    CloudDriveSettings.GoogleDriveSettings.SharedResources = False
    CloudDriveSettings.OneDriveSettings.OAuth2.AuthStorage = [oasAccessToken, oasRefreshToken, oasEncryptTokens]
    CloudDriveSettings.OneDriveSettings.OAuth2.RedirectURI = 'http://localhost'
    CloudDriveSettings.OneDriveSettings.OAuth2.RedirectPort = 0
    CloudDriveSettings.OneDriveSettings.OAuth2.RefreshTokenLifeSpan = 365
    CloudDriveSettings.OneDriveSettings.DirectorySupport = True
    CloudDriveSettings.OneDriveSettings.SharedResources = True
    Left = 432
    Top = 264
    Version = '23.01'
    mmColumnWidth = 0
    DataPipelineName = 'plReport'
    object ppHeaderBand1: TppHeaderBand
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 14288
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label1'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'DESCRIPTION'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        Transparent = True
        mmHeight = 4763
        mmLeft = 1852
        mmTop = 6615
        mmWidth = 36777
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel3: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label3'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'RETAILPRICE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 51858
        mmTop = 6615
        mmWidth = 38894
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel2: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label2'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'SOH'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 107156
        mmTop = 6615
        mmWidth = 32808
        BandType = 0
        LayerName = Foreground
      end
      object ppLabel4: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label4'
        AutoSize = False
        Border.mmPadding = 0
        Caption = 'STOCKVALUE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 157957
        mmTop = 6615
        mmWidth = 33867
        BandType = 0
        LayerName = Foreground
      end
    end
    object ppDetailBand1: TppDetailBand
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 26458
      mmPrintPosition = 0
      object ppDBText1: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText1'
        Border.mmPadding = 0
        DataField = 'DESCRIPTION'
        DataPipeline = plReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        Transparent = True
        DataPipelineName = 'plReport'
        mmHeight = 4763
        mmLeft = 1852
        mmTop = 3704
        mmWidth = 36777
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText3: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText3'
        Border.mmPadding = 0
        DataField = 'RETAILPRICE'
        DataPipeline = plReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plReport'
        mmHeight = 4763
        mmLeft = 51858
        mmTop = 3704
        mmWidth = 38894
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText2: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText2'
        Border.mmPadding = 0
        DataField = 'SOH'
        DataPipeline = plReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plReport'
        mmHeight = 4763
        mmLeft = 107156
        mmTop = 3704
        mmWidth = 32808
        BandType = 4
        LayerName = Foreground
      end
      object ppDBText4: TppDBText
        DesignLayer = ppDesignLayer1
        UserName = 'DBText4'
        Border.mmPadding = 0
        DataField = 'STOCKVALUE'
        DataPipeline = plReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plReport'
        mmHeight = 4763
        mmLeft = 157957
        mmTop = 3704
        mmWidth = 33867
        BandType = 4
        LayerName = Foreground
      end
    end
    object ppFooterBand1: TppFooterBand
      Border.mmPadding = 0
      mmBottomOffset = 0
      mmHeight = 21431
      mmPrintPosition = 0
      object ppLabel5: TppLabel
        DesignLayer = ppDesignLayer1
        UserName = 'Label5'
        Border.mmPadding = 0
        Caption = 'Total Stock Value'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        FormFieldSettings.FormSubmitInfo.SubmitMethod = fstPost
        FormFieldSettings.FormFieldType = fftNone
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 4763
        mmLeft = 161396
        mmTop = 5821
        mmWidth = 32279
        BandType = 8
        LayerName = Foreground
      end
      object ppDBCalc1: TppDBCalc
        DesignLayer = ppDesignLayer1
        UserName = 'DBCalc1'
        Border.mmPadding = 0
        DataField = 'STOCKVALUE'
        DataPipeline = plReport
        DisplayFormat = 'R#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'plReport'
        mmHeight = 4763
        mmLeft = 147109
        mmTop = 12965
        mmWidth = 46567
        BandType = 8
        LayerName = Foreground
      end
    end
    object ppDesignLayers1: TppDesignLayers
      object ppDesignLayer1: TppDesignLayer
        UserName = 'Foreground'
        LayerType = ltBanded
        Index = 0
      end
    end
    object ppParameterList1: TppParameterList
    end
  end
  object DSReport: TDataSource
    DataSet = FDQueryReport
    Left = 504
    Top = 264
  end
  object FDQueryReport: TFDQuery
    Active = True
    Connection = Form1.FDConnection1
    SQL.Strings = (
      
        'SELECT Description, RetailPrice, SOH, (RetailPrice * SOH) AS Sto' +
        'ckValue FROM Products')
    Left = 344
    Top = 264
  end
  object plReport: TppDBPipeline
    DataSource = DSReport
    UserName = 'plReport'
    Left = 560
    Top = 264
    object plReportppField1: TppField
      FieldAlias = 'DESCRIPTION'
      FieldName = 'DESCRIPTION'
      FieldLength = 0
      DisplayWidth = 0
      Position = 0
    end
    object plReportppField2: TppField
      Alignment = taRightJustify
      FieldAlias = 'RETAILPRICE'
      FieldName = 'RETAILPRICE'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 19
      Position = 1
    end
    object plReportppField3: TppField
      Alignment = taRightJustify
      FieldAlias = 'SOH'
      FieldName = 'SOH'
      FieldLength = 0
      DataType = dtInteger
      DisplayWidth = 10
      Position = 2
    end
    object plReportppField4: TppField
      Alignment = taRightJustify
      FieldAlias = 'STOCKVALUE'
      FieldName = 'STOCKVALUE'
      FieldLength = 2
      DataType = dtDouble
      DisplayWidth = 39
      Position = 3
    end
  end
end
