unit CardHash;

interface

uses
  JunoApi4Delphi.Interfaces;

type
  TCardHash = class(TInterfacedObject, iCardHash)
    private
      FCardHash : String;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iCardHash;
      function CardNumber(Value : String) : iCardHash;
      function holderName(Value : String) : iCardHash;
      function securityCode(Value : String) : iCardHash;
      function expirationMonth(Value : String) : iCardHash;
      function expirationYear(Value : String) : iCardHash;
      function cardHash : String;
  end;

implementation

{ TCardHash }

function TCardHash.cardHash: String;
begin
  Result := FCardHash;
end;

function TCardHash.CardNumber(Value: String): iCardHash;
begin
  Result := Self;
end;

constructor TCardHash.Create;
begin

end;

destructor TCardHash.Destroy;
begin

  inherited;
end;

function TCardHash.expirationMonth(Value: String): iCardHash;
begin

end;

function TCardHash.expirationYear(Value: String): iCardHash;
begin
  Result := Self;
end;

function TCardHash.holderName(Value: String): iCardHash;
begin
  Result := Self;
end;

class function TCardHash.New: iCardHash;
begin
  Result := Self.Create;
end;

function TCardHash.securityCode(Value: String): iCardHash;
begin
  Result := Self;
end;

end.
