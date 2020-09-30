unit PaymentTransaction;

interface

uses
  System.Generics.Collections,
  Payment;

type
  TPaymentTransaction = class
    private
    FtransactionId: String;
    Fpayments: TObjectList<TPayment>;
    Finstallments: Integer;
    public
    property transactionId : String read FtransactionId write FtransactionId;
    property installments : Integer read Finstallments write Finstallments;
    property payments : TObjectList<TPayment> read Fpayments write Fpayments;
  end;

implementation

end.
