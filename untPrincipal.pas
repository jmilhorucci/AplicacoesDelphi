unit untPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmPrincipal = class(TForm)
    btnRetangulo: TBitBtn;
    btnQuadrado: TBitBtn;
    btnTriangulo: TBitBtn;
    btnCirculo: TBitBtn;
    Label1: TLabel;
    Label4: TLabel;
    btnDividendo: TBitBtn;
    btnNumMaiorMenor: TBitBtn;
    btnNumPares: TBitBtn;
    btnCalcIMC: TBitBtn;
    btnTorreHanoi: TBitBtn;
    procedure btnRetanguloClick(Sender: TObject);
    procedure btnQuadradoClick(Sender: TObject);
    procedure btnTrianguloClick(Sender: TObject);
    procedure btnCirculoClick(Sender: TObject);
    procedure btnDividendoClick(Sender: TObject);
    procedure btnNumParesClick(Sender: TObject);
    procedure btnCalcIMCClick(Sender: TObject);
    procedure btnNumMaiorMenorClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses untRetangulo, untQuadrado, untCirculo, untDividendo, untNumPares,
  untCalcIMC, untOpcoesTriangulo,
  untOpcoesMaiorMenor;

procedure TfrmPrincipal.btnDividendoClick(Sender: TObject);
begin
  frmDividendo := TfrmDividendo.Create(self); // Cria o formulário
  frmDividendo.ShowModal; // Exibe o formulário
end;

procedure TfrmPrincipal.btnQuadradoClick(Sender: TObject);
begin
  frmQuadrado := TfrmQuadrado.Create(self);
  frmQuadrado.ShowModal;
end;

procedure TfrmPrincipal.btnTrianguloClick(Sender: TObject);
begin
  frmOpcoesTriangulo := TfrmOpcoesTriangulo.Create(self);
  frmOpcoesTriangulo.ShowModal;
end;

procedure TfrmPrincipal.btnNumMaiorMenorClick(Sender: TObject);
begin
  frmOpcoesMaiorMenor := TfrmOpcoesMaiorMenor.Create(self);
  frmOpcoesMaiorMenor.ShowModal;
end;

procedure TfrmPrincipal.btnNumParesClick(Sender: TObject);
begin
  frmNumPares := TfrmNumPares.Create(self);
  frmNumPares.ShowModal;
end;

procedure TfrmPrincipal.btnCalcIMCClick(Sender: TObject);
begin
  frmCalcIMC := TfrmCalcIMC.Create(self);
  frmCalcIMC.ShowModal;
end;

procedure TfrmPrincipal.btnCirculoClick(Sender: TObject);
begin
  frmCirculo := TfrmCirculo.Create(self);
  frmCirculo.ShowModal;
end;

procedure TfrmPrincipal.btnRetanguloClick(Sender: TObject);
begin
  frmRetangulo := TfrmRetangulo.Create(self);
  frmRetangulo.ShowModal;
end;

end.
