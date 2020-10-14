unit Split;

interface

uses
  JunoApi4Delphi.Interfaces;

type
  TSplit<T : IInterface> = class(TInterfacedObject, iSplit<T>)
    private
      [weak]
      FParent : T;
      FrecipientToken : String;
      Famount : Double;
      Fpercentage : Double;
      FamountRemainder : Boolean;
      FchargeFee : Boolean;
    public
      constructor Create(Parent : T);
      destructor Destroy; override;
      class function New(Parent : T) : iSplit<T>;
      function recipientToken(Value : String) : iSplit<T>; overload;
      function recipientToken : String; overload;
      function amount(Value : Double) : iSplit<T>; overload;
      function amount : Double; overload;
      function percentage(Value : Double) : iSplit<T>; overload;
      function percentage : Double; overload;
      function amountRemainder(Value : Boolean) : iSplit<T>; overload;
      function amountRemainder : Boolean; overload;
      function chargeFee(Value : Boolean) : iSplit<T>; overload;
      function chargeFee : Boolean; overload;
      function &End : T;
  end;

implementation

{ TSplit<T> }

function TSplit<T>.amount(Value: Double): iSplit<T>;
begin
  Result := Self;
  Famount := Value;
end;

function TSplit<T>.amount: Double;
begin
  Result := Famount;
end;

function TSplit<T>.amountRemainder: Boolean;
begin
  Result := FamountRemainder;
end;

function TSplit<T>.amountRemainder(Value: Boolean): iSplit<T>;
begin
  Result := Self;
  FamountRemainder := Value;
end;

function TSplit<T>.chargeFee: Boolean;
begin
  Result := FchargeFee;
end;

function TSplit<T>.chargeFee(Value: Boolean): iSplit<T>;
begin
  Result := Self;
  FchargeFee := Value;
end;

function TSplit<T>.&End: T;
begin
  Result := FParent;
end;

constructor TSplit<T>.Create(Parent : T);
begin
  FParent := Parent;
end;

destructor TSplit<T>.Destroy;
begin

  inherited;
end;

class function TSplit<T>.New(Parent : T): iSplit<T>;
begin
  Result := Self.Create(Parent);
end;

function TSplit<T>.percentage(Value: Double): iSplit<T>;
begin

end;

function TSplit<T>.percentage: Double;
begin

end;

function TSplit<T>.recipientToken(Value: String): iSplit<T>;
begin

end;

function TSplit<T>.recipientToken: String;
begin

end;

end.
