unit uFuncoesDB;

interface

uses
  Data.DB, Data.SqlExpr, System.SysUtils;

  function PegarCodigoAutoIncrement(sTabela: string): Integer;
  function MascaraTelefone(Sender: TField; DisplayText: Boolean): string;
  function MascaraCnpjCpf(Sender: TField; DisplayText: Boolean): string;

implementation

uses
  udmPrincipal, MaskUtils;

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


function MascaraTelefone(Sender: TField; DisplayText: Boolean): string;
const
  sFixo  = '(00)\ 0000\-0000;0;_';
  sCelular =  '(00)\ 00000\-0000;0;_';
var
  fMask: string;
begin
  if DisplayText then
  begin
    case Length(Sender.AsString) of
      10: fMask := sFixo;
      11: fMask := sCelular;
    else
      fMask := '';
    end;
    Result := FormatMaskText(fMask, Sender.AsString);
  end
  else
    Result := Sender.AsString;
end;

function MascaraCnpjCpf(Sender: TField; DisplayText: Boolean): string;
const
  sCPF  = '000\.000\.000\-00;0;_';
  sCNPj =  '00\.000\.000\/0000\-00;0;_';
var
  fMask: string;
begin
  if DisplayText then
  begin
    case Length(Sender.AsString) of
      11: fMask := sCPF;
      14: fMask := sCNPj;
    else
      fMask := '';
    end;
    Result := FormatMaskText(fMask, Sender.AsString);
  end
  else
    Result := Sender.AsString;
end;

end.
