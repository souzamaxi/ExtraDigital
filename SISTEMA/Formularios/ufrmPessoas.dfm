inherited frmPessoas: TfrmPessoas
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 495
  ClientWidth = 769
  ExplicitWidth = 785
  ExplicitHeight = 534
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnMenu: TPanel
    Top = 456
    Width = 769
    Height = 39
    ExplicitTop = 456
    ExplicitWidth = 769
    ExplicitHeight = 39
    inherited btnExcluir: TButton
      OnClick = btnExcluirClick
    end
    inherited btnFechar: TButton
      Left = 687
      ExplicitLeft = 687
    end
  end
  inherited pcPrincipal: TPageControl
    Width = 769
    Height = 456
    ExplicitWidth = 769
    ExplicitHeight = 456
    inherited tabPesquisar: TTabSheet
      ExplicitWidth = 761
      ExplicitHeight = 428
      inherited Panel1: TPanel
        Width = 761
        ExplicitWidth = 761
        inherited btnBuscar: TButton
          Left = 423
          OnClick = btnBuscarClick
          ExplicitLeft = 423
        end
      end
      inherited grDados: TDBGrid
        Width = 761
        Height = 387
        DataSource = dsPqPessoas
        OnDblClick = grDadosDblClick
        Columns = <
          item
            Expanded = False
            FieldName = 'IDTITULAR'
            Title.Caption = 'C'#243'digo'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NMTITULAR'
            Title.Caption = 'Nome Pessoa'
            Width = 280
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOCNPJCPF'
            Title.Caption = 'CNPJ/CPF'
            Width = 120
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NMEMPRESA'
            Title.Caption = 'Empresa'
            Width = 160
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATIVO'
            Title.Caption = 'Ativo'
            Width = 30
            Visible = True
          end>
      end
    end
    inherited tabDados: TTabSheet
      ExplicitWidth = 761
      ExplicitHeight = 428
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
        Left = 375
        Top = 51
        Width = 41
        Height = 13
        Caption = 'Empresa'
      end
      object Label5: TLabel
        Left = 11
        Top = 52
        Width = 48
        Height = 13
        Caption = 'CNPJ/CPF'
      end
      object Label6: TLabel
        Left = 217
        Top = 52
        Width = 75
        Height = 13
        Caption = 'Insci'#231#227'o Est/RG'
      end
      object Label7: TLabel
        Left = 11
        Top = 96
        Width = 81
        Height = 13
        Caption = 'Data Nascimento'
      end
      object Label8: TLabel
        Left = 126
        Top = 96
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
        Top = 177
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
        Left = 368
        Top = 136
        Width = 81
        Height = 13
        Caption = 'Telefone Recado'
      end
      object Label14: TLabel
        Left = 249
        Top = 136
        Width = 91
        Height = 13
        Caption = 'Telefone Comercial'
      end
      object Label15: TLabel
        Left = 487
        Top = 136
        Width = 66
        Height = 13
        Caption = 'Nome Recado'
      end
      object dbIDTITULAR: TDBEdit
        Left = 11
        Top = 24
        Width = 121
        Height = 21
        DataField = 'IDTITULAR'
        DataSource = dsPrincipal
        TabOrder = 0
      end
      object DBLookupComboBox1: TDBLookupComboBox
        Left = 375
        Top = 67
        Width = 376
        Height = 21
        DataField = 'IDEMPRESA'
        DataSource = dsPrincipal
        KeyField = 'IDEMPRESA'
        ListField = 'NMEMPRESA;IDEMPRESA'
        ListSource = dsComboEmpresa
        TabOrder = 3
      end
      object dbNMTITULAR: TDBEdit
        Left = 138
        Top = 24
        Width = 543
        Height = 21
        DataField = 'NMTITULAR'
        DataSource = dsPrincipal
        TabOrder = 1
      end
      object dbNOCNPJCPF: TDBEdit
        Left = 11
        Top = 67
        Width = 199
        Height = 21
        DataField = 'NOCNPJCPF'
        DataSource = dsPrincipal
        MaxLength = 14
        TabOrder = 4
      end
      object dbNOINCRICAORG: TDBEdit
        Left = 217
        Top = 67
        Width = 151
        Height = 21
        DataField = 'NOINCRICAORG'
        DataSource = dsPrincipal
        TabOrder = 5
      end
      object dbDTNASCIMENTO: TDBEdit
        Left = 11
        Top = 111
        Width = 109
        Height = 21
        DataField = 'DTNASCIMENTO'
        DataSource = dsPrincipal
        TabOrder = 6
      end
      object dbDTCADASTRO: TDBEdit
        Left = 126
        Top = 111
        Width = 109
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
        TabOrder = 8
      end
      object dbTXOBS: TDBMemo
        Left = 11
        Top = 192
        Width = 740
        Height = 56
        DataField = 'TXOBS'
        DataSource = dsPrincipal
        TabOrder = 14
      end
      object dbTLRESIDENCIAL: TDBEdit
        Left = 11
        Top = 151
        Width = 113
        Height = 21
        DataField = 'TLRESIDENCIAL'
        DataSource = dsPrincipal
        TabOrder = 9
      end
      object dbTLCELULAR: TDBEdit
        Left = 130
        Top = 151
        Width = 113
        Height = 21
        DataField = 'TLCELULAR'
        DataSource = dsPrincipal
        TabOrder = 10
      end
      object dbTLCONTATO: TDBEdit
        Left = 368
        Top = 151
        Width = 113
        Height = 21
        DataField = 'TLCONTATO'
        DataSource = dsPrincipal
        TabOrder = 12
      end
      object dbTLCOMERCIAL: TDBEdit
        Left = 249
        Top = 151
        Width = 113
        Height = 21
        DataField = 'TLCOMERCIAL'
        DataSource = dsPrincipal
        TabOrder = 11
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
      object dbNMCONTATO: TDBEdit
        Left = 487
        Top = 151
        Width = 264
        Height = 21
        DataField = 'NMCONTATO'
        DataSource = dsPrincipal
        TabOrder = 13
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = 255
        Width = 758
        Height = 171
        Caption = 'Dados Endere'#231'o'
        TabOrder = 15
        object Label16: TLabel
          Left = 328
          Top = 16
          Width = 19
          Height = 13
          Caption = 'CEP'
        end
        object Label17: TLabel
          Left = 412
          Top = 16
          Width = 55
          Height = 13
          Caption = 'Logradouro'
        end
        object Label18: TLabel
          Left = 328
          Top = 56
          Width = 37
          Height = 13
          Caption = 'N'#250'mero'
        end
        object Label19: TLabel
          Left = 442
          Top = 56
          Width = 28
          Height = 13
          Caption = 'Bairro'
        end
        object Label20: TLabel
          Left = 328
          Top = 96
          Width = 33
          Height = 13
          Caption = 'Cidade'
        end
        object Label21: TLabel
          Left = 680
          Top = 96
          Width = 13
          Height = 13
          Caption = 'UF'
        end
        object dbNOCEP: TDBEdit
          Left = 328
          Top = 31
          Width = 78
          Height = 21
          DataField = 'NOCEP'
          DataSource = dsCadEndereco
          TabOrder = 0
        end
        object dbNMENDERECO: TDBEdit
          Left = 412
          Top = 31
          Width = 338
          Height = 21
          DataField = 'NMENDERECO'
          DataSource = dsCadEndereco
          TabOrder = 1
        end
        object dbNOENDERECO: TDBEdit
          Left = 327
          Top = 71
          Width = 109
          Height = 21
          DataField = 'NOENDERECO'
          DataSource = dsCadEndereco
          TabOrder = 2
        end
        object dbNMBAIRRO: TDBEdit
          Left = 442
          Top = 71
          Width = 308
          Height = 21
          DataField = 'NMBAIRRO'
          DataSource = dsCadEndereco
          TabOrder = 3
        end
        object dbNMCIDADE: TDBLookupComboBox
          Left = 328
          Top = 111
          Width = 346
          Height = 21
          DataField = 'IDCIDADE'
          DataSource = dsCadEndereco
          KeyField = 'IDCIDADE'
          ListField = 'NMCIDADE'
          ListSource = dsComboCidade
          TabOrder = 4
        end
        object dbSGUF: TDBLookupComboBox
          Left = 680
          Top = 111
          Width = 70
          Height = 21
          DataField = 'IDUF'
          DataSource = dsCadEndereco
          KeyField = 'IDUF'
          ListField = 'SGESTADO'
          ListSource = dsComboUF
          TabOrder = 5
        end
        object Panel2: TPanel
          Left = 2
          Top = 15
          Width = 318
          Height = 154
          Align = alLeft
          Caption = 'Panel2'
          TabOrder = 7
          object grEnderecos: TDBGrid
            Left = 1
            Top = 33
            Width = 316
            Height = 120
            Align = alBottom
            DataSource = dsDetEndereco
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'Tahoma'
            TitleFont.Style = []
            OnCellClick = grEnderecosCellClick
            Columns = <
              item
                Expanded = False
                FieldName = 'SGESTADO'
                Title.Caption = 'UF'
                Width = 30
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NMENDERECO'
                Title.Caption = 'Endere'#231'o'
                Width = 250
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOENDERECO'
                Title.Caption = 'Numero'
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NOCEP'
                Title.Caption = 'CEP'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NMCIDADE'
                Title.Caption = 'Cidade'
                Width = 300
                Visible = True
              end>
          end
          object btnNovoEndereco: TButton
            Left = 75
            Top = 3
            Width = 75
            Height = 27
            Caption = '&Novo'
            TabOrder = 1
            TabStop = False
            OnClick = btnNovoEnderecoClick
          end
          object btnSalvarEndereco: TButton
            Left = 156
            Top = 3
            Width = 75
            Height = 28
            Caption = 'Salvar'
            TabOrder = 2
            TabStop = False
            OnClick = btnSalvarEnderecoClick
          end
          object btnExcluirEndereco: TButton
            Left = 237
            Top = 3
            Width = 75
            Height = 27
            Caption = 'Excluir'
            TabOrder = 3
            TabStop = False
            OnClick = btnExcluirEnderecoClick
          end
        end
        object dbSTATIVOENDERECO: TDBCheckBox
          Left = 327
          Top = 138
          Width = 49
          Height = 17
          Caption = 'Ativo'
          DataField = 'STATIVO'
          DataSource = dsCadEndereco
          TabOrder = 6
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
    end
  end
  object dsPqPessoas: TDataSource [2]
    DataSet = dmPessoas.cdsPqPessoas
    Left = 296
    Top = 65528
  end
  inherited dsPrincipal: TDataSource
    DataSet = dmPessoas.cdsCadPessoa
    Left = 200
    Top = 65528
  end
  object dsComboEmpresa: TDataSource
    DataSet = dmPessoas.cdsComboEmpresa
    Left = 416
    Top = 65528
  end
  object dsDetEndereco: TDataSource
    DataSet = dmPessoas.cdsDetEndereco
    Left = 72
    Top = 376
  end
  object dsCadEndereco: TDataSource
    DataSet = dmPessoas.cdsCadEnderecoPessoa
    OnStateChange = dsCadEnderecoStateChange
    Left = 208
    Top = 384
  end
  object dsComboCidade: TDataSource
    DataSet = dmPessoas.cdsComboCidade
    Left = 432
    Top = 392
  end
  object dsComboUF: TDataSource
    DataSet = dmPessoas.cdsComboUF
    Left = 704
    Top = 392
  end
end
