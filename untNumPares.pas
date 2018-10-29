unit untNumPares;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmNumPares = class(TForm)
    Label4: TLabel;
    Label2: TLabel;
    edtQtd: TEdit;
    btnVerificar: TBitBtn;
    btnLimpar: TBitBtn;
    Label3: TLabel;
    edtResultado: TEdit;
    procedure btnVerificarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure edtQtdKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  // Definindo as váriaveis
var
  frmNumPares: TfrmNumPares;
  Qtd: Integer;

implementation

{$R *.dfm}

procedure TfrmNumPares.btnLimparClick(Sender: TObject);
begin
  edtQtd.Text := '';
  // Ao clicar no botão LIMPAR será realizado limpeza dos campos, atribuindo o valor deste EDIT por NULL/Espaço em Branco
  edtResultado.Text := '';
end;

procedure TfrmNumPares.btnVerificarClick(Sender: TObject);

begin
  Qtd := StrToInt(edtQtd.Text);
  try
    if (Qtd mod 2) = 0 then
    // Irá validar se o núm digitado é um número par ou impar
    // Mod dá ao restante a divisão do Dividendo pelo Divisor. O resultado do número inteiro da divisão é ignorado.
    begin
      edtResultado.Text := 'Par';
      // Atribui ao EDIT o valor de Par
    end
    else
      edtResultado.Text := 'Impar';
    // Atribui ao EDIT o valor de Impar
  except
    // Caso ocorra algum problema, será realizado o que está abaixo
    if (edtQtd.Text = '') then
    // Verificação de campos vazios, caso tenha algum, será exibido a mensagem abaixo no EDIT Resultado
    begin
      edtResultado.Text := 'Favor iserir a quantidade!';
    end;
  end;
end;

// Bloaqueando teclas
procedure TfrmNumPares.edtQtdKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = false) and (word(Key) <> vk_back)) then
    // Será permitido somente as teclas númericas de 0 a 9 e a tecla virgula (",")
    Key := #0; // Caso seja uma telca invalida, será atribuido um valor nulo
end;

end.
