object FrmProducts: TFrmProducts
  Left = 0
  Top = 0
  Caption = 'Productos'
  ClientHeight = 329
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
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 27
    Align = alTop
    AutoSize = True
    TabOrder = 0
    object Button1: TButton
      Left = 237
      Top = 1
      Width = 53
      Height = 25
      Caption = 'Consultar'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 60
      Top = 1
      Width = 54
      Height = 25
      Caption = 'Guardar'
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 117
      Top = 1
      Width = 38
      Height = 25
      Caption = 'Editar'
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 158
      Top = 1
      Width = 42
      Height = 25
      Caption = 'Borrar'
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 203
      Top = 1
      Width = 31
      Height = 25
      Caption = 'Salir'
      TabOrder = 4
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 4
      Top = 1
      Width = 53
      Height = 25
      Caption = 'Nuevo'
      TabOrder = 5
      OnClick = Button6Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 33
    Width = 511
    Height = 294
    DataSource = DataModule2.DSProducts
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'nombre_producto'
        Title.Caption = 'Nombre'
        Width = 350
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'valor'
        Title.Caption = 'Valor'
        Width = 120
        Visible = True
      end>
  end
end
