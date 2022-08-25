unit InvoicesList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Data.DBXMySQL, Data.FMTBcd,
  Datasnap.DBClient, Data.SqlExpr, Datasnap.Provider;

type
  TFrmInvoices = class(TForm)
    Panel1: TPanel;
    Button2: TButton;
    Button5: TButton;
    DBGrid1: TDBGrid;
    ComboBox1: TComboBox;
    DateTimePicker1: TDateTimePicker;
    Edit1: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    Procedure Validaciones;
  end;

var
  FrmInvoices: TFrmInvoices;

implementation

{$R *.dfm}

uses DMPrincipal;

procedure TFrmInvoices.Button2Click(Sender: TObject);
var
  QCabezaFacturaInsert, QDetalleFacturaInsert, QConsecutivo: TSQLQuery;
begin
  if (self.Caption = 'Nuevo') then
  begin
  QCabezaFacturaInsert := TSQLQuery.Create(nil);
  QCabezaFacturaInsert.SQLConnection := DataModule2.SQLConnection1;
  QCabezaFacturaInsert.Close;
  QCabezaFacturaInsert.SQL.Clear;
  QCabezaFacturaInsert.SQL.Add('INSERT INTO cabeza_factura(cliente, fecha, total)');
  QCabezaFacturaInsert.SQL.Add('VALUES(:cliente, :fecha, :total)');
  QCabezaFacturaInsert.ParamByName('cliente').AsString := ComboBox1.Text;
  QCabezaFacturaInsert.ParamByName('fecha').AsDateTime := DateTimePicker1.DateTime;
  QCabezaFacturaInsert.ParamByName('total').AsInteger := DataModule2.CDSCabezaFacturatotal.AsInteger;
  Validaciones;
  QCabezaFacturaInsert.ExecSQL;

  try
    QDetalleFacturaInsert := TSQLQuery.Create(nil);
    QDetalleFacturaInsert.SQLConnection := DataModule2.SQLConnection1;
    QDetalleFacturaInsert.Close;
    QDetalleFacturaInsert.SQL.Clear;
    QDetalleFacturaInsert.SQL.Add('INSERT INTO detalle_factura(numero, producto, cantidad, valor)');
    QDetalleFacturaInsert.SQL.Add('VALUES(:numero, :producto, :cantidad, :valor)');
    DataModule2.CDSDetalleFactura.First;
    while not DataModule2.CDSDetalleFactura.Eof do
    begin
      QDetalleFacturaInsert.ParamByName('numero').AsInteger := DataModule2.CDSCabezaFacturanumero.AsInteger;
      QDetalleFacturaInsert.ParamByName('producto').AsInteger := DataModule2.CDSDetalleFacturaproducto.AsInteger;
      QDetalleFacturaInsert.ParamByName('cantidad').AsString := DataModule2.CDSDetalleFacturacantidad.AsString;
      QDetalleFacturaInsert.ParamByName('valor').AsFloat := DataModule2.CDSDetalleFacturavalor.AsFloat;
      QDetalleFacturaInsert.ExecSQL;
      DataModule2.CDSDetalleFactura.Next;
    end;
  finally
    QDetalleFacturaInsert.Free;
  end;
  ShowMessage('Registro creado exitosamente.!');
  Button2.Enabled := false;
  end

  else if (self.Caption = 'Editar') then
  begin
  QCabezaFacturaInsert := TSQLQuery.Create(nil);
  QCabezaFacturaInsert.SQLConnection := DataModule2.SQLConnection1;
  QCabezaFacturaInsert.Close;
  QCabezaFacturaInsert.SQL.Clear;
  QCabezaFacturaInsert.SQL.Add('UPDATE cabeza_factura SET cliente=:cliente, fecha=:fecha, total=:total');
  QCabezaFacturaInsert.SQL.Add('WHERE numero=:numero');
  QCabezaFacturaInsert.ParamByName('cliente').AsString := DataModule2.CDSCabezaFacturacliente.AsString;
  QCabezaFacturaInsert.ParamByName('fecha').AsDateTime := DataModule2.CDSCabezaFacturafecha.AsDateTime;
  QCabezaFacturaInsert.ParamByName('total').AsInteger := DataModule2.CDSCabezaFacturatotal.AsInteger;
  QCabezaFacturaInsert.ParamByName('numero').AsString := DataModule2.CDSCabezaFacturanumero.AsString;
  Validaciones;
  QCabezaFacturaInsert.ExecSQL;

  try
    QDetalleFacturaInsert := TSQLQuery.Create(nil);
    QDetalleFacturaInsert.SQLConnection := DataModule2.SQLConnection1;
    QDetalleFacturaInsert.Close;
    QDetalleFacturaInsert.SQL.Clear;
    QDetalleFacturaInsert.SQL.Add('UPDATE detalle_factura SET producto=:producto, cantidad=:cantidad, valor=:valor');
    QDetalleFacturaInsert.SQL.Add('WHERE numero=:numero');
    DataModule2.CDSDetalleFactura.First;
    while not DataModule2.CDSDetalleFactura.Eof do
    begin
      QDetalleFacturaInsert.ParamByName('producto').AsInteger := DataModule2.CDSDetalleFacturaproducto.AsInteger;
      QDetalleFacturaInsert.ParamByName('cantidad').AsString := DataModule2.CDSDetalleFacturacantidad.AsString;
      QDetalleFacturaInsert.ParamByName('valor').AsFloat := DataModule2.CDSDetalleFacturavalor.AsFloat;
      QDetalleFacturaInsert.ParamByName('numero').AsString := DataModule2.CDSCabezaFacturanumero.AsString;
      QDetalleFacturaInsert.ExecSQL;
      DataModule2.CDSDetalleFactura.Next;
    end;
  finally
    QDetalleFacturaInsert.Free;
  end;
  ShowMessage('Registro modificado exitosamente.!');
  Button2.Enabled := false;
  end;
end;

procedure TFrmInvoices.Button5Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmInvoices.Button6Click(Sender: TObject);
begin
  DataModule2.CDSDetalleFactura.Append;
end;

procedure TFrmInvoices.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DataModule2.CDSCabezaFactura.Close;
  DataModule2.CDSDetalleFactura.Close;
end;

procedure TFrmInvoices.FormShow(Sender: TObject);
var
  QClientsList, QProductsList: TSQLQuery;
begin
  if (self.Caption = 'Nuevo') then
    begin
      DataModule2.QCabezaFactura.Close;
      DataModule2.QCabezaFactura.Open;

      DataModule2.CDSCabezaFactura.Close;
      DataModule2.CDSCabezaFactura.CreateDataSet;
      DataModule2.CDSCabezaFactura.Edit;
      DataModule2.CDSCabezaFactura.Open;

      DataModule2.QDetalleFactura.Close;
      DataModule2.QDetalleFactura.Open;

      DataModule2.CDSDetalleFactura.Close;
      DataModule2.CDSDetalleFactura.CreateDataSet;
      DataModule2.CDSDetalleFactura.Edit;
      DataModule2.CDSDetalleFactura.Open;

      DataModule2.CDSCabezaFactura.Append;
    end
    else if (self.Caption = 'Editar') then
    begin
      DataModule2.QCabezaFactura.Close;
      DataModule2.QCabezaFactura.Open;

      DataModule2.CDSCabezaFactura.Close;
      DataModule2.CDSCabezaFactura.CreateDataSet;
      DataModule2.CDSCabezaFactura.Edit;
      DataModule2.CDSCabezaFactura.Open;

      DataModule2.QDetalleFactura.Close;
      DataModule2.QDetalleFactura.Open;

      DataModule2.CDSDetalleFactura.Close;
      DataModule2.CDSDetalleFactura.CreateDataSet;
      DataModule2.CDSDetalleFactura.Edit;
      DataModule2.CDSDetalleFactura.Open;

      DataModule2.CDSCabezaFactura.Append;
      DataModule2.CDSCabezaFacturanumero.AsString := DataModule2.QCabezaFacturanumero.AsString;
      DataModule2.CDSCabezaFacturafecha.AsDateTime := DataModule2.QCabezaFacturafecha.AsDateTime;
      DataModule2.CDSCabezaFacturacliente.AsInteger := DataModule2.QCabezaFacturacliente.AsInteger;
      DataModule2.CDSCabezaFacturatotal.AsFloat := DataModule2.QCabezaFacturatotal.AsFloat;

      DataModule2.CDSDetalleFacturanumero.AsString := DataModule2.QDetalleFacturanumero.AsString;
      DataModule2.CDSDetalleFacturaproducto.AsInteger := DataModule2.QDetalleFacturaproducto.AsInteger;
      DataModule2.CDSDetalleFacturacantidad.AsString := DataModule2.QDetalleFacturacantidad.AsString;
      DataModule2.CDSDetalleFacturavalor.AsFloat := DataModule2.QDetalleFacturavalor.AsFloat;
    end;

  QClientsList := TSQLQuery.Create(nil);
  QClientsList.SQLConnection := DataModule2.SQLConnection1;
  QClientsList.Close;
  QClientsList.SQL.Clear;
  QClientsList.SQL.Add('SELECT cliente, nombre_cliente FROM clientes');
  QClientsList.Open;
  while not QClientsList.Eof do
  begin
    Combobox1.Items.Add(QClientsList.FieldByName('cliente').AsString);
    QClientsList.Next;
  end;

  with DBGrid1.Columns[0].PickList do
  begin
    QProductsList := TSQLQuery.Create(nil);
    QProductsList.SQLConnection := DataModule2.SQLConnection1;
    QProductsList.Close;
    QProductsList.SQL.Clear;
    QProductsList.SQL.Add('SELECT producto, valor FROM productos');
    QProductsList.Open;
    while not QProductsList.Eof do
    begin
    Add(QProductsList.FieldByName('producto').AsString);
    QProductsList.Next;
    end;
  end;
  Button2.Enabled := true;
end;

procedure TFrmInvoices.Validaciones;
begin
  if ComboBox1.Text = '' then
  begin
    raise Exception.Create('Debe seleccionar un cliente.');
  end;
end;

end.
