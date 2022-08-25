program CRUDClientes;

uses
  Vcl.Forms,
  Menu in 'Menu.pas' {FrmMenu},
  DMPrincipal in 'DMPrincipal.pas' {DataModule2: TDataModule},
  ClientsList in 'ClientsList.pas' {FrmClientList},
  ProductsList in 'ProductsList.pas' {FrmProducts},
  InvoicesList in 'InvoicesList.pas' {FrmInvoices},
  Invoices in 'Invoices.pas' {FrmInvoice};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMenu, FrmMenu);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TFrmClientList, FrmClientList);
  Application.CreateForm(TFrmProducts, FrmProducts);
  Application.CreateForm(TFrmInvoices, FrmInvoices);
  Application.CreateForm(TFrmInvoice, FrmInvoice);
  Application.Run;
end.
