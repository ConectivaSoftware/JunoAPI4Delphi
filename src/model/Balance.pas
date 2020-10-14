unit Balance;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TSelfDTO = class
  private
    FHref: string;
  published
    property Href: string read FHref write FHref;
  end;
  
  TLinksDTO = class
  private
    FSelf: TSelfDTO;
  published
    property Self: TSelfDTO read FSelf write FSelf;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TBalance = class(TJsonDTO)
  private
    FBalance: Double;
    [JSONName('_links')]
    FLinks: TLinksDTO;
    FTransferableBalance: Double;
    FWithheldBalance: Integer;
  published
    property Balance: Double read FBalance write FBalance;
    property Links: TLinksDTO read FLinks write FLinks;
    property TransferableBalance: Double read FTransferableBalance write FTransferableBalance;
    property WithheldBalance: Integer read FWithheldBalance write FWithheldBalance;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;
  
implementation

{ TLinksDTO }

constructor TLinksDTO.Create;
begin
  inherited;
  FSelf := TSelfDTO.Create;
end;

destructor TLinksDTO.Destroy;
begin
  FSelf.Free;
  inherited;
end;

{ TBalance }

constructor TBalance.Create;
begin
  inherited;
  FLinks := TLinksDTO.Create;
end;

destructor TBalance.Destroy;
begin
  FLinks.Free;
  inherited;
end;

end.
