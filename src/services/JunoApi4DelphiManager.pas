unit JunoApi4DelphiManager;

interface

uses
  JunoApi4Delphi.Interfaces;

type
  TJunoApi4DelphiManager = class(TInterfacedObject, iJunoApi4DelphiManager)
    private
      FConfig : iJunoApi4DelphiConig;
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iJunoApi4DelphiManager;
      function ContentTypeHeader : String;
      function ContentEncodingHeader : String;
      function XResourceToken : String;
      function XApiVersion : String;
      function Config : iJunoApi4DelphiConig;
      function Resources : iJunoApi4DelphiResources;
  end;

implementation

uses
  JunoApi4Delphi.Config, JunoAi4DelphiResources;

{ TJunoApi4DelphiManager }

function TJunoApi4DelphiManager.Config: iJunoApi4DelphiConig;
begin
  FConfig := TJunoApi4DelphiConig.New;
  Result := FConfig;
end;

function TJunoApi4DelphiManager.ContentEncodingHeader: String;
begin
  Result := 'Content-encoding';
end;

function TJunoApi4DelphiManager.ContentTypeHeader: String;
begin
  Result := 'Content-type';
end;

constructor TJunoApi4DelphiManager.Create;
begin

end;

destructor TJunoApi4DelphiManager.Destroy;
begin

  inherited;
end;

class function TJunoApi4DelphiManager.New: iJunoApi4DelphiManager;
begin
  Result := Self.Create;
end;

function TJunoApi4DelphiManager.Resources: iJunoApi4DelphiResources;
begin
  Result := TJunoApi4DelphiResources.New(FConfig);
end;

function TJunoApi4DelphiManager.XApiVersion: String;
begin
  Result := 'X-API-Version';
end;

function TJunoApi4DelphiManager.XResourceToken: String;
begin
  Result := 'X-Resource-Token';
end;

end.
