unit TokenizedCreditCard;

interface

type
  TTokenizedCreditCard = class
    private
    FexpirationYear: String;
    Flast4CardNumber: String;
    FexpirationMonth: String;
    FcreditCardId: String;
    public
    property creditCardId : String read FcreditCardId write FcreditCardId;
    property last4CardNumber : String read Flast4CardNumber write Flast4CardNumber;
    property expirationMonth : String read FexpirationMonth write FexpirationMonth;
    property expirationYear : String read FexpirationYear write FexpirationYear;
  end;

implementation

end.
