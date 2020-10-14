unit SandboxEnvironment;

interface

uses
  JunoApi4Delphi.Interfaces;

type
  TSandboxEnvironment = class(TInterfacedObject, iEnvironment)
    private
      CONST
        AUTHORIZATION_SERVER = 'https://sandbox.boletobancario.com/authorization-server';
        RESOURCE_SERVER = 'https://sandbox.boletobancario.com/api-integration';
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iEnvironment;
      function AuthorizationServerEndpoint : String;
      function ResourceServerEndpoint : String;
  end;

implementation

{ TSandboxEnvironment }

function TSandboxEnvironment.AuthorizationServerEndpoint: String;
begin
  Result := AUTHORIZATION_SERVER;
end;

constructor TSandboxEnvironment.Create;
begin

end;

destructor TSandboxEnvironment.Destroy;
begin

  inherited;
end;

class function TSandboxEnvironment.New: iEnvironment;
begin
  Result := Self.Create;
end;

function TSandboxEnvironment.ResourceServerEndpoint: String;
begin
  Result := RESOURCE_SERVER;
end;

end.
