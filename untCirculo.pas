unit untCirculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmCirculo = class(TForm)
    Label2: TLabel;
    edtRaio: TEdit;
    Label3: TLabel;
    edtResultado: TEdit;
    Label4: TLabel;
    btnLimpar: TBitBtn;
    procedure edtRaioChange(Sender: TObject);
    procedure edtRaioKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCirculo: TfrmCirculo;

implementation

{$R *.dfm}

procedure TfrmCirculo.btnLimparClick(Sender: TObject);
// Ao clicar no bot�o Limpar, os campos abaixo passaram a receber o valor NULL/vazio
begin
  edtResultado.Text := '';
  edtRaio.Text := '';
end;

procedure TfrmCirculo.edtRaioChange(Sender: TObject);
// Definindo as v�riareis do tipo REAL
var
  Pi: Real;
  Raio: Real;
  Resultado: Real;
begin
  Pi := 3.14; // Pi recebe 3.14 como valor fixo
  try // Caso ocorra tudo bem, ser� realizado os procedimentos abaixo
    if edtRaio.Text = '' then
    // Caso o EDIT Raio esteja vazio, far� com que este EDIT receba o valor 0
    begin
      Raio := 0;
    end
    else
      // A v�riavel recebe a convers�o do que est� vindo do EDIT Raio
      Raio := StrToFloat(edtRaio.Text);
    // O resultado � raio vezes o raio, logo vezes 3.14 (pi)
    Resultado := Pi * (Raio * Raio);
    edtResultado.Text := FloatToStr(Resultado);
    // O EDIT Resultado recebe a convers�o da v�riavel Resultado
  except // Caso ocorra algum problema, ser� realizado o que est� abaixo
    if (edtRaio.Text = '') then
      // Verifica se o campo est� vazio. Caso esteja, o EDIT Resultado exibir� uma mensagem
      edtResultado.Text := 'Preencha o valor no campo Raio!';
  end;
end;

// Bloaqueando teclas

procedure TfrmCirculo.edtRaioKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = false) and (word(Key) <> vk_back)) then
    // Ser� permitido somente as teclas n�mericas de 0 a 9 e a tecla virgula (",")
    Key := #0;
  // Caso seja uma telca invalida, ser� atribuido um valor nulo
end;

end.
