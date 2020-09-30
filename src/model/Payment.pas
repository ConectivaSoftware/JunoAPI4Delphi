unit Payment;

interface

type
  TPayment = class
    private
    FtransactionId: String;
    Fdate: TDateTime;
    Ffee: Double;
    FreleaseDate: TDateTime;
    Fstatus: String;
    Famount: Double;
    FchargeId: String;
    Ftype: String;
    FcreditCardId: String;
    public
      property date : TDateTime read Fdate write Fdate;
      property releaseDate : TDateTime read FreleaseDate write FreleaseDate;
      property amount : Double read Famount write Famount;
      property fee : Double read Ffee write Ffee;
      property &type : String read Ftype write Ftype;
      property status : String read Fstatus write Fstatus;
      property chargeId : String read FchargeId write FchargeId;
      property transactionId : String read FtransactionId write FtransactionId;
      property creditCardId : String read FcreditCardId write FcreditCardId;
  end;

implementation

end.
