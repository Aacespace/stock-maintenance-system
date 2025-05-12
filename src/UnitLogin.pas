unit UnitLogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, MainForm,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  StrUtils, UnitProduct, Globals, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.FB, FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait;

type
  TFormLogin = class(TForm)
    EditUsername: TEdit;
    EditPassword: TEdit;
    btnLogin: TButton;
    lblUsername: TLabel;
    lblPassword: TLabel;
    FDQuery1: TFDQuery;
    procedure FormCreate(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    // procedure btnLoadUsersClick(Sender: TObject); // Commented out: Testing method
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormProduct: TFormProduct;
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

//------------------------------------------------------------------------------
// Production Login Logic
//------------------------------------------------------------------------------
procedure TFormLogin.btnLoginClick(Sender: TObject);
var
  Username, Password: string;
begin
  Username := Trim(EditUsername.Text);
  Password := Trim(EditPassword.Text);

  // Use the global FDConnection1 from MainForm
  FDQuery1.Connection := Form1.FDConnection1;

  // Query to validate user credentials
  FDQuery1.Close;
  FDQuery1.SQL.Text :=
    'SELECT * FROM Users WHERE Username = :Username AND Password = :Password';
  FDQuery1.ParamByName('Username').AsString := Username;
  FDQuery1.ParamByName('Password').AsString := Password;
  FDQuery1.Open;

  // If matching user found, store role and continue
  if not FDQuery1.IsEmpty then
  begin
    LoggedInUser := Username;
    LoggedInIsAdmin := FDQuery1.FieldByName('IsAdmin').AsInteger = 1;

    // Optional debug message
    ShowMessage('LoggedInIsAdmin = ' + BoolToStr(LoggedInIsAdmin, True));
    ShowMessage('Login successful!');

    // Open main product form after login
    FormProduct := TFormProduct.Create(nil);
    FormProduct.Show;
    FormLogin.Hide;
  end
  else
  begin
    ShowMessage('Invalid username or password.');
  end;
end;

//------------------------------------------------------------------------------
// Ensure connection is ready before login
//------------------------------------------------------------------------------
procedure TFormLogin.FormCreate(Sender: TObject);
begin
  // Ensure the shared connection from Form1 is active
  if Assigned(Form1) and Assigned(Form1.FDConnection1) then
  begin
    if not Form1.FDConnection1.Connected then
      Form1.FDConnection1.Connected := True;
  end;
end;

(*
//------------------------------------------------------------------------------
// TEST METHOD - Commented out for production
// Used for viewing all users during development
//------------------------------------------------------------------------------
procedure TFormLogin.btnLoadUsersClick(Sender: TObject);
begin
  FDQuery1.Close;
  FDQuery1.SQL.Text := 'SELECT * FROM Users';
  FDQuery1.Open;
end;
*)

end.

