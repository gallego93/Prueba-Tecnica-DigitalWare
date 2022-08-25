unit Menu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmMenu = class(TForm)
    BtnClients: TButton;
    BtnProducts: TButton;
    BtnInvoices: TButton;
    BtnMenuExit: TButton;
    Panel1: TPanel;
    procedure BtnClientsClick(Sender: TObject);
    procedure BtnProductsClick(Sender: TObject);
    procedure BtnInvoicesClick(Sender: TObject);
    procedure BtnMenuExitClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmMenu: TFrmMenu;

implementation

{$R *.dfm}

uses DMPrincipal, ClientsList, Invoices, ProductsList;

procedure TFrmMenu.BtnClientsClick(Sender: TObject);
begin
  ClientsList.FrmClientList.Show;
end;

procedure TFrmMenu.BtnInvoicesClick(Sender: TObject);
begin
  Invoices.FrmInvoice.Show;
end;

procedure TFrmMenu.BtnMenuExitClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmMenu.BtnProductsClick(Sender: TObject);
begin
  ProductsList.FrmProducts.Show;
end;

end.
