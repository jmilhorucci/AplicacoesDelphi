unit untOpcoesTriangulo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmOpcoesTriangulo = class(TForm)
    btnTipoTriangulo: TBitBtn;
    btnCalcArea: TBitBtn;
    Label1: TLabel;
    procedure btnCalcAreaClick(Sender: TObject);
    procedure btnTipoTrianguloClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOpcoesTriangulo: TfrmOpcoesTriangulo;

implementation

{$R *.dfm}

uses untTriangulo, untTipoTriangulo;

procedure TfrmOpcoesTriangulo.btnCalcAreaClick(Sender: TObject);
begin
  frmTriangulo := TfrmTriangulo.Create(self); // Cria o formulário
  frmTriangulo.ShowModal; // Exibe o formulário
end;

procedure TfrmOpcoesTriangulo.btnTipoTrianguloClick(Sender: TObject);
begin
  frmTipoTriangulo := TfrmTipoTriangulo.Create(self);
  frmTipoTriangulo.ShowModal;
end;

end.
