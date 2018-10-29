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
// Ao clicar no botão Limpar, os campos abaixo passaram a receber o valor NULL/vazio
begin
  edtResultado.Text := '';
  edtBase.Text := '';
  edtAltura.Text := '';
end;

procedure TfrmRetangulo.btnVerificarClick(Sender: TObject);

var
  // Define as váriaveis do tipo Real
  Base, Altura, Resultado: Real;

begin
  try // Caso ocorra tudo bem, será realizado os procedimentos abaixo
    if edtBase.Text = '' then // Verifica de o EDIT Base está vazio
    begin
      // Caso o EDIT Base esteja vazio, fará com que este EDIT receba o valor 0
      Base := 0;
    end
    else if edtAltura.Text = '' then
    // Caso contrário, verifica de o EDIT Altura está vazio
    begin
      // Caso o EDIT Altura esteja vazio, fará com que este EDIT receba o valor 0
      Altura := 0;
    end
    else // Caso contrário, fará o procedimento abaixo:
      Base := StrToFloat(edtBase.Text);
    // Realiza a conversão de entrada de dados para o tipo Ponto Flutuante
    Altura := StrToFloat(edtAltura.Text);
    // Realiza a conversão de entrada de dados para o tipo Ponto Flutuante
    Resultado := Base * Altura;
    // A váriavel recebe o calculo da Base vezes Altura
    edtResultado.Text := FloatToStr(Resultado);
    // Realiza a conversão de saída de dados para o tipo Texto no EDIT Resultado
  except // Caso ocorra algum problema, será realizado o que está abaixo
    if (edtBase.Text = '') or (edtAltura.Text = '') then
      // Verifica se os campos estão vazios. Caso estejam, o EDIT Resultado exibirá uma mensagem
      edtResultado.Text := 'Preencha o(s) campo(s) faltante(s)!';
  end;
end;

// Bloaqueando teclas

procedure TfrmRetangulo.edtAlturaKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = false) and (word(Key) <> vk_back)) then
    // Será permitido somente as teclas númericas de 0 a 9 e a tecla virgula (",")
    Key := #0;
  // Caso seja uma telca invalida, será atribuido um valor nulo
end;

procedure TfrmRetangulo.edtBaseKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = false) and (word(Key) <> vk_back)) then
    Key := #0;
end;

end.
