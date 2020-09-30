unit Webhook;

interface

uses
  EventType, System.Generics.Collections;

type
  TWebhookStatusEnum = (ACTIVE, INACTIVE);

  TWebhook = class
    private
    FeventTypes: TObjectList<TEventType>;
    Fsecret: String;
    Fstatus: TWebhookStatusEnum;
    Furl: String;
    public
    property url : String read Furl write Furl;
    property secret : String read Fsecret write Fsecret;
    property status : TWebhookStatusEnum read Fstatus write Fstatus;
    property eventTypes : TObjectList<TEventType> read FeventTypes write FeventTypes;
  end;

implementation

end.
