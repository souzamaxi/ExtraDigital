unit udmPessoas;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr;

type
  TdmPessoas = class(TDataModule)
    sqlPqPessoas: TSQLDataSet;
    dspPqPessoas: TDataSetProvider;
    cdsPqPessoas: TClientDataSet;
    dspCadPessoa: TDataSetProvider;
    cdsCadPessoa: TClientDataSet;
    sqlCadPessoa: TSQLDataSet;
    cdsCadPessoaIDTITULAR: TIntegerField;
    cdsCadPessoaIDEMPRESA: TIntegerField;
    cdsCadPessoaNMTITULAR: TStringField;
    cdsCadPessoaNOCNPJCPF: TStringField;
    cdsCadPessoaNOINCRICAORG: TStringField;
    cdsCadPessoaDTNASCIMENTO: TDateField;
    cdsCadPessoaDTCADASTRO: TDateField;
    cdsCadPessoaTXEMAIL: TStringField;
    cdsCadPessoaTXOBS: TStringField;
    cdsCadPessoaTLRESIDENCIAL: TStringField;
    cdsCadPessoaTLCOMERCIAL: TStringField;
    cdsCadPessoaTLCELULAR: TStringField;
    cdsCadPessoaTLCONTATO: TStringField;
    cdsCadPessoaNMCONTATO: TStringField;
    cdsCadPessoaSTEXCLUIDO: TStringField;
    cdsCadPessoaDTEXCLUIDO: TDateField;
    cdsCadPessoaSTATIVO: TStringField;
    dspComboEmpresa: TDataSetProvider;
    cdsComboEmpresa: TClientDataSet;
    sqlComboEmpresa: TSQLDataSet;
    cdsComboEmpresaIDEMPRESA: TIntegerField;
    cdsComboEmpresaNMEMPRESA: TStringField;
    sqlCadPessoaIDTITULAR: TIntegerField;
    sqlCadPessoaIDEMPRESA: TIntegerField;
    sqlCadPessoaNMTITULAR: TStringField;
    sqlCadPessoaNOCNPJCPF: TStringField;
    sqlCadPessoaNOINCRICAORG: TStringField;
    sqlCadPessoaDTNASCIMENTO: TDateField;
    sqlCadPessoaDTCADASTRO: TDateField;
    sqlCadPessoaTXEMAIL: TStringField;
    sqlCadPessoaTXOBS: TStringField;
    sqlCadPessoaTLRESIDENCIAL: TStringField;
    sqlCadPessoaTLCOMERCIAL: TStringField;
    sqlCadPessoaTLCELULAR: TStringField;
    sqlCadPessoaTLCONTATO: TStringField;
    sqlCadPessoaNMCONTATO: TStringField;
    sqlCadPessoaSTEXCLUIDO: TStringField;
    sqlCadPessoaDTEXCLUIDO: TDateField;
    sqlCadPessoaSTATIVO: TStringField;
    cdsPqPessoasIDTITULAR: TIntegerField;
    cdsPqPessoasNMTITULAR: TStringField;
    cdsPqPessoasNOCNPJCPF: TStringField;
    cdsPqPessoasSTATIVO: TStringField;
    procedure cdsCadPessoaAfterOpen(DataSet: TDataSet);
    procedure cdsCadPessoaAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmPessoas: TdmPessoas;

implementation

uses
  udmPrincipal, uFuncoesDB;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TdmPessoas.cdsCadPessoaAfterOpen(DataSet: TDataSet);
begin
  cdsComboEmpresa.Close;
  cdsComboEmpresa.Open;
end;

procedure TdmPessoas.cdsCadPessoaAfterPost(DataSet: TDataSet);
begin
  if cdsCadPessoa.FieldByName('IDTITULAR').AsInteger = 0 then
  begin
    cdsCadPessoa.Edit;
    cdsCadPessoa.FieldByName('IDTITULAR').AsInteger := PegarCodigoAutoIncrement('CADTITULAR');
  end;
end;

end.