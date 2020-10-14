unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,  Vcl.StdCtrls, Banks, companytype,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

type
  TForm1 = class(TForm)
    Button3: TButton;
    Memo1: TMemo;
    Button1: TButton;
    Button2: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    DBGrid1: TDBGrid;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation


{$R *.dfm}

uses JunoApi4Delphi, EventType;


procedure TForm1.Button11Click(Sender: TObject);
begin
memo1.Clear;
memo1.Lines.Add(
_JunoApi4Delphi
.Resources
.PlansService
.GetPlans);
_JunoApi4Delphi
.Resources
.PlansService
.GetPlans(ClientDataSet1);
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Lines.Add(
    _JunoApi4Delphi
    .Resources
    .Subscriptions
    .CreateSubscription
      .DueDay(21)
      .PlanId('pln_37D138A1EA0CC834')
      .ChargeDescription('Assinatura 1')
      .CreditCardDetails('fgfabfbafb')
        .Billing
          .Email('alemedeiros@bsd.com.br')
          .Name('Alessandro')
          .Document('12345678')
          .Street('rua teste')
          .Number('34')
          .Complement('343434')
          .Neighborhood('estacao')
          .City('iguaba grande')
          .State('RJ')
          .PostCode('28960000')
        .&End
    .&End
  );
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  Memo1.Clear;
  memo1.Lines.Add(
  _JunoApi4Delphi
  .Resources
  .Subscriptions
  .GetSubscription('sub_F722D74E6B8150CD'));
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  CompanyType : TCompanyType;
begin
  Memo1.Clear;
  Memo1.Lines.Add(
  _JunoApi4Delphi
    .Resources
    .DataService
    .CompanyTypes);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Lines.Add(
  _JunoApi4Delphi
    .Resources
    .DataService
    .BusinessAreas);
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  Bank : TBanks;
begin
  Memo1.Clear;
  for Bank in _JunoApi4Delphi
    .Resources
    .DataService
    .Banks do
    Memo1.Lines.Add(Bank.number+' : '+Bank.name);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Lines.Add(
    _JunoApi4Delphi
    .Resources
    .BalanceService
    .Balance);
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  EventType : TEventTypes;
begin
  Memo1.Clear;
  for EventType in _JunoApi4Delphi
    .Resources
    .NotificationService
    .ListaEventTypes do
    Memo1.Lines.Add(EventType.Name);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Lines.Add(
  _JunoApi4Delphi
  .Resources
    .ChargeService
      .CreateCharge
        .ChargeDescription('Licença bilioteca')
        .ChargeReferences('boleto1')
        .ChargeAmount(10.00)
        .ChargeDueDate('2020-10-08')
        .ChargeInstallments(1)
        .ChargeMaxOverdueDays(5)
        .ChargeFine(5)
        .ChargeInterest('5.00')
        .ChargeDiscountAmount('0.00')
        .ChargeDiscountDays(-1)
        .ChargePaymentTypes('BOLETO')
        .ChargePaymentAdvance(false)

        .BillingName('Alessandro Teste Biblioteca')
        .BillingDocument('09826468797')
        .BillingEmail('alemedeiros@bsd.com.br')
        .BillingSecondaryEmail('aleportomedeiros@gmail.com')
        .BillingPhone('21993005210')
        .BillingBirthDate('2020-10-07 21:37:30')
        .BillingNotify(false)
      .&End);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  memo1.Clear;
  memo1.Lines.Add(
    _JunoApi4Delphi
    .Resources
    .ChargeService
    .GetCharge);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Lines.Add(
    _JunoApi4Delphi
    .Resources
    .ChargeService
    .GetFirstCharge(Edit1.Text));
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  Memo1.Clear;
  Memo1.Lines.Add(
    _JunoApi4Delphi
    .Resources
    .ChargeService
    .CancelCharge(Edit1.Text));
end;

end.
