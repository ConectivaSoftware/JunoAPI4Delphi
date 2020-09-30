unit Balance;

interface

type
  TBalance = class
    private
    FtransferableBalance: Double;
    FBalance: Double;
    FwithheldBalance: Double;
    public
    property balance : Double read FBalance write FBalance;
    property withheldBalance : Double read FwithheldBalance write FwithheldBalance;
    property transferableBalance : Double read FtransferableBalance write FtransferableBalance;
  end;

implementation

end.
