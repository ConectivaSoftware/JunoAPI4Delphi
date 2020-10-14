unit DataService;

interface

uses
  JunoApi4Delphi.Interfaces,
  REST.JSON,
  System.JSON,
  System.Generics.Collections,
  Banks,
  AuthorizationService,
  CompanyType;

type
  TDataService = class(TInterfacedObject, iDataService)
    private
      FParent : iJunoApi4DelphiConig;
      FAuth : iAuthorizationService;
    public
      constructor Create(Parent : iJunoApi4DelphiConig;  AuthService : iAuthorizationService);
      destructor Destroy; override;
      class function New(Parent : iJunoApi4DelphiConig; AuthService : iAuthorizationService) : iDataService;
      function Banks : TObjectList<TBanks>;
      function CompanyTypes : String;
      function BusinessAreas : String;
  end;

implementation

uses
  RESTRequest4D.Request, REST.Types, System.SysUtils;

CONST
  DATA_ENDPOINT = '/data';
  BANKS_ENDPOINT = DATA_ENDPOINT + '/banks';
  COMPANY_TYPES_ENDPOINT = DATA_ENDPOINT + '/company-types';
  BUSINESS_AREAS_ENDPOINT = DATA_ENDPOINT + '/business-areas';

{ TDataService }

function TDataService.Banks: TObjectList<TBanks>;
var
  jobj : TJSONObject;
  jv: TJSONValue;
  ja : TJSONArray;
  I : Integer;
begin
  jObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(
    TRequest.New
        .BaseURL(FParent.ResourceEndpoint + BANKS_ENDPOINT)
        .Token(FAuth.Token)
        .AddParam('X-Api-Version','2',pkHTTPHEADER)
        .Get.Content), 0) as TJSONObject;

  jv := jObj.Get('_embedded').JsonValue;
  jobj := jv as TJSONObject;
  jv := jobj.Get('banks').JsonValue;

  ja := jv as TJSONArray;

  Result := TObjectList<TBanks>.Create;
  for I := 0 to ja.Size -1 do
  begin
    Result.Add(TBanks.Create);
    jObj := (ja.Get(i) as TJSONObject);
    jv := jObj.Get(0).JsonValue;
    Result[I].Number := jv.Value;
    jv := jObj.Get(1).JsonValue;
    Result[I].Name := jv.Value;
  end;

end;

function TDataService.BusinessAreas: String;
begin
Result :=
  TRequest.New
    .BaseURL(FParent.ResourceEndpoint + BUSINESS_AREAS_ENDPOINT)
    .Token(FAuth.Token)
    .AddParam('X-Api-Version','2',pkHTTPHEADER)
    .Get.Content;
end;

function TDataService.CompanyTypes: String;
var
  JSONObj : TJSONObject;
  CompanyType : TCompanyType;
begin
  JsonObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(
  TRequest.New
    .BaseURL(FParent.ResourceEndpoint + COMPANY_TYPES_ENDPOINT)
    .Token(FAuth.Token)
    .AddParam('X-Api-Version','2',pkHTTPHEADER)
    .Get.Content), 0) as TJSONObject;

  CompanyType :=  TJson.JsonToObject<TCompanyType>(JsonObj);

  Result := String.Join(',',CompanyType.CompanyTypes);
end;

constructor TDataService.Create(Parent : iJunoApi4DelphiConig;  AuthService : iAuthorizationService);
begin
  FParent := Parent;
  FAuth := AuthService;
end;

destructor TDataService.Destroy;
begin

  inherited;
end;

class function TDataService.New(Parent : iJunoApi4DelphiConig; AuthService : iAuthorizationService) : iDataService;
begin
  Result := Self.Create(Parent, AuthService);
end;

end.
