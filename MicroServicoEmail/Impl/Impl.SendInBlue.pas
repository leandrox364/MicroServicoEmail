unit Impl.SendInBlue;

interface

uses
  System.Classes, System.SysUtils, Interfaces.IEmail;
type
  TConfig = class
  private
    FPrivateKey: string;
    FToken: string;
    FDestinatario: string;
    FMsg: string;

    procedure SetPrivateKey(const Value: string);
    procedure SetToken(const Value: string);
    procedure SetDestinatario(const Value: string);
    procedure SetMsg(const Value: string);
    property PrivateKey : string read FPrivateKey write SetPrivateKey;
    property Token : string  read FToken write SetToken;
    property Destinatario : string read FDestinatario write SetDestinatario;
    property Msg : string read FMsg write SetMsg;

  end;

  TSendInBlue = class (TInterfacedObject , IEmail)

  private
    Configuracao : TConfig;
    Constructor Create;
  public
    Destructor Destroy; Override;
    class Function New : IEmail;
    function Configurar: IEmail;
    function Enviar(const email: string; const msg: String): String;
  end;
implementation

{ TSendInBlue }

function TSendInBlue.Configurar: IEmail;
begin
  Result := self;

  Configuracao       := TConfig.Create;
  Configuracao.PrivateKey := 'sdklfjhkfgfdgk';
  Configuracao.Token      := '123156:sdkjfhd';


end;

constructor TSendInBlue.Create;
begin

end;

destructor TSendInBlue.Destroy;
begin
  Configuracao.Free;
  inherited;
end;

function TSendInBlue.Enviar(const email, msg: String): String;
begin

  Configuracao.Destinatario := email;
  Configuracao.Msg := msg;

  Result := 'SENDINBVLUE - E-mail enviado com sucesso para: ' + Configuracao.Destinatario;

end;

class function TSendInBlue.New: IEmail;
begin
  Result := self.Create;
end;

{ TConfig }

procedure TConfig.SetDestinatario(const Value: string);
begin
  FDestinatario := Value;
end;

procedure TConfig.SetMsg(const Value: string);
begin
  FMsg := Value;
end;

procedure TConfig.SetPrivateKey(const Value: string);
begin
  FPrivateKey := Value;
end;

procedure TConfig.SetToken(const Value: string);
begin
  FToken := Value;
end;

end.
