unit Infra.Rotas;

interface

uses
  System.StrUtils, System.Classes, System.JSON;
type
  TRotas = class
  public
    class procedure Registrar;
  end;

implementation

{ TRouter }
uses
  Horse, Interfaces.IEmail, Impl.Gmail, System.SysUtils, Impl.SendInBlue;

class procedure TRotas.Registrar;
var
  lEmail : IEmail;
  lBody  : TJSONObject;
  lDestinatario, lMsg : string;
begin

  THorse.Post('email',
  procedure(Req: THorseRequest; Res: THorseResponse)
  begin
    lBody := TJSONObject.ParseJSONValue(TEncoding.UTF8.GetBytes(Req.Body) , 0) as TJSONObject;
    try
      lDestinatario := lBody.GetValue<string>('email','');
      lMsg          := lBody.GetValue<string>('msg','');

      lEmail := TGMail.new;

      Res.ContentType('text/html');
      Res.Send(lEmail
               .Configurar
               .Enviar(lDestinatario , lMsg)
              );

    finally
      lBody.Free;
    end;

  end);
end;
end.
