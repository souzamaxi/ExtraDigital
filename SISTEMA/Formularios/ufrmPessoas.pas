unit ufrmPessoas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufrmPadraoCad, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient,
  Vcl.Mask, Vcl.DBCtrls, Data.FMTBcd, Data.SqlExpr;

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
    dbDTNASCIMENTO: TDBEdit;
    Label7: TLabel;
    dbDTCADASTRO: TDBEdit;
    Label8: TLabel;
    dbTXEMAIL: TDBEdit;
    Label9: TLabel;
    Label10: TLabel;
    dbTXOBS: TDBMemo;
    dbTLRESIDENCIAL: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    dbTLCELULAR: TDBEdit;
    dbTLCONTATO: TDBEdit;
    Label13: TLabel;
    dbTLCOMERCIAL: TDBEdit;
    Label14: TLabel;
    dbSTATIVO: TDBCheckBox;
    dbNMCONTATO: TDBEdit;
    Label15: TLabel;
    GroupBox1: TGroupBox;
    dbNOCEP: TDBEdit;
    Label16: TLabel;
    dbNMENDERECO: TDBEdit;
    Label17: TLabel;
    dbNOENDERECO: TDBEdit;
    Label18: TLabel;
    dbNMBAIRRO: TDBEdit;
    Label19: TLabel;
    dbNMCIDADE: TDBLookupComboBox;
    Label20: TLabel;
    dbSGUF: TDBLookupComboBox;
    Label21: TLabel;
    Panel2: TPanel;
    grEnderecos: TDBGrid;
    btnNovoEndereco: TButton;
    btnSalvarEndereco: TButton;
    btnExcluirEndereco: TButton;
    dbSTATIVOENDERECO: TDBCheckBox;
    dsDetEndereco: TDataSource;
    dsCadEndereco: TDataSource;
    dsComboCidade: TDataSource;
    dsComboUF: TDataSource;
    procedure btnBuscarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure grDadosDblClick(Sender: TObject);
    procedure btnNovoEnderecoClick(Sender: TObject);
    procedure btnSalvarEnderecoClick(Sender: TObject);
    procedure btnExcluirEnderecoClick(Sender: TObject);
    procedure dbSTATIVOENDERECOEnter(Sender: TObject);
    procedure grEnderecosCellClick(Column: TColumn);
    procedure dbSTATIVOENDERECOClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure dsCadEnderecoStateChange(Sender: TObject);
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
  udmPrincipal, udmPessoas, uEnderecos;

{$R *.dfm}

procedure TfrmPessoas.btnBuscarClick(Sender: TObject);
var
  aSQL: TStringList;
begin
  inherited;
  aSQL := TStringList.Create;
  try
    aSQL.Clear;
    aSQL.Add('SELECT TIT.IDTITULAR, TIT.NMTITULAR, TIT.NOCNPJCPF, TIT.STATIVO, EMP.NMEMPRESA FROM CADTITULAR TIT');
    aSQL.Add('    LEFT JOIN CADEMPRESA EMP ON (TIT.IDEMPRESA = EMP.IDEMPRESA)');
    if StrToIntDef(edtFiltro.Text, 0) = 0 then
    begin
      aSQL.Add('WHERE (UPPER(TIT.NMTITULAR) LIKE ''%' + AnsiUpperCase(edtFiltro.Text) + '%'' OR ');
      aSQL.Add('    TIT.NOCNPJCPF LIKE ''%' + edtFiltro.Text + '%'') ');
    end
    else
    begin
      aSQL.Add('WHERE TIT.IDTITULAR = ' + (edtFiltro.Text));
    end;

    aSQL.Add('  AND (TIT.STEXCLUIDO = ''N'' OR TIT.STEXCLUIDO IS NULL) ');

    dmPessoas.cdsPqPessoas.Close;
    dmPessoas.cdsPqPessoas.CommandText := aSQL.Text;
    dmPessoas.cdsPqPessoas.Open;
  finally
    FreeAndNil(aSQL);
  end;
end;

procedure TfrmPessoas.btnExcluirClick(Sender: TObject);
var
  oDados: TSQLQuery;
  aSQL: TStringList;
begin
  inherited;
  if Application.MessageBox('Deseja excluir esta Pessoa?','Confirma��o', MB_YESNO + Mb_IconInformation + MB_DEFBUTTON2) = 6 then
  begin
    oDados := TSQLQuery.Create(nil);
    oDados.SQLConnection := dmPrincipal.Conexao;

    aSQL := TStringList.Create;
    try
      aSQL.Clear;
      aSQL.Add('UPDATE CADTITULAR SET STEXCLUIDO = ''S'', ');
      aSQL.Add('DTEXCLUIDO = ' + QuotedStr(FormatDateTime('yyyy/mm/dd', Now)) );
      aSQL.Add(' WHERE IDTITULAR = ' + dmPessoas.cdsCadPessoa.FieldByName('IDTITULAR').AsString);

      oDados.Close;
      oDados.CommandText := aSQL.Text;
      oDados.ExecSQL();

    finally
      FreeAndNil(oDados);
      FreeAndNil(aSQL);
    end;
    dmPessoas.cdsCadPessoa.Close;
  end;
end;

procedure TfrmPessoas.btnExcluirEnderecoClick(Sender: TObject);
var
  nCodigo: Integer;
  oDados: TSQLQuery;
  aSQL: TStringList;
begin
  inherited;
  if Application.MessageBox('Deseja excluir este endere�o?','Confirma��o', MB_YESNO + Mb_IconInformation + MB_DEFBUTTON2) = 6 then
  begin
    if not VerificarEnderecoSelecionado(dmPessoas.cdsCadEnderecoPessoa.Params.ParamByName('IDENDERECO').AsInteger) then
    begin
      oDados := TSQLQuery.Create(nil);
      oDados.SQLConnection := dmPrincipal.Conexao;

      aSQL := TStringList.Create;
      try
        aSQL.Clear;
        aSQL.Add('UPDATE CADENDERECOS SET STEXCLUIDO = ''S'', ');
        aSQL.Add('DTEXCLUIDO = ' + QuotedStr(FormatDateTime('yyyy/mm/dd', Now)) );
        aSQL.Add(' WHERE IDTITULAR = ' + dmPessoas.cdsCadPessoa.FieldByName('IDTITULAR').AsString);
        aSQL.Add('    AND IDENDERECO = ' + dmPessoas.cdsCadEnderecoPessoa.Params.ParamByName('IDENDERECO').AsString);

        oDados.Close;
        oDados.CommandText := aSQL.Text;
        oDados.ExecSQL();

        dmPessoas.cdsCadEnderecoPessoa.Close;
        dmPessoas.cdsDetEndereco.Close;
        dmPessoas.cdsDetEndereco.Open;
      finally
        FreeAndNil(oDados);
        FreeAndNil(aSQL);
      end;
    end
    else
      Application.MessageBox('N�o e poss�vel excluir um endere�o ativo!', 'SISTEMA', MB_ICONERROR + MB_OK + MB_SYSTEMMODAL);
  end;
end;

procedure TfrmPessoas.btnNovoClick(Sender: TObject);
begin
  inherited;
  dbNMTITULAR.SetFocus;
  dmPessoas.cdsCadPessoa.FieldByName('STATIVO').AsString := 'S';
  dmPessoas.cdsCadPessoa.FieldByName('STEXCLUIDO').AsString := 'N';
end;

procedure TfrmPessoas.btnNovoEnderecoClick(Sender: TObject);
begin
  inherited;
  dmPessoas.cdsCadEnderecoPessoa.Open;
  dmPessoas.cdsCadEnderecoPessoa.Append;
  dmPessoas.cdsCadEnderecoPessoa.FieldByName('IDTITULAR').AsInteger :=
    dmPessoas.cdsCadPessoa.FieldByName('IDTITULAR').AsInteger;
  dmPessoas.cdsCadEnderecoPessoa.FieldByName('STEXCLUIDO').AsString := 'N';
  dmPessoas.cdsCadEnderecoPessoa.FieldByName('TPCADASTRO').AsString := 'P';

  if dmPessoas.cdsDetEndereco.RecordCount > 0 then
    dmPessoas.cdsCadEnderecoPessoa.FieldByName('STATIVO').AsString := 'N'
  else
    dmPessoas.cdsCadEnderecoPessoa.FieldByName('STATIVO').AsString := 'S';

  dbNOCEP.SetFocus;
end;

procedure TfrmPessoas.btnSalvarClick(Sender: TObject);
begin
  if ValidarCadastroPessoa then
    inherited;

end;

procedure TfrmPessoas.btnSalvarEnderecoClick(Sender: TObject);
begin
  inherited;
  dmPessoas.cdsCadEnderecoPessoa.Post;
  dmPessoas.cdsCadEnderecoPessoa.ApplyUpdates(0);

  dmPessoas.cdsDetEndereco.Close;
  dmPessoas.cdsDetEndereco.Params.ParamByName('IDTITULAR').AsInteger :=
    dmPessoas.cdsCadPessoa.FieldByName('IDTITULAR').AsInteger;
  dmPessoas.cdsDetEndereco.Open;
end;

procedure TfrmPessoas.grEnderecosCellClick(Column: TColumn);
begin
  inherited;
  if dmPessoas.cdsDetEndereco.RecordCount > 0 then
  begin
    dmPessoas.cdsCadEnderecoPessoa.Close;
    dmPessoas.cdsCadEnderecoPessoa.Params.ParamByName('IDENDERECO').AsInteger :=
      dmPessoas.cdsDetEndereco.FieldByName('IDENDERECO').AsInteger;
    dmPessoas.cdsCadEnderecoPessoa.Open;
  end;
end;

procedure TfrmPessoas.dbSTATIVOENDERECOClick(Sender: TObject);
begin
  inherited;
  if VerificarEnderecoSelecionado(dmPessoas.cdsCadEnderecoPessoa.Params.ParamByName('IDENDERECO').AsInteger) then
    dbSTATIVOENDERECO.Checked := True;
end;

procedure TfrmPessoas.dbSTATIVOENDERECOEnter(Sender: TObject);
var
  nCodigo: Integer;
begin
  inherited;
  dmPessoas.cdsCadEnderecoPessoa.Edit;
  if (not dbSTATIVOENDERECO.Checked) and VerificarEnderecoAtivo(dmPessoas.cdsCadEnderecoPessoa.FieldByName('IDTITULAR').AsInteger, 'P') then
  begin
    if Application.MessageBox('J� existe outro endere�o ativo, deseja remover e ativar este endere�o?','Confirma��o', MB_YESNO + Mb_IconInformation + MB_DEFBUTTON2) = 6 then
    begin
      nCodigo := dmPessoas.cdsCadEnderecoPessoa.FieldByName('IDENDERECO').AsInteger;
      AtivarEnderecoPessoa(nCodigo);
      dbSTATIVOENDERECO.Checked := True;
      dmPessoas.cdsCadEnderecoPessoa.FieldByName('STATIVO').AsString := 'S';
    end;
  end;
end;

procedure TfrmPessoas.dsCadEnderecoStateChange(Sender: TObject);
begin
  inherited;
  btnNovoEndereco.Enabled := not (dmPessoas.cdsCadEnderecoPessoa.State in dsEditModes);
  btnSalvarEndereco.Enabled := (dmPessoas.cdsCadEnderecoPessoa.State in dsEditModes);
  btnExcluirEndereco.Enabled := not (dmPessoas.cdsCadEnderecoPessoa.State in dsEditModes) and dmPessoas.cdsCadEnderecoPessoa.Active and (dmPessoas.cdsCadEnderecoPessoa.RecordCount > 0);
end;

procedure TfrmPessoas.grDadosDblClick(Sender: TObject);
begin
  inherited;
  if dmPessoas.cdsPqPessoas.RecordCount > 0 then
  begin
    dmPessoas.cdsCadPessoa.Close;
    dmPessoas.cdsCadPessoa.Params.ParamByName('IDTITULAR').AsInteger :=
      dmPessoas.cdsPqPessoas.FieldByName('IDTITULAR').AsInteger;
    dmPessoas.cdsCadPessoa.Open;

    pcPrincipal.ActivePage := tabDados;
  end;
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
