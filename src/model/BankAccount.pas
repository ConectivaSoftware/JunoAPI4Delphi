unit BankAccount;

interface

uses
  BankAccountType, BankAccountHolder;

type
  TBankAccount = class
    private
    FaccountComplementNumber: String;
    FbankNumber: String;
    FaccountNumber: String;
    FaccountType: TBankAccountType;
    FagencyNumber: String;
    FaccountHolder: TBankAccountHolder;
    public
      property bankNumber : String read FbankNumber write FbankNumber;
      property agencyNumber : String read FagencyNumber write FagencyNumber;
      property accountNumber : String read FaccountNumber write FaccountNumber;
      property accountComplementNumber : String read FaccountComplementNumber write FaccountComplementNumber;
      property accountType : TBankAccountType read FaccountType write FaccountType;
      property accountHolder : TBankAccountHolder read FaccountHolder write FaccountHolder;
  end;

implementation

end.
