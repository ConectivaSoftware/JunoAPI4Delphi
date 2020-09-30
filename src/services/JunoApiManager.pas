unit JunoApiManager;

interface

uses
  JunoApiServicesInterface;

type
  TJunoApiManager = class(TInterfacedObject, iJunoApiManager)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iJunoApiManager;
      function AuthorizationServerEndpoint : String;
      function SandboxEnvironment : String;
      function ResourceServerEndpoint : String;
  end;

const
  AUTHORIZATION_SERVER = 'https://api.juno.com.br/authorization-server';
  SANDBOX_RESOURCE = 'https://sandbox.boletobancario.com/api-integration';
  RESOURCE_SERVER = 'https://api.juno.com.br';

implementation

{ TJunoApiManager }

function TJunoApiManager.AuthorizationServerEndpoint: String;
begin
  Result := AUTHORIZATION_SERVER;
end;

constructor TJunoApiManager.Create;
begin

end;

destructor TJunoApiManager.Destroy;
begin

  inherited;
end;

class function TJunoApiManager.New: iJunoApiManager;
begin
  Result := Self.Create;
end;

function TJunoApiManager.ResourceServerEndpoint: String;
begin
  Result := RESOURCE_SERVER;
end;

function TJunoApiManager.SandboxEnvironment: String;
begin
  Result := SANDBOX_RESOURCE;
end;

end.
