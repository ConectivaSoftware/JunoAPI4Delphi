unit Bank;

interface

type
  TBank = class
    private
    FName: String;
    FNumber: String;
    public
      property number : String read FNumber write FNumber;
      property name : String read FName write FName;
  end;

implementation

end.
