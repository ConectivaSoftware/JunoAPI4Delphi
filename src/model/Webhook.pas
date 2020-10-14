unit Webhook;

interface

uses
  EventType;

type
  TWebhookStatusEnum = (ACTIV, INACTIVE);

  TWebhook = class
    private
      FeventTypes: TArray<TEventTypes>;
      Fsecret: String;
      Fstatus: TWebhookStatusEnum;
      FString: String;
    public
      property url : String read FString write FString ;
      property secret : String read Fsecret write Fsecret;
      property status : TWebhookStatusEnum read Fstatus write Fstatus;
      property eventTypes : TArray<TEventTypes> read FeventTypes write FeventTypes;
      destructor Destroy; override;
  end;

implementation

{ TWebhook }

destructor TWebhook.Destroy;
var
  eventType : TEventTypes;
begin
  for eventType in FeventTypes do
    eventType.Free;
  inherited;
end;

end.
