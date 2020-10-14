object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 511
  ClientWidth = 729
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button3: TButton
    Left = 8
    Top = 8
    Width = 89
    Height = 25
    Caption = 'Bancos'
    TabOrder = 0
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 144
    Top = 8
    Width = 249
    Height = 231
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 39
    Width = 89
    Height = 25
    Caption = 'Tipos Empresa'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 70
    Width = 89
    Height = 25
    Caption = 'Area Negocio'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button4: TButton
    Left = 8
    Top = 115
    Width = 89
    Height = 25
    Caption = 'Consulta Saldo'
    TabOrder = 4
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 8
    Top = 152
    Width = 105
    Height = 25
    Caption = 'Lista tipos eventos'
    TabOrder = 5
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 8
    Top = 259
    Width = 105
    Height = 25
    Caption = 'Cria cobran'#231'a'
    TabOrder = 6
    OnClick = Button6Click
  end
  object Button7: TButton
    Left = 8
    Top = 290
    Width = 105
    Height = 25
    Caption = 'Lista Cobran'#231'a'
    TabOrder = 7
    OnClick = Button7Click
  end
  object Button8: TButton
    Left = 8
    Top = 321
    Width = 105
    Height = 25
    Caption = 'Consulta Cobran'#231'a'
    TabOrder = 8
    OnClick = Button8Click
  end
  object Button9: TButton
    Left = 8
    Top = 352
    Width = 105
    Height = 25
    Caption = 'Cancelar Cobran'#231'a'
    TabOrder = 9
    OnClick = Button9Click
  end
  object Edit1: TEdit
    Left = 8
    Top = 200
    Width = 121
    Height = 21
    TabOrder = 10
  end
  object Button10: TButton
    Left = 144
    Top = 259
    Width = 105
    Height = 25
    Caption = 'Criar planos'
    TabOrder = 11
  end
  object Button11: TButton
    Left = 144
    Top = 290
    Width = 105
    Height = 25
    Caption = 'Listar Planos'
    TabOrder = 12
    OnClick = Button11Click
  end
  object Button12: TButton
    Left = 255
    Top = 259
    Width = 105
    Height = 25
    Caption = 'Consultar plano'
    TabOrder = 13
  end
  object Button13: TButton
    Left = 255
    Top = 290
    Width = 105
    Height = 25
    Caption = 'Consultar plano'
    TabOrder = 14
  end
  object Button14: TButton
    Left = 144
    Top = 321
    Width = 105
    Height = 25
    Caption = 'Desativar Plano'
    TabOrder = 15
  end
  object Button15: TButton
    Left = 255
    Top = 321
    Width = 105
    Height = 25
    Caption = 'Reativar Plano'
    TabOrder = 16
  end
  object Button16: TButton
    Left = 392
    Top = 259
    Width = 105
    Height = 25
    Caption = 'Criar Assintatura'
    TabOrder = 17
    OnClick = Button16Click
  end
  object Button17: TButton
    Left = 503
    Top = 259
    Width = 105
    Height = 25
    Caption = 'Listar Assinatura'
    TabOrder = 18
    OnClick = Button17Click
  end
  object Button18: TButton
    Left = 392
    Top = 290
    Width = 105
    Height = 25
    Caption = 'Consultar Assinatura'
    TabOrder = 19
  end
  object Button19: TButton
    Left = 503
    Top = 290
    Width = 105
    Height = 25
    Caption = 'Desativar Assinatura'
    TabOrder = 20
  end
  object Button20: TButton
    Left = 503
    Top = 321
    Width = 105
    Height = 25
    Caption = 'Ativar Assinatura'
    TabOrder = 21
  end
  object Button21: TButton
    Left = 614
    Top = 259
    Width = 105
    Height = 25
    Caption = 'Cancelar Assinatura'
    TabOrder = 22
  end
  object Button22: TButton
    Left = 392
    Top = 321
    Width = 105
    Height = 25
    Caption = 'Completar Assinatura'
    TabOrder = 23
  end
  object DBGrid1: TDBGrid
    Left = 401
    Top = 8
    Width = 320
    Height = 231
    DataSource = DataSource1
    TabOrder = 24
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Button23: TButton
    Left = 8
    Top = 393
    Width = 105
    Height = 25
    Caption = 'Pix Keys'
    TabOrder = 25
  end
  object Button24: TButton
    Left = 8
    Top = 424
    Width = 105
    Height = 25
    Caption = 'Pix QrCode Est'#225'tico'
    TabOrder = 26
  end
  object Button25: TButton
    Left = 8
    Top = 455
    Width = 105
    Height = 25
    Caption = 'Pix QrCode Dinamico'
    TabOrder = 27
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 560
    Top = 112
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 552
    Top = 176
  end
end
