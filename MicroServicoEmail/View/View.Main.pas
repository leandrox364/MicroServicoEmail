unit View.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TFrmMain = class(TForm)
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

uses
  Horse, Infra.Rotas;

{$R *.dfm}

procedure TFrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Thorse.IsRunning then
     Thorse.StopListen;
end;

procedure TFrmMain.FormCreate(Sender: TObject);
begin
  Thorse.KeepConnectionAlive := false;
  Thorse.Listen(1982);
  TRotas.Registrar;

end;

end.
