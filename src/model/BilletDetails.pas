unit BilletDetails;

interface

type
  TBilletDetails = class
    private
    FbarcodeNumber: String;
    Fportfolio: String;
    FourNumber: String;
    FbankAccount: String;
    public
      property bankAccount : String read FbankAccount write FbankAccount;
      property ourNumber : String read FourNumber write FourNumber;
      property barcodeNumber : String read FbarcodeNumber write FbarcodeNumber;
      property portfolio : String read Fportfolio write Fportfolio;
  end;

implementation

end.
