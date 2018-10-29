unit untTriangulo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmTriangulo = class(TForm)
    Label4: TLabel;
    Label2: TLabel;
    edtBase: TEdit;
    Label3: TLabel;
    edtResultado: TEdit;
    Label1: TLabel;
    edtAltura: TEdit;
    btnLimpar: TBitBtn;
    procedure VerificaNumeros();
    procedure edtBaseKeyPress(Sender: TObject; var Key: Char);
    procedure edtAlturaKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimparClick(Sender: TObject);
    procedure edtBaseChange(Sender: TObject);
    procedure edtAlturaChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTriangulo: TfrmTriangulo;

implementation

{$R *.dfm}

procedure TfrmTriangulo.btnLimparClick(Sender: TObject);
// Ao clicar no botão Limpar, os campos abaixo passaram a receber o valor NULL/vazio
begin
  edtResultado.Text := '';
  edtBase.Text := '';
  edtAltura.Text := '';
end;

procedure TfrmTriangulo.VerificaNumeros;
var
  Base, Altura, Resultado: Real; // Atribuindo váriaveis do tipo REAL
begin
  try // Caso ocorra tudo bem, será realizado os procedimentos abaixo
    if edtBase.Text = '' then
    // Caso o EDIT Base esteja vazio, fará com que este EDIT receba o valor 0
    begin
      Base := 0;
    end
    else if edtAltura.Text = '' then
    // Caso contrário, irá verificar se o EDIT Altura estará vazio, se sim, fará com que este EDIT receba o valor 0
    begin
      Altura := 0;
    end
    else
      // Caso contrário, as váriaveis recebem a conversão do que está vindo dos EDITs Base e Altura
      Base := StrToFloat(edtBase.Text);
    Altura := StrToFloat(edtAltura.Text);
    // Será exibido no resultado o calculo da área que é:
    // Base vezes a Altura divido por 2
    Resultado := (Base * Altura) / 2;
    // O EDIT Resultado recebe a conversão da váriavel Resultado
    edtResultado.Text := FloatToStr(Resultado);
  except // Caso ocorra algum problema, será realizado o que está abaixo
    if (edtBase.Text = '') or (edtAltura.Text = '') then
    begin
      edtResultado.Text := 'Por favor, preencha os campos acima!';
    end;
  end;
end;

procedure TfrmTriangulo.edtAlturaChange(Sender: TObject);
// O EDIT Altura recebe o evento OnChange com a procedure VerificaNumeros para exibir o resultado;
begin
  VerificaNumeros();
end;

procedure TfrmTriangulo.edtAlturaKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = false) and (word(Key) <> vk_back)) then
    // Será permitido somente as teclas númericas de 0 a 9 e a tecla virgula (",")
    // Caso seja uma telca invalida, será atribuido um valor nulo
    Key := #0;
end;

procedure TfrmTriangulo.edtBaseChange(Sender: TObject);
// O EDIT Base recebe o evento OnChange com a procedure VerificaNumeros para exibir o resultado;
begin
  VerificaNumeros();
end;

procedure TfrmTriangulo.edtBaseKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = false) and (word(Key) <> vk_back)) then
    // Será permitido somente as teclas númericas de 0 a 9 e a tecla virgula (",")
    // Caso seja uma telca invalida, será atribuido um valor nulo
    Key := #0;
end;

end.
