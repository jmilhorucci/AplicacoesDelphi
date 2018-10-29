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

  // Define as váriveis do tipo Inteiro
  Num1, Num2, Resultado: Integer;

implementation

{$R *.dfm}

procedure TfrmNumMaior.btnLimparClick(Sender: TObject);
begin
  // Ao clicar no botão Limpar, os campos abaixo passaram a receber o valor NULL/vazio
  edtNum1.Text := '';
  edtNum2.Text := '';
  lblResultado.Caption := '...';
end;

procedure TfrmNumMaior.btnVerificarClick(Sender: TObject);
begin
  try
    // Realiza conversão de entrada de dados para o tipo Inteiro
    Num1 := StrToInt(edtNum1.Text);
    Num2 := StrToInt(edtNum2.Text);

    if (Num1 >= Num2) then
      // Verifica se o Num1 é maior igual que o Num2, se sim, fará:
      Resultado := Num1 // Resultado recebe o valor da váriavel Num1
    else // Caso contrário, fará:
      Resultado := Num2; // Resultado recebe o valor da váriavel Num2
    lblResultado.Caption := 'Maior número é: ' + IntToStr(Resultado);
    // Realiza conversão de saída de dados para o tipo Texto
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
    // Será permitido somente as teclas númericas de 0 a 9 e a tecla virgula (",")
    Key := #0;
  // Caso seja uma telca invalida, será atribuido um valor nulo
end;

procedure TfrmNumMaior.edtNum2KeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = false) and (word(Key) <> vk_back)) then
    Key := #0;
end;

end.
