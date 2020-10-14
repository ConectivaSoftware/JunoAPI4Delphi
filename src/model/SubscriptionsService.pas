unit SubscriptionsService;

interface

uses
  JunoApi4Delphi.Interfaces, Data.DB;

type
  TSubscriptions = class(TInterfacedObject, iSubscriptions)
    private
      FBilling : iBilling<iSubscriptions>;
      FSplit : iSplit<iSubscriptions>;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iSubscriptions;
      function CreateSubscription : iSubscriptions;
      function DueDay(Value : Integer) : iSubscriptions;
      function PlanId(Value : String) : iSubscriptions;
      function ChargeDescription(Value : String): iSubscriptions;
      function CreditCardDetails(Value : String) : iSubscriptions;
      function Billing : iBilling<iSubscriptions>;
      function Split : iSplit<iSubscriptions>;
      function &End(Value : TDataSet) : iSubscriptions; overload;
      function &End : String; overload;
  end;

implementation

{ TSubscriptions }

uses Billing, Split;

function TSubscriptions.Billing: iBilling<iSubscriptions>;
begin
  Result := FBilling;
end;

function TSubscriptions.ChargeDescription(Value: String): iSubscriptions;
begin

end;

function TSubscriptions.&End: String;
begin

end;

function TSubscriptions.&End(Value: TDataSet): iSubscriptions;
begin

end;

constructor TSubscriptions.Create;
begin
  FBilling := TBilling<iSubscriptions>.New(Self);
  FSplit := TSplit<iSubscriptions>.New(Self);
end;

function TSubscriptions.CreateSubscription: iSubscriptions;
begin

end;

function TSubscriptions.CreditCardDetails(Value: String): iSubscriptions;
begin

end;

destructor TSubscriptions.Destroy;
begin

  inherited;
end;

function TSubscriptions.DueDay(Value: Integer): iSubscriptions;
begin

end;

class function TSubscriptions.New: iSubscriptions;
begin
  Result := Self.Create;
end;

function TSubscriptions.PlanId(Value: String): iSubscriptions;
begin

end;

function TSubscriptions.Split: iSplit<iSubscriptions>;
begin

end;

end.
