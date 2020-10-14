unit ChargeService;

interface

uses
  JunoApi4Delphi.Interfaces, RESTRequest4D.Request, REST.Types, Charge,
  System.JSON, REST.Json;

type
  TChargeService = class(TInterfacedObject, iChargeService)
    private
      FParent : iJunoApi4DelphiConig;
      FAuth : iAuthorizationService;
      FJSONCharge : TJSONObject;
      FJSONBilling : TJSONObject;
      FJSONMain : TJSONObject;
    public
      constructor Create(Parent : iJunoApi4DelphiConig;  AuthService : iAuthorizationService);
      destructor Destroy; override;
      class function New(Parent : iJunoApi4DelphiConig;  AuthService : iAuthorizationService) : iChargeService;
      function CreateCharge : iChargeService;
      function ChargeDescription(Value : String) : iChargeService;
      function ChargeReferences(Value : String) : iChargeService;
      function ChargeAmount(Value : Double) : iChargeService;
      function ChargeDueDate(Value : String) : iChargeService;
      function ChargeInstallments(Value : Integer) : iChargeService;
      function ChargeMaxOverdueDays(Value : Integer) : iChargeService;
      function ChargeFine(Value : Integer) : iChargeService;
      function ChargeInterest(Value : String) : iChargeService;
      function ChargeDiscountAmount(Value : String) : iChargeService;
      function ChargeDiscountDays(Value : Integer) : iChargeService;
      function ChargePaymentTypes(Value : String) : iChargeService;
      function ChargePaymentAdvance(Value : Boolean) : iChargeService;

      function BillingName(Value : String) : iChargeService;
      function BillingDocument(Value : String) : iChargeService;
      function BillingEmail(Value : String) : iChargeService;
      function BillingSecondaryEmail(Value : String) : iChargeService;
      function BillingPhone(Value : String) : iChargeService;
      function BillingBirthDate(Value : String) : iChargeService;
      function BillingNotify(Value : Boolean) : iChargeService;
      function &End : String;

      function ListCharge : iChargeService; overload;
      function GetCharge : String;
      function createdOnStart(Value : String) : iChargeService; overload;
      function createdOnStart : String;overload;
      function createdOnEnd(Value : String) : iChargeService; overload;
      function createdOnEnd : String; overload;
      function dueDateStart(Value : String) : iChargeService; overload;
      function dueDateStart : String; overload;
      function paymentDateStart(Value : String) : iChargeService; overload;
      function paymentDateStart : String; overload;
      function paymentDateEnd(Value : String) : iChargeService; overload;
      function paymentDateEnd : String; overload;
      function showUnarchived(Value : Boolean) : iChargeService; overload;
      function showUnarchived : Boolean; overload;
      function showArchived(Value : Boolean) : iChargeService; overload;
      function showArchived : Boolean; overload;
      function showDue(Value : Boolean) : iChargeService; overload;
      function showDue : Boolean; overload;
      function showNotDue(Value : Boolean) : iChargeService; overload;
      function showNotDue : Boolean; overload;
      function showPaid(Value : Boolean) : iChargeService; overload;
      function showPaid : Boolean; overload;
      function showNotPaid(Value : Boolean) : iChargeService; overload;
      function showNotPaid : Boolean; overload;
      function showCancelled(Value : Boolean) : iChargeService; overload;
      function showCancelled : Boolean; overload;
      function showNotCancelled(Value : Boolean) : iChargeService; overload;
      function showNotCancelled : Boolean; overload;
      function showManualReconciliation(Value : Boolean) : iChargeService; overload;
      function showManualReconciliation : Boolean; overload;
      function showNotManualReconciliation(Value : Boolean) : iChargeService; overload;
      function showNotManualReconciliation : Boolean; overload;
      function showNotFailed(Value : Boolean) : iChargeService; overload;
      function showNotFailed : Boolean; overload;
      function orderBy(Value : String) : iChargeService; overload;
      function orderBy : String; overload;
      function orderAsc(Value : Boolean) : iChargeService; overload;
      function orderAsc : Boolean; overload;
      function pageSize(Value : Integer) : iChargeService; overload;
      function pageSize : Integer; overload;
      function page(Value : Integer) : iChargeService; overload;
      function page : Integer; overload;
      function firstObjectId(Value : String) : iChargeService; overload;
      function firstObjectId : String; overload;
      function firstValue(Value : String) : iChargeService; overload;
      function firstValue : String; overload;
      function lastObjectId(Value : String) : iChargeService; overload;
      function lastObjectId : String; overload;
      function lastValue(Value : String) : iChargeService; overload;
      function lastValue : String; overload;
      function &ListEnd : String;

      function GetFirstCharge(Value : String) : String;
      function CancelCharge(Value : String) : String;
      function UpdateSplit(Value : String) : String;
  end;

implementation

uses
  System.SysUtils;

CONST
  CHARGES_ENDPOINT = '/charges';

{ TChargeService }

function TChargeService.BillingBirthDate(Value: String): iChargeService;
begin
  Result := Self;
  FJSONBilling.AddPair('birthDate', Value);
end;

function TChargeService.BillingDocument(Value: String): iChargeService;
begin
  Result := Self;
  FJSONBilling.AddPair('document', Value);
end;

function TChargeService.BillingEmail(Value: String): iChargeService;
begin
  Result := Self;
  FJSONBilling.AddPair('email', Value);
end;

function TChargeService.BillingName(Value: String): iChargeService;
begin
  Result := Self;
  FJSONBilling.AddPair('name', Value);
end;

function TChargeService.BillingNotify(Value: Boolean): iChargeService;
begin
  Result := Self;
  FJSONBilling.AddPair('notify', TJSONBool.Create(Value));
end;

function TChargeService.BillingPhone(Value: String): iChargeService;
begin
  Result := Self;
  FJSONBilling.AddPair('phone', Value);
end;

function TChargeService.BillingSecondaryEmail(Value: String): iChargeService;
begin
  Result := Self;
  FJSONBilling.AddPair('secondaryEmail', Value);
end;

function TChargeService.CancelCharge(Value: String): String;
begin
  Result :=
    TRequest.New
      .BaseURL(FParent.ResourceEndpoint + CHARGES_ENDPOINT +'/'+ Value +'/cancelation')
      .Token(FAuth.Token)
      .AddParam('X-Api-Version','2',pkHTTPHEADER)
      .AddParam('X-Resource-Token', FParent.ResourceToken, pkHTTPHEADER)
      .Put.Content;
end;

function TChargeService.ChargeAmount(Value: Double): iChargeService;
begin
  Result := Self;
  FJSONCharge.AddPair('amount',TJSONNumber.Create(Value));
end;

function TChargeService.ChargeDescription(Value: String): iChargeService;
begin
  Result := Self;
  FJSONCharge.AddPair('description',Value);
end;

function TChargeService.ChargeDiscountAmount(Value: String): iChargeService;
begin
  Result := Self;
  FJSONCharge.AddPair('discountAmount',Value);
end;

function TChargeService.ChargeDiscountDays(Value: Integer): iChargeService;
begin
  Result := Self;
  FJSONCharge.AddPair('discountDays',TJSONNumber.Create(Value));
end;

function TChargeService.ChargeDueDate(Value: String): iChargeService;
begin
  Result := Self;
  FJSONCharge.AddPair('dueDate',Value);
end;

function TChargeService.ChargeFine(Value: Integer): iChargeService;
begin
  Result := Self;
  FJSONCharge.AddPair('fine', TJSONNumber.Create(Value));
end;

function TChargeService.ChargeInstallments(Value: Integer): iChargeService;
begin
  Result := Self;
  FJSONCharge.AddPair('installments',TJSONNumber.Create(Value));
end;

function TChargeService.ChargeInterest(Value: String): iChargeService;
begin
  Result := Self;
  FJSONCharge.AddPair('interest',Value);
end;

function TChargeService.ChargeMaxOverdueDays(Value: Integer): iChargeService;
begin
  Result := Self;
  FJSONCharge.AddPair('maxOverdueDays',TJSONNumber.Create(Value));
end;

function TChargeService.ChargePaymentAdvance(Value: Boolean): iChargeService;
begin
  Result := Self;
  FJSONCharge.AddPair('paymentAdvance',TJSONBool.Create(Value));
end;

function TChargeService.ChargePaymentTypes(Value: String): iChargeService;
var
  JSONArray : TJSONArray;
begin
  Result := Self;
  JSONArray := TJSONArray.Create;
  JSONArray.Add(Value);
  FJSONCharge.AddPair('paymentTypes',JSONArray);
end;

function TChargeService.ChargeReferences(Value: String): iChargeService;
var
  JSONArray : TJSONArray;
begin
  Result := Self;
  JSONArray := TJSONArray.Create;
  JSONArray.Add(Value);
  FJSONCharge.AddPair('references',JSONArray);
end;

function TChargeService.&End: String;
begin
  FJSONMain.AddPair('charge',FJSONCharge);
  FJSONMain.AddPair('billing',FJSONBilling);

  Result :=
  TRequest.New
      .BaseURL(FParent.ResourceEndpoint + CHARGES_ENDPOINT)
      .Accept('application/json')
      .Token(FAuth.Token)
      .AddBody('application/json',ctAPPLICATION_JSON)
      .AddParam('X-Api-Version','2',pkHTTPHEADER)
      .AddParam('X-Resource-Token', FParent.ResourceToken, pkHTTPHEADER)
      .AddParam('body', FJSONMain.ToString, pkREQUESTBODY)
      .Post.Content;
end;

function TChargeService.firstObjectId(Value: String): iChargeService;
begin

end;

function TChargeService.firstObjectId: String;
begin

end;

function TChargeService.firstValue: String;
begin

end;

function TChargeService.firstValue(Value: String): iChargeService;
begin

end;

function TChargeService.GetCharge: String;
begin
  Result :=
    TRequest.New
      .BaseURL(FParent.ResourceEndpoint + CHARGES_ENDPOINT)
      .Token(FAuth.Token)
      .AddParam('X-Api-Version','2',pkHTTPHEADER)
      .AddParam('X-Resource-Token', FParent.ResourceToken, pkHTTPHEADER)
      .Get.Content;
end;

function TChargeService.GetFirstCharge(Value : String) : String;
begin
  Result :=
    TRequest.New
      .BaseURL(FParent.ResourceEndpoint + CHARGES_ENDPOINT +'/'+ Value)
      .Token(FAuth.Token)
      .AddParam('X-Api-Version','2',pkHTTPHEADER)
      .AddParam('X-Resource-Token', FParent.ResourceToken, pkHTTPHEADER)
      .Get.Content;
end;

function TChargeService.lastObjectId: String;
begin

end;

function TChargeService.lastObjectId(Value: String): iChargeService;
begin

end;

function TChargeService.lastValue(Value: String): iChargeService;
begin

end;

function TChargeService.lastValue: String;
begin

end;

function TChargeService.ListCharge: iChargeService;
begin

end;

function TChargeService.ListEnd: String;
begin

end;

constructor TChargeService.Create(Parent : iJunoApi4DelphiConig;  AuthService : iAuthorizationService);
begin
  FParent := Parent;
  FAuth := AuthService;
  FJSONCharge := TJSONObject.Create;
  FJSONBilling := TJSONObject.Create;
  FJSONMain := TJSONObject.Create;
end;

function TChargeService.CreateCharge: iChargeService;
begin
  Result := Self;
end;

function TChargeService.createdOnEnd(Value: String): iChargeService;
begin

end;

function TChargeService.createdOnEnd: String;
begin

end;

function TChargeService.createdOnStart: String;
begin

end;

function TChargeService.createdOnStart(Value: String): iChargeService;
begin

end;

destructor TChargeService.Destroy;
begin
  inherited;
  FJSONCharge.DisposeOf;
  FJSONBilling.DisposeOf;
end;

function TChargeService.dueDateStart: String;
begin

end;

function TChargeService.dueDateStart(Value: String): iChargeService;
begin

end;

class function TChargeService.New(Parent : iJunoApi4DelphiConig;  AuthService : iAuthorizationService) : iChargeService;
begin
  Result := Self.Create(Parent, AuthService);
end;

function TChargeService.orderAsc(Value: Boolean): iChargeService;
begin

end;

function TChargeService.orderAsc: Boolean;
begin

end;

function TChargeService.orderBy: String;
begin

end;

function TChargeService.orderBy(Value: String): iChargeService;
begin

end;

function TChargeService.page: Integer;
begin

end;

function TChargeService.page(Value: Integer): iChargeService;
begin

end;

function TChargeService.pageSize: Integer;
begin

end;

function TChargeService.pageSize(Value: Integer): iChargeService;
begin

end;

function TChargeService.paymentDateEnd(Value: String): iChargeService;
begin

end;

function TChargeService.paymentDateEnd: String;
begin

end;

function TChargeService.paymentDateStart(Value: String): iChargeService;
begin

end;

function TChargeService.paymentDateStart: String;
begin

end;

function TChargeService.showArchived: Boolean;
begin

end;

function TChargeService.showArchived(Value: Boolean): iChargeService;
begin

end;

function TChargeService.showCancelled: Boolean;
begin

end;

function TChargeService.showCancelled(Value: Boolean): iChargeService;
begin

end;

function TChargeService.showDue(Value: Boolean): iChargeService;
begin

end;

function TChargeService.showDue: Boolean;
begin

end;

function TChargeService.showManualReconciliation: Boolean;
begin

end;

function TChargeService.showManualReconciliation(
  Value: Boolean): iChargeService;
begin

end;

function TChargeService.showNotCancelled(Value: Boolean): iChargeService;
begin

end;

function TChargeService.showNotCancelled: Boolean;
begin

end;

function TChargeService.showNotDue(Value: Boolean): iChargeService;
begin

end;

function TChargeService.showNotDue: Boolean;
begin

end;

function TChargeService.showNotFailed(Value: Boolean): iChargeService;
begin

end;

function TChargeService.showNotFailed: Boolean;
begin

end;

function TChargeService.showNotManualReconciliation: Boolean;
begin

end;

function TChargeService.showNotManualReconciliation(
  Value: Boolean): iChargeService;
begin

end;

function TChargeService.showNotPaid(Value: Boolean): iChargeService;
begin

end;

function TChargeService.showNotPaid: Boolean;
begin

end;

function TChargeService.showPaid(Value: Boolean): iChargeService;
begin

end;

function TChargeService.showPaid: Boolean;
begin

end;

function TChargeService.showUnarchived(Value: Boolean): iChargeService;
begin

end;

function TChargeService.showUnarchived: Boolean;
begin

end;

function TChargeService.UpdateSplit(Value: String): String;
begin
  Result := 'Falta implementar';
end;

end.
