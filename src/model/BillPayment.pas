unit BillPayment;

interface

type
  TBillPayment = class
    private
    FpayeeId: Integer;
    F: Double;
    FbillAmount: Double;
    FbillType: String;
    FpaymentDate: TDateTime;
    Fstatus: String;
    FnumericalBarCode: String;
    FcreatedOn: TDateTime;
    FdueDate: TDateTime;
    FbeneficiaryDocument: String;
    FpaymentDescription: String;
    FpaidAmount: Double;
    public
    property beneficiaryDocument : String read FbeneficiaryDocument write FbeneficiaryDocument;
    property billAmount : Double read FbillAmount write FbillAmount;
    property billType : String read FbillType write FbillType;
    property createdOn : TDateTime read FcreatedOn write FcreatedOn;
    property dueDate : TDateTime read FdueDate write FdueDate;
    property numericalBarCode : String read FnumericalBarCode write FnumericalBarCode;
    property paidAmount : Double read FpaidAmount write FpaidAmount;
    property payeeId : Integer read FpayeeId write FpayeeId;
    property paymentDate : TDateTime read FpaymentDate write FpaymentDate;
    property paymentDescription : String read FpaymentDescription write FpaymentDescription;
    property status : String read Fstatus write Fstatus;
  end;

implementation

end.
