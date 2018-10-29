unit untRetangulo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmRetangulo = class(TForm)
    Label4: TLabel;
    Label2: TLabel;
    Label1: TLabel;
    edtAltura: TEdit;
    edtBase: TEdit;
    btnVerificar: TBitBtn;
    Label3: TLabel;
    edtResultado: TEdit;
    btnLimpar: TBitBtn;
    procedure btnVerificarClick(Sender: TObject);
    procedure edtBaseKeyPress(Sender: TObject; var Key: Char);
    procedure edtAlturaKeyPress(Sender: TObject; var Key: Char);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRetangulo: TfrmRetangulo;

implementation

{$R *.dfm}

procedure TfrmRetangulo.btnLimparClick(Sender: TObject);
// Ao clicar no bot�o Limpar, os campos abaixo passaram a receber o valor NULL/vazio
begin
  edtResultado.Text := '';
  edtBase.Text := '';
  edtAltura.Text := '';
end;

procedure TfrmRetangulo.btnVerificarClick(Sender: TObject);

var
  // Define as v�riaveis do tipo Real
  Base, Altura, Resultado: Real;

begin
  try // Caso ocorra tudo bem, ser� realizado os procedimentos abaixo
    if edtBase.Text = '' then // Verifica de o EDIT Base est� vazio
    begin
      // Caso o EDIT Base esteja vazio, far� com que este EDIT receba o valor 0
      Base := 0;
    end
    else if edtAltura.Text = '' then
    // Caso contr�rio, verifica de o EDIT Altura est� vazio
    begin
      // Caso o EDIT Altura esteja vazio, far� com que este EDIT receba o valor 0
      Altura := 0;
    end
    else // Caso contr�rio, far� o procedimento abaixo:
      Base := StrToFloat(edtBase.Text);
    // Realiza a convers�o de entrada de dados para o tipo Ponto Flutuante
    Altura := StrToFloat(edtAltura.Text);
    // Realiza a convers�o de entrada de dados para o tipo Ponto Flutuante
    Resultado := Base * Altura;
    // A v�riavel recebe o calculo da Base vezes Altura
    edtResultado.Text := FloatToStr(Resultado);
    // Realiza a convers�o de sa�da de dados para o tipo Texto no EDIT Resultado
  except // Caso ocorra algum problema, ser� realizado o que est� abaixo
    if (edtBase.Text = '') or (edtAltura.Text = '') then
      // Verifica se os campos est�o vazios. Caso estejam, o EDIT Resultado exibir� uma mensagem
      edtResultado.Text := 'Preencha o(s) campo(s) faltante(s)!';
  end;
end;

// Bloaqueando teclas

procedure TfrmRetangulo.edtAlturaKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = false) and (word(Key) <> vk_back)) then
    // Ser� permitido somente as teclas n�mericas de 0 a 9 e a tecla virgula (",")
    Key := #0;
  // Caso seja uma telca invalida, ser� atribuido um valor nulo
end;

procedure TfrmRetangulo.edtBaseKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = false) and (word(Key) <> vk_back)) then
    Key := #0;
end;

end.
