unit JunoAi4DelphiResources;

interface

uses
  JunoApi4Delphi.Interfaces;

type
  TJunoApi4DelphiResources = class(TInterfacedObject, iJunoApi4DelphiResources)
    private
      FParent : iJunoApi4DelphiConig;
    public
      constructor Create(Parent : iJunoApi4DelphiConig);
      destructor Destroy; override;
      class function New(Parent : iJunoApi4DelphiConig) : iJunoApi4DelphiResources;
      function DataService : iDataService;
      function ChargeService : iChargeService;
      function BalanceService : iBalanceService;
      function PaymentService : iPaymentService;
      function DocumentService : iDocumentService;
      function TransferService : iTransferService;
      function CreditCardService : iCreditCardService;
      function BillPaymentService : iBillPaymentService;
      function CredentialsService : iCredentialsService;
      function NotificationService : iNotificationService;
      function AuthorizationService : iAuthorizationService;
      function DigitalAccountService : iDigitalAccountService;
      function PlansService : iPlans;
      function Subscriptions : iSubscriptions;
  end;

implementation

uses
  DataService, ChargeService, BalanceService, CreditCardService,
  CredentialsService, BillPaymentService, DigitalAccountService,
  DocumentService, NotificationService, PaymentService, AuthorizationService,
  TransferService,PlansService, SubscriptionsService;

{ TJunoApi4DelphiResources }

function TJunoApi4DelphiResources.AuthorizationService: iAuthorizationService;
begin
  Result := TAuthorizationService.New(FParent);
end;

function TJunoApi4DelphiResources.BalanceService: iBalanceService;
begin
  Result := TBalanceService.New(FParent, Self.AuthorizationService);
end;

function TJunoApi4DelphiResources.BillPaymentService: iBillPaymentService;
begin
  Result := TBillPaymentService.New;
end;

function TJunoApi4DelphiResources.ChargeService: iChargeService;
begin
  Result := TChargeService.New(FParent, Self.AuthorizationService);
end;

constructor TJunoApi4DelphiResources.Create(Parent : iJunoApi4DelphiConig);
begin
  FParent := Parent;
end;

function TJunoApi4DelphiResources.CredentialsService: iCredentialsService;
begin
  Result := TCredentialsService.New;
end;

function TJunoApi4DelphiResources.CreditCardService: iCreditCardService;
begin
  Result := TCreditCardService.New;
end;

function TJunoApi4DelphiResources.DataService: iDataService;
begin
  Result := TDataService.New(FParent, Self.AuthorizationService);
end;

destructor TJunoApi4DelphiResources.Destroy;
begin

  inherited;
end;

function TJunoApi4DelphiResources.DigitalAccountService: iDigitalAccountService;
begin
  Result := TDigitalAccountService.New;
end;

function TJunoApi4DelphiResources.DocumentService: iDocumentService;
begin
  Result := TDocumentService.New;
end;

class function TJunoApi4DelphiResources.New(Parent : iJunoApi4DelphiConig) : iJunoApi4DelphiResources;
begin
  Result := Self.Create(Parent);
end;

function TJunoApi4DelphiResources.NotificationService: iNotificationService;
begin
  Result := TNotificationService.New(FParent, Self.AuthorizationService);
end;

function TJunoApi4DelphiResources.PaymentService: iPaymentService;
begin
  Result := TPaymentService.New;
end;

function TJunoApi4DelphiResources.PlansService: iPlans;
begin
  Result := TPlansService.New(FParent, Self.AuthorizationService);
end;

function TJunoApi4DelphiResources.Subscriptions: iSubscriptions;
begin
  Result := TSubscriptionsService.New(FParent, Self.AuthorizationService);
end;

function TJunoApi4DelphiResources.TransferService: iTransferService;
begin
  Result := TTransferService.New;
end;

end.
