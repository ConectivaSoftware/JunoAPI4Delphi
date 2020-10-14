unit EventType;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TEventTypes = class
  private
    FId: string;
    [JSONName('label')]
    FLabel: string;
    FName: string;
    FStatus: string;
  published
    property Id: string read FId write FId;
    property &Label: string read FLabel write FLabel;
    property Name: string read FName write FName;
    property Status: string read FStatus write FStatus;
  end;

  TRootDTO = class(TJsonDTO)
  private
    [JSONName('eventTypes')]
    FEventTypesArray: TArray<TEventTypes>;
    [GenericListReflect]
    FEventTypes: TObjectList<TEventTypes>;
    function GetEventTypes: TObjectList<TEventTypes>;
  published
    property EventTypes: TObjectList<TEventTypes> read GetEventTypes;
    destructor Destroy; override;
  end;

implementation

{ TRootDTO }

destructor TRootDTO.Destroy;
begin
  GetEventTypes.Free;
  inherited;
end;

function TRootDTO.GetEventTypes: TObjectList<TEventTypes>;
begin
  if not Assigned(FEventTypes) then
  begin
    FEventTypes := TObjectList<TEventTypes>.Create;
    FEventTypes.AddRange(FEventTypesArray);
  end;
  Result := FEventTypes;
end;

end.
