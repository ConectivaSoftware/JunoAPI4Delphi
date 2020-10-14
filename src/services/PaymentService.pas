unit PaymentService;

interface

uses
  JunoApi4Delphi.Interfaces;

type
  TPaymentService = class(TInterfacedObject, iPaymentService)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iPaymentService;
      function Payment : String;
      function RefundPayment : String;
      function Capture : String;
  end;

implementation

{ TPaymentService }

function TPaymentService.Capture: String;
begin

end;

constructor TPaymentService.Create;
begin

end;

destructor TPaymentService.Destroy;
begin

  inherited;
end;

class function TPaymentService.New: iPaymentService;
begin
  Result := Self.Create;
end;

function TPaymentService.Payment: String;
begin

end;

function TPaymentService.RefundPayment: String;
begin

end;

end.
