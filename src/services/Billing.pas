unit Billing;

interface

uses
  JunoApi4Delphi.Interfaces;

type
  TBilling<T : IInterface> = class(TInterfacedObject, iBilling<T>)
    private
      [weak]
      FParent : T;
      FEmail : String;
      FName : String;
      FDocument : String;
      FStreet : String;
      FNumber : String;
      FComplement : String;
      FNeighborhood : String;
      FCity : String;
      FState : String;
      FPostCode : String;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iBilling<T>;
      function Email(Value : String) : iBilling<T>; overload;
      function Email : String; overload;
      function Name(Value : String) : iBilling<T>; overload;
      function Name : String; overload;
      function Document(Value : String) : iBilling<T>; overload;
      function Document : String; overload;
      function Street(Value : String) : iBilling<T>; overload;
      function Street : String; overload;
      function Number(Value : String) : iBilling<T>; overload;
      function Number : String; overload;
      function Complement(Value : String) : iBilling<T>; overload;
      function Complement : String; overload;
      function Neighborhood(Value : String) : iBilling<T>; overload;
      function Neighborhood : String; overload;
      function City(Value : String) : iBilling<T>; overload;
      function City : String; overload;
      function State(Value : String) : iBilling<T>; overload;
      function State : String; overload;
      function PostCode(Value : String) : iBilling<T>; overload;
      function PostCode : String; overload;
      function &End : T;
  end;

implementation


{ TBilling<T> }

function TBilling<T>.City: String;
begin
  Result := FCity;
end;

function TBilling<T>.City(Value: String): iBilling<T>;
begin
  Result := Self;
  FCity := Value;
end;

function TBilling<T>.Complement: String;
begin
  Result := FComplement;
end;

function TBilling<T>.Complement(Value: String): iBilling<T>;
begin
  Result := Self;
  FComplement := Value;
end;

constructor TBilling<T>.Create(Parent: T);
begin
  FParent := Parent;
end;

destructor TBilling<T>.Destroy;
begin

  inherited;
end;

function TBilling<T>.Document(Value: String): iBilling<T>;
begin
  Result := Self;
  FDocument := Value;
end;

function TBilling<T>.Document: String;
begin
  Result := FDocument;
end;

function TBilling<T>.Email: String;
begin
  Result := FEmail;
end;

function TBilling<T>.Email(Value: String): iBilling<T>;
begin
  Result := Self;
  FEmail := Value;
end;

function TBilling<T>.&End: T;
begin
  Result := FParent;
end;

function TBilling<T>.Neighborhood(Value: String): iBilling<T>;
begin
  Result := Self;
  FNeighborhood := Value;
end;

function TBilling<T>.Name(Value: String): iBilling<T>;
begin
  Result := Self;
  FName := Value;
end;

function TBilling<T>.Name: String;
begin
  Result := FName;
end;

function TBilling<T>.Neighborhood: String;
begin
  Result := FNeighborhood;
end;

class function TBilling<T>.New(Parent: T): iBilling<T>;
begin
  Result := Self.Create(Parent);
end;

function TBilling<T>.Number: String;
begin
  Result := FNumber;
end;

function TBilling<T>.Number(Value: String): iBilling<T>;
begin
  Result := Self;
  FNumber := Value;
end;

function TBilling<T>.PostCode(Value: String): iBilling<T>;
begin
  Result := Self;
  FPostCode := Value;
end;

function TBilling<T>.PostCode: String;
begin
  Result := FPostCode;
end;

function TBilling<T>.State(Value: String): iBilling<T>;
begin
  Result := Self;
  FState := Value;
end;

function TBilling<T>.State: String;
begin
  Result := FState;
end;

function TBilling<T>.Street(Value: String): iBilling<T>;
begin
  Result := Self;
  FStreet := Value;
end;

function TBilling<T>.Street: String;
begin
  Result := FStreet;
end;

end.
