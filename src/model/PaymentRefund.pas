unit PaymentRefund;

interface

type
  TPaymentRefund = class
    private
    FpaybackAmount: Double;
    FreleaseDate: TDateTime;
    FpaybackDate: TDateTime;
    Fstatus: String;
    FchargeId: String;
    public
    property releaseDate : TDateTime read FreleaseDate write FreleaseDate;
    property paybackDate : TDateTime read FpaybackDate write FpaybackDate;
    property paybackAmount : Double read FpaybackAmount write FpaybackAmount;
    property status : String read Fstatus write Fstatus;
    property chargeId : String read FchargeId write FchargeId;
  end;

implementation

end.
