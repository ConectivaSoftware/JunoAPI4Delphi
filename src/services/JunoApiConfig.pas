unit JunoApiConfig;

interface

uses
  JunoApiServicesInterface;


type
  TJunoApiConig = class(TInterfacedObject, iJunoApiConfig)
    private
      FClientID : String;
      FClientSecret : String;
      FResourceToken : String;
      FPublicToken : String;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iJunoApiConfig;
      function ClientID(value : string) : iJunoApiConfig;
      function ClientSecret(value : String) : iJunoApiConfig;
      function ResourceToken(value : String) : iJunoApiConfig;
      function PublicToken(value : string) : iJunoApiConfig;
  end;

implementation

{ TJunoApiConig }

function TJunoApiConig.ClientID(value: string): iJunoApiConfig;
begin
  Result := Self;
  FClientID := Value;
end;

function TJunoApiConig.ClientSecret(value: String): iJunoApiConfig;
begin
  Result := Self;
  FClientSecret := Value;
end;

constructor TJunoApiConig.Create;
begin

end;

destructor TJunoApiConig.Destroy;
begin

  inherited;
end;

class function TJunoApiConig.New: iJunoApiConfig;
begin
  Result := Self.Create;
end;

function TJunoApiConig.PublicToken(value: string): iJunoApiConfig;
begin
  Result := self;
  FPublicToken := Value;
end;

function TJunoApiConig.ResourceToken(value: String): iJunoApiConfig;
begin
  Result := Self;
  FResourceToken := Value;
end;

end.
