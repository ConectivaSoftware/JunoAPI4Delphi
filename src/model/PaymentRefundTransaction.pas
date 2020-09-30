unit PaymentRefundTransaction;

interface

uses
  System.Generics.Collections,
  PaymentRefund;

type
  TPaymentRefundTransaction = class
    private
    FtransactionId: String;
    Frefunds: TObjectList<TPaymentRefund>;
    Finstallments: Integer;
    public
    property transactionId : String read FtransactionId write FtransactionId;
    property installments : Integer read Finstallments write Finstallments;
    property refunds : TObjectList<TPaymentRefund> read Frefunds write Frefunds;
  end;

implementation

end.
