unit BillPaymentService;

interface

uses
  JunoApi4Delphi.Interfaces;

type
  TBillPaymentService = class(TInterfacedObject, iBillPaymentService)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iBillPaymentService;
      function RegisterBillPayment : String;
  end;

implementation

{ TBillPaymentService }

constructor TBillPaymentService.Create;
begin

end;

destructor TBillPaymentService.Destroy;
begin

  inherited;
end;

class function TBillPaymentService.New: iBillPaymentService;
begin
  Result := Self.Create;
end;

function TBillPaymentService.RegisterBillPayment: String;
begin

end;

end.
