unit DocumentService;

interface

uses
  JunoApi4Delphi.Interfaces,
  Document,
  System.Generics.Collections;

type
  TDocumentService = class(TInterfacedObject, iDocumentService)
    private
    public
      constructor Create;
      destructor Destroy; override;
      class function New : iDocumentService;
      function Document : String;
      function ListDocument : TObjectList<TDocument>;
      function UploadFile : String;
      function UploadStream : String;
  end;

implementation

{ TDocumentService }

constructor TDocumentService.Create;
begin

end;

destructor TDocumentService.Destroy;
begin

  inherited;
end;

function TDocumentService.Document: String;
begin

end;

function TDocumentService.ListDocument: TObjectList<TDocument>;
begin

end;

class function TDocumentService.New: iDocumentService;
begin
  Result := Self.Create;
end;

function TDocumentService.UploadFile: String;
begin

end;

function TDocumentService.UploadStream: String;
begin

end;

end.
