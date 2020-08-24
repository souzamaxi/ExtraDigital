object dmFuncionarios: TdmFuncionarios
  OldCreateOrder = False
  Height = 434
  Width = 756
  object sqlPqFuncionario: TSQLDataSet
    CommandText = 
      'SELECT FUNC.IDFUNCIONARIO, FUNC.NMFUNCIONARIO, FUNC.NOCPF, FUNC.' +
      'STATIVO, FUNC.TXEMAIL,'#13#10'FUNC.DTNASCIMENTO, FUNC.DTCONTRATACAO, F' +
      'UNC.DTDEMISSAO, FUNC.TLRESIDENCIAL, FUNC.TLCELULAR FROM CADFUNCI' +
      'ONARIOS FUNC'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmPrincipal.Conexao
    Left = 72
    Top = 32
  end
  object sqlCadFuncionario: TSQLDataSet
    CommandText = 
      'SELECT * FROM CADFUNCIONARIOS FUNC WHERE FUNC.IDFUNCIONARIO = :I' +
      'DFUNCIONARIO'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftWideString
        Name = 'IDFUNCIONARIO'
        ParamType = ptInput
        Value = '-1'
      end>
    SQLConnection = dmPrincipal.Conexao
    Left = 72
    Top = 88
    object sqlCadFuncionarioIDFUNCIONARIO: TIntegerField
      FieldName = 'IDFUNCIONARIO'
    end
    object sqlCadFuncionarioIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
    end
    object sqlCadFuncionarioNMFUNCIONARIO: TStringField
      FieldName = 'NMFUNCIONARIO'
      Size = 100
    end
    object sqlCadFuncionarioNOCPF: TStringField
      FieldName = 'NOCPF'
      Size = 18
    end
    object sqlCadFuncionarioNORG: TStringField
      FieldName = 'NORG'
      Size = 15
    end
    object sqlCadFuncionarioDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
    end
    object sqlCadFuncionarioTXEMAIL: TStringField
      FieldName = 'TXEMAIL'
      Size = 100
    end
    object sqlCadFuncionarioNOCARTEIRATRAB: TStringField
      FieldName = 'NOCARTEIRATRAB'
    end
    object sqlCadFuncionarioNOTITULOELEITOR: TStringField
      FieldName = 'NOTITULOELEITOR'
      Size = 12
    end
    object sqlCadFuncionarioNOCARTEIRAMOTORISTA: TStringField
      FieldName = 'NOCARTEIRAMOTORISTA'
      Size = 15
    end
    object sqlCadFuncionarioTPCATERORIA: TStringField
      FieldName = 'TPCATERORIA'
      Size = 4
    end
    object sqlCadFuncionarioDTVALIDADECARTEIRAMOT: TDateField
      FieldName = 'DTVALIDADECARTEIRAMOT'
    end
    object sqlCadFuncionarioTLRESIDENCIAL: TStringField
      FieldName = 'TLRESIDENCIAL'
      Size = 15
    end
    object sqlCadFuncionarioTLCELULAR: TStringField
      FieldName = 'TLCELULAR'
      Size = 15
    end
    object sqlCadFuncionarioTLCONTATO: TStringField
      FieldName = 'TLCONTATO'
      Size = 15
    end
    object sqlCadFuncionarioNMCONTATO: TStringField
      FieldName = 'NMCONTATO'
      Size = 50
    end
    object sqlCadFuncionarioDTCONTRATACAO: TDateField
      FieldName = 'DTCONTRATACAO'
    end
    object sqlCadFuncionarioDTDEMISSAO: TDateField
      FieldName = 'DTDEMISSAO'
    end
    object sqlCadFuncionarioDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
    end
    object sqlCadFuncionarioSTATIVO: TStringField
      FieldName = 'STATIVO'
      FixedChar = True
      Size = 1
    end
    object sqlCadFuncionarioTXOBS: TStringField
      FieldName = 'TXOBS'
      Size = 1000
    end
    object sqlCadFuncionarioNMENDERECO: TStringField
      FieldName = 'NMENDERECO'
      Size = 100
    end
    object sqlCadFuncionarioNOENDERECO: TStringField
      FieldName = 'NOENDERECO'
      Size = 10
    end
    object sqlCadFuncionarioNMBAIRRO: TStringField
      FieldName = 'NMBAIRRO'
      Size = 100
    end
    object sqlCadFuncionarioIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
    end
    object sqlCadFuncionarioIDUF: TIntegerField
      FieldName = 'IDUF'
    end
    object sqlCadFuncionarioNOCEP: TStringField
      FieldName = 'NOCEP'
      Size = 10
    end
    object sqlCadFuncionarioSTEXCLUIDO: TStringField
      FieldName = 'STEXCLUIDO'
      FixedChar = True
      Size = 1
    end
    object sqlCadFuncionarioDTEXCLUIDO: TDateField
      FieldName = 'DTEXCLUIDO'
    end
  end
  object dspPqFuncionario: TDataSetProvider
    DataSet = sqlPqFuncionario
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 216
    Top = 32
  end
  object dspCadFuncionario: TDataSetProvider
    DataSet = sqlCadFuncionario
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 216
    Top = 88
  end
  object cdsPqFuncionario: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT FUNC.IDFUNCIONARIO, FUNC.NMFUNCIONARIO, FUNC.NOCPF, FUNC.' +
      'STATIVO, FUNC.TXEMAIL,'#13#10'FUNC.DTNASCIMENTO, FUNC.DTCONTRATACAO, F' +
      'UNC.DTDEMISSAO, FUNC.TLRESIDENCIAL, FUNC.TLCELULAR FROM CADFUNCI' +
      'ONARIOS FUNC'
    Params = <>
    ProviderName = 'dspPqFuncionario'
    Left = 344
    Top = 32
    object cdsPqFuncionarioIDFUNCIONARIO: TIntegerField
      FieldName = 'IDFUNCIONARIO'
      Required = True
    end
    object cdsPqFuncionarioNMFUNCIONARIO: TStringField
      FieldName = 'NMFUNCIONARIO'
      Size = 100
    end
    object cdsPqFuncionarioNOCPF: TStringField
      FieldName = 'NOCPF'
      OnGetText = cdsPqFuncionarioNOCPFGetText
      Size = 18
    end
    object cdsPqFuncionarioSTATIVO: TStringField
      FieldName = 'STATIVO'
      OnGetText = cdsPqFuncionarioSTATIVOGetText
      FixedChar = True
      Size = 1
    end
    object cdsPqFuncionarioTXEMAIL: TStringField
      FieldName = 'TXEMAIL'
      Size = 100
    end
    object cdsPqFuncionarioDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
    end
    object cdsPqFuncionarioDTCONTRATACAO: TDateField
      FieldName = 'DTCONTRATACAO'
    end
    object cdsPqFuncionarioDTDEMISSAO: TDateField
      FieldName = 'DTDEMISSAO'
    end
    object cdsPqFuncionarioTLRESIDENCIAL: TStringField
      FieldName = 'TLRESIDENCIAL'
      Size = 15
    end
    object cdsPqFuncionarioTLCELULAR: TStringField
      FieldName = 'TLCELULAR'
      Size = 15
    end
  end
  object cdsCadFuncionario: TClientDataSet
    Aggregates = <>
    CommandText = 
      'SELECT * FROM CADFUNCIONARIOS FUNC WHERE FUNC.IDFUNCIONARIO = :I' +
      'DFUNCIONARIO'
    Params = <
      item
        DataType = ftWideString
        Name = 'IDFUNCIONARIO'
        ParamType = ptUnknown
        Value = '-1'
      end>
    ProviderName = 'dspCadFuncionario'
    AfterOpen = cdsCadFuncionarioAfterOpen
    AfterPost = cdsCadFuncionarioAfterPost
    Left = 344
    Top = 88
    object cdsCadFuncionarioIDFUNCIONARIO: TIntegerField
      FieldName = 'IDFUNCIONARIO'
    end
    object cdsCadFuncionarioNMFUNCIONARIO: TStringField
      FieldName = 'NMFUNCIONARIO'
      Size = 100
    end
    object cdsCadFuncionarioNOCPF: TStringField
      FieldName = 'NOCPF'
      OnGetText = cdsCadFuncionarioNOCPFGetText
      Size = 18
    end
    object cdsCadFuncionarioNORG: TStringField
      FieldName = 'NORG'
      Size = 15
    end
    object cdsCadFuncionarioDTNASCIMENTO: TDateField
      FieldName = 'DTNASCIMENTO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsCadFuncionarioTXEMAIL: TStringField
      FieldName = 'TXEMAIL'
      Size = 100
    end
    object cdsCadFuncionarioNOCARTEIRATRAB: TStringField
      FieldName = 'NOCARTEIRATRAB'
    end
    object cdsCadFuncionarioNOTITULOELEITOR: TStringField
      FieldName = 'NOTITULOELEITOR'
      Size = 12
    end
    object cdsCadFuncionarioNOCARTEIRAMOTORISTA: TStringField
      FieldName = 'NOCARTEIRAMOTORISTA'
      Size = 15
    end
    object cdsCadFuncionarioDTVALIDADECARTEIRAMOT: TDateField
      FieldName = 'DTVALIDADECARTEIRAMOT'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsCadFuncionarioTLRESIDENCIAL: TStringField
      FieldName = 'TLRESIDENCIAL'
      OnGetText = cdsCadFuncionarioTLRESIDENCIALGetText
      Size = 15
    end
    object cdsCadFuncionarioTLCELULAR: TStringField
      FieldName = 'TLCELULAR'
      OnGetText = cdsCadFuncionarioTLCELULARGetText
      Size = 15
    end
    object cdsCadFuncionarioTLCONTATO: TStringField
      FieldName = 'TLCONTATO'
      OnGetText = cdsCadFuncionarioTLCONTATOGetText
      Size = 15
    end
    object cdsCadFuncionarioNMCONTATO: TStringField
      FieldName = 'NMCONTATO'
      Size = 50
    end
    object cdsCadFuncionarioDTCONTRATACAO: TDateField
      FieldName = 'DTCONTRATACAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsCadFuncionarioDTDEMISSAO: TDateField
      FieldName = 'DTDEMISSAO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsCadFuncionarioDTCADASTRO: TDateField
      FieldName = 'DTCADASTRO'
      DisplayFormat = 'dd/mm/yyyy'
      EditMask = '!99/99/9999;1;_'
    end
    object cdsCadFuncionarioSTATIVO: TStringField
      FieldName = 'STATIVO'
      FixedChar = True
      Size = 1
    end
    object cdsCadFuncionarioTXOBS: TStringField
      FieldName = 'TXOBS'
      Size = 1000
    end
    object cdsCadFuncionarioNMENDERECO: TStringField
      FieldName = 'NMENDERECO'
      Size = 100
    end
    object cdsCadFuncionarioNOENDERECO: TStringField
      FieldName = 'NOENDERECO'
      Size = 10
    end
    object cdsCadFuncionarioNMBAIRRO: TStringField
      FieldName = 'NMBAIRRO'
      Size = 100
    end
    object cdsCadFuncionarioIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
    end
    object cdsCadFuncionarioIDUF: TIntegerField
      FieldName = 'IDUF'
    end
    object cdsCadFuncionarioNOCEP: TStringField
      FieldName = 'NOCEP'
      Size = 10
    end
    object cdsCadFuncionarioSTEXCLUIDO: TStringField
      FieldName = 'STEXCLUIDO'
      FixedChar = True
      Size = 1
    end
    object cdsCadFuncionarioDTEXCLUIDO: TDateField
      FieldName = 'DTEXCLUIDO'
    end
    object cdsCadFuncionarioIDEMPRESA: TIntegerField
      FieldName = 'IDEMPRESA'
    end
    object cdsCadFuncionarioTPCATERORIA: TStringField
      FieldName = 'TPCATERORIA'
      Size = 4
    end
  end
  object dspComboCidade: TDataSetProvider
    DataSet = sqlComboCidade
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 216
    Top = 144
  end
  object dspComboUF: TDataSetProvider
    DataSet = sqlComboUF
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 216
    Top = 200
  end
  object cdsComboCidade: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM CADCIDADE CID ORDER BY CID.NMCIDADE'
    Params = <>
    ProviderName = 'dspComboCidade'
    Left = 344
    Top = 144
    object cdsComboCidadeIDCIDADE: TIntegerField
      FieldName = 'IDCIDADE'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object cdsComboCidadeNMCIDADE: TStringField
      FieldName = 'NMCIDADE'
      Size = 100
    end
    object cdsComboCidadeIDUF: TIntegerField
      FieldName = 'IDUF'
      Required = True
    end
    object cdsComboCidadeNOIBGE: TStringField
      FieldName = 'NOIBGE'
      Size = 7
    end
  end
  object cdsComboUF: TClientDataSet
    Aggregates = <>
    CommandText = 'SELECT * FROM CADUF EST ORDER BY EST.SGESTADO'
    Params = <>
    ProviderName = 'dspComboUF'
    Left = 344
    Top = 200
    object cdsComboUFIDUF: TIntegerField
      FieldName = 'IDUF'
      Required = True
    end
    object cdsComboUFNMESTADO: TStringField
      FieldName = 'NMESTADO'
      Size = 50
    end
    object cdsComboUFSGESTADO: TStringField
      FieldName = 'SGESTADO'
      FixedChar = True
      Size = 3
    end
  end
  object sqlComboCidade: TSQLDataSet
    CommandText = 'SELECT * FROM CADCIDADE CID ORDER BY CID.NMCIDADE'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmPrincipal.Conexao
    Left = 72
    Top = 144
  end
  object sqlComboUF: TSQLDataSet
    CommandText = 'SELECT * FROM CADUF EST ORDER BY EST.SGESTADO'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmPrincipal.Conexao
    Left = 72
    Top = 200
  end
end
