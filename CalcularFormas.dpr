program CalcularFormas;

uses
  Vcl.Forms,
  untPrincipal in 'untPrincipal.pas' {frmPrincipal} ,
  untRetangulo in 'untRetangulo.pas' {frmRetangulo} ,
  untCirculo in 'untCirculo.pas' {frmCirculo} ,
  untQuadrado in 'untQuadrado.pas' {frmQuadrado} ,
  untTriangulo in 'untTriangulo.pas' {frmTriangulo} ,
  untDividendo in 'untDividendo.pas' {frmDividendo} ,
  untMaxMin in 'untMaxMin.pas' {frmMaxMin} ,
  untNumMaior in 'untNumMaior.pas' {frmNumMaior} ,
  untNumPares in 'untNumPares.pas' {frmNumPares} ,
  untCalcIMC in 'untCalcIMC.pas' {frmCalcIMC} ,
  untOpcoesTriangulo in 'untOpcoesTriangulo.pas' {frmOpcoesTriangulo} ,
  untTipoTriangulo in 'untTipoTriangulo.pas' {FrmTipoTriangulo} ,
  untOpcoesMaiorMenor in 'untOpcoesMaiorMenor.pas' {frmOpcoesMaiorMenor};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmRetangulo, frmRetangulo);
  Application.CreateForm(TfrmCirculo, frmCirculo);
  Application.CreateForm(TfrmQuadrado, frmQuadrado);
  Application.CreateForm(TfrmTriangulo, frmTriangulo);
  Application.CreateForm(TfrmDividendo, frmDividendo);
  Application.CreateForm(TfrmMaxMin, frmMaxMin);
  Application.CreateForm(TfrmNumMaior, frmNumMaior);
  Application.CreateForm(TfrmNumPares, frmNumPares);
  Application.CreateForm(TfrmCalcIMC, frmCalcIMC);
  Application.CreateForm(TfrmOpcoesTriangulo, frmOpcoesTriangulo);
  Application.CreateForm(TFrmTipoTriangulo, FrmTipoTriangulo);
  Application.CreateForm(TfrmOpcoesMaiorMenor, frmOpcoesMaiorMenor);
  Application.Run;

end.
