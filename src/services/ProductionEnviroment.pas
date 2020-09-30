unit ProductionEnviroment;

interface

uses
  JunoApiServicesInterface;

type
  TProductionEnviroment = class(TInterfacedObject, iEnvironment)
    private
      CONST
        AUTHORIZATION_SERVER = 'https://api.juno.com.br/authorization-server';
        RESOURCE_SERVER = 'https://api.juno.com.br';
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iEnvironment;
      function AuthorizationServerEndpoint : String;
      function ResourceServerEndpoint : String;
  end;

implementation

{ TProductionEnviroment }

function TProductionEnviroment.AuthorizationServerEndpoint: String;
begin
  Result := AUTHORIZATION_SERVER;
end;

constructor TProductionEnviroment.Create;
begin

end;

destructor TProductionEnviroment.Destroy;
begin

  inherited;
end;

class function TProductionEnviroment.New: iEnvironment;
begin
  Result := Self.Create;
end;

function TProductionEnviroment.ResourceServerEndpoint: String;
begin
  Result := RESOURCE_SERVER;
end;

end.
