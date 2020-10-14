unit CompanyType;

interface

type
  TCompanyType = class
    private
      [JSONName('type')]
      Ftype: string;
    public
      property &type : string read Ftype write Ftype;
  end;

implementation

end.
