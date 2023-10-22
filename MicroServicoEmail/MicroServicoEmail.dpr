program MicroServicoEmail;

uses
  Vcl.Forms,
  View.Main in 'View\View.Main.pas' {FrmMain},
  Infra.Rotas in 'Infra\Infra.Rotas.pas',
  Interfaces.IEmail in 'Interfaces\Interfaces.IEmail.pas',
  Impl.Gmail in 'Impl\Impl.Gmail.pas',
  Impl.SendInBlue in 'Impl\Impl.SendInBlue.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown := true;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
