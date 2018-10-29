unit untQuadrado;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmQuadrado = class(TForm)
    Label1: TLabel;
    edtLado: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtResultado: TEdit;
    btnLimpar: TBitBtn;
    procedure edtLadoChange(Sender: TObject);
    procedure edtLadoKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmQuadrado: TfrmQuadrado;

implementation

{$R *.dfm}

procedure TfrmQuadrado.btnLimparClick(Sender: TObject);
begin
  // Ao clicar no bot�o Limpar, os campos abaixo passaram a receber o valor NULL/vazio
  edtLado.Text := '';
  edtResultado.Text := '';
end;

procedure TfrmQuadrado.edtLadoChange(Sender: TObject);
var
  // Define as v�riaveis do tipo Real
  Lado: Real;
  Resultado: Real;
begin
  try // Caso ocorra tudo bem, ser� realizado os procedimentos abaixo
    if edtLado.Text = '' then // Verifica se o EDIT est� vazio
    begin
      // Caso o EDIT Lado esteja vazio, far� com que este EDIT receba o valor 0
      Lado := 0;
    end
    else // Caso contr�rio, far�:
      Lado := StrToFloat(edtLado.Text);
    // Realiza a convers�o de entrada de dados para Ponto Flutuante
    Resultado := Lado * Lado;
    // Atribui ao Resultado o calculo do Lado vezes o Lado
    edtResultado.Text := FloatToStr(Resultado);
    // Realiza a convers�o de sa�da de dados para Texto
  except // Caso ocorra algum problema, ser� realizado o que est� abaixo
    if (edtLado.Text = '') then // Verifica se o EDIT est� vazio
      edtResultado.Text := 'Insira o lado do Quadrado!';
    // Caso o EDIT Lado esteja vazio, exibir� uma mensagem no EDIT
  end;
end;

// Bloaqueando teclas

procedure TfrmQuadrado.edtLadoKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = false) and (word(Key) <> vk_back)) then
    // Ser� permitido somente as teclas n�mericas de 0 a 9 e a tecla virgula (",")
    Key := #0;
  // Caso seja uma telca invalida, ser� atribuido um valor nulo

end;

end.
