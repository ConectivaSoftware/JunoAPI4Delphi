unit Banks;

interface

type
  TBanks = class
    private
      Fname: String;
      Fnumber: String;
    public
      property number : String read Fnumber write Fnumber;
      property name : String read Fname write Fname;
  end;

implementation

end.
