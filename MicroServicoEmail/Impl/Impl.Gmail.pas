unit Impl.Gmail;

interface

uses
  System.Classes, System.SysUtils, Interfaces.IEmail;
type
  TConfig = class
  private
    FEmail: string;
    FSenha: string;
    FSmtp: string;
    FPorta: integer;
    FDestinatario: string;
    FMsg: string;

    procedure Setemail(const Value: string);
    procedure SetPorta(const Value: integer);
    procedure Setsenha(const Value: string);
    procedure Setsmtp(const Value: string);
    procedure SetDestinatario(const Value: string);
    procedure SetMsg(const Value: string);

    property Porta : integer read FPorta write SetPorta;
    property Smtp : string read Fsmtp write Setsmtp;
    property Email : string read Femail write Setemail;
    property Senha : string read Fsenha write Setsenha;
    property Destinatario : string read FDestinatario write SetDestinatario;
    property Msg : string read FMsg write SetMsg;

  end;

  TGMail = class (TInterfacedObject , IEmail)
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

{ TGMail }

function TGMail.Configurar: IEmail;
begin
  Result := self;

  Configuracao       := TConfig.Create;
  Configuracao.Porta := 1234;
  Configuracao.smtp  := 'smtp.gmail.com';
  Configuracao.email := 'gmail@gmail.com';
  Configuracao.senha := 'gmail';

end;

constructor TGMail.Create;
begin

end;

destructor TGMail.Destroy;
begin
  Configuracao.Free;
  inherited;
end;

function TGMail.Enviar(const email, msg: String): String;
begin

  Configuracao.Destinatario := email;
  Configuracao.Msg := msg;

  Result := 'GMAIL - E-mail enviado com sucesso para: ' + Configuracao.Destinatario;
end;

class function TGMail.New: IEmail;
begin
  Result := self.Create;
end;

{ TConfig }

procedure TConfig.SetDestinatario(const Value: string);
begin
  FDestinatario := Value;
end;

procedure TConfig.Setemail(const Value: string);
begin
  Femail := Value;
end;

procedure TConfig.SetMsg(const Value: string);
begin
  FMsg := Value;
end;

procedure TConfig.SetPorta(const Value: integer);
begin
  FPorta := Value;
end;

procedure TConfig.Setsenha(const Value: string);
begin
  Fsenha := Value;
end;

procedure TConfig.Setsmtp(const Value: string);
begin
  Fsmtp := Value;
end;

end.
