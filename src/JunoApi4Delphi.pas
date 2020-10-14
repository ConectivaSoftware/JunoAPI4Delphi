unit JunoApi4Delphi;

interface

uses
  JunoApi4Delphi.Interfaces;

type
  iJunoApi4Delphi = interface
    function JunoApi4delphiManager : iJunoApi4DelphiManager;
  end;

  TJunoApi4Delphi = class(TInterfacedObject, iJunoApi4Delphi)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iJunoApi4Delphi;
      function JunoApi4delphiManager : iJunoApi4DelphiManager;
  end;

implementation

uses
  JunoApi4DelphiManager;

{ TJunoApi4Delphi }

constructor TJunoApi4Delphi.Create;
begin

end;

destructor TJunoApi4Delphi.Destroy;
begin

  inherited;
end;

function TJunoApi4Delphi.JunoApi4delphiManager: iJunoApi4DelphiManager;
begin
  Result := TJunoApi4DelphiManager.New;
end;

class function TJunoApi4Delphi.New: iJunoApi4Delphi;
begin
  Result := Self.Create;
end;

end.
