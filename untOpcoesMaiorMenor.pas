unit untOpcoesMaiorMenor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TfrmOpcoesMaiorMenor = class(TForm)
    Label1: TLabel;
    btnCalcMaxMin: TBitBtn;
    btnMaiorNum: TBitBtn;
    procedure btnCalcMaxMinClick(Sender: TObject);
    procedure btnMaiorNumClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOpcoesMaiorMenor: TfrmOpcoesMaiorMenor;

implementation

{$R *.dfm}

uses untMaxMin, untNumMaior;

procedure TfrmOpcoesMaiorMenor.btnMaiorNumClick(Sender: TObject);
begin
  frmNumMaior := TfrmNumMaior.Create(self); // Cria o formulário
  frmNumMaior.ShowModal; // Exibe o formulário
end;

procedure TfrmOpcoesMaiorMenor.btnCalcMaxMinClick(Sender: TObject);
begin
  frmMaxMin := TfrmMaxMin.Create(self);
  frmMaxMin.ShowModal;
end;

end.
