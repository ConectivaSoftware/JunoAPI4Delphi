unit CompanyType;

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
  
  TCompanyType = class(TJsonDTO)
  private
    FCompanyTypes: TArray<string>;
    [JSONName('_links')]
    FLinks: TLinksDTO;
  published
    property CompanyTypes: TArray<string> read FCompanyTypes write FCompanyTypes;
    property Links: TLinksDTO read FLinks write FLinks;
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

{ TCompanyType }

constructor TCompanyType.Create;
begin
  inherited;
  FLinks := TLinksDTO.Create;
end;

destructor TCompanyType.Destroy;
begin
  FLinks.Free;
  inherited;
end;

end.
