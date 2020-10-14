unit Charge;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TBilling = class
  private
    FBirthDate: string;
    FDocument: string;
    FEmail: string;
    FName: string;
    FNotify: Boolean;
    FPhone: string;
    FSecondaryEmail: string;
  published
    property BirthDate: string read FBirthDate write FBirthDate;
    property Document: string read FDocument write FDocument;
    property Email: string read FEmail write FEmail;
    property Name: string read FName write FName;
    property Notify: Boolean read FNotify write FNotify;
    property Phone: string read FPhone write FPhone;
    property SecondaryEmail: string read FSecondaryEmail write FSecondaryEmail;
  end;

  TSplit = class
  private
    FAmount: Integer;
    FAmountRemainder: Boolean;
    FChargeFee: Boolean;
    FPercentage: Integer;
    FRecipientToken: string;
  published
    property Amount: Integer read FAmount write FAmount;
    property AmountRemainder: Boolean read FAmountRemainder write FAmountRemainder;
    property ChargeFee: Boolean read FChargeFee write FChargeFee;
    property Percentage: Integer read FPercentage write FPercentage;
    property RecipientToken: string read FRecipientToken write FRecipientToken;
  end;

  TCharge = class
  private
    FAmount: Double;
    FDescription: string;
    FDiscountAmount: string;
    FDiscountDays: Integer;
    FDueDate: string;
    FFeeSchemaToken: string;
    FFine: Integer;
    FInstallments: Integer;
    FInterest: string;
    FMaxOverdueDays: Integer;
    FPaymentAdvance: Boolean;
    FPaymentTypes: TArray<string>;
    FReferences: TArray<string>;
    [JSONName('split')]
    FSplitArray: TArray<TSplit>;
    [GenericListReflect]
    FSplit: TObjectList<TSplit>;
    FTotalAmount: Double;
    function GetSplit: TObjectList<TSplit>;
  published
    property Amount: Double read FAmount write FAmount;
    property Description: string read FDescription write FDescription;
    property DiscountAmount: string read FDiscountAmount write FDiscountAmount;
    property DiscountDays: Integer read FDiscountDays write FDiscountDays;
    property DueDate: string read FDueDate write FDueDate;
    property FeeSchemaToken: string read FFeeSchemaToken write FFeeSchemaToken;
    property Fine: Integer read FFine write FFine;
    property Installments: Integer read FInstallments write FInstallments;
    property Interest: string read FInterest write FInterest;
    property MaxOverdueDays: Integer read FMaxOverdueDays write FMaxOverdueDays;
    property PaymentAdvance: Boolean read FPaymentAdvance write FPaymentAdvance;
    property PaymentTypes: TArray<string> read FPaymentTypes write FPaymentTypes;
    property References: TArray<string> read FReferences write FReferences;
    property Split: TObjectList<TSplit> read GetSplit;
    property TotalAmount: Double read FTotalAmount write FTotalAmount;
    destructor Destroy; override;
  end;

  TRootCharge = class(TJsonDTO)
  private
    FBilling: TBilling;
    FCharge: TCharge;
  published
    property Billing: TBilling read FBilling write FBilling;
    property Charge: TCharge read FCharge write FCharge;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;

implementation

{ TCharge }

destructor TCharge.Destroy;
begin
  GetSplit.Free;
  inherited;
end;

function TCharge.GetSplit: TObjectList<TSplit>;
begin
  if not Assigned(FSplit) then
  begin
    FSplit := TObjectList<TSplit>.Create;
    FSplit.AddRange(FSplitArray);
  end;
  Result := FSplit;
end;

{ TRootCharge }

constructor TRootCharge.Create;
begin
  inherited;
  FCharge := TCharge.Create;
  FBilling := TBilling.Create;
end;

destructor TRootCharge.Destroy;
begin
  FCharge.Free;
  FBilling.Free;
  inherited;
end;

end.
