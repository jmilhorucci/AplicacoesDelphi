object frmQuadrado: TfrmQuadrado
  Left = 0
  Top = 0
  Caption = 'Quadrado'
  ClientHeight = 226
  ClientWidth = 326
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -15
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 18
  object Label1: TLabel
    Left = 84
    Top = 17
    Width = 159
    Height = 18
    Caption = #193'REA DO QUADRADO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 36
    Height = 18
    Caption = 'Lado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 112
    Width = 75
    Height = 18
    Caption = 'Resultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtLado: TEdit
    Left = 8
    Top = 80
    Width = 310
    Height = 26
    TabOrder = 0
    OnChange = edtLadoChange
    OnKeyPress = edtLadoKeyPress
  end
  object edtResultado: TEdit
    Left = 8
    Top = 136
    Width = 310
    Height = 26
    ReadOnly = True
    TabOrder = 1
  end
  object btnLimpar: TBitBtn
    Left = 8
    Top = 186
    Width = 310
    Height = 32
    Caption = 'LIMPAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = btnLimparClick
  end
end
