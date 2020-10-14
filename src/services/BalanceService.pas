unit BalanceService;

interface

uses
  JunoApi4Delphi.Interfaces, REST.Types;

type
  TBalanceService = class(TInterfacedObject, iBalanceService)
    private
      FParent : iJunoApi4DelphiConig;
      FAuth : iAuthorizationService;
    public
      constructor Create(Parent : iJunoApi4DelphiConig; AuthService : iAuthorizationService);
      destructor Destroy; override;
      class function New(Parent : iJunoApi4DelphiConig; AuthService : iAuthorizationService) : iBalanceService;
      function Balance : String;
  end;

implementation

uses
  RESTRequest4D.Request, System.JSON, System.SysUtils, Balance, REST.Json;

CONST
  BALANCE_ENDPOINT = '/balance';

{ TBalanceService }

function TBalanceService.Balance: String;
var
  JSONObj : TJSONObject;
  Balance : TBalance;
begin
  JsonObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(
  TRequest.New
    .BaseURL(FParent.ResourceEndpoint + BALANCE_ENDPOINT)
    .Token(FAuth.Token)
    .AddParam('X-Api-Version','2',pkHTTPHEADER)
    .AddParam('X-Resource-Token', FParent.ResourceToken, pkHTTPHEADER)
    .Get.Content), 0) as TJSONObject;

  Balance := TJson.JsonToObject<TBalance>(JsonObj);

  Result := 'Transferable:' + FloatToStr(Balance.TransferableBalance) +#13#10+
    'Withheld: ' + FloatToStr(Balance.WithheldBalance) +#13#10+
    'Balance:' + FloatToStr(Balance.Balance);
end;

constructor TBalanceService.Create(Parent : iJunoApi4DelphiConig; AuthService : iAuthorizationService);
begin
  FParent := Parent;
  FAuth := AuthService;
end;

destructor TBalanceService.Destroy;
begin

  inherited;
end;

class function TBalanceService.New(Parent : iJunoApi4DelphiConig; AuthService : iAuthorizationService) : iBalanceService;
begin
  Result := Self.Create(Parent, AuthService);
end;

end.
