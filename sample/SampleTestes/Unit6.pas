unit Unit6;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,REST.JSON, System.Json,
  System.Generics.Collections, {}MSHTML, Vcl.OleCtrls, SHDocVw{},REST.Response.Adapter,
  Data.DB, Datasnap.DBClient, Vcl.Grids, Vcl.DBGrids;

type
  TBanks = class
  private
    FName: string;
    FNumber: string;
  published
    property Name: string read FName write FName;
    property Number: String read FNumber write FNumber;
  end;

  TForm6 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Button3: TButton;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
var
a:string;
Banks : TObjectList<TBanks>;
JSONObj,jobj : TJSONObject;
ja: TJSONArray;
jv: TJSONValue;
  I: Integer;
  Bank : TBanks;
begin
a:=
'{'+
'   "_embedded": {'+
'      "banks": ['+
'         {'+
'            "number": "001",'+
'            "name": "BCO DO BRASIL S.A."'+
'         },'+
'         {'+
'            "number": "003",'+
'            "name": "BCO DA AMAZONIA S.A."'+
'         },'+
'         {'+
'            "number": "004",'+
'            "name": "BCO DO NORDESTE DO BRASIL S.A."'+
'         },'+
'         {'+
'            "number": "021",'+
'            "name": "BCO BANESTES S.A."'+
'         },'+
'         {'+
'            "number": "025",'+
'            "name": "BCO ALFA S.A."'+
'         },'+
'         {'+
'            "number": "033",'+
'            "name": "BCO SANTANDER (BRASIL) S.A."'+
'         },'+
'         {'+
'            "number": "036",'+
'            "name": "BCO BBI S.A."'+
'         },'+
'         {'+
'            "number": "037",'+
'            "name": "BCO DO EST. DO PA S.A."'+
'         },'+
'         {'+
'            "number": "041",'+
'            "name": "BCO DO ESTADO DO RS S.A."'+
'         },'+
'         {'+
'            "number": "047",'+
'            "name": "BCO DO EST. DE SE S.A."'+
'         },'+
'         {'+
'            "number": "062",'+
'            "name": "HIPERCARD BM S.A."'+
'         },'+
'         {'+
'            "number": "066",'+
'            "name": "BCO MORGAN STANLEY S.A."'+
'         },'+
'         {'+
'            "number": "069",'+
'            "name": "BCO CREFISA S.A."'+
'         },'+
'         {'+
'            "number": "070",'+
'            "name": "BRB - BCO DE BRASILIA S.A."'+
'         },'+
'         {'+
'            "number": "074",'+
'            "name": "BCO. J.SAFRA S.A."'+
'         },'+
'         {'+
'            "number": "077",'+
'            "name": "Banco Inter"'+
'         },'+
'         {'+
'            "number": "079",'+
'            "name": "BCO ORIGINAL DO AGRO S/A"'+
'         },'+
'         {'+
'            "number": "084",'+
'            "name": "UNIPRIME NORTE DO PARANÁ - CC"'+
'         },'+
'         {'+
'            "number": "085",'+
'            "name": "COOP CENTRAL AILOS"'+
'         },'+
'         {'+
'            "number": "089",'+
'            "name": "CREDISAN CC"'+
'         },'+
'         {'+
'            "number": "091",'+
'            "name": "CCCM UNICRED CENTRAL RS"'+
'         },'+
'         {'+
'            "number": "093",'+
'            "name": "POLOCRED SCMEPP LTDA."'+
'         },'+
'         {'+
'            "number": "097",'+
'            "name": "CREDISIS CENTRAL DE COOPERATIVAS DE CRÉDITO LTDA."'+
'         },'+
'         {'+
'            "number": "099",'+
'            "name": "UNIPRIME CENTRAL CCC LTDA."'+
'         },'+
'         {'+
'            "number": "104",'+
'            "name": "Caixa Economica Federal"'+
'         },'+
'         {'+
'            "number": "107",'+
'            "name": "BCO BOCOM BBM S.A."'+
'         },'+
'         {'+
'            "number": "114",'+
'            "name": "CENTRAL COOPERATIVA DE CRÉDITO NO ESTADO DO ESPÍRITO SANTO"'+
'         },'+
'         {'+
'            "number": "121",'+
'            "name": "BCO AGIBANK S.A."'+
'         },'+
'         {'+
'            "number": "133",'+
'            "name": "CRESOL CONFEDERAÇÃO"'+
'         },'+
'         {'+
'            "number": "136",'+
'            "name": "UNICRED"'+
'         },'+
'         {'+
'            "number": "173",'+
'            "name": "BRL TRUST DTVM SA"'+
'         },'+
'         {'+
'            "number": "197",'+
'            "name": "Stone Pagamentos S.A."'+
'         },'+
'         {'+
'            "number": "208",'+
'            "name": "BANCO BTG PACTUAL S.A."'+
'         },'+
'         {'+
'            "number": "212",'+
'            "name": "Banco Original"'+
'         },'+
'         {'+
'            "number": "218",'+
'            "name": "BCO BS2 S.A."'+
'         },'+
'         {'+
'            "number": "222",'+
'            "name": "BCO CRÉDIT AGRICOLE BR S.A."'+
'         },'+
'         {'+
'            "number": "237",'+
'            "name": "BCO BRADESCO S.A."'+
'         },'+
'         {'+
'            "number": "243",'+
'            "name": "BCO MÁXIMA S.A."'+
'         },'+
'         {'+
'            "number": "246",'+
'            "name": "BCO ABC BRASIL S.A."'+
'         },'+
'         {'+
'            "number": "254",'+
'            "name": "PARANA BCO S.A."'+
'         },'+
'         {'+
'            "number": "260",'+
'            "name": "Nu Pagamentos S.A."'+
'         },'+
'         {'+
'            "number": "265",'+
'            "name": "BCO FATOR S.A."'+
'         },'+
'         {'+
'            "number": "290",'+
'            "name": "PAGSEGURO"'+
'         },'+
'         {'+
'            "number": "301",'+
'            "name": "BPP IP S.A."'+
'         },'+
'         {'+
'            "number": "318",'+
'            "name": "BCO BMG S.A."'+
'         },'+
'         {'+
'            "number": "320",'+
'            "name": "BCO CCB BRASIL S.A."'+
'         },'+
'         {'+
'            "number": "323",'+
'            "name": "Mercado Pago"'+
'         },'+
'         {'+
'            "number": "336",'+
'            "name": "BCO C6 S.A."'+
'         },'+
'         {'+
'            "number": "341",'+
'            "name": "ITAÚ UNIBANCO S.A."'+
'         },'+
'         {'+
'            "number": "364",'+
'            "name": "GERENCIANET PAGTOS BRASIL LTDA"'+
'         },'+
'         {'+
'            "number": "366",'+
'            "name": "BCO SOCIETE GENERALE BRASIL"'+
'         },'+
'         {'+
'            "number": "370",'+
'            "name": "BCO MIZUHO S.A."'+
'         },'+
'         {'+
'            "number": "376",'+
'            "name": "BCO J.P. MORGAN S.A."'+
'         },'+
'         {'+
'            "number": "389",'+
'            "name": "BCO MERCANTIL DO BRASIL S.A."'+
'         },'+
'         {'+
'            "number": "394",'+
'            "name": "BCO BRADESCO FINANC. S.A."'+
'         },'+
'         {'+
'            "number": "399",'+
'            "name": "KIRTON BANK"'+
'         },'+
'         {'+
'            "number": "412",'+
'            "name": "BCO CAPITAL S.A."'+
'         },'+
'         {'+
'            "number": "422",'+
'            "name": "BCO SAFRA S.A."'+
'         },'+
'         {'+
'            "number": "473",'+
'            "name": "BCO CAIXA GERAL BRASIL S.A."'+
'         },'+
'         {'+
'            "number": "600",'+
'            "name": "BCO LUSO BRASILEIRO S.A."'+
'         },'+
'         {'+
'            "number": "604",'+
'            "name": "BCO INDUSTRIAL DO BRASIL S.A."'+
'         },'+
'         {'+
'            "number": "611",'+
'            "name": "BCO PAULISTA S.A."'+
'         },'+
'         {'+
'            "number": "612",'+
'            "name": "BCO GUANABARA S.A."'+
'         },'+
'         {'+
'            "number": "613",'+
'            "name": "OMNI BANCO S.A."'+
'         },'+
'         {'+
'            "number": "623",'+
'            "name": "BANCO PAN"'+
'         },'+
'         {'+
'            "number": "626",'+
'            "name": "BCO C6 CONSIG"'+
'         },'+
'         {'+
'            "number": "630",'+
'            "name": "SMARTBANK"'+
'         },'+
'         {'+
'            "number": "633",'+
'            "name": "BCO RENDIMENTO S.A."'+
'         },'+
'         {'+
'            "number": "634",'+
'            "name": "BCO TRIANGULO S.A."'+
'         },'+
'         {'+
'            "number": "637",'+
'            "name": "BCO SOFISA S.A."'+
'         },'+
'         {'+
'            "number": "654",'+
'            "name": "BCO DIGIMAIS S.A."'+
'         },'+
'         {'+
'            "number": "655",'+
'            "name": "BCO VOTORANTIM S.A."'+
'         },'+
'         {'+
'            "number": "707",'+
'            "name": "BCO DAYCOVAL S.A"'+
'         },'+
'         {'+
'            "number": "739",'+
'            "name": "BCO CETELEM S.A."'+
'         },'+
'         {'+
'            "number": "741",'+
'            "name": "BCO RIBEIRAO PRETO S.A."'+
'         },'+
'         {'+
'            "number": "743",'+
'            "name": "Banco Semear"'+
'         },'+
'         {'+
'            "number": "745",'+
'            "name": "BCO CITIBANK S.A."'+
'         },'+
'         {'+
'            "number": "746",'+
'            "name": "BCO MODAL S.A."'+
'         },'+
'         {'+
'            "number": "748",'+
'            "name": "BCO COOPERATIVO SICREDI S.A."'+
'         },'+
'         {'+
'            "number": "752",'+
'            "name": "BCO BNP PARIBAS BRASIL S A"'+
'         },'+
'         {'+
'            "number": "755",'+
'            "name": "BOFA MERRILL LYNCH BM S.A."'+
'         },'+
'         {'+
'            "number": "756",'+
'            "name": "BANCOOB"'+
'         }'+
'      ]'+
'   },'+
'   "_links": {'+
'      "self": {'+
'         "href": "https://sandbox.boletobancario.com/api-integration/data/banks"'+
'      }'+
'   }'+
'}';
jsonObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(a), 0) as TJSONObject;
jv := jsonObj.Get('_embedded').JsonValue;
jobj := jv as TJSONObject;
jv := jobj.Get('banks').JsonValue;

ja := jv as TJSONArray;

Banks := TObjectList<TBanks>.Create;
for I := 0 to ja.Size -1 do
begin
Banks.Add(TBanks.Create);
jObj := (ja.Get(i) as TJSONObject);
jv := jObj.Get(0).JsonValue;
Banks[I].Number := jv.Value;
jv := jObj.Get(1).JsonValue;
Banks[I].Name := jv.Value;
end;

for Bank in Banks do
  Memo1.Lines.Add(Bank.Number +' : '+Bank.Name);
end;

procedure TForm6.Button2Click(Sender: TObject);
var
  webbrowser : TWebBrowser;
begin
//  webbrowser.Navigate(ExtractFilePath(Application.ExeName) + 'hash.html');
//  With webbrowser.Document as IHTMLDocument2 do
//    parentWindow.execScript('DirectCheckout(')
end;

procedure TForm6.Button3Click(Sender: TObject);
var
  lJSONObj : TJSONObject;
  lJSONArray : TJSONArray;

  lConv : TCustomJSONDataSetAdapter;
  lJSON : String;
begin
ljson:=
'{'+
'"id": "pln_D539CC5AF0E87FB1",'+
'"createdOn": "2020-06-22 07:22:18",'+
'"name": "Primeiro plano",'+
'"frequency": "MONTHLY",'+
'"status": "ACTIVE",'+
'"amount": 100.01,'+
'"_links": ['+
'{'+
'"href": "https://{url_resource_server}/plans/pln_D539CC5AF0E87FB1"'+
'}'+
']'+
'}';

  lJSONObj := TJSONObject.ParseJSONValue(TEncoding.ASCII.GetBytes(lJSON), 0) as TJSONObject;
  lConv := TCustomJSONDataSetAdapter.Create(nil);

  try
    lConv.DataSet := ClientDataSet1;
    lConv.UpdateDataSet(lJSONObj);
  finally
    lConv.Free;
  end;
end;

end.
