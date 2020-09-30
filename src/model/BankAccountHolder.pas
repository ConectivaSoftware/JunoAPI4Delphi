unit BankAccountHolder;

interface

type
  TBankAccountHolder = class
    private
    Fname: String;
    Fdocument: String;
    public
     property name : String  read Fname write Fname;
     property document : String read Fdocument write Fdocument;
  end;

implementation

end.
