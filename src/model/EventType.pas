unit EventType;

interface

type
  TEventStatus = (ENABLED, DEPRECATED);

  TEventType = class
    private
    Fname: String;
    Flabel: String;
    Fstatus: TEventStatus;
    public
    property name : String read Fname write Fname;
    property &label : String read Flabel write Flabel;
    property status : TEventStatus read Fstatus write Fstatus;
  end;

implementation

end.
