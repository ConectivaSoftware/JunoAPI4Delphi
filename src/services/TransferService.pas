unit TransferService;

interface

uses
  JunoApi4Delphi.Interfaces;

type
  TTransferService = class(TInterfacedObject, iTransferService)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iTransferService;
  end;

implementation

{ TTransferService }

constructor TTransferService.Create;
begin

end;

destructor TTransferService.Destroy;
begin

  inherited;
end;

class function TTransferService.New: iTransferService;
begin
  Result := Self.Create;
end;

end.
