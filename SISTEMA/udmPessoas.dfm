object dmPessoas: TdmPessoas
  OldCreateOrder = False
  Height = 311
  Width = 681
  object sqlPqPessoas: TSQLDataSet
    CommandText = 'SELECT IDTITULAR, NMTITULAR, NOCNPJCPF, STATIVO FROM CADTITULAR'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmPrincipal.Conexao
    Left = 64
    Top = 40
  end
  object dspPqPessoas: TDataSetProvider
    DataSet = sqlPqPessoas
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 200
    Top = 40
  end
  object cdsPqPessoas: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT IDTITULAR, NMTITULAR, NOCNPJCPF, STATIVO FROM CADTITULAR'
    Params = <>
    ProviderName = 'dspPqPessoas'
    Left = 336
    Top = 40
    object cdsPqPessoasIDTITULAR: TIntegerField
      FieldName = 'IDTITULAR'
      Required = True
    end
    object cdsPqPessoasNMTITULAR: TStringField
      FieldName = 'NMTITULAR'
      Size = 100
    end
    object cdsPqPessoasNOCNPJCPF: TStringField
      FieldName = 'NOCNPJCPF'
      Size = 18
    end
    object cdsPqPessoasSTATIVO: TStringField
      FieldName = 'STATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object dspCadPessoa: TDataSetProvider
    DataSet = sqlCadPessoa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 200
    Top = 104
  end
  object cdsCadPessoa: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM CADTITULAR WHERE IDTITULAR = :IDTITULAR'
    Params = <
      item
        DataType = ftWideString
        Name = 'IDTITULAR'
        ParamType = ptUnknown
        Value = '-1'
      end>
    ProviderName = 'dspCadPessoa'
    AfterOpen = cdsCadPessoaAfterOpen
    AfterPost = cdsCadPessoaAfterPost
    Left = 336
    Top = 104
    object cdsCadPessoaIDTITULAR: TIntegerField
      FieldName = 'IDTITULAR'
    end
    object cdsCadPessoaIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      Required = True
    end
    object cdsCadPessoaNMTITULAR: TStringField
      FieldName = 'NMTITULAR'
      Size = 100
    end
    object cdsCadPessoaNOCNPJCPF: TStringField
      FieldName = 'NOCNPJCPF'
      Size = 18
    end
    object cdsCadPessoaNOINCRICAORG: TStringField
      FieldName = 'NOINCRICAORG'
      Size = 15
    end
    object cdsCadPessoaDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
    end
    object cdsCadPessoaDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
    end
    object cdsCadPessoaTXEMAIL: TStringField
      FieldName = 'TXEMAIL'
      Size = 100
    end
    object cdsCadPessoaTXOBS: TStringField
      FieldName = 'TXOBS'
      Size = 1000
    end
    object cdsCadPessoaTLRESIDENCIAL: TStringField
      FieldName = 'TLRESIDENCIAL'
      Size = 15
    end
    object cdsCadPessoaTLCOMERCIAL: TStringField
      FieldName = 'TLCOMERCIAL'
      Size = 15
    end
    object cdsCadPessoaTLCELULAR: TStringField
      FieldName = 'TLCELULAR'
      Size = 15
    end
    object cdsCadPessoaTLCONTATO: TStringField
      FieldName = 'TLCONTATO'
      Size = 15
    end
    object cdsCadPessoaNMCONTATO: TStringField
      FieldName = 'NMCONTATO'
      Size = 50
    end
    object cdsCadPessoaSTEXCLUIDO: TStringField
      FieldName = 'STEXCLUIDO'
      FixedChar = True
      Size = 1
    end
    object cdsCadPessoaDTEXCLUIDO: TDateField
      FieldName = 'DTEXCLUIDO'
    end
    object cdsCadPessoaSTATIVO: TStringField
      FieldName = 'STATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object sqlCadPessoa: TSQLDataSet
    CommandText = 'SELECT * FROM CADTITULAR WHERE IDTITULAR = :IDTITULAR'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftWideString
        Name = 'IDTITULAR'
        ParamType = ptInput
        Value = '-1'
      end>
    SQLConnection = dmPrincipal.Conexao
    Left = 64
    Top = 104
    object sqlCadPessoaIDTITULAR: TIntegerField
      FieldName = 'IDTITULAR'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object sqlCadPessoaIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      Required = True
    end
    object sqlCadPessoaNMTITULAR: TStringField
      FieldName = 'NMTITULAR'
      Size = 100
    end
    object sqlCadPessoaNOCNPJCPF: TStringField
      FieldName = 'NOCNPJCPF'
      Size = 18
    end
    object sqlCadPessoaNOINCRICAORG: TStringField
      FieldName = 'NOINCRICAORG'
      Size = 15
    end
    object sqlCadPessoaDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
    end
    object sqlCadPessoaDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
    end
    object sqlCadPessoaTXEMAIL: TStringField
      FieldName = 'TXEMAIL'
      Size = 100
    end
    object sqlCadPessoaTXOBS: TStringField
      FieldName = 'TXOBS'
      Size = 1000
    end
    object sqlCadPessoaTLRESIDENCIAL: TStringField
      FieldName = 'TLRESIDENCIAL'
      Size = 15
    end
    object sqlCadPessoaTLCOMERCIAL: TStringField
      FieldName = 'TLCOMERCIAL'
      Size = 15
    end
    object sqlCadPessoaTLCELULAR: TStringField
      FieldName = 'TLCELULAR'
      Size = 15
    end
    object sqlCadPessoaTLCONTATO: TStringField
      FieldName = 'TLCONTATO'
      Size = 15
    end
    object sqlCadPessoaNMCONTATO: TStringField
      FieldName = 'NMCONTATO'
      Size = 50
    end
    object sqlCadPessoaSTEXCLUIDO: TStringField
      FieldName = 'STEXCLUIDO'
      FixedChar = True
      Size = 1
    end
    object sqlCadPessoaDTEXCLUIDO: TDateField
      FieldName = 'DTEXCLUIDO'
    end
    object sqlCadPessoaSTATIVO: TStringField
      FieldName = 'STATIVO'
      FixedChar = True
      Size = 1
    end
  end
  object dspComboEmpresa: TDataSetProvider
    DataSet = sqlComboEmpresa
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 200
    Top = 168
  end
  object cdsComboEmpresa: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT EMP.IDEMPRESA, EMP.NMEMPRESA FROM CADEMPRESA EMP ORDER BY' +
      ' EMP.NMEMPRESA'
    Params = <>
    ProviderName = 'dspComboEmpresa'
    Left = 336
    Top = 168
    object cdsComboEmpresaIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
      Required = True
    end
    object cdsComboEmpresaNMEMPRESA: TStringField
      FieldName = 'NMEMPRESA'
      Size = 100
    end
  end
  object sqlComboEmpresa: TSQLDataSet
    CommandText = 
      'SELECT EMP.IDEMPRESA, EMP.NMEMPRESA FROM CADEMPRESA EMP ORDER BY' +
      ' EMP.NMEMPRESA'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmPrincipal.Conexao
    Left = 72
    Top = 168
  end
end