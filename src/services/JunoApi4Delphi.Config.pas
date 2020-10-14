unit JunoApi4Delphi.Config;

interface

uses
  JunoApi4Delphi.Interfaces;

type
  TJunoApi4DelphiConig = class(TInterfacedObject, iJunoApi4DelphiConig)
    private
      FClientId : String;
      FClientSecret : String;
      FResourceToken : String;
      FPublicToken : String;
      FEnvironment : iEnvironment;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iJunoApi4DelphiConig;
      function ClientId(Value : String) : iJunoApi4DelphiConig; overload;
      function ClientId : String; overload;
      function ClientSecret(Value : String) : iJunoApi4DelphiConig; overload;
      function ClientSecret : String; overload;
      function ResourceToken(Value : String) : iJunoApi4DelphiConig; overload;
      function ResourceToken : String; overload;
      function PublicToken(Value : String) : iJunoApi4DelphiConig; overload;
      function PublicToken : String; overload;
      function TokenTimeout : Integer;
      function AuthorizationEndpoint : String;
      function ResourceEndpoint : String;
      function Sandbox : iJunoApi4DelphiConig;
      function Production :iJunoApi4DelphiConig;
  end;

implementation

uses
  SandboxEnvironment, ProductionEnviroment;

{ TJunoApi4DelphiConig }

function TJunoApi4DelphiConig.ClientId(Value: String): iJunoApi4DelphiConig;
begin
  Result := Self;
  FClientId := Value;
end;

function TJunoApi4DelphiConig.AuthorizationEndpoint: String;
begin
  Result := FEnvironment.AuthorizationServerEndpoint;
end;

function TJunoApi4DelphiConig.ClientId: String;
begin
  Result := FClientId;
end;

function TJunoApi4DelphiConig.ClientSecret(Value: String): iJunoApi4DelphiConig;
begin
  Result := Self;
  FClientSecret := Value;
end;

function TJunoApi4DelphiConig.ClientSecret: String;
begin
  Result := FClientSecret;
end;

constructor TJunoApi4DelphiConig.Create;
begin

end;

destructor TJunoApi4DelphiConig.Destroy;
begin

  inherited;
end;

class function TJunoApi4DelphiConig.New: iJunoApi4DelphiConig;
begin
  Result := Self.Create;
end;

function TJunoApi4DelphiConig.Production: iJunoApi4DelphiConig;
begin
  Result := Self;
  FEnvironment := TProductionEnviroment.New;
end;

function TJunoApi4DelphiConig.PublicToken: String;
begin
  Result := FPublicToken;
end;

function TJunoApi4DelphiConig.PublicToken(Value: String): iJunoApi4DelphiConig;
begin
  Result := Self;
  FPublicToken := Value;
end;

function TJunoApi4DelphiConig.ResourceToken(
  Value: String): iJunoApi4DelphiConig;
begin
  Result := Self;
  FResourceToken := Value;
end;

function TJunoApi4DelphiConig.ResourceEndpoint: String;
begin
  Result := FEnvironment.ResourceServerEndpoint;
end;

function TJunoApi4DelphiConig.ResourceToken: String;
begin
  Result := FResourceToken;
end;

function TJunoApi4DelphiConig.Sandbox: iJunoApi4DelphiConig;
begin
  Result := Self;
  FEnvironment := TSandboxEnvironment.New;
end;

function TJunoApi4DelphiConig.TokenTimeout: Integer;
begin
  Result := 86400;
end;

end.
