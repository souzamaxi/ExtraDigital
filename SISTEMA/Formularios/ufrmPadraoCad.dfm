object frmPadraoCad: TfrmPadraoCad
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Cadastro padr'#227'o'
  ClientHeight = 282
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object pnMenu: TPanel
    Left = 0
    Top = 244
    Width = 505
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    DesignSize = (
      505
      38)
    object btnNovo: TButton
      Left = 8
      Top = 2
      Width = 75
      Height = 34
      Caption = '&Novo'
      TabOrder = 0
      TabStop = False
      OnClick = btnNovoClick
    end
    object btnSalvar: TButton
      Left = 85
      Top = 2
      Width = 75
      Height = 34
      Caption = 'Salvar'
      TabOrder = 1
      TabStop = False
      OnClick = btnSalvarClick
    end
    object btnExcluir: TButton
      Left = 162
      Top = 2
      Width = 75
      Height = 34
      Caption = 'Excluir'
      TabOrder = 2
      TabStop = False
    end
    object btnFechar: TButton
      Left = 423
      Top = 2
      Width = 75
      Height = 34
      Anchors = [akTop, akRight]
      Caption = 'Fechar'
      TabOrder = 3
      OnClick = btnFecharClick
    end
    object Button5: TButton
      Left = 216
      Top = 40
      Width = 75
      Height = 25
      Caption = 'Button5'
      TabOrder = 4
    end
  end
  object pcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 505
    Height = 244
    ActivePage = tabPesquisar
    Align = alClient
    TabOrder = 1
    object tabPesquisar: TTabSheet
      Caption = 'Pesquisar'
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 497
        Height = 41
        Align = alTop
        TabOrder = 0
        object Label1: TLabel
          Left = 8
          Top = 0
          Width = 104
          Height = 13
          Caption = 'Dados para pesquisar'
        end
        object btnBuscar: TButton
          Left = 419
          Top = 10
          Width = 71
          Height = 25
          Caption = 'Buscar'
          TabOrder = 0
        end
        object edtFiltro: TEdit
          Left = 8
          Top = 14
          Width = 409
          Height = 21
          TabOrder = 1
        end
      end
      object grDados: TDBGrid
        Left = 0
        Top = 41
        Width = 497
        Height = 175
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object tabDados: TTabSheet
      Caption = 'Dados'
      ImageIndex = 1
    end
  end
  object dsPrincipal: TDataSource
    OnDataChange = dsPrincipalDataChange
    Left = 88
    Top = 120
  end
end
