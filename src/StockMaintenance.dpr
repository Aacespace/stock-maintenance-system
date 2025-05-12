program StockMaintenance;

uses
  Vcl.Forms,
  UnitLogin in 'UnitLogin.pas' {FormLogin},
  MainForm in 'MainForm.pas' {Form1},
  UnitProduct in 'UnitProduct.pas' {FormProduct},
  Globals in 'Globals.pas' {FormGlobals};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TFormGlobals, FormGlobals);
  Application.CreateForm(TFormProduct, FormProduct);
  Application.Run;
end.


