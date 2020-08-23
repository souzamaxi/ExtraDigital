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
    procedure dsCadEnderecoDataChange(Sender: TObject; Field: TField);
    procedure btnSalvarEnderecoClick(Sender: TObject);
    procedure btnExcluirEnderecoClick(Sender: TObject);
    procedure dbSTATIVOENDERECOEnter(Sender: TObject);
    procedure grEnderecosCellClick(Column: TColumn);
    procedure dbSTATIVOENDERECOClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure AtivarEnderecoPessoa(nCodigo: Integer);

    function ValidarCadastroPessoa: Boolean;
    function VerificarEnderecoAtivo(nCodigo: Integer): Boolean;
    function VerificarEnderecoSelecionado(nCodigo: Integer): Boolean;
  public
    { Public declarations }
  end;

var
  frmPessoas: TfrmPessoas;

implementation

uses
  udmPessoas, udmPrincipal;

{$R *.dfm}

procedure TfrmPessoas.AtivarEnderecoPessoa(nCodigo: Integer);
var
  oDados: TSQLQuery;
  aSQL: TStringList;
begin
  oDados := TSQLQuery.Create(nil);
  oDados.SQLConnection := dmPrincipal.Conexao;

  aSQL := TStringList.Create;
  try
    oDados.Close;
    aSQL.Clear;
    aSQL.Add('UPDATE CADENDERECOS SET STATIVO = ''N'' WHERE IDTITULAR = ' +
      dmPessoas.cdsCadPessoa.FieldByName('IDTITULAR').AsString);
    aSQL.Add('    AND IDENDERECO <> ' + nCodigo.ToString);

    oDados.CommandText := aSQL.Text;
    oDados.ExecSQL();

    oDados.Close;
    aSQL.Clear;
    aSQL.Add('UPDATE CADENDERECOS SET STATIVO = ''S'' WHERE IDTITULAR = ' +
      dmPessoas.cdsCadPessoa.FieldByName('IDTITULAR').AsString);
    aSQL.Add('    AND IDENDERECO = ' + nCodigo.ToString);

    oDados.CommandText := aSQL.Text;
    oDados.ExecSQL();
  finally
    FreeAndNil(oDados);
    FreeAndNil(aSQL);
  end;
end;

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
    if not VerificarEnderecoSelecionado(dmPessoas.cdsCadEndereco.Params.ParamByName('IDENDERECO').AsInteger) then
    begin
      oDados := TSQLQuery.Create(nil);
      oDados.SQLConnection := dmPrincipal.Conexao;

      aSQL := TStringList.Create;
      try
        aSQL.Clear;
        aSQL.Add('UPDATE CADENDERECOS SET STEXCLUIDO = ''S'', ');
        aSQL.Add('DTEXCLUIDO = ' + QuotedStr(FormatDateTime('yyyy/mm/dd', Now)) );
        aSQL.Add(' WHERE IDTITULAR = ' + dmPessoas.cdsCadPessoa.FieldByName('IDTITULAR').AsString);
        aSQL.Add('    AND IDENDERECO = ' + dmPessoas.cdsCadEndereco.Params.ParamByName('IDENDERECO').AsString);

        oDados.Close;
        oDados.CommandText := aSQL.Text;
        oDados.ExecSQL();

        dmPessoas.cdsCadEndereco.Close;
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
  dmPessoas.cdsCadEndereco.Open;
  dmPessoas.cdsCadEndereco.Append;
  dmPessoas.cdsCadEndereco.FieldByName('IDTITULAR').AsInteger :=
    dmPessoas.cdsCadPessoa.FieldByName('IDTITULAR').AsInteger;
  dmPessoas.cdsCadEndereco.FieldByName('STEXCLUIDO').AsString := 'N';

  if dmPessoas.cdsDetEndereco.RecordCount > 0 then
    dmPessoas.cdsCadEndereco.FieldByName('STATIVO').AsString := 'N'
  else
    dmPessoas.cdsCadEndereco.FieldByName('STATIVO').AsString := 'S';

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
  dmPessoas.cdsCadEndereco.Post;
  dmPessoas.cdsCadEndereco.ApplyUpdates(0);

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
    dmPessoas.cdsCadEndereco.Close;
    dmPessoas.cdsCadEndereco.Params.ParamByName('IDENDERECO').AsInteger :=
      dmPessoas.cdsDetEndereco.FieldByName('IDENDERECO').AsInteger;
    dmPessoas.cdsCadEndereco.Open;
  end;
end;

procedure TfrmPessoas.dbSTATIVOENDERECOClick(Sender: TObject);
begin
  inherited;
  if VerificarEnderecoSelecionado(dmPessoas.cdsCadEndereco.Params.ParamByName('IDENDERECO').AsInteger) then
    dbSTATIVOENDERECO.Checked := True;
end;

procedure TfrmPessoas.dbSTATIVOENDERECOEnter(Sender: TObject);
var
  nCodigo: Integer;
begin
  inherited;
  dmPessoas.cdsCadEndereco.Edit;
  if (not dbSTATIVOENDERECO.Checked) and VerificarEnderecoAtivo(dmPessoas.cdsCadEndereco.FieldByName('IDTITULAR').AsInteger) then
  begin
    if Application.MessageBox('J� existe outro endere�o ativo, deseja remover e ativar este endere�o?','Confirma��o', MB_YESNO + Mb_IconInformation + MB_DEFBUTTON2) = 6 then
    begin
      nCodigo := dmPessoas.cdsCadEndereco.FieldByName('IDENDERECO').AsInteger;
      AtivarEnderecoPessoa(nCodigo);
      dbSTATIVOENDERECO.Checked := True;
      dmPessoas.cdsCadEndereco.FieldByName('STATIVO').AsString := 'S';
    end;
  end
  else
  begin
    //dmPessoas.cdsCadEndereco.FieldByName('STATIVO').AsString := 'S';
    //dmPessoas.cdsCadEndereco.Post;
    //dmPessoas.cdsCadEndereco.ApplyUpdates(0);
  end;
end;

procedure TfrmPessoas.dsCadEnderecoDataChange(Sender: TObject; Field: TField);
begin
  inherited;
  btnNovoEndereco.Enabled := not (dmPessoas.cdsCadEndereco.State in dsEditModes);
  btnSalvarEndereco.Enabled := (dmPessoas.cdsCadEndereco.State in dsEditModes);
  btnExcluirEndereco.Enabled := not (dmPessoas.cdsCadEndereco.State in dsEditModes) and (dmPessoas.cdsCadEndereco.RecordCount > 0);
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

function TfrmPessoas.VerificarEnderecoAtivo(nCodigo: Integer): Boolean;
var
  oDados: TSQLDataSet;
begin
  oDados := TSQLDataSet.Create(nil);
  oDados.SQLConnection := dmPrincipal.Conexao;

  try
    oDados.Close;
    oDados.CommandText := 'SELECT STATIVO FROM CADENDERECOS WHERE IDTITULAR = ' + nCodigo.ToString + ' AND STATIVO = ''S''';
    oDados.Open;

    Result := (oDados.RecordCount > 0);

  finally
    FreeAndNil(oDados);
  end;
end;

function TfrmPessoas.VerificarEnderecoSelecionado(nCodigo: Integer): Boolean;
var
  oDados: TSQLDataSet;
begin
  oDados := TSQLDataSet.Create(nil);
  oDados.SQLConnection := dmPrincipal.Conexao;

  try
    oDados.Close;
    oDados.CommandText := 'SELECT STATIVO FROM CADENDERECOS WHERE IDENDERECO = ' + nCodigo.ToString + ' AND STATIVO = ''S''';
    oDados.Open;

    Result := (oDados.RecordCount > 0);

  finally
    FreeAndNil(oDados);
  end;
end;

end.
