unit FrmSerieFibonacci;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    Panel1: TPanel;
    SpeedButton1: TSpeedButton;
    ListBox1: TListBox;
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.SpeedButton1Click(Sender: TObject);
var
  n,a,b,c,I:integer;
begin
  ListBox1.Clear;
  n:=strToInt(Edit1.Text);
  a:=1;
  b:=1;
  c:=0;
  for I := 1 to n do
  begin
    a:=b;
    b:=c;
    c:=a+b;
    ListBox1.Items.Add(IntToStr(c));
  end;
end;

end.
