unit BusinessArea;

interface

type
  TBusinessArea = class
    private
    Fcode: LongInt;
    Fcategory: String;
    Factivity: String;
    public
      property code : LongInt read Fcode write Fcode;
      property activity : String read Factivity write Factivity;
      property category : String read Fcategory write Fcategory;
  end;

implementation

end.
