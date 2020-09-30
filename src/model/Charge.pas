unit Charge;

interface

uses
  BilletDetails, Payment, System.Generics.Collections;

type
  TCharge = class
    private
    Fpayments: TObjectList<TPayment>;
    Fcode: LongInt;
    FpayNumber: String;
    Flink: String;
    FinstallmentLink: String;
    Famount: Double;
    FcheckoutUrl: String;
    FdueDate: TDateTime;
    Freference: String;
    FbilletDetails: TBilletDetails;
    public
    property code : LongInt read Fcode write Fcode;
    property reference : String read Freference write Freference;
    property dueDate : TDateTime read FdueDate write FdueDate;
    property link : String read Flink write Flink;
    property checkoutUrl : String read FcheckoutUrl write FcheckoutUrl;
    property installmentLink : String read FinstallmentLink write FinstallmentLink;
    property payNumber : String read FpayNumber write FpayNumber;
    property amount : Double read Famount write Famount;
    property billetDetails : TBilletDetails read FbilletDetails write FbilletDetails;
    property payments : TObjectList<TPayment> read Fpayments write Fpayments;
  end;

implementation

end.
