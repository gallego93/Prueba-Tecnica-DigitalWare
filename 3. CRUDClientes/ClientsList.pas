unit ClientsList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids, Data.DBXMySQL, Data.FMTBcd,
  Datasnap.DBClient, Data.SqlExpr, Datasnap.Provider, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFrmClientList = class(TForm)
    DBGrid1: TDBGrid;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Panel1: TPanel;
    Button5: TButton;
    Button6: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmClientList: TFrmClientList;

implementation

{$R *.dfm}

uses DMPrincipal;

procedure TFrmClientList.Button1Click(Sender: TObject);
begin
  DataModule2.DSClients.DataSet.Refresh;
  Button2.Enabled := true;
  Button3.Enabled := true;
  Button4.Enabled := true;
end;

procedure TFrmClientList.Button2Click(Sender: TObject);
var
  QClientInsert: TSQLQuery;
begin
  QClientInsert := TSQLQuery.Create(nil);
  QClientInsert.SQLConnection := DataModule2.SQLConnection1;
  QClientInsert.Close;
  QClientInsert.SQL.Clear;
  QClientInsert.SQL.Add('INSERT INTO clientes(nombre_cliente, direccion)');
  QClientInsert.SQL.Add('VALUES(:nombre_cliente, :direccion)');
  QClientInsert.ParamByName('nombre_cliente').AsString := DataModule2.CDSClientsnombre_cliente.AsString;
  QClientInsert.ParamByName('direccion').AsString := DataModule2.CDSClientsdireccion.AsString;
  QClientInsert.ExecSQL;
  ShowMessage('Registro creado exitosamente.!');
  Button2.Enabled := false;
end;

procedure TFrmClientList.Button3Click(Sender: TObject);
var
  QClientUpdate : TSQLQuery;
begin
  QClientUpdate := TSQLQuery.Create(nil);
  QClientUpdate.SQLConnection := DataModule2.SQLConnection1;
  QClientUpdate.Close;
  QClientUpdate.SQL.Clear;
  QClientUpdate.SQL.Add('UPDATE clientes SET nombre_cliente = :nombre_cliente, direccion = :direccion');
  QClientUpdate.SQL.Add('WHERE cliente = :cliente');
  QClientUpdate.ParamByName('nombre_cliente').AsString := DataModule2.CDSClientsnombre_cliente.AsString;
  QClientUpdate.ParamByName('direccion').AsString := DataModule2.CDSClientsdireccion.AsString;
  QClientUpdate.ParamByName('cliente').AsInteger := DataModule2.CDSClientscliente.AsInteger;
  QClientUpdate.ExecSQL;
  ShowMessage('Registro modificado exitosamente.!');
  Button3.Enabled := false;
end;

procedure TFrmClientList.Button4Click(Sender: TObject);
var
  QClientDelete: TSQLQuery;
begin
  QClientDelete := TSQLQuery.Create(nil);
  QClientDelete.SQLConnection := DataModule2.SQLConnection1;
  QClientDelete.Close;
  QClientDelete.SQL.Clear;
  QClientDelete.SQL.Add('DELETE FROM clientes');
  QClientDelete.SQL.Add('WHERE cliente = :cliente');
  QClientDelete.ParamByName('cliente').AsInteger := DataModule2.CDSClientscliente.AsInteger;
  QClientDelete.ExecSQL;
  ShowMessage('Registr eliminado exitosamente!');
  Button4.Enabled := false;
end;

procedure TFrmClientList.Button5Click(Sender: TObject);
begin
  Close;
end;

procedure TFrmClientList.Button6Click(Sender: TObject);
begin
  DataModule2.CDSClients.Append;
  Button2.Enabled := true;
end;

procedure TFrmClientList.FormCreate(Sender: TObject);
begin
  //DataModule2.CDSClients.Close;
  //DataModule2.CDSClients.Open;
end;

procedure TFrmClientList.FormShow(Sender: TObject);
begin
  DataModule2.CDSClients.Close;
  DataModule2.CDSClients.Open;
  Button2.Enabled := true;
  Button3.Enabled := true;
  Button4.Enabled := true;
end;

end.
