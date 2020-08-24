inherited frmFuncionarios: TfrmFuncionarios
  Caption = 'Cadastro de funcion'#225'rios'
  ClientHeight = 468
  ClientWidth = 771
  ExplicitWidth = 787
  ExplicitHeight = 507
  PixelsPerInch = 96
  TextHeight = 13
  object Label26: TLabel [0]
    Left = 550
    Top = 60
    Width = 81
    Height = 13
    Caption = 'Data Nascimento'
  end
  object Label27: TLabel [1]
    Left = 657
    Top = 60
    Width = 70
    Height = 13
    Caption = 'Data Cadastro'
  end
  inherited pnMenu: TPanel
    Top = 430
    Width = 771
    ExplicitTop = 432
    ExplicitWidth = 771
    inherited btnExcluir: TButton
      OnClick = btnExcluirClick
    end
    inherited btnFechar: TButton
      Left = 689
      ExplicitLeft = 689
    end
  end
  inherited pcPrincipal: TPageControl
    Width = 771
    Height = 430
    ExplicitWidth = 771
    ExplicitHeight = 430
    inherited tabPesquisar: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 763
      ExplicitHeight = 402
      inherited Panel1: TPanel
        Width = 763
        ExplicitWidth = 763
        object Label30: TLabel [1]
          Left = 310
          Top = 0
          Width = 53
          Height = 13
          Caption = 'Data Inicial'
        end
        object Label31: TLabel [2]
          Left = 402
          Top = 0
          Width = 48
          Height = 13
          Caption = 'Data Final'
        end
        inherited btnBuscar: TButton
          Left = 576
          TabOrder = 3
          OnClick = btnBuscarClick
          ExplicitLeft = 576
        end
        inherited edtFiltro: TEdit
          Width = 294
          TabOrder = 0
          ExplicitWidth = 294
        end
        object btnExportar: TButton
          Left = 679
          Top = 2
          Width = 75
          Height = 34
          Caption = 'Exportar'
          TabOrder = 4
          TabStop = False
          OnClick = btnExportarClick
        end
        object dtpkFinal: TDateTimePicker
          Left = 402
          Top = 14
          Width = 85
          Height = 21
          Date = 44067.433353657410000000
          Time = 44067.433353657410000000
          TabOrder = 2
          OnChange = dtpkFinalChange
        end
        object dtpkInicial: TDateTimePicker
          Left = 310
          Top = 14
          Width = 85
          Height = 21
          Date = 44067.433353657410000000
          Time = 44067.433353657410000000
          TabOrder = 1
          OnChange = dtpkInicialChange
        end
        object ckFiltroData: TCheckBox
          Left = 493
          Top = 16
          Width = 70
          Height = 17
          TabStop = False
          Caption = 'Filtro Data'
          TabOrder = 5
        end
      end
      inherited grDados: TDBGrid
        Width = 763
        Height = 361
        DataSource = dsPqFuncionario
        OnDblClick = grDadosDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'IDFUNCIONARIO'
            Title.Caption = 'C'#243'digo'
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NMFUNCIONARIO'
            Title.Caption = 'Nome'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOCPF'
            Title.Caption = 'CPF'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATIVO'
            Title.Caption = 'Ativo'
            Width = 40
            Visible = True
          end>
      end
    end
    inherited tabDados: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 763
      ExplicitHeight = 402
      object Label2: TLabel
        Left = 11
        Top = 9
        Width = 33
        Height = 13
        Caption = 'C'#243'digo'
      end
      object Label3: TLabel
        Left = 138
        Top = 9
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label4: TLabel
        Left = 276
        Top = 52
        Width = 41
        Height = 13
        Caption = 'Empresa'
      end
      object Label5: TLabel
        Left = 11
        Top = 52
        Width = 19
        Height = 13
        Caption = 'CPF'
      end
      object Label6: TLabel
        Left = 161
        Top = 52
        Width = 14
        Height = 13
        Caption = 'RG'
      end
      object Label7: TLabel
        Left = 542
        Top = 52
        Width = 81
        Height = 13
        Caption = 'Data Nascimento'
      end
      object Label8: TLabel
        Left = 649
        Top = 52
        Width = 70
        Height = 13
        Caption = 'Data Cadastro'
      end
      object Label9: TLabel
        Left = 241
        Top = 96
        Width = 28
        Height = 13
        Caption = 'E-mail'
      end
      object Label10: TLabel
        Left = 11
        Top = 219
        Width = 58
        Height = 13
        Caption = 'Observa'#231#227'o'
      end
      object Label11: TLabel
        Left = 11
        Top = 136
        Width = 98
        Height = 13
        Caption = 'Telefone Residencial'
      end
      object Label12: TLabel
        Left = 130
        Top = 136
        Width = 78
        Height = 13
        Caption = 'Telefone Celular'
      end
      object Label13: TLabel
        Left = 249
        Top = 136
        Width = 81
        Height = 13
        Caption = 'Telefone Recado'
      end
      object Label15: TLabel
        Left = 368
        Top = 136
        Width = 66
        Height = 13
        Caption = 'Nome Recado'
      end
      object Label14: TLabel
        Left = 11
        Top = 177
        Width = 84
        Height = 13
        Caption = 'Carteira Trabalho'
      end
      object Label22: TLabel
        Left = 161
        Top = 177
        Width = 59
        Height = 13
        Caption = 'T'#237'tulo Eleitor'
      end
      object Label23: TLabel
        Left = 328
        Top = 177
        Width = 102
        Height = 13
        Caption = 'Carteira de Motorista'
      end
      object Label24: TLabel
        Left = 490
        Top = 177
        Width = 47
        Height = 13
        Caption = 'Categoria'
      end
      object Label25: TLabel
        Left = 553
        Top = 177
        Width = 97
        Height = 13
        Caption = 'Vencimento Carteira'
      end
      object Label28: TLabel
        Left = 11
        Top = 94
        Width = 71
        Height = 13
        Caption = 'Data Admiss'#227'o'
      end
      object Label29: TLabel
        Left = 126
        Top = 94
        Width = 71
        Height = 13
        Caption = 'Data Demiss'#227'o'
      end
      object dbIDFUNCIONARIO: TDBEdit
        Left = 11
        Top = 24
        Width = 121
        Height = 21
        DataField = 'IDFUNCIONARIO'
        DataSource = dsPrincipal
        TabOrder = 0
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 276
        Top = 67
        Width = 260
        Height = 21
        DataField = 'IDEMPRESA'
        DataSource = dsPrincipal
        KeyField = 'IDEMPRESA'
        ListField = 'NMEMPRESA;IDEMPRESA'
        TabOrder = 5
      end
      object dbNMFUNCIONARIO: TDBEdit
        Left = 138
        Top = 24
        Width = 543
        Height = 21
        DataField = 'NMFUNCIONARIO'
        DataSource = dsPrincipal
        TabOrder = 1
      end
      object dbNOCPF: TDBEdit
        Left = 11
        Top = 67
        Width = 144
        Height = 21
        DataField = 'NOCPF'
        DataSource = dsPrincipal
        MaxLength = 14
        TabOrder = 3
      end
      object dbNORG: TDBEdit
        Left = 161
        Top = 67
        Width = 109
        Height = 21
        DataField = 'NORG'
        DataSource = dsPrincipal
        TabOrder = 4
      end
      object dbDTNASCIMENTO: TDBEdit
        Left = 542
        Top = 67
        Width = 102
        Height = 21
        DataField = 'DTNASCIMENTO'
        DataSource = dsPrincipal
        TabOrder = 6
      end
      object dbDTCADASTRO: TDBEdit
        Left = 649
        Top = 67
        Width = 102
        Height = 21
        DataField = 'DTCADASTRO'
        DataSource = dsPrincipal
        TabOrder = 7
      end
      object dbTXEMAIL: TDBEdit
        Left = 241
        Top = 111
        Width = 510
        Height = 21
        DataField = 'TXEMAIL'
        DataSource = dsPrincipal
        TabOrder = 10
      end
      object dbTXOBS: TDBMemo
        Left = 11
        Top = 234
        Width = 740
        Height = 56
        DataField = 'TXOBS'
        DataSource = dsPrincipal
        TabOrder = 20
      end
      object dbTLRESIDENCIAL: TDBEdit
        Left = 11
        Top = 151
        Width = 113
        Height = 21
        DataField = 'TLRESIDENCIAL'
        DataSource = dsPrincipal
        TabOrder = 11
      end
      object dbTLCELULAR: TDBEdit
        Left = 130
        Top = 152
        Width = 113
        Height = 21
        DataField = 'TLCELULAR'
        DataSource = dsPrincipal
        TabOrder = 12
      end
      object dbTLCONTATO: TDBEdit
        Left = 249
        Top = 151
        Width = 113
        Height = 21
        DataField = 'TLCONTATO'
        DataSource = dsPrincipal
        TabOrder = 13
      end
      object dbNMCONTATO: TDBEdit
        Left = 368
        Top = 151
        Width = 264
        Height = 21
        DataField = 'NMCONTATO'
        DataSource = dsPrincipal
        TabOrder = 14
      end
      object GroupBox1: TGroupBox
        Left = 2
        Top = 304
        Width = 758
        Height = 98
        Caption = 'Dados Endere'#231'o'
        TabOrder = 21
        object Label16: TLabel
          Left = 14
          Top = 14
          Width = 19
          Height = 13
          Caption = 'CEP'
        end
        object Label17: TLabel
          Left = 98
          Top = 14
          Width = 55
          Height = 13
          Caption = 'Logradouro'
        end
        object Label18: TLabel
          Left = 443
          Top = 14
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
        end
        object Label19: TLabel
          Left = 14
          Top = 54
          Width = 28
          Height = 13
          Caption = 'Bairro'
        end
        object Label20: TLabel
          Left = 292
          Top = 54
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label21: TLabel
          Left = 644
          Top = 54
          Width = 13
          Height = 13
          Caption = 'UF'
        end
        object dbNOCEP: TDBEdit
          Left = 14
          Top = 29
          Width = 78
          Height = 21
          DataField = 'NOCEP'
          DataSource = dsPrincipal
          TabOrder = 0
        end
        object dbNMENDERECO: TDBEdit
          Left = 98
          Top = 29
          Width = 338
          Height = 21
          DataField = 'NMENDERECO'
          DataSource = dsPrincipal
          TabOrder = 1
        end
        object dbNOENDERECO: TDBEdit
          Left = 442
          Top = 29
          Width = 109
          Height = 21
          DataField = 'NOENDERECO'
          DataSource = dsPrincipal
          TabOrder = 2
        end
        object dbNMBAIRRO: TDBEdit
          Left = 14
          Top = 69
          Width = 273
          Height = 21
          DataField = 'NMBAIRRO'
          DataSource = dsPrincipal
          TabOrder = 3
        end
        object dbNMCIDADE: TDBLookupComboBox
          Left = 292
          Top = 69
          Width = 346
          Height = 21
          DataField = 'IDCIDADE'
          DataSource = dsPrincipal
          KeyField = 'IDCIDADE'
          ListField = 'NMCIDADE'
          ListSource = dsComboCidade
          TabOrder = 4
        end
        object dbSGUF: TDBLookupComboBox
          Left = 644
          Top = 69
          Width = 70
          Height = 21
          DataField = 'IDUF'
          DataSource = dsPrincipal
          KeyField = 'IDUF'
          ListField = 'SGESTADO'
          ListSource = dsComboUF
          TabOrder = 5
        end
      end
      object dbSTATIVO: TDBCheckBox
        Left = 692
        Top = 26
        Width = 49
        Height = 17
        Caption = 'Ativo'
        DataField = 'STATIVO'
        DataSource = dsPrincipal
        TabOrder = 2
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbNOCARTEIRATRAB: TDBEdit
        Left = 11
        Top = 192
        Width = 144
        Height = 21
        DataField = 'NOCARTEIRATRAB'
        DataSource = dsPrincipal
        TabOrder = 15
      end
      object dbNOTITULOELEITOR: TDBEdit
        Left = 161
        Top = 192
        Width = 161
        Height = 21
        DataField = 'NOTITULOELEITOR'
        DataSource = dsPrincipal
        TabOrder = 16
      end
      object dbNOCARTEIRAMOTORISTA: TDBEdit
        Left = 328
        Top = 192
        Width = 156
        Height = 21
        DataField = 'NOCARTEIRAMOTORISTA'
        DataSource = dsPrincipal
        TabOrder = 17
      end
      object dbTPCATERORIA: TDBEdit
        Left = 490
        Top = 192
        Width = 57
        Height = 21
        DataField = 'TPCATERORIA'
        DataSource = dsPrincipal
        TabOrder = 18
      end
      object dbDTVALIDADECARTEIRAMOT: TDBEdit
        Left = 553
        Top = 192
        Width = 109
        Height = 21
        DataField = 'DTVALIDADECARTEIRAMOT'
        DataSource = dsPrincipal
        TabOrder = 19
      end
      object dbDTCONTRATACAO: TDBEdit
        Left = 11
        Top = 111
        Width = 110
        Height = 21
        DataField = 'DTCONTRATACAO'
        DataSource = dsPrincipal
        TabOrder = 8
      end
      object dbDTDEMISSAO: TDBEdit
        Left = 126
        Top = 111
        Width = 110
        Height = 21
        DataField = 'DTDEMISSAO'
        DataSource = dsPrincipal
        TabOrder = 9
      end
    end
  end
  inherited dsPrincipal: TDataSource
    DataSet = dmFuncionarios.cdsCadFuncionario
    Left = 176
    Top = 65528
  end
  object dsPqFuncionario: TDataSource
    DataSet = dmFuncionarios.cdsPqFuncionario
    Left = 376
    Top = 65520
  end
  object dsComboCidade: TDataSource
    DataSet = dmFuncionarios.cdsComboCidade
    Left = 384
    Top = 384
  end
  object dsComboUF: TDataSource
    DataSet = dmFuncionarios.cdsComboUF
    Left = 656
    Top = 384
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'CSV'
    Filter = 'CSV|*.CSV'
    Left = 400
    Top = 160
  end
end
