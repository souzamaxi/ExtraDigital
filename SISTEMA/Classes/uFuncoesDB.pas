unit uFuncoesDB;

interface

uses
  Data.DB, Data.SqlExpr, System.SysUtils;

  function PegarCodigoAutoIncrement(sTabela: string): Integer;

implementation

uses
  udmPrincipal;

function PegarCodigoAutoIncrement(sTabela: string): Integer;
var
  oDados: TSQLDataSet;
begin
  oDados := TSQLDataSet.Create(nil);
  oDados.SQLConnection := dmPrincipal.Conexao;
  try
    oDados.Close;
    oDados.CommandText := 'SELECT GEN_ID(GEN_' + sTabela + '_ID,0) AS ID FROM RDB$DATABASE';
    oDados.Open;

    Result := oDados.FieldByName('ID').AsInteger + 1;
  finally
    FreeAndNil(oDados);
  end;
end;

end.