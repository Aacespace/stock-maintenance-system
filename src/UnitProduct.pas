unit UnitProduct;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, Vcl.Grids, Vcl.DBGrids, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, MainForm, Globals, ppComm, ppRelatv, ppProd, ppClass,
  ppReport, ppDB, ppDBPipe, ppBands, ppCache, ppDesignLayer, ppParameter,
  ppCtrls, ppPrnabl, System.IOUtils, ppTypes, ppDevice, ppPDFDevice;

type
  TFormProduct = class(TForm)
    // UI components for product management
    lblBarcode: TLabel;
    EditBarcode: TEdit;
    lblDescriotion: TLabel;
    EditDescription: TEdit;
    lblSelectDepartment: TLabel;
    ComboDepartment: TComboBox;
    lblRetailPrice: TLabel;
    EditRetailPrice: TEdit;
    lblProductCost: TLabel;
    EditCostPrice: TEdit;
    lblMarkup: TLabel;
    EditMarkup: TEdit;
    lblSOH: TLabel;
    EditSOH: TEdit;
    LblSelectSupplier: TLabel;
    ComboSupplier: TComboBox;
    lblAddProduct: TLabel;
    btnAddProduct: TButton;
    lblUpdateProduct: TLabel;
    btnUpdateProduct: TButton;
    lblGridProducts: TLabel;
    DBGridProducts: TDBGrid;
    DataSourceProducts: TDataSource;
    FDQueryProducts: TFDQuery;
    FDConnectionProduct: TFDConnection;
    BtnTestSuppliers: TButton;
    BtnInsertSuppliers: TButton;
    BtnDeleteProduct: TButton;
    BtnStockReport: TButton;
    ppReportStock: TppReport;
    DSReport: TDataSource;
    BtnPrintStockValue: TButton;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    plReport: TppDBPipeline;
    FDQueryReport: TFDQuery;
    ppLabel1: TppLabel;
    ppDBText1: TppDBText;
    ppLabel2: TppLabel;
    ppDBText2: TppDBText;
    ppLabel3: TppLabel;
    ppDBText3: TppDBText;
    ppLabel4: TppLabel;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppDBCalc1: TppDBCalc;
    btnExportStockReport: TButton;

    // Event procedures
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure LoadProducts;
    procedure btnAddProductClick(Sender: TObject);
    procedure BtnTestSuppliersClick(Sender: TObject);
    procedure BtnInsertSuppliersClick(Sender: TObject);
    procedure btnUpdateProductClick(Sender: TObject);
    procedure BtnDeleteProductClick(Sender: TObject);
    procedure BtnPrintStockValueClick(Sender: TObject);
    procedure btnExportStockReportClick(Sender: TObject);

  private
    { Internal functionality not directly accessible from other units }
  public
    { Accessible functionality for other units if needed }
  end;

var
  FormProduct: TFormProduct;
  PDFDevice: TppPDFDevice;

implementation

{$R *.dfm}

// Set up database connection for this form only (used for special cases)
procedure TFormProduct.FormCreate(Sender: TObject);
begin
  FDConnectionProduct.Params.Clear;
  FDConnectionProduct.Params.DriverID := 'FB';
  FDConnectionProduct.Params.Database := 'C:\DelphiProjects\stock-maintenance-system\db\StockDB.fdb';
  FDConnectionProduct.Params.UserName := 'SYSDBA';
  FDConnectionProduct.Params.Password := 'masterkey';
  FDConnectionProduct.Params.Values['CharacterSet'] := 'UTF8';
  FDConnectionProduct.LoginPrompt := False;

  try
    FDConnectionProduct.Connected := True;
  except
    on E: Exception do
      ShowMessage('Database connection error: ' + E.Message);
  end;
end;

// Called when the form opens – loads suppliers and products
procedure TFormProduct.FormShow(Sender: TObject);
begin
  if FDQueryProducts.Connection = nil then
    FDQueryProducts.Connection := Form1.FDConnection1;

  // Load suppliers into combo box
  FDQueryProducts.Close;
  FDQueryProducts.SQL.Text := 'SELECT SupplierID, SupplierName FROM Suppliers';
  FDQueryProducts.Open;

  ComboSupplier.Items.Clear;
  while not FDQueryProducts.Eof do
  begin
    ComboSupplier.Items.AddObject(
      FDQueryProducts.FieldByName('SupplierName').AsString,
      TObject(FDQueryProducts.FieldByName('SupplierID').AsInteger)
    );
    FDQueryProducts.Next;
  end;

  // Load the product list into the grid
  LoadProducts;

  // Only allow admins to edit markup
  ShowMessage('Setting Markup Enabled to ' + BoolToStr(LoggedInIsAdmin, True));
  EditMarkup.Enabled := LoggedInIsAdmin;
end;

// Populate the product grid with all product records
procedure TFormProduct.LoadProducts;
begin
  FDQueryProducts.Close;
  FDQueryProducts.Connection := Form1.FDConnection1;
  FDQueryProducts.SQL.Text := 'SELECT * FROM Products';
  FDQueryProducts.Open;
end;

// Add a new product to the database
procedure TFormProduct.btnAddProductClick(Sender: TObject);
begin
  if ComboSupplier.ItemIndex = -1 then
  begin
    ShowMessage('Please select a supplier.');
    Exit;
  end;

  try
    FDQueryProducts.SQL.Text :=
      'INSERT INTO Products (Barcode, Description, Department, RetailPrice, CostPrice, Markup, SOH, SupplierID) ' +
      'VALUES (:Barcode, :Description, :Department, :RetailPrice, :CostPrice, :Markup, :SOH, :SupplierID)';

    FDQueryProducts.ParamByName('Barcode').AsString := EditBarcode.Text;
    FDQueryProducts.ParamByName('Description').AsString := EditDescription.Text;
    FDQueryProducts.ParamByName('Department').AsString := ComboDepartment.Text;
    FDQueryProducts.ParamByName('RetailPrice').AsFloat := StrToFloatDef(EditRetailPrice.Text, 0);
    FDQueryProducts.ParamByName('CostPrice').AsFloat := StrToFloatDef(EditCostPrice.Text, 0);
    FDQueryProducts.ParamByName('Markup').AsFloat := StrToFloatDef(EditMarkup.Text, 0);
    FDQueryProducts.ParamByName('SOH').AsInteger := StrToIntDef(EditSOH.Text, 0);
    FDQueryProducts.ParamByName('SupplierID').AsInteger := Integer(ComboSupplier.Items.Objects[ComboSupplier.ItemIndex]);

    FDQueryProducts.ExecSQL;

    ShowMessage('Product added successfully.');
    LoadProducts;
  except
    on E: Exception do
      ShowMessage('Error adding product: ' + E.Message);
  end;
end;

// Delete selected product
procedure TFormProduct.BtnDeleteProductClick(Sender: TObject);
var
  ProductID: Integer;
begin
  if DBGridProducts.DataSource.DataSet.IsEmpty then
  begin
    ShowMessage('Please select a product to delete.');
    Exit;
  end;

  if MessageDlg('Are you sure you want to delete the selected product?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    Exit;

  ProductID := DBGridProducts.DataSource.DataSet.FieldByName('ProductID').AsInteger;

  FDQueryProducts.Close;
  FDQueryProducts.SQL.Text := 'DELETE FROM Products WHERE ProductID = :ProductID';
  FDQueryProducts.ParamByName('ProductID').AsInteger := ProductID;
  FDQueryProducts.ExecSQL;

  ShowMessage('Product deleted successfully.');
  LoadProducts;
end;

// Update selected product details
procedure TFormProduct.BtnUpdateProductClick(Sender: TObject);
var
  SupplierID: Integer;
begin
  if FDQueryProducts.IsEmpty then
  begin
    ShowMessage('Please select a product to update.');
    Exit;
  end;

  if ComboSupplier.ItemIndex = -1 then
  begin
    ShowMessage('Please select a supplier.');
    Exit;
  end;

  SupplierID := Integer(ComboSupplier.Items.Objects[ComboSupplier.ItemIndex]);

  FDQueryProducts.SQL.Text :=
    'UPDATE Products SET ' +
    'Description = :Description, ' +
    'Department = :Department, ' +
    'RetailPrice = :RetailPrice, ' +
    'CostPrice = :CostPrice, ' +
    'Markup = :Markup, ' +
    'SOH = :SOH, ' +
    'SupplierID = :SupplierID ' +
    'WHERE Barcode = :Barcode';

  FDQueryProducts.Params.ParamByName('Description').AsString := EditDescription.Text;
  FDQueryProducts.Params.ParamByName('Department').AsString := ComboDepartment.Text;
  FDQueryProducts.Params.ParamByName('RetailPrice').AsFloat := StrToFloatDef(EditRetailPrice.Text, 0);
  FDQueryProducts.Params.ParamByName('CostPrice').AsFloat := StrToFloatDef(EditCostPrice.Text, 0);
  FDQueryProducts.Params.ParamByName('Markup').AsFloat := StrToFloatDef(EditMarkup.Text, 0);
  FDQueryProducts.Params.ParamByName('SOH').AsInteger := StrToIntDef(EditSOH.Text, 0);
  FDQueryProducts.Params.ParamByName('SupplierID').AsInteger := SupplierID;
  FDQueryProducts.Params.ParamByName('Barcode').AsString := EditBarcode.Text;

  try
    FDQueryProducts.ExecSQL;
    ShowMessage('Product updated successfully.');
    LoadProducts;

    // Clear input fields
    EditBarcode.Clear;
    EditDescription.Clear;
    ComboDepartment.ItemIndex := -1;
    EditRetailPrice.Clear;
    EditCostPrice.Clear;
    EditMarkup.Clear;
    EditSOH.Clear;
    ComboSupplier.ItemIndex := -1;
  except
    on E: Exception do
      ShowMessage('Error updating product: ' + E.Message);
  end;
end;

// Insert sample suppliers (demo/testing)
procedure TFormProduct.BtnInsertSuppliersClick(Sender: TObject);
begin
  try
    FDQueryProducts.SQL.Text := 'INSERT INTO SUPPLIERS (SUPPLIERNAME) VALUES (:Name)';

    FDQueryProducts.ParamByName('Name').AsString := 'Alpha Trading';
    FDQueryProducts.ExecSQL;

    FDQueryProducts.ParamByName('Name').AsString := 'Beta Distributors';
    FDQueryProducts.ExecSQL;

    FDQueryProducts.ParamByName('Name').AsString := 'Gamma Wholesale';
    FDQueryProducts.ExecSQL;

    ShowMessage('Sample suppliers inserted. Please restart the form.');
  except
    on E: Exception do
      ShowMessage('Error inserting suppliers: ' + E.Message);
  end;
end;

// Preview and print the stock report from a template
procedure TFormProduct.btnPrintStockValueClick(Sender: TObject);
var
  ReportPath: string;
begin
  try
    if not Form1.FDConnection1.Connected then
      Form1.FDConnection1.Connected := True;

    ReportPath := 'C:\DelphiProjects\stock-maintenance-system\db\Reports\StockValueReport.rtm';

    if FileExists(ReportPath) then
    begin
      ppReportStock.Template.FileName := ReportPath;
      ppReportStock.Template.LoadFromFile;
    end
    else
    begin
      ShowMessage('Report file not found: ' + ReportPath);
      Exit;
    end;

    FDQueryReport.Close;
    FDQueryReport.SQL.Text := 'SELECT Description, RetailPrice, SOH, (RetailPrice * SOH) AS StockValue FROM Products';
    FDQueryReport.Open;

    ppReportStock.Print;
  except
    on E: Exception do
      ShowMessage('Error printing stock report: ' + E.Message);
  end;
end;

// Export report directly without layout
procedure TFormProduct.btnExportStockReportClick(Sender: TObject);
begin
  try
    if not Form1.FDConnection1.Connected then
      Form1.FDConnection1.Connected := True;

    FDQueryReport.Close;
    FDQueryReport.SQL.Text := 'SELECT Description, RetailPrice, SOH, (RetailPrice * SOH) AS StockValue FROM Products';
    FDQueryReport.Open;

    ppReportStock.Print;
  except
    on E: Exception do
      ShowMessage('Error generating stock value report: ' + E.Message);
  end;
end;

// Test query to check supplier records
procedure TFormProduct.BtnTestSuppliersClick(Sender: TObject);
begin
  FDQueryProducts.Close;
  FDQueryProducts.SQL.Text := 'SELECT SupplierID, SupplierName FROM Suppliers';
  FDQueryProducts.Open;

  ShowMessage('Records found: ' + IntToStr(FDQueryProducts.RecordCount));
end;

end.

