unit Delphi4Juno;

interface

uses
  JunoApiServicesInterface;

type
  TDelphi4Juno = class(TInterfacedObject, iDelphi4Juno)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iDelphi4Juno;
      function Cofig : iJunoApiConfig;
  end;

implementation

uses
  JunoApiConfig;

{ TDelphi4Juno }

function TDelphi4Juno.Cofig: iJunoApiConfig;
begin
  Result := TJunoApiConig.New;
end;

constructor TDelphi4Juno.Create;
begin

end;

destructor TDelphi4Juno.Destroy;
begin

  inherited;
end;

class function TDelphi4Juno.New: iDelphi4Juno;
begin
  Result := Self.Create;
end;

end.
