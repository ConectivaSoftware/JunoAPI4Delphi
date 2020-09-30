unit JunoAuthorizationService;

interface

uses
  JunoApiServicesInterface,
  AuthorizationToken,
  System.Generics.Collections,
  RESTRequest4D.Request,
  Rest.JSON,
  System.JSON;

type
  TAuthorizationService = class(TInterfacedObject, iAuthorizationService)
    private
      FJson : TJSONObject;
      FAuthentication : TAuthetication;
      FConf : iJunoApiConfig;
      procedure Refresh;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iAuthorizationService;
      function AuthorizationHeader : String;
      function Token : String;
  end;

const
  AUTHORIZATION_HEADER = 'Authorization';
  BEARER = 'Bearer ';
  OAUTH_TOKEN_ENDPOINT = '/oauth/token';

implementation

uses
  REST.Types, System.SysUtils, JunoApiConfig, JunoApiManager;


{ TAuthorizationService }

function TAuthorizationService.AuthorizationHeader: String;
begin
  Result := AUTHORIZATION_HEADER +','+ BEARER + FAuthentication.access_token;
end;

constructor TAuthorizationService.Create;
begin
  FConf := TJunoApiConig.New;
  Refresh;
end;

destructor TAuthorizationService.Destroy;
begin

  inherited;
end;

class function TAuthorizationService.New: iAuthorizationService;
begin
  Result := Self.Create;
end;

procedure TAuthorizationService.Refresh;
begin
  FJSON :=
    TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(
      TRequest.New.BaseURL(TJunoApiManager.New.AuthorizationServerEndpoint
        +OAUTH_TOKEN_ENDPOINT)
          .Accept('application/json')
          .BasicAuthentication(FConf.ClientID,FConf.ClientSecret)
          .AddParam('Content-Type','application/x-www-form-urlencoded',pkGETorPOST)
          .AddParam('grant_type','client_credentials',pkREQUESTBODY)
          .Post.Content), 0) as TJSONObject;
  FAuthentication :=  TJson.JsonToObject<TAuthetication>(FJSON);
end;

function TAuthorizationService.Token: String;
begin
  Result :=  FConf.ResourceToken;
end;

end.
