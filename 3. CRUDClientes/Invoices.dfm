object FrmInvoice: TFrmInvoice
  Left = 0
  Top = 0
  Caption = 'Facturas'
  ClientHeight = 359
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 33
    Width = 511
    Height = 318
    DataSource = DataModule2.DSFactura
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'numero'
        Title.Caption = 'Numero'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cliente'
        Title.Caption = 'Cliente'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'total'
        Title.Caption = 'Total'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'fecha'
        Title.Caption = 'Fecha'
        Width = 120
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 27
    Align = alTop
    AutoSize = True
    TabOrder = 1
    object Button1: TButton
      Left = 181
      Top = 1
      Width = 53
      Height = 25
      Caption = 'Consultar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 4
      Top = 1
      Width = 54
      Height = 25
      Caption = 'Nuevo'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 61
      Top = 1
      Width = 38
      Height = 25
      Caption = 'Editar'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 102
      Top = 1
      Width = 43
      Height = 25
      Caption = 'Borrar'
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 147
      Top = 1
      Width = 31
      Height = 25
      Caption = 'Salir'
      TabOrder = 4
      OnClick = Button5Click
    end
  end
end
