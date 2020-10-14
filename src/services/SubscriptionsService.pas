unit SubscriptionsService;

interface

uses
  JunoApi4Delphi.Interfaces,
  Data.DB,
  System.JSON;

type
  TSubscriptionsService = class(TInterfacedObject, iSubscriptions)
    private
      FBilling : iBilling<iSubscriptions>;
      FSplit : iSplit<iSubscriptions>;
      FParent : iJunoApi4DelphiConig;
      FAuth : iAuthorizationService;
      FJSON : TJSONObject;
    public
      constructor Create(Parent : iJunoApi4DelphiConig;  AuthService : iAuthorizationService);
      destructor Destroy; override;
      class function New(Parent : iJunoApi4DelphiConig;  AuthService : iAuthorizationService) : iSubscriptions;
      function CreateSubscription : iSubscriptions;
      function DueDay(Value : Integer) : iSubscriptions;
      function PlanId(Value : String) : iSubscriptions;
      function ChargeDescription(Value : String): iSubscriptions;
      function CreditCardDetails(Value : String) : iSubscriptions;
      function Billing : iBilling<iSubscriptions>;
      function Split : iSplit<iSubscriptions>;
      function &End(Value : TDataSet) : iSubscriptions; overload;
      function &End : String; overload;

      function GetSubscriptions(Value : TDataSet) : iSubscriptions; overload;
      function GetSubscriptions : String; overload;

      function GetSubscription(Value : String; dtValue : TDataSet) : iSubscriptions; overload;
      function GetSubscription(Value : String) : String; overload;

      function DeactiveSubscription(Value : String) : String;
      function ActiveSubscription(Value : String) : String;

      function CancelationSubscription(Value : String) : String;
  end;

implementation

uses Billing, Split, REST.Response.Adapter, RESTRequest4D.Request, REST.Types,
  System.SysUtils;

CONST
  SUBSCRIPTIONS_ENDPONT = '/subscriptions';

{ TSubscriptionsService }

function TSubscriptionsService.ActiveSubscription(Value: String): String;
begin
  Result :=
  TRequest.New
    .BaseURL(FParent.ResourceEndpoint + SUBSCRIPTIONS_ENDPONT + '/' + Value + '/activation')
    .Token(FAuth.Token)
    .AddParam('X-Api-Version','2',pkHTTPHEADER)
    .AddParam('X-Resource-Token', FParent.ResourceToken, pkHTTPHEADER)
    .Post.Content;
end;

function TSubscriptionsService.Billing: iBilling<iSubscriptions>;
begin
  Result := FBilling;
end;

function TSubscriptionsService.CancelationSubscription(Value: String): String;
begin
  Result :=
  TRequest.New
    .BaseURL(FParent.ResourceEndpoint + SUBSCRIPTIONS_ENDPONT + '/' + Value + '/cancelation')
    .Token(FAuth.Token)
    .AddParam('X-Api-Version','2',pkHTTPHEADER)
    .AddParam('X-Resource-Token', FParent.ResourceToken, pkHTTPHEADER)
    .Post.Content;
end;

function TSubscriptionsService.ChargeDescription(Value: String): iSubscriptions;
begin
  Result := Self;
  FJSON.AddPair('chargeDescription', Value);
end;

function TSubscriptionsService.&End: String;
var
  lJSONBilling : TJSONObject;
  ljson:TJSONObject;
begin
  lJSONBilling := TJSONObject.Create;
  ljson := TJSONObject.Create;

  lJSONBilling.AddPair('email', FBilling.Email);
  lJSONBilling.AddPair('name', FBilling.Name);
  lJSONBilling.AddPair('document', FBilling.Document);

  ljson.AddPair('street', FBilling.Street);
  ljson.AddPair('number', FBilling.Number);
  ljson.AddPair('complement', FBilling.Complement);
  ljson.AddPair('neighborhood', FBilling.Neighborhood);
  ljson.AddPair('city', FBilling.City);
  ljson.AddPair('state', FBilling.State);
  ljson.AddPair('postCode', FBilling.PostCode);

  lJSONBilling.AddPair('address', ljson);

  FJSON.AddPair('billing', lJSONBilling);

  Result :=
    TRequest.New
        .BaseURL(FParent.ResourceEndpoint + SUBSCRIPTIONS_ENDPONT)
        .Accept('application/json')
        .Token(FAuth.Token)
        .AddBody('application/json',ctAPPLICATION_JSON)
        .AddParam('X-Api-Version','2',pkHTTPHEADER)
        .AddParam('X-Resource-Token', FParent.ResourceToken, pkHTTPHEADER)
        .AddParam('body', FJSON.ToString, pkREQUESTBODY)
        .Post.Content;
end;

function TSubscriptionsService.GetSubscription(Value: String): String;
begin
  Result :=
  TRequest.New
    .BaseURL(FParent.ResourceEndpoint + SUBSCRIPTIONS_ENDPONT + '/' + Value)
    .Token(FAuth.Token)
    .AddParam('X-Api-Version','2',pkHTTPHEADER)
    .AddParam('X-Resource-Token', FParent.ResourceToken, pkHTTPHEADER)
    .Get.Content;
end;

function TSubscriptionsService.GetSubscription(Value: String;
  dtValue: TDataSet): iSubscriptions;
var
  lJSONObj : TJSONObject;
  lJSONArray : TJSONArray;
  jv : TJSONValue;

  lConv : TCustomJSONDataSetAdapter;
  lJSON : String;
begin
  Result := Self;
  lJSON :=
    TRequest.New
    .BaseURL(FParent.ResourceEndpoint + SUBSCRIPTIONS_ENDPONT + '/' + Value)
    .Token(FAuth.Token)
    .AddParam('X-Api-Version','2',pkHTTPHEADER)
    .AddParam('X-Resource-Token', FParent.ResourceToken, pkHTTPHEADER)
    .Get.Content;

  lJSONObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(lJSON), 0) as TJSONObject;

  lConv := TCustomJSONDataSetAdapter.Create(nil);
  try
    lConv.DataSet := dtValue;
    lConv.UpdateDataSet(lJSONObj);
  finally
    lConv.Free;
  end;
end;

function TSubscriptionsService.GetSubscriptions: String;
begin
  Result :=
  TRequest.New
    .BaseURL(FParent.ResourceEndpoint + SUBSCRIPTIONS_ENDPONT)
    .Token(FAuth.Token)
    .AddParam('X-Api-Version','2',pkHTTPHEADER)
    .AddParam('X-Resource-Token', FParent.ResourceToken, pkHTTPHEADER)
    .Get.Content;
end;

function TSubscriptionsService.GetSubscriptions(Value: TDataSet): iSubscriptions;
var
  lJSONObj : TJSONObject;
  lJSONArray : TJSONArray;
  jv : TJSONValue;

  lConv : TCustomJSONDataSetAdapter;
  lJSON : String;
begin
  Result := Self;
  lJSON :=
    TRequest.New
    .BaseURL(FParent.ResourceEndpoint + SUBSCRIPTIONS_ENDPONT)
    .Token(FAuth.Token)
    .AddParam('X-Api-Version','2',pkHTTPHEADER)
    .AddParam('X-Resource-Token', FParent.ResourceToken, pkHTTPHEADER)
    .Get.Content;

  lJSONObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(lJSON), 0) as TJSONObject;
  jv := lJSONObj.Get('_embedded').JsonValue;
  lJSONObj := jv as TJSONObject;
  lJSONArray := lJSONObj.Get('subscriptions').JsonValue as TJSONArray;

  lConv := TCustomJSONDataSetAdapter.Create(nil);
  try
    lConv.DataSet := Value;
    lConv.UpdateDataSet(lJSONArray);
  finally
    lConv.Free;
  end;
end;

function TSubscriptionsService.&End(Value: TDataSet): iSubscriptions;
var
  lJSONObj,lJSONBilling,ljsono : TJSONObject;

  lConv : TCustomJSONDataSetAdapter;
  ljson : String;
begin
  Result := Self;

  lJSONBilling := TJSONObject.Create;
  ljsono := TJSONObject.Create;

  lJSONBilling.AddPair('email', FBilling.Email);
  lJSONBilling.AddPair('name', FBilling.Name);
  lJSONBilling.AddPair('document', FBilling.Document);

  ljsono.AddPair('street', FBilling.Street);
  ljsono.AddPair('number', FBilling.Number);
  ljsono.AddPair('complement', FBilling.Complement);
  ljsono.AddPair('neighborhood', FBilling.Neighborhood);
  ljsono.AddPair('city', FBilling.City);
  ljsono.AddPair('state', FBilling.State);
  ljsono.AddPair('postCode', FBilling.PostCode);

  lJSONBilling.AddPair('address', ljsono);

  FJSON.AddPair('billing', lJSONBilling);

  lJSON :=
    TRequest.New
      .BaseURL(FParent.ResourceEndpoint + SUBSCRIPTIONS_ENDPONT)
      .Accept('application/json')
      .Token(FAuth.Token)
      .AddBody('application/json',ctAPPLICATION_JSON)
      .AddParam('X-Api-Version','2',pkHTTPHEADER)
      .AddParam('X-Resource-Token', FParent.ResourceToken, pkHTTPHEADER)
      .AddParam('body', FJSON.ToString, pkREQUESTBODY)
      .Post.Content;

  lJSONObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(lJSON), 0) as TJSONObject;

  lConv := TCustomJSONDataSetAdapter.Create(nil);
  try
    lConv.DataSet := Value;
    lConv.UpdateDataSet(lJSONObj);
  finally
    lConv.Free;
  end;
end;

constructor TSubscriptionsService.Create(Parent : iJunoApi4DelphiConig;  AuthService : iAuthorizationService);
begin
  FBilling := TBilling<iSubscriptions>.New(Self);
  FSplit := TSplit<iSubscriptions>.New(Self);
  FParent := Parent;
  FAuth := AuthService;
  FJSON := TJSONObject.Create;
end;

function TSubscriptionsService.CreateSubscription: iSubscriptions;
begin
  Result := Self;
end;

function TSubscriptionsService.CreditCardDetails(Value: String): iSubscriptions;
var
  ljson : TJSONObject;
begin
  Result := Self;

  ljson := TJSONObject.Create;

  lJson.AddPair('creditCardHash', Value);

  FJson.AddPair('creditCardDetails',ljson);
end;

function TSubscriptionsService.DeactiveSubscription(Value: String): String;
begin
  Result :=
  TRequest.New
    .BaseURL(FParent.ResourceEndpoint + SUBSCRIPTIONS_ENDPONT + '/' + Value + '/deactivation')
    .Token(FAuth.Token)
    .AddParam('X-Api-Version','2',pkHTTPHEADER)
    .AddParam('X-Resource-Token', FParent.ResourceToken, pkHTTPHEADER)
    .Post.Content;
end;

destructor TSubscriptionsService.Destroy;
begin

  inherited;
end;

function TSubscriptionsService.DueDay(Value: Integer): iSubscriptions;
begin
  Result := Self;
  FJSON.AddPair('dueDay', TJSONNumber.Create(Value));
end;

class function TSubscriptionsService.New(Parent : iJunoApi4DelphiConig;  AuthService : iAuthorizationService) : iSubscriptions;
begin
  Result := Self.Create(Parent, AuthService);
end;

function TSubscriptionsService.PlanId(Value: String): iSubscriptions;
begin
  Result := Self;
  FJSON.AddPair('planId', Value);
end;

function TSubscriptionsService.Split: iSplit<iSubscriptions>;
begin
  Result := FSplit;
end;

end.
