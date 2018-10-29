unit untNumMaior;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmNumMaior = class(TForm)
    Label2: TLabel;
    edtNum1: TEdit;
    Label4: TLabel;
    edtNum2: TEdit;
    Label1: TLabel;
    btnLimpar: TBitBtn;
    btnVerificar: TBitBtn;
    Label3: TLabel;
    lblResultado: TLabel;
    procedure btnVerificarClick(Sender: TObject);
    procedure edtNum1KeyPress(Sender: TObject; var Key: Char);
    procedure edtNum2KeyPress(Sender: TObject; var Key: Char);
    procedure btnLimparClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNumMaior: TfrmNumMaior;

  // Define as v�riveis do tipo Inteiro
  Num1, Num2, Resultado: Integer;

implementation

{$R *.dfm}

procedure TfrmNumMaior.btnLimparClick(Sender: TObject);
begin
  // Ao clicar no bot�o Limpar, os campos abaixo passaram a receber o valor NULL/vazio
  edtNum1.Text := '';
  edtNum2.Text := '';
  lblResultado.Caption := '...';
end;

procedure TfrmNumMaior.btnVerificarClick(Sender: TObject);
begin
  try
    // Realiza convers�o de entrada de dados para o tipo Inteiro
    Num1 := StrToInt(edtNum1.Text);
    Num2 := StrToInt(edtNum2.Text);

    if (Num1 >= Num2) then
      // Verifica se o Num1 � maior igual que o Num2, se sim, far�:
      Resultado := Num1 // Resultado recebe o valor da v�riavel Num1
    else // Caso contr�rio, far�:
      Resultado := Num2; // Resultado recebe o valor da v�riavel Num2
    lblResultado.Caption := 'Maior n�mero �: ' + IntToStr(Resultado);
    // Realiza convers�o de sa�da de dados para o tipo Texto
  except
    if (edtNum1.Text = '') or (edtNum2.Text = '') then
    begin
      lblResultado.Caption := 'Preencha o(s) campo(s) faltante(s)!';
    end;

  end;
end;

// Bloaqueando teclas

procedure TfrmNumMaior.edtNum1KeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = false) and (word(Key) <> vk_back)) then
    // Ser� permitido somente as teclas n�mericas de 0 a 9 e a tecla virgula (",")
    Key := #0;
  // Caso seja uma telca invalida, ser� atribuido um valor nulo
end;

procedure TfrmNumMaior.edtNum2KeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = false) and (word(Key) <> vk_back)) then
    Key := #0;
end;

end.
