inherited frmPessoas: TfrmPessoas
  Caption = 'Cadastro de Pessoas'
  ExplicitWidth = 521
  ExplicitHeight = 321
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnMenu: TPanel
    Top = 243
    Height = 39
    ExplicitTop = 243
    ExplicitHeight = 39
    inherited btnExcluir: TButton
      OnClick = btnExcluirClick
    end
  end
  inherited pcPrincipal: TPageControl
    Height = 243
    ActivePage = tabDados
    ExplicitHeight = 243
    inherited tabPesquisar: TTabSheet
      ExplicitLeft = 4
      ExplicitTop = 24
      ExplicitWidth = 497
      ExplicitHeight = 215
      inherited Panel1: TPanel
        ExplicitTop = 0
        inherited btnBuscar: TButton
          Left = 423
          OnClick = btnBuscarClick
          ExplicitLeft = 423
        end
      end
      inherited grDados: TDBGrid
        Height = 174
        DataSource = dsPqPessoas
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
            Width = 250
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOCNPJCPF'
            Title.Caption = 'CNPJ/CPF'
            Width = 100
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
      ExplicitLeft = 1
      ExplicitTop = 24
      ExplicitWidth = 497
      ExplicitHeight = 215
      object Label2: TLabel
        Left = 11
        Top = 9
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object Label3: TLabel
        Left = 138
        Top = 9
        Width = 27
        Height = 13
        Caption = 'Nome'
      end
      object Label4: TLabel
        Left = 11
        Top = 51
        Width = 37
        Height = 13
        Caption = 'C'#243'digo:'
      end
      object Label5: TLabel
        Left = 11
        Top = 97
        Width = 52
        Height = 13
        Caption = 'CNPJ/CPF:'
      end
      object Label6: TLabel
        Left = 138
        Top = 97
        Width = 79
        Height = 13
        Caption = 'Insci'#231#227'o Est/RG:'
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
        Left = 11
        Top = 67
        Width = 222
        Height = 21
        DataField = 'IDEMPRESA'
        DataSource = dsPrincipal
        KeyField = 'IDEMPRESA'
        ListField = 'NMEMPRESA;IDEMPRESA'
        ListSource = dsComboEmpresa
        TabOrder = 2
      end
      object dbNMTITULAR: TDBEdit
        Left = 138
        Top = 24
        Width = 347
        Height = 21
        DataField = 'NMTITULAR'
        DataSource = dsPrincipal
        TabOrder = 1
      end
      object dbNOCNPJCPF: TDBEdit
        Left = 11
        Top = 112
        Width = 121
        Height = 21
        DataField = 'NOCNPJCPF'
        DataSource = dsPrincipal
        TabOrder = 3
      end
      object dbNOINCRICAORG: TDBEdit
        Left = 138
        Top = 112
        Width = 121
        Height = 21
        DataField = 'NOINCRICAORG'
        DataSource = dsPrincipal
        TabOrder = 4
      end
    end
  end
  object dsPqPessoas: TDataSource [2]
    DataSet = dmPessoas.cdsPqPessoas
    Left = 296
    Top = 24
  end
  inherited dsPrincipal: TDataSource
    DataSet = dmPessoas.cdsCadPessoa
  end
  object dsComboEmpresa: TDataSource
    DataSet = dmPessoas.cdsComboEmpresa
    Left = 248
    Top = 144
  end
end
