unit udmEmpresas;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr;

type
  TdmEmpresas = class(TDataModule)
    sqlPqEmpresas: TSQLDataSet;
    sqlCadEmpresas: TSQLDataSet;
    dspPqEmpresas: TDataSetProvider;
    dspCadEmpresas: TDataSetProvider;
    cdsPqEmpresas: TClientDataSet;
    cdsCadEmpresas: TClientDataSet;
    dspComboCidade: TDataSetProvider;
    dspComboUF: TDataSetProvider;
    cdsComboCidade: TClientDataSet;
    cdsComboCidadeIDCIDADE: TIntegerField;
    cdsComboCidadeNMCIDADE: TStringField;
    cdsComboCidadeIDUF: TIntegerField;
    cdsComboCidadeNOIBGE: TStringField;
    cdsComboUF: TClientDataSet;
    cdsComboUFIDUF: TIntegerField;
    cdsComboUFNMESTADO: TStringField;
    cdsComboUFSGESTADO: TStringField;
    sqlComboCidade: TSQLDataSet;
    sqlComboUF: TSQLDataSet;
    cdsPqEmpresasIDEMPRESA: TIntegerField;
    cdsPqEmpresasNMEMPRESA: TStringField;
    cdsPqEmpresasNOCNPJ: TStringField;
    cdsCadEmpresasIDEMPRESA: TIntegerField;
    cdsCadEmpresasNMEMPRESA: TStringField;
    cdsCadEmpresasNOCNPJ: TStringField;
    cdsCadEmpresasNOINSCRICAO: TStringField;
    cdsCadEmpresasDTCADASTRO: TDateField;
    cdsCadEmpresasDTABERTURA: TDateField;
    cdsCadEmpresasTLCOMERCIAL: TStringField;
    sqlCadEmpresasIDEMPRESA: TIntegerField;
    sqlCadEmpresasNMEMPRESA: TStringField;
    sqlCadEmpresasNOCNPJ: TStringField;
    sqlCadEmpresasNOINSCRICAO: TStringField;
    sqlCadEmpresasDTCADASTRO: TDateField;
    sqlCadEmpresasDTABERTURA: TDateField;
    sqlCadEmpresasTLCOMERCIAL: TStringField;
    sqlCadEmpresasTLCELULAR: TStringField;
    sqlCadEmpresasTXOBS: TIntegerField;
    sqlCadEmpresasSTEXCLUIDO: TStringField;
    sqlCadEmpresasDTEXCLUIDO: TDateField;
    cdsCadEmpresasTLCELULAR: TStringField;
    cdsCadEmpresasTXOBS: TIntegerField;
    cdsCadEmpresasSTEXCLUIDO: TStringField;
    cdsCadEmpresasDTEXCLUIDO: TDateField;
    sqlCadEmpresasTXEMAIL: TStringField;
    cdsCadEmpresasTXEMAIL: TStringField;
    sqlCadEmpresasSTATIVO: TStringField;
    cdsCadEmpresasSTATIVO: TStringField;
    cdsPqEmpresasSTATIVO: TStringField;
    sqlDetEndereco: TSQLDataSet;
    sqlCadEndereco: TSQLDataSet;
    sqlCadEnderecoIDENDERECO: TIntegerField;
    sqlCadEnderecoIDTITULAR: TIntegerField;
    sqlCadEnderecoNMENDERECO: TStringField;
    sqlCadEnderecoNOENDERECO: TStringField;
    sqlCadEnderecoNMBAIRRO: TStringField;
    sqlCadEnderecoIDCIDADE: TIntegerField;
    sqlCadEnderecoIDUF: TIntegerField;
    sqlCadEnderecoNOCEP: TStringField;
    sqlCadEnderecoSTATIVO: TStringField;
    sqlCadEnderecoSTEXCLUIDO: TStringField;
    sqlCadEnderecoDTEXCLUIDO: TDateField;
    sqlCadEnderecoTPCADASTRO: TStringField;
    dspDetEndereco: TDataSetProvider;
    dspCadEndereco: TDataSetProvider;
    cdsDetEndereco: TClientDataSet;
    cdsDetEnderecoNMENDERECO: TStringField;
    cdsDetEnderecoNOENDERECO: TStringField;
    cdsDetEnderecoNOCEP: TStringField;
    cdsDetEnderecoNMCIDADE: TStringField;
    cdsDetEnderecoSGESTADO: TStringField;
    cdsDetEnderecoIDENDERECO: TIntegerField;
    cdsCadEndereco: TClientDataSet;
    cdsCadEnderecoIDENDERECO: TIntegerField;
    cdsCadEnderecoIDTITULAR: TIntegerField;
    cdsCadEnderecoNMENDERECO: TStringField;
    cdsCadEnderecoNOENDERECO: TStringField;
    cdsCadEnderecoNMBAIRRO: TStringField;
    cdsCadEnderecoIDCIDADE: TIntegerField;
    cdsCadEnderecoIDUF: TIntegerField;
    cdsCadEnderecoNOCEP: TStringField;
    cdsCadEnderecoSTATIVO: TStringField;
    cdsCadEnderecoSTEXCLUIDO: TStringField;
    cdsCadEnderecoDTEXCLUIDO: TDateField;
    cdsCadEnderecoTPCADASTRO: TStringField;
    sqlCadEnderecoIDEMPRESA: TIntegerField;
    cdsCadEnderecoIDEMPRESA: TIntegerField;
    procedure cdsCadEmpresasAfterOpen(DataSet: TDataSet);
    procedure cdsCadEmpresasTLCOMERCIALGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsCadEmpresasTLCELULARGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsCadEmpresasNOCNPJGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsCadEnderecoAfterOpen(DataSet: TDataSet);
    procedure cdsPqEmpresasSTATIVOGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure cdsCadEmpresasAfterClose(DataSet: TDataSet);
    procedure cdsCadEmpresasAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmEmpresas: TdmEmpresas;

implementation

uses
  udmPrincipal, uFuncoesDB;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmEmpresas.cdsCadEmpresasAfterClose(DataSet: TDataSet);
begin
  cdsDetEndereco.Close;
  cdsCadEndereco.Close;
end;

procedure TdmEmpresas.cdsCadEmpresasAfterOpen(DataSet: TDataSet);
begin
  cdsDetEndereco.Close;
  cdsDetEndereco.Params.ParamByName('IDEMPRESA').AsInteger :=
    cdsCadEmpresas.FieldByName('IDEMPRESA').AsInteger;
  cdsDetEndereco.Open;
end;

procedure TdmEmpresas.cdsCadEmpresasAfterPost(DataSet: TDataSet);
begin
  if cdsCadEmpresas.FieldByName('IDEMPRESA').AsInteger = 0 then
  begin
    cdsCadEmpresas.Edit;
    cdsCadEmpresas.FieldByName('IDEMPRESA').AsInteger := PegarCodigoAutoIncrement('CADEMPRESA');
  end;
end;

procedure TdmEmpresas.cdsCadEmpresasNOCNPJGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := MascaraCnpjCpf(Sender, DisplayText);
end;

procedure TdmEmpresas.cdsCadEmpresasTLCELULARGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := MascaraTelefone(Sender, DisplayText);
end;

procedure TdmEmpresas.cdsCadEmpresasTLCOMERCIALGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  Text := MascaraTelefone(Sender, DisplayText);
end;

procedure TdmEmpresas.cdsCadEnderecoAfterOpen(DataSet: TDataSet);
begin
  cdsComboCidade.Close;
  cdsComboCidade.Open;

  cdsComboUF.Close;
  cdsComboUF.Open;
end;

procedure TdmEmpresas.cdsPqEmpresasSTATIVOGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  if (Sender as TStringField).Value = 'S' then
    Text := 'SIM'
  else if (Sender as TStringField).Value = 'N' then
    Text := 'NAO'
  else
    Text := '';
end;

end.
