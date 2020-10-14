unit DigitalAccountService;

interface

uses
  JunoApi4Delphi.Interfaces;

type
  TDigitalAccountService = class(TInterfacedObject, iDigitalAccountService)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iDigitalAccountService;
  end;

implementation

{ TDigitalAccountService }

constructor TDigitalAccountService.Create;
begin

end;

destructor TDigitalAccountService.Destroy;
begin

  inherited;
end;

class function TDigitalAccountService.New: iDigitalAccountService;
begin
  Result := Self.Create;
end;

end.
