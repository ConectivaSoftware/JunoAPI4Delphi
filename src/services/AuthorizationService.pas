unit AuthorizationService;

interface

uses
  JunoApi4Delphi.Interfaces,
  RESTRequest4D.Request,
  AuthorizationToken,
  REST.JSON,
  System.JSON;

type
  TAuthorizationService = class(TInterfacedObject, iAuthorizationService)
    private
      FParent : iJunoApi4DelphiConig;
      FAuthenticationToken : TAuthorizationToken;
      procedure Refresh;
    public
      constructor Create(Parent : iJunoApi4DelphiConig);
      destructor Destroy; override;
      class function New(Parent : iJunoApi4DelphiConig) : iAuthorizationService;
      function Token : String;
      function AuthorizationHeader : String;
  end;

const
  AUTHORIZATION_HEADER = 'Authorization';
  BEARER = 'Bearer ';
  OAUTH_TOKEN_ENDPOINT = '/oauth/token';

implementation

uses
  JunoApi4DelphiManager, REST.Types, System.SysUtils;

{ TAuthorizationService }

function TAuthorizationService.AuthorizationHeader: String;
begin

end;

constructor TAuthorizationService.Create(Parent : iJunoApi4DelphiConig);
begin
  FParent := Parent;
  Refresh;
end;

destructor TAuthorizationService.Destroy;
begin

  inherited;
end;

class function TAuthorizationService.New(Parent : iJunoApi4DelphiConig) : iAuthorizationService;
begin
  Result := Self.Create(Parent);
end;

procedure TAuthorizationService.Refresh;
var
  JSONObj : TJSONObject;
begin
  JsonObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(
  TRequest.New.BaseURL(FParent.AuthorizationEndpoint + OAUTH_TOKEN_ENDPOINT)
    .Accept('application/json')
    .BasicAuthentication(FParent.ClientId,FParent.ClientSecret)
    .AddParam('Content-Type','application/x-www-form-urlencoded',pkGETorPOST)
    .AddParam('grant_type','client_credentials',pkREQUESTBODY)
    .Post.Content), 0) as TJSONObject;
  FAuthenticationToken :=  TJson.JsonToObject<TAuthorizationToken>(JsonObj);
end;

function TAuthorizationService.Token: String;
begin
  Result := 'Bearer ' + FAuthenticationToken.access_token;
end;

end.
