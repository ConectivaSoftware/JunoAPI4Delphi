unit EventType;

interface

type
  TEventStatus = (ENABLED, DEPRECATED);

  TEventType = class
    private
    Fname: String;
    Flabel: String;
    Fstatus: TEventStatus;
    function GetStatus: TEventStatus;
    public
      property name : String read Fname write Fname;
      property &label : String read Flabel write Flabel;
      property status : TEventStatus read GetStatus write Fstatus;
  end;

implementation

{ TEventType }

function TEventType.GetStatus: TEventStatus;
begin
  Result := Fstatus;
end;

end.
