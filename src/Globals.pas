unit Globals;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs;

type
  TFormGlobals = class(TForm)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGlobals: TFormGlobals;
  LoggedInUser: string;
  LoggedInIsAdmin: Boolean;

implementation

{$R *.dfm}

end.
