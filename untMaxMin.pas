unit untMaxMin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmMaxMin = class(TForm)
    Label4: TLabel;
    Label2: TLabel;
    edtNum1: TEdit;
    Label3: TLabel;
    edtNum2: TEdit;
    edtNum3: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    btnVerificar: TBitBtn;
    btnLimpar: TBitBtn;
    mmResultado: TMemo;
    procedure ValidaCampos;
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
  frmMaxMin: TfrmMaxMin;

implementation

{$R *.dfm}

procedure TfrmMaxMin.btnLimparClick(Sender: TObject);
var
  i: Integer; // Define a v�riavel contadora do tipo inteiro
begin
  for i := 0 to frmMaxMin.ComponentCount - 1 do
    // La�o de repeti��o contanto todos os itens do formul�rio
    if frmMaxMin.Components[i] is TCustomEdit then
      // Aqui verifica todos os componentes do formul�rio. Caso sej� um EDIT
      (frmMaxMin.Components[i] as TCustomEdit).Clear;
  // Ser� armazenado em um arrey para ser realizado a limpeza, caso contr�rio,
  // ele pular� o item
end;

procedure TfrmMaxMin.btnVerificarClick(Sender: TObject);
var // Definindo v�riaveis do tipo Real
  Num1, Num2, Num3, Maior, Menor: Real;
begin
  try
    // Caso ocorra tudo bem, ser� realizado os procedimentos abaixo
    Num1 := StrToFloat(edtNum1.Text);
    Num2 := StrToFloat(edtNum2.Text);
    Num3 := StrToFloat(edtNum3.Text);
    // Realiza convers�o do tipo de dado (texto) de entrada para um tipo de dado de ponto flutuante

    if (Num1 >= Num2) and (Num2 >= Num3) then
    // Verifica se a v�riavel Num1 � maior igual a Num2 E Num2 � maior igual a Num3, caso seja, far�:
    begin
      Maior := Num1; // Atribui a v�riavel Maior o valor da v�rivel Num1
      Menor := Num3; // Atribui a v�riavel Menor o valor da v�rivel Num3
    end
    else if (Num2 >= Num1) and (Num3 >= Num2) then
    // Verifica se a v�riavel Num2 � maior igual a Num1 E Num3 � maior igual a Num2, caso seja, far�:
    begin
      Maior := Num3; // Atribui a v�riavel Maior o valor da v�rivel Num3
      Menor := Num1; // Atribui a v�riavel Menor o valor da v�rivel Num1
    end
    else if (Num3 >= Num1) and (Num1 >= Num2) then
    // Verifica se a v�riavel Num3 � maior igual a Num1 E Num1 � maior igual a Num2, caso seja, far�:
    begin
      Maior := Num3; // Atribui a v�riavel Maior o valor da v�rivel Num3
      Menor := Num2; // Atribui a v�riavel Menor o valor da v�rivel Num2
    end
    else // Caso contr�rio n�o seja nenhuma, far�
    begin
      Maior := Num2; // Atribui a v�riavel Maior o valor da v�rivel Num2
      Menor := Num3; // Atribui a v�riavel Menor o valor da v�rivel Num3
    end;
  except // Caso ocorra algum problema, ser� realizado o que est� abaixo
    if (edtNum1.Text = '') or (edtNum2.Text = '') or (edtNum3.Text = '') then
    // Verifica se um ou mais campos est�o vazio, caso tenha algum, ser� exibido a mensagem abaixo
    begin
      mmResultado.Text := 'H� um ou mais campos vazios. Por favor, preencha.';
    end
    // Verifica se todos os campos est�o vazios
    else if (edtNum1.Text = '') and (edtNum2.Text = '') and (edtNum3.Text = '')
    then
    begin
      mmResultado.Text :=
        'Preencha os campos com algum n�mero para obter um resultado!';
    end;

  end;

  mmResultado.Lines.Clear;
  // Realiza a limpeza da primeira linha
  mmResultado.Lines.Add('M�XIMO: ' + FloatToStr(Maior));
  // Exibe a mensagem junto a o resultado
  mmResultado.Lines.Add('______________________________');
  mmResultado.Lines.Add('M�NIMO: ' + FloatToStr(Menor));
end;

// Bloaqueando teclas

procedure TfrmMaxMin.edtNum2KeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = false) and (word(Key) <> vk_back)) then
    // Ser� permitido somente as teclas n�mericas de 0 a 9 e a tecla virgula (",")
    Key := #0;
  // Caso seja uma telca invalida, ser� atribuido um valor nulo
end;

procedure TfrmMaxMin.edtNum3KeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = false) and (word(Key) <> vk_back)) then
    Key := #0;
end;

procedure TfrmMaxMin.edtNum1KeyPress(Sender: TObject; var Key: Char);
begin
  if ((Key in ['0' .. '9'] = false) and (word(Key) <> vk_back)) then
    Key := #0;
end;

procedure TfrmMaxMin.ValidaCampos; // Cria procedure de valida��o de campos
var
  i: Integer; // Define v�rivel contadora do tipo inteiro
begin
  if Components[i].ClassType = TCustomEdit then
    // Verifica todos componetes, caso seja igual do tipo EDIT, ser� feito:
    if (TCustomEdit(Components[i]).Text = '') then
    // Outra verifica��o, caso os campos estejam vazios, far�:
    begin
      TCustomEdit(Components[i]).TextHint := 'Campo Obrigat�rio';
      // Exibir� a mensagem no EDIT
      TCustomEdit(Components[i]).SetFocus; // Posicionar� o cursor no EDIT
      Exit; // Finalizar� o procedimento
    end;

end;

end.
