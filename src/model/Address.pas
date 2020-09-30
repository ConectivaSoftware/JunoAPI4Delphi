unit Address;

interface

type
  TAddress = class
    private
      Fstreet: string;
      Fstate: string;
      Fcomplement: string;
      Fnumber: string;
      Fneighborhood: string;
      FpostCode: string;
      Fcity: string;
    public
      property street : string read Fstreet write Fstreet;
      property number : string read Fnumber write Fnumber;
      property complement : string read Fcomplement write Fcomplement;
      property neighborhood : string read Fneighborhood write Fneighborhood;
      property city : string read Fcity write Fcity;
      property state : string read Fstate write Fstate;
      property postCode : string read FpostCode write FpostCode;
  end;

implementation

end.
