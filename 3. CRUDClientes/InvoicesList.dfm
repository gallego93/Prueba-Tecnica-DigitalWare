object FrmInvoices: TFrmInvoices
  Left = 0
  Top = 0
  Caption = 'Facturas'
  ClientHeight = 357
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 90
    Width = 73
    Height = 13
    Caption = 'Detalle Factura'
  end
  object Label2: TLabel
    Left = 8
    Top = 39
    Width = 33
    Height = 13
    Caption = 'Cliente'
  end
  object Label3: TLabel
    Left = 176
    Top = 40
    Width = 24
    Height = 13
    Caption = 'Total'
  end
  object Label4: TLabel
    Left = 328
    Top = 39
    Width = 29
    Height = 13
    Caption = 'Fecha'
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 27
    Align = alTop
    AutoSize = True
    TabOrder = 0
    object Button2: TButton
      Left = 4
      Top = 1
      Width = 51
      Height = 25
      Caption = 'Guardar'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button5: TButton
      Left = 58
      Top = 1
      Width = 31
      Height = 25
      Caption = 'Salir'
      TabOrder = 1
      OnClick = Button5Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 105
    Width = 511
    Height = 244
    DataSource = DataModule2.DSDetalleFactura
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'producto'
        Title.Caption = 'Producto'
        Width = 230
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'cantidad'
        Title.Caption = 'Cantidad'
        Width = 90
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Title.Caption = 'Valor'
        Width = 150
        Visible = True
      end>
  end
  object ComboBox1: TComboBox
    Left = 8
    Top = 58
    Width = 145
    Height = 21
    TabOrder = 2
  end
  object DateTimePicker1: TDateTimePicker
    Left = 328
    Top = 58
    Width = 186
    Height = 21
    Date = 44784.000000000000000000
    Time = 0.561659490740567000
    TabOrder = 3
  end
  object Edit1: TEdit
    Left = 176
    Top = 58
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
end
