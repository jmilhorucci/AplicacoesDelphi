unit untTipoTriangulo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons;

type
  TFrmTipoTriangulo = class(TForm)
    Label2: TLabel;
    edtNum1: TEdit;
    Label3: TLabel;
    edtNum2: TEdit;
    Label5: TLabel;
    edtNum3: TEdit;
    btnLimpar: TBitBtn;
    btnVerificar: TBitBtn;
    Label4: TLabel;
    Label6: TLabel;
    imgEscaleno: TImage;
    imgEquilatero: TImage;
    imgIsosceles: TImage;
    mmResultado: TMemo;
    imgTrianguloNone: TImage;
    procedure edtNum1KeyPress(Sender: TObject; var Key: Char);
    procedure edtNum2KeyPress(Sender: TObject; var Key: Char);
    procedure edtNum3KeyPress(Sender: TObject; var Key: Char);
    procedure btnLimparClick(Sender: TObject);
    procedure btnVerificarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmTipoTriangulo: TFrmTipoTriangulo;

implementation

{$R *.dfm}

procedure TFrmTipoTriangulo.btnLimparClick(Sender: TObject);
begin
  // Ao clicar no bot�o Limpar, os EDITs Num1, Num2, Num3 e TMEMO Resultado Ir�o receber o valor NULL/vazio
  edtNum1.Text := '';
  edtNum2.Text := '';
  edtNum3.Text := '';
  mmResultado.Text := '';
  // Junto ao TIMAGEs abaixo que ser�o destruidos, limpados da mem�ria atrv�s do .Hide
  imgEscaleno.Hide;
  imgEquilatero.Hide;
  imgIsosceles.Hide;

end;

procedure TFrmTipoTriangulo.btnVerificarClick(Sender: TObject);
var // Definindo v�riaveis do tipo Inteiro
  lado1, lado2, lado3: Integer;
begin
  try // Caso ocorra tudo bem, ser� realizado os procedimentos abaixo
    mmResultado.Enabled := Enabled; // Define o TMEMO Resultado ativado
    // Converte uma string ou seja texto para um n�mero inteiro
    lado1 := StrToInt(edtNum1.Text);
    lado2 := StrToInt(edtNum2.Text);
    lado3 := StrToInt(edtNum3.Text);

    if (lado1 <= lado2 + lado3) and (lado2 <= lado1 + lado3) and
      (lado3 <= lado1 + lado2) then
    // Se um lado � menor do que a soma de outros dois lados, Come�a:

    begin
      if (lado1 = lado2) and (lado2 = lado3) then
      // Se os tr�s lados forem iguais � um equil�tero
      begin
        mmResultado.Text := 'Tri�ngulo Equil�tero';
        imgEquilatero.BringToFront;
        // Traz o item para frente, deixando as demais imagens para tr�s
        imgEquilatero.Show;
        // Como este item foi destruido pelo .Hide, � necess�rio usar o .Show para apresenta-lo novamente
      end
      else if (lado1 = lado2) or (lado2 = lado3) then
      // Se dois lados forem iguais e um unico diferente � is�sceles
      begin
        mmResultado.Text := 'Tri�ngulo Is�sceles';
        imgIsosceles.BringToFront;
        imgIsosceles.Show;
      end
      else
      // Se os tr�s lados forem diferentes ent�o o tri�ngulo � escaleno
      begin
        mmResultado.Text := 'Tri�ngulo Escaleno';
        imgEscaleno.BringToFront;
        imgEscaleno.Show;
      end

    end
    else
    begin
      // Se um lado n�o for menor do que a soma dos outros dois lados n�o � tri�ngulo
      mmResultado.Text := 'N�o � tri�ngulo!';
      imgTrianguloNone.BringToFront;
    end;

  except
    // Caso ocorra algum problema, ser� realizado o que est� abaixo
    if (edtNum1.Text = '') or (edtNum2.Text = '') or (edtNum3.Text = '') then
    // Verifica��o de campos vazios, caso tenha algum, ser� exibido a mensagem abaixo
    begin
      mmResultado.Text := 'Por favor, preencha os campos acima!';
      imgTrianguloNone.BringToFront;
      imgTrianguloNone.Show;
    end;
  end;

end;

// Bloaqueando teclas
procedure TFrmTipoTriangulo.edtNum1KeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = False) and (word(Key) <> vk_back)) then
    // Ser� permitido somente as teclas n�mericas de 0 a 9 e a tecla virgula (",")
    Key := #0;
  // Caso seja uma telca invalida, ser� atribuido um valor nulo
end;

procedure TFrmTipoTriangulo.edtNum2KeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = False) and (word(Key) <> vk_back)) then
    Key := #0;
end;

procedure TFrmTipoTriangulo.edtNum3KeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = False) and (word(Key) <> vk_back)) then
    Key := #0;
end;

end.
