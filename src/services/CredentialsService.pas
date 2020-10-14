unit CredentialsService;

interface

uses
  JunoApi4Delphi.Interfaces;

type
  TCredentialsService = class(TInterfacedObject, iCredentialsService)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iCredentialsService;
      function PublicCredentials : String;
  end;

implementation

{ TCredentialsService }

constructor TCredentialsService.Create;
begin

end;

destructor TCredentialsService.Destroy;
begin

  inherited;
end;

class function TCredentialsService.New: iCredentialsService;
begin
  Result := Self.Create;
end;

function TCredentialsService.PublicCredentials: String;
begin

end;

end.
