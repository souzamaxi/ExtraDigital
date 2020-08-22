unit ufrmPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmPadraoCad, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,
  Vcl.Mask, Vcl.DBCtrls;

type
  TfrmPessoas = class(TfrmPadraoCad)
    dsPqPessoas: TDataSource;
    dbIDTITULAR: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    dsComboEmpresa: TDataSource;
    Label4: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    dbNMTITULAR: TDBEdit;
    dbNOCNPJCPF: TDBEdit;
    Label5: TLabel;
    dbNOINCRICAORG: TDBEdit;
    Label6: TLabel;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
  private
    { Private declarations }
    function ValidarCadastroPessoa: Boolean;
  public
    { Public declarations }
  end;

var
  frmPessoas: TfrmPessoas;

implementation

uses
  udmPessoas;

{$R *.dfm}

procedure TfrmPessoas.btnBuscarClick(Sender: TObject);
var
  aSQL: TStringList;
begin
  inherited;
  aSQL := TStringList.Create;
  try
    aSQL.Clear;
    aSQL.Add('SELECT IDTITULAR, NMTITULAR, NOCNPJCPF, STATIVO FROM CADTITULAR');
    aSQL.Add('WHERE UPPER(NMTITULAR) LIKE ''%' + AnsiUpperCase(edtFiltro.Text) + '%''');

    dmPessoas.cdsPqPessoas.Close;
    dmPessoas.cdsPqPessoas.CommandText := aSQL.Text;
    dmPessoas.cdsPqPessoas.Open;
  finally
    FreeAndNil(aSQL);
  end;
end;

procedure TfrmPessoas.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if MessageDlg('� Necess�rio realizar o preenchimento dos dados que est�o na tela Curriculum, Deseja abrir a tela?', mtConfirmation,[mbYes,mbNo], 0) <> mrYes then
    abort;
end;

procedure TfrmPessoas.btnNovoClick(Sender: TObject);
begin
  inherited;
  dbNMTITULAR.SetFocus;
end;

procedure TfrmPessoas.btnSalvarClick(Sender: TObject);
begin
  if ValidarCadastroPessoa then
    inherited;

end;

function TfrmPessoas.ValidarCadastroPessoa: Boolean;
var
  ok: Boolean;
begin
  ok := True;
  if dmPessoas.cdsCadPessoa.FieldByName('IDEMPRESA').AsInteger = 0 then
  begin
    Result := False;
    Application.MessageBox('Falta informar uma empresa para o cadastro!', 'SISTEMA', MB_ICONEXCLAMATION + MB_OK + MB_SYSTEMMODAL);
    Abort
  end;

  Result := ok;
end;

end.
