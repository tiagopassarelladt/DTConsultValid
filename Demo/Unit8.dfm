object Form8: TForm8
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Demom - DTConsultValid'
  ClientHeight = 605
  ClientWidth = 617
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 5
    Width = 36
    Height = 13
    Caption = 'Usuario'
  end
  object Label2: TLabel
    Left = 135
    Top = 5
    Width = 30
    Height = 13
    Caption = 'Senha'
  end
  object edtUsuario: TEdit
    Left = 8
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '11914502000144'
  end
  object edtSenha: TEdit
    Left = 135
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '119145'
  end
  object Button1: TButton
    Left = 262
    Top = 22
    Width = 99
    Height = 25
    Caption = 'Gerar Token'
    TabOrder = 2
    OnClick = Button1Click
  end
  object msg: TMemo
    Left = 8
    Top = 53
    Width = 601
    Height = 544
    Lines.Strings = (
      'msg')
    ScrollBars = ssVertical
    TabOrder = 3
  end
  object Button2: TButton
    Left = 367
    Top = 22
    Width = 114
    Height = 25
    Caption = 'Consultar Tributa'#231#227'o'
    TabOrder = 4
    OnClick = Button2Click
  end
  object DTConsultValid1: TDTConsultValid
    Ambiente = tpvHomologacao
    RegimeTributario = tpvSimplesNacional
    GravaLog = False
    TipoArquivo = tpvEnvio
    Left = 328
    Top = 184
  end
end
