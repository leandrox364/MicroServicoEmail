unit Interfaces.IEmail;

interface

uses
  System.Classes, System.SysUtils;

type
  IEmail = Interface
  ['{61DAF992-4AA4-4C9E-8EB7-889C83451A1E}']
     function Configurar: IEmail;
     function Enviar(const email: string; const msg: String): String;

  end;

implementation

end.
