object FrmMenu: TFrmMenu
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 212
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 527
    Height = 212
    Align = alClient
    AutoSize = True
    TabOrder = 0
    ExplicitLeft = 185
    ExplicitTop = 8
    ExplicitWidth = 185
    ExplicitHeight = 145
    object BtnClients: TButton
      Left = 16
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Clientes'
      TabOrder = 0
      OnClick = BtnClientsClick
    end
    object BtnInvoices: TButton
      Left = 16
      Top = 96
      Width = 75
      Height = 25
      Caption = 'Facturas'
      TabOrder = 1
      OnClick = BtnInvoicesClick
    end
    object BtnProducts: TButton
      Left = 16
      Top = 56
      Width = 75
      Height = 25
      Caption = 'Productos'
      TabOrder = 2
      OnClick = BtnProductsClick
    end
    object BtnMenuExit: TButton
      Left = 432
      Top = 168
      Width = 75
      Height = 25
      Caption = 'Salir'
      TabOrder = 3
      OnClick = BtnMenuExitClick
    end
  end
end
