unit JunoApi4Delphi.Interfaces;

interface

uses
  System.Generics.Collections,
  Document,
  EventType,
  Webhook,
  CompanyType,
  Banks, Charge, Data.DB;

type
  iDataService = interface;
  iChargeService = interface;
  iBalanceService = interface;
  iPaymentService = interface;
  iDocumentService = interface;
  iTransferService = interface;
  iCreditCardService = interface;
  iBillPaymentService = interface;
  iCredentialsService = interface;
  iNotificationService = interface;
  iDigitalAccountService = interface;
  iPlans = interface;
  iSubscriptions = interface;


  iJunoApi4DelphiConig = interface
    function ClientId(Value : String) : iJunoApi4DelphiConig; overload;
    function ClientId : String; overload;
    function ClientSecret(Value : String) : iJunoApi4DelphiConig; overload;
    function ClientSecret : String; overload;
    function ResourceToken(Value : String) : iJunoApi4DelphiConig; overload;
    function ResourceToken : String; overload;
    function PublicToken(Value : String) : iJunoApi4DelphiConig; overload;
    function PublicToken : String; overload;
    function TokenTimeout : Integer;
    function AuthorizationEndpoint : String;
    function ResourceEndpoint : String;
    function Sandbox : iJunoApi4DelphiConig;
    function Production :iJunoApi4DelphiConig;
  end;

  iEnvironment = interface
    function AuthorizationServerEndpoint : String;
    function ResourceServerEndpoint : String;
  end;

  iAuthorizationService = interface
    function Token : String;
    function AuthorizationHeader : String;
  end;

  iJunoApi4DelphiResources = interface
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

  iJunoApi4DelphiManager = interface
    function ContentTypeHeader : String;
    function ContentEncodingHeader : String;
    function XResourceToken : String;
    function XApiVersion : String;
    function Config : iJunoApi4DelphiConig;
    function Resources : iJunoApi4DelphiResources;
  end;

  iDataService = interface
    function Banks : TObjectList<TBanks>;
    function CompanyTypes : String;
    function BusinessAreas : String;
  end;

  iBalanceService = interface
    function Balance : String;
  end;

  iPaymentService = interface
    function Payment : String;
    function RefundPayment : String;
    function Capture : String;
  end;

  iDocumentService = interface
    function Document : String;
    function ListDocument : TObjectList<TDocument>;
    function UploadFile : String;
    function UploadStream : String;
  end;

  iTransferService = interface

  end;

  iCreditCardService = interface
    function Tokenize : String;
  end;

  iBillPaymentService = interface
    function RegisterBillPayment : String;
  end;

  iCredentialsService = interface
    function PublicCredentials : String;
  end;

  iNotificationService = interface
    function ListaEventTypes : TObjectList<TEventTypes>;
    function ListaWebhooks : TObjectList<TWebhook>;
    function CreateWebhook : String;
  end;

  iChargeService = interface
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

  iDigitalAccountService = interface

  end;

  iCardHash = interface
    function CardNumber(Value : String) : iCardHash;
    function holderName(Value : String) : iCardHash;
    function securityCode(Value : String) : iCardHash;
    function expirationMonth(Value : String) : iCardHash;
    function expirationYear(Value : String) : iCardHash;
    function cardHash : String;
  end;

  iPlans = interface
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

  iBilling<T> = interface
    function Email(Value : String) : iBilling<T>; overload;
    function Email : String; overload;
    function Name(Value : String) : iBilling<T>; overload;
    function Name : String; overload;
    function Document(Value : String) : iBilling<T>; overload;
    function Document : String; overload;
    function Street(Value : String) : iBilling<T>; overload;
    function Street : String; overload;
    function Number(Value : String) : iBilling<T>; overload;
    function Number : String; overload;
    function Complement(Value : String) : iBilling<T>; overload;
    function Complement : String; overload;
    function Neighborhood(Value : String) : iBilling<T>; overload;
    function Neighborhood : String; overload;
    function City(Value : String) : iBilling<T>; overload;
    function City : String; overload;
    function State(Value : String) : iBilling<T>; overload;
    function State : String; overload;
    function PostCode(Value : String) : iBilling<T>; overload;
    function PostCode : String; overload;
    function &End : T;
  end;

  iSplit<T> = interface
    function recipientToken(Value : String) : iSplit<T>; overload;
    function recipientToken : String; overload;
    function amount(Value : Double) : iSplit<T>; overload;
    function amount : Double; overload;
    function percentage(Value : Double) : iSplit<T>; overload;
    function percentage : Double; overload;
    function amountRemainder(Value : Boolean) : iSplit<T>; overload;
    function amountRemainder : Boolean; overload;
    function chargeFee(Value : Boolean) : iSplit<T>; overload;
    function chargeFee : Boolean; overload;
    function &End : T;
  end;

  iSubscriptions = interface
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

end.
