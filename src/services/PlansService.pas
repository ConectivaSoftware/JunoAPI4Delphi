unit PlansService;

interface

uses
  JunoApi4Delphi.Interfaces, 
  Data.DB, 
  System.JSON,
  REST.Response.Adapter;

type
  TPlansService = class(TInterfacedObject, iPlans)
    private
      FParent : iJunoApi4DelphiConig;
      FAuth : iAuthorizationService;
      FJSON : TJSONObject;
    public
      constructor Create(Parent : iJunoApi4DelphiConig;  AuthService : iAuthorizationService);
      destructor Destroy; override;
      class function New(Parent : iJunoApi4DelphiConig;  AuthService : iAuthorizationService) : iPlans;
      function CratePlan : iPlans;
      function Name(Value : String) : iPlans;
      function Amount(Value : Double) : iPlans;
      function EndCreatePlan(Value : TDataSet) : iPlans; overload;
      function EndCreatePlan : String; overload;

      function GetPlans(Value : TDataSet) : iPlans; overload;
      function GetPlans : String; overload;

      function GetPlan(Value : String; dtValue : TDataSet): iPlans; overload;
      function GetPlan(Value : String) : String; overload;

      function DeactivePlan(Value : String; dtValue : TDataSet) : iPlans; overload;
      function DeactivePlan(Value : String) : String; overload;

      function ActivePlan(Value : String; dtValue : TDataSet) : iPlans; overload;
      function ActivePlan(Value : String) : String; overload;      
  end;

implementation

uses
  RESTRequest4D.Request, REST.Types, System.SysUtils;

CONST
  PLAN_ENDPOINT = '/plans';

{ TPlansService }

function TPlansService.ActivePlan(Value: String): String;
begin
  Result :=
    TRequest.New
      .BaseURL(FParent.ResourceEndpoint + PLAN_ENDPOINT +'/'+ Value +'/activation')
      .Accept('application/json')
      .Token(FAuth.Token)
      .AddBody('application/json',ctAPPLICATION_JSON)
      .AddParam('X-Api-Version','2',pkHTTPHEADER)
      .AddParam('X-Resource-Token', FParent.ResourceToken, pkHTTPHEADER)
      .AddParam('body', FJSON.ToString, pkREQUESTBODY)
      .Post.Content;
end;

function TPlansService.ActivePlan(Value: String; dtValue: TDataSet): iPlans;
var
  lJSONObj : TJSONObject;

  lConv : TCustomJSONDataSetAdapter;
  lJSON : String;
begin
  Result := Self;

  lJSON :=
   TRequest.New
      .BaseURL(FParent.ResourceEndpoint + PLAN_ENDPOINT +'/'+ Value +'/activation')
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
    lConv.DataSet := dtValue;
    lConv.UpdateDataSet(lJSONObj);
  finally
    lConv.Free;
  end;
end;

function TPlansService.Amount(Value: Double): iPlans;
begin
  Result := Self;
  FJSON.AddPair('amount', TJSONNumber.Create(Value));
end;

function TPlansService.DeactivePlan(Value: String): String;
begin
  Result := 
    TRequest.New
      .BaseURL(FParent.ResourceEndpoint + PLAN_ENDPOINT +'/'+ Value +'/deactivation')
      .Accept('application/json')
      .Token(FAuth.Token)
      .AddBody('application/json',ctAPPLICATION_JSON)
      .AddParam('X-Api-Version','2',pkHTTPHEADER)
      .AddParam('X-Resource-Token', FParent.ResourceToken, pkHTTPHEADER)
      .AddParam('body', FJSON.ToString, pkREQUESTBODY)
      .Post.Content;
end;

function TPlansService.DeactivePlan(Value: String; dtValue: TDataSet): iPlans;
var
  lJSONObj : TJSONObject;

  lConv : TCustomJSONDataSetAdapter;
  lJSON : String;
begin
  Result := Self;
  lJSON := 
    TRequest.New
      .BaseURL(FParent.ResourceEndpoint + PLAN_ENDPOINT +'/'+ Value +'/deactivation')
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
    lConv.DataSet := dtValue;
    lConv.UpdateDataSet(lJSONObj);
  finally
    lConv.Free;
  end;
end;

function TPlansService.CratePlan: iPlans;
begin
  Result := Self;
end;

constructor TPlansService.Create(Parent : iJunoApi4DelphiConig;  AuthService : iAuthorizationService);
begin
  FParent := Parent;
  FAuth := AuthService;
  FJSON := TJSONObject.Create;
end;

destructor TPlansService.Destroy;
begin

  inherited;
end;

function TPlansService.EndCreatePlan(Value: TDataSet): iPlans;
var
  lJSONObj : TJSONObject;

  lConv : TCustomJSONDataSetAdapter;
  lJSON : String;
begin
  Result := Self;
  lJSON := 
    TRequest.New
      .BaseURL(FParent.ResourceEndpoint + PLAN_ENDPOINT)
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

function TPlansService.EndCreatePlan: String;
begin
  Result := 
  TRequest.New
    .BaseURL(FParent.ResourceEndpoint + PLAN_ENDPOINT)
    .Accept('application/json')
    .Token(FAuth.Token)
    .AddBody('application/json',ctAPPLICATION_JSON)
    .AddParam('X-Api-Version','2',pkHTTPHEADER)
    .AddParam('X-Resource-Token', FParent.ResourceToken, pkHTTPHEADER)
    .AddParam('body', FJSON.ToString, pkREQUESTBODY)
    .Post.Content
end;

function TPlansService.GetPlan(Value: String): String;
begin
  Result :=
  TRequest.New
    .BaseURL(FParent.AuthorizationEndpoint + PLAN_ENDPOINT + '/'+Value)
    .Token(FAuth.Token)
    .AddParam('X-Api-Version','2',pkHTTPHEADER)
    .AddParam('X-Resource-Token', FParent.ResourceToken, pkHTTPHEADER)
    .Get.Content;
end;

function TPlansService.GetPlan(Value: String; dtValue: TDataSet): iPlans;
var
  lJSONObj : TJSONObject;

  lConv : TCustomJSONDataSetAdapter;
  lJSON : String;
begin
  Result := Self;
  lJSON :=
    TRequest.New
      .BaseURL(FParent.AuthorizationEndpoint + PLAN_ENDPOINT + '/'+Value)
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

function TPlansService.GetPlans: String;
begin
  Result :=
  TRequest.New
    .BaseURL(FParent.ResourceEndpoint + PLAN_ENDPOINT)
    .Token(FAuth.Token)
    .AddParam('X-Api-Version','2',pkHTTPHEADER)
    .AddParam('X-Resource-Token', FParent.ResourceToken, pkHTTPHEADER)
    .Get.Content;
end;

function TPlansService.GetPlans(Value: TDataSet): iPlans;
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
    .BaseURL(FParent.ResourceEndpoint + PLAN_ENDPOINT)
    .Token(FAuth.Token)
    .AddParam('X-Api-Version','2',pkHTTPHEADER)
    .AddParam('X-Resource-Token', FParent.ResourceToken, pkHTTPHEADER)
    .Get.Content;
    
  lJSONObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(lJSON), 0) as TJSONObject;
  jv := lJSONObj.Get('_embedded').JsonValue;
  lJSONObj := jv as TJSONObject;
  lJSONArray := lJSONObj.Get('plans').JsonValue as TJSONArray;

  lConv := TCustomJSONDataSetAdapter.Create(nil);
  try
    lConv.DataSet := Value;
    lConv.UpdateDataSet(lJSONArray);
  finally
    lConv.Free;
  end;
end;

function TPlansService.Name(Value: String): iPlans;
begin
  Result := Self;
  FJson.AddPair('name', Value);
end;

class function TPlansService.New(Parent : iJunoApi4DelphiConig;  AuthService : iAuthorizationService) : iPlans;
begin
  Result := Self.Create(Parent, AuthService);
end;

end.
