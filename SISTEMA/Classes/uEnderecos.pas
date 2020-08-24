unit uEnderecos;

interface

  procedure AtivarEnderecoPessoa(nCodigo: Integer);

  function VerificarEnderecoSelecionado(nCodigo: Integer): Boolean;
  function VerificarEnderecoAtivo(nCodigo: Integer; sTipoCadastro: string): Boolean;

implementation

uses
  udmPrincipal, Data.SqlExpr, System.SysUtils, System.Classes;

function VerificarEnderecoSelecionado(nCodigo: Integer): Boolean;
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

procedure AtivarEnderecoPessoa(nCodigo: Integer);
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
    aSQL.Add('UPDATE CADENDERECOS SET STATIVO = ''N'' ');
    aSQL.Add('WHERE IDENDERECO <> ' + nCodigo.ToString);

    oDados.CommandText := aSQL.Text;
    oDados.ExecSQL();

    oDados.Close;
    aSQL.Clear;
    aSQL.Add('UPDATE CADENDERECOS SET STATIVO = ''S'' ');
    aSQL.Add('WHERE IDENDERECO = ' + nCodigo.ToString);

    oDados.CommandText := aSQL.Text;
    oDados.ExecSQL();
  finally
    FreeAndNil(oDados);
    FreeAndNil(aSQL);
  end;
end;

function VerificarEnderecoAtivo(nCodigo: Integer; sTipoCadastro: string): Boolean;
var
  oDados: TSQLDataSet;
begin
  oDados := TSQLDataSet.Create(nil);
  oDados.SQLConnection := dmPrincipal.Conexao;

  try
    oDados.Close;
    oDados.CommandText := 'SELECT STATIVO FROM CADENDERECOS WHERE STATIVO = ''S'' AND (IDTITULAR = ' + nCodigo.ToString +
      ' AND TPCADASTRO = ' + QuotedStr(sTipoCadastro) + ') OR ' +
      ' (IDEMPRESA = ' + nCodigo.ToString + ' AND TPCADASTRO = ' + QuotedStr(sTipoCadastro) + ')';
    oDados.Open;

    Result := (oDados.RecordCount > 0);

  finally
    FreeAndNil(oDados);
  end;
end;

end.
