unit untDividendo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmDividendo = class(TForm)
    Label2: TLabel;
    Label4: TLabel;
    Label3: TLabel;
    edtResultado: TEdit;
    btnLimpar: TBitBtn;
    edtNum1: TEdit;
    edtNum2: TEdit;
    Label1: TLabel;
    procedure VerificaNumeros;
    procedure edtNum1Change(Sender: TObject);
    procedure edtNum1KeyPress(Sender: TObject; var Key: Char);
    procedure edtNum2KeyPress(Sender: TObject; var Key: Char);
    procedure edtNum2Change(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDividendo: TfrmDividendo;

implementation

{$R *.dfm}

procedure TfrmDividendo.btnLimparClick(Sender: TObject);
// Ao clicar no bot�o Limpar, os campos abaixo passaram a receber o valor NULL/vazio
begin
  edtNum1.Text := '';
  edtNum2.Text := '';
  edtResultado.Text := '';
end;

procedure TfrmDividendo.edtNum1Change(Sender: TObject);
// Procedure no EDIT Num1 com evento OnChange.
begin
  VerificaNumeros();
end;

procedure TfrmDividendo.edtNum1KeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = false) and (word(Key) <> vk_back)) then
    // Ser� permitido somente as teclas n�mericas de 0 a 9 e a tecla virgula (",")
    Key := #0;
  // Caso seja uma telca invalida, ser� atribuido um valor nulo
end;

procedure TfrmDividendo.edtNum2Change(Sender: TObject);
// Procedure no EDIT Num1 com evento OnChange.
begin
  VerificaNumeros();
end;

procedure TfrmDividendo.edtNum2KeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = false) and (word(Key) <> vk_back)) then
    // Ser� permitido somente as teclas n�mericas de 0 a 9 e a tecla virgula (",")
    Key := #0;
  // Caso seja uma telca invalida, ser� atribuido um valor nulo
end;

procedure TfrmDividendo.VerificaNumeros;
// Definindo v�riaveis do tipo Inteiro
var
  Num1, Num2: Integer;
begin
  try
    // O programa ir� tentar executar o codigo abaixo
    Num1 := StrToInt(edtNum1.Text);
    Num2 := StrToInt(edtNum2.Text);
    // Se a divis�o do Numero 2 pelo Numero 1 for igual a 0
    if (Num2 mod Num1 = 0) then
      // Ser� exibida menssagem "O n�mero: Numero 2(convertido) � divisivel por Numero 1 (convertido)" no campo Resultado
      edtResultado.Text := 'O n�mero ' + IntToStr(Num2) + ' � divis�vel por ' +
        IntToStr(Num1)
    else
      // Caso contr�rio ser� exibida menssagem "O n�mero: Numero 2(convertido) n�o � divisivel por Numero 1 (convertido)" no campo Resultado
      edtResultado.Text := 'O n�mero ' + IntToStr(Num2) +
        ' N�O � divis�vel por ' + IntToStr(Num1);
    // Caso o programa acuse algum erro durante a execu��o, ele exibir� um erro tratado
  except
    // Se o campo Numero 1 for vazio ou o campo Numero 2 for vazio
    if (edtNum1.Text = '') or (edtNum2.Text = '') then
    begin
      // Ser� exibido a menssagem "Este campo n�o pode vazio" no campo Resultado
      edtResultado.Text := 'Este campo n�o pode vazio';
    end;
  end;
end;

end.
