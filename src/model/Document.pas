unit Document;

interface

type
  TDocument = class
    private
      Fdetails: String;
      FrejectionReason: String;
      FapprovalStatus: String;
      Fdescription: String;
      FType: String;
    public
     property &type : String read FType write FType;
     property description : String read Fdescription write Fdescription;
     property approvalStatus : String read FapprovalStatus write FapprovalStatus;
     property rejectionReason : String read FrejectionReason write FrejectionReason;
     property details : String read Fdetails write Fdetails;
  end;

implementation

end.
