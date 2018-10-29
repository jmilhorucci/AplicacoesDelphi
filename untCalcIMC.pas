unit untCalcIMC;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmCalcIMC = class(TForm)
    Label4: TLabel;
    Label2: TLabel;
    edtPeso: TEdit;
    btnLimpar: TBitBtn;
    Label3: TLabel;
    edtSituacao: TEdit;
    btnVerificar: TBitBtn;
    EdtAltura: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    edtIMC: TEdit;
    Label6: TLabel;
    procedure btnVerificarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure edtPesoKeyPress(Sender: TObject; var Key: Char);
    procedure EdtAlturaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalcIMC: TfrmCalcIMC;

implementation

{$R *.dfm}

procedure TfrmCalcIMC.btnLimparClick(Sender: TObject);
// Ao clicar no bot�o Limpar, os campos abaixo passaram a receber o valor NULL/vazio
begin
  edtPeso.Text := '';
  edtSituacao.Text := '';
  EdtAltura.Text := '';
  edtIMC.Text := '';
end;

procedure TfrmCalcIMC.btnVerificarClick(Sender: TObject);

var
  peso, altura, imc: real; // Atribuindo v�riaveis do tipo REAL
begin
  try // Caso ocorra tudo bem, ser� realizado os procedimentos abaixo
    altura := StrToFloat(EdtAltura.Text);
    // Realiza convers�o de entrada de dados
    peso := StrToFloat(edtPeso.Text);
    // Realiza convers�o de entrada de dados

    imc := peso / (altura * altura);
    // O resultado � a altura vezes a altura divido pelo peso
    if (imc < 17) then
    // Se o resultado do IMC for MENOR que 17, ele far�:
    begin
      edtSituacao.Text := ('Muito Abaixo do Peso');
      // Exibir� o texto no EDIT Situacao
      edtIMC.Text := FloatToStrf(imc, ffNumber, 4, 2);
      // Exibir� o o valor convertido no EDIT IMC
    end
    // A fun��o floattostrf converte um valor num�rico de ponto flutuante em uma string exib�vel
    // com grande controle sobre a formata��o por meio dos valores Format, Precision e Digits
    else if (imc >= 17) and (imc <= 18.49) then
    // Se o resultado do IMC for MAIOR IGUAL a 17 E MENOR igual a 18.49, ele far�:
    begin
      edtSituacao.Text := ('Abaixo do Peso');
      edtIMC.Text := FloatToStrf(imc, ffNumber, 4, 2);
    end
    else if (imc >= 18.5) and (imc <= 24.99) then
    begin
      edtSituacao.Text := ('Peso Normal');
      edtIMC.Text := FloatToStrf(imc, ffNumber, 4, 2);
    end
    else if (imc >= 25) and (imc <= 29.99) then
    begin
      edtSituacao.Text := ('Acima do Peso');
      edtIMC.Text := FloatToStrf(imc, ffNumber, 4, 2);
    end
    else if (imc >= 30) and (imc <= 34.99) then
    begin
      edtSituacao.Text := ('Obesidade Grau I');
      edtIMC.Text := FloatToStrf(imc, ffNumber, 4, 2);
    end
    else if (imc >= 35) and (imc <= 39.99) then
    begin
      edtSituacao.Text := ('Obesidade Grau II');
      edtIMC.Text := FloatToStrf(imc, ffNumber, 4, 2);
    end
    else if (imc >= 40) then
    begin
      edtSituacao.Text := ('Obesidade Grau III');
      edtIMC.Text := FloatToStrf(imc, ffNumber, 4, 2);
    end;

  except
    // Caso ocorra algum problema, ser� realizado o que est� abaixo
    if (edtPeso.Text = null) or (EdtAltura.Text = '') then
    // Verifica��o de campos vazios, caso tenha algum, ser� exibido a mensagem abaixo
    begin
      ShowMessage('Por favor, digite as informa��es solicitadas!');
    end
    else
    // Caso contr�rio, ser� realizado a interpreta��o do erro do Delphi pela mensagem abaixo
    begin
      ShowMessage
        ('Por favor, digite os valor corretamente, se necess�rio, usar virgula (",") ao inv�s de ponto (".").');
    end;
  end;
end;

// Bloaqueando teclas

procedure TfrmCalcIMC.EdtAlturaKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9', ','] = false) and (word(Key) <> vk_back)) then
    // Ser� permitido somente as teclas n�mericas de 0 a 9 e a tecla virgula (",")
    Key := #0;
  // Caso seja uma telca invalida, ser� atribuido um valor nulo
end;

procedure TfrmCalcIMC.edtPesoKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9', ','] = false) and (word(Key) <> vk_back)) then
    Key := #0;
end;

end.
