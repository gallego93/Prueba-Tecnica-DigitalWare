unit CalcularSalario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Samples.Spin,
  Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Edit1: TEdit;
    SpinEdit1: TSpinEdit;
    Button1: TButton;
    Panel2: TPanel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Validaciones;
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
var
horaExtra, horaOrdinaria, valorSalario, valorExtras: Integer;
begin
valorExtras := 19000;
horaOrdinaria := 15000;

if SpinEdit1.Value > 35 then
begin
horaExtra := SpinEdit1.Value - 35;
valorSalario := (35 * horaOrdinaria) + (valorExtras * horaExtra);
end
else
begin
valorSalario := (horaOrdinaria * SpinEdit1.Value);
end;

Validaciones;

showMessage('Al empleado '+Edit1.Text+' se le debe pagar la suma de '+IntToStr(valorSalario)+' pesos.');

end;

procedure TForm2.Validaciones;
begin
if Edit1.Text = '' then
  raise Exception.Create('Debe ingresar el nombre de un empleado.');

if (SpinEdit1.Value < 0) or (SpinEdit1.Value = 0) then
  raise Exception.Create('El numero de horas debe ser mayor a 0.');
end;

end.
