unit JunoApiServicesInterface;

interface

uses
  System.Generics.Collections;

type
  iEnvironment = interface
    function AuthorizationServerEndpoint : String;
    function ResourceServerEndpoint : String;
  end;

  iAuthorizationService = interface
    function AuthorizationHeader : String;
    function Token : String;
  end;

  iJunoApiConfig = interface
    function ClientID(value : string) : iJunoApiConfig;
    function ClientSecret(value : String) : iJunoApiConfig;
    function ResourceToken(value : String) : iJunoApiConfig;
    function PublicToken(value : string) : iJunoApiConfig;
    function Production : iEnvironment;
    function SandBox : iEnvironment;
  end;

  iJunoApiManager = interface
    function AuthorizationServerEndpoint : String;
    function SandboxEnvironment : String;
    function ResourceServerEndpoint : String;
  end;

  iDelphi4Juno = interface
    function Cofig : iJunoApiConfig;
  end;

implementation

end.
