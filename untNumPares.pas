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

  // Definindo as v�riaveis
var
  frmNumPares: TfrmNumPares;
  Qtd: Integer;

implementation

{$R *.dfm}

procedure TfrmNumPares.btnLimparClick(Sender: TObject);
begin
  edtQtd.Text := '';
  // Ao clicar no bot�o LIMPAR ser� realizado limpeza dos campos, atribuindo o valor deste EDIT por NULL/Espa�o em Branco
  edtResultado.Text := '';
end;

procedure TfrmNumPares.btnVerificarClick(Sender: TObject);

begin
  Qtd := StrToInt(edtQtd.Text);
  try
    if (Qtd mod 2) = 0 then
    // Ir� validar se o n�m digitado � um n�mero par ou impar
    // Mod d� ao restante a divis�o do Dividendo pelo Divisor. O resultado do n�mero inteiro da divis�o � ignorado.
    begin
      edtResultado.Text := 'Par';
      // Atribui ao EDIT o valor de Par
    end
    else
      edtResultado.Text := 'Impar';
    // Atribui ao EDIT o valor de Impar
  except
    // Caso ocorra algum problema, ser� realizado o que est� abaixo
    if (edtQtd.Text = '') then
    // Verifica��o de campos vazios, caso tenha algum, ser� exibido a mensagem abaixo no EDIT Resultado
    begin
      edtResultado.Text := 'Favor iserir a quantidade!';
    end;
  end;
end;

// Bloaqueando teclas
procedure TfrmNumPares.edtQtdKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = false) and (word(Key) <> vk_back)) then
    // Ser� permitido somente as teclas n�mericas de 0 a 9 e a tecla virgula (",")
    Key := #0; // Caso seja uma telca invalida, ser� atribuido um valor nulo
end;

end.
