unit CreditCardService;

interface

uses
  JunoApi4Delphi.Interfaces;

type
  TCreditCardService = class(TInterfacedObject, iCreditCardService)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iCreditCardService;
      function Tokenize : String;
  end;

implementation

{ TCreditCardService }

constructor TCreditCardService.Create;
begin

end;

destructor TCreditCardService.Destroy;
begin

  inherited;
end;

class function TCreditCardService.New: iCreditCardService;
begin
  Result := Self.Create;
end;

function TCreditCardService.Tokenize: String;
begin

end;

end.
