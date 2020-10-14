unit NotificationService;

interface

uses
  JunoApi4Delphi.Interfaces,
  EventType,
  Webhook,
  System.Generics.Collections, System.JSON, RESTRequest4D.Request,
  System.SysUtils, REST.Types, REST.Json;

type
  TNotificationService = class(TInterfacedObject, iNotificationService)
    private
      FParent : iJunoApi4DelphiConig;
      FAuth : iAuthorizationService;
    public
      constructor Create(Parent : iJunoApi4DelphiConig;  AuthService : iAuthorizationService);
      destructor Destroy; override;
      class function New(Parent : iJunoApi4DelphiConig;  AuthService : iAuthorizationService) : iNotificationService;
      function ListaEventTypes : TObjectList<TEventTypes>;
      function ListaWebhooks : TObjectList<TWebhook>;
      function CreateWebhook : String;
  end;

implementation

CONST
  NOTIFICATIONS_ENDPOINT = '/notifications';
  EVENT_TYPES_ENDPOINT = NOTIFICATIONS_ENDPOINT + '/event-types';
  WEBHOOKS_ENDPOINT = NOTIFICATIONS_ENDPOINT + '/webhooks';
  WEBHOOKS_TEMPLATED_ENDPOINT = WEBHOOKS_ENDPOINT + '/{id}';

{ TNotificationService }

constructor TNotificationService.Create(Parent : iJunoApi4DelphiConig;  AuthService : iAuthorizationService);
begin
  FParent := Parent;
  FAuth := AuthService;
end;

function TNotificationService.CreateWebhook: String;
begin

end;

destructor TNotificationService.Destroy;
begin

  inherited;
end;

function TNotificationService.ListaEventTypes: TObjectList<TEventTypes>;
var
  JsonObj : TJSONObject;
  jv: TJSONValue;
  ja : TJSONArray;
  Event : TEventTypes;
  I: Integer;
begin
  JsonObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(
  TRequest.New
    .BaseURL(FParent.ResourceEndpoint + EVENT_TYPES_ENDPOINT)
    .Token(FAuth.Token)
    .AddParam('X-Api-Version','2',pkHTTPHEADER)
    .Get.Content), 0) as TJSONObject;

  jv := JsonObj.Get('_embedded').JsonValue;
  JsonObj := jv as TJSONObject;
  jv := JsonObj.Get('eventTypes').JsonValue;

  ja := jv as TJSONArray;

  Result := TObjectList<TEventTypes>.Create;
  for I := 0 to ja.Size -1 do
  begin
    Result.Add(TEventTypes.Create);
    JsonObj := (ja.Get(i) as TJSONObject);
    Result[I].Id := JsonObj.GetValue('id').ToString;
    Result[I].&Label := JsonObj.GetValue('label').ToString;
    Result[I].Name := JsonObj.GetValue('name').ToString;
    Result[I].Status := JsonObj.GetValue('status').ToString;
  end;
end;

function TNotificationService.ListaWebhooks: TObjectList<TWebhook>;
begin

end;

class function TNotificationService.New(Parent : iJunoApi4DelphiConig;  AuthService : iAuthorizationService) : iNotificationService;
begin
  Result := Self.Create(Parent, AuthService);
end;

end.
