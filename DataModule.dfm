object damod: Tdamod
  OldCreateOrder = False
  Left = 1306
  Top = 161
  Height = 699
  Width = 213
  object PerpusTara: TZConnection
    ControlsCodePage = cGET_ACP
    AutoEncodeStrings = True
    Properties.Strings = (
      'AutoEncodeStrings=True'
      'controls_cp=GET_ACP')
    Connected = True
    HostName = 'localhost'
    Port = 0
    Database = 'Perpus_Nusa'
    User = 'root'
    Protocol = 'mysql'
    LibraryLocation = 'C:\Delphi7\Lib\libmysql.dll'
    Left = 24
    Top = 8
  end
  object tAnggota: TZQuery
    Connection = PerpusTara
    Active = True
    SQL.Strings = (
      'select * from Anggota;')
    Params = <>
    Left = 80
    Top = 8
  end
  object dsAnggota: TDataSource
    DataSet = tAnggota
    Left = 136
    Top = 8
  end
  object tPuswan: TZQuery
    Connection = PerpusTara
    Active = True
    SQL.Strings = (
      'select * from Pustakawan')
    Params = <>
    Left = 81
    Top = 56
  end
  object dsPuswan: TDataSource
    DataSet = tPuswan
    Left = 136
    Top = 56
  end
  object dsBuku: TDataSource
    DataSet = trBuku
    Left = 136
    Top = 112
  end
  object trBuku: TZQuery
    Connection = PerpusTara
    Active = True
    SQL.Strings = (
      'select * from penulis_buku')
    Params = <>
    Left = 80
    Top = 112
    object trBukuid_penulis: TIntegerField
      FieldName = 'id_penulis'
      Required = True
    end
    object trBukuid_buku: TIntegerField
      FieldName = 'id_buku'
      Required = True
    end
    object trBukuPenulis: TStringField
      FieldKind = fkLookup
      FieldName = 'Penulis'
      LookupDataSet = tPenulis
      LookupKeyFields = 'id_penulis'
      LookupResultField = 'nama_penulis'
      KeyFields = 'id_penulis'
      Size = 50
      Lookup = True
    end
    object trBukuJudulBuku: TStringField
      FieldKind = fkLookup
      FieldName = 'Judul Buku'
      LookupDataSet = tBuku
      LookupKeyFields = 'id_buku'
      LookupResultField = 'judul'
      KeyFields = 'id_buku'
      Size = 50
      Lookup = True
    end
  end
  object dsAnggotaInput: TDataSource
    DataSet = tAnggotaInput
    Left = 136
    Top = 160
  end
  object tAnggotaInput: TZQuery
    Connection = PerpusTara
    Active = True
    SQL.Strings = (
      
        'select nama_anggota, jenis_kelamin_anggota, tempat_lahir_anggota' +
        ', tanggal_lahir_anggota, noTelp_anggota, alamat_anggota, usernam' +
        'e_anggota, password_anggota from anggota;')
    Params = <>
    Left = 80
    Top = 160
  end
  object dsBukuDetail: TDataSource
    DataSet = tBuku
    Left = 24
    Top = 112
  end
  object tPenulis: TZQuery
    Connection = PerpusTara
    Active = True
    SQL.Strings = (
      'select * from penulis;')
    Params = <>
    Left = 80
    Top = 216
  end
  object dsPenulis: TDataSource
    DataSet = tPenulis
    Left = 136
    Top = 216
  end
  object tPenerbit: TZQuery
    Connection = PerpusTara
    Active = True
    SQL.Strings = (
      'select * from penerbit')
    Params = <>
    Left = 24
    Top = 160
  end
  object tKategori: TZQuery
    Connection = PerpusTara
    Active = True
    SQL.Strings = (
      'select * from kategori')
    Params = <>
    Left = 24
    Top = 216
  end
  object tTransaksi: TZQuery
    Connection = PerpusTara
    Active = True
    SQL.Strings = (
      'select * from transaksi;')
    Params = <>
    Left = 80
    Top = 272
  end
  object dsTransaksi: TDataSource
    DataSet = tTransaksi
    Left = 136
    Top = 272
  end
  object fBukuDetail: TSMDBFilterDialog
    Caption = 'Filter setup dialog'
    Dataset = tBuku
    FilterMode = fmFilterDataset
    WildCard = '%'
    Left = 24
    Top = 272
  end
  object sBukuDetail: TSMDBFindDialog
    Caption = 'Record search'
    ShowDialog = True
    DataSource = dsBukuDetail
    FindOption = []
    FindMode = fmBeginPart
    FindScore = fsFromFirst
    SayResult = False
    Left = 24
    Top = 328
  end
  object exBukuDetail: TmxDBGridExport
    DateFormat = 'M/d/yyyy'
    TimeFormat = 'h:mm AMPM'
    DateTimeFormat = 'h:mm AMPM M/d/yyyy'
    ExportType = xtExcel
    ExportTypes = [xtHTML, xtExcel, xtWord, xtTXT, xtCSV, xtTAB, xtRTF, xtDIF, xtSYLK, xtClipboard]
    ExportStyle = xsView
    HTML.CustomColors.Background = clWhite
    HTML.CustomColors.DefaultLink = clRed
    HTML.CustomColors.DefaultFontFace = 'Arial,Helvetica'
    HTML.CustomColors.VisitedLink = clAqua
    HTML.CustomColors.ActiveLink = clBlue
    HTML.CustomColors.DefaultText = clBlack
    HTML.CustomColors.TableFontColor = clBlack
    HTML.CustomColors.TableFontFace = 'Arial,Helvetica'
    HTML.CustomColors.TableBackground = 16777167
    HTML.CustomColors.TableOddBackground = clWhite
    HTML.CustomColors.HeaderBackground = 3368601
    HTML.CustomColors.HeadersFontColor = clWhite
    HTML.Options = [hoShowGridLines, hoBoldHeaders, hoAutoLink, hoOddRowColoring, hoDisplayTitle]
    HTML.Template = ctStandard
    Messages.Caption = 'Exporting DBGrid'
    Messages.CopiedToClipboard = 'Data was copied to clipboard!'
    Messages.CancelCaption = '&Cancel'
    Messages.CreatedText = 'Created:'
    Messages.DocumentFilter.HTML = 'HTML Documents'
    Messages.DocumentFilter.Excel = 'Excel Files'
    Messages.DocumentFilter.Word = 'Word Documents'
    Messages.DocumentFilter.Text = 'Text Files'
    Messages.DocumentFilter.Comma = 'CSV (Comma delimited)'
    Messages.DocumentFilter.Tab = 'Text (Tab delimited)'
    Messages.DocumentFilter.RTF = 'Rich Text Format'
    Messages.DocumentFilter.DIF = 'Data Interchange Format'
    Messages.DocumentFilter.SYLK = 'SYLK Files'
    Messages.ExportCaption = '&Export'
    Messages.ExportToFile = 'Export &to file'
    Messages.FalseText = 'False'
    Messages.Height = 80
    Messages.SaveTitle = 'Save document'
    Messages.SelectFormat = 'E&xport formats:'
    Messages.Text = 'Processing...'
    Messages.TrueText = 'True'
    Messages.Width = 300
    Messages.ViewOnly = '&View only'
    TruncateSymbol = '...'
    RowNumberFormat = '%d'
    DOC_RTF.Template = rtStandard
    DOC_RTF.Options = [roShowGridLines, roOddRowColoring]
    DOC_RTF.CustomSettings.TableBackground = 16777167
    DOC_RTF.CustomSettings.TableOddBackground = clWhite
    DOC_RTF.CustomSettings.HeaderBackground = 3368601
    DOC_RTF.CustomSettings.DefaultFont.Charset = DEFAULT_CHARSET
    DOC_RTF.CustomSettings.DefaultFont.Color = clWindowText
    DOC_RTF.CustomSettings.DefaultFont.Height = -11
    DOC_RTF.CustomSettings.DefaultFont.Name = 'MS Sans Serif'
    DOC_RTF.CustomSettings.DefaultFont.Style = []
    DOC_RTF.CustomSettings.HeaderFont.Charset = DEFAULT_CHARSET
    DOC_RTF.CustomSettings.HeaderFont.Color = clWindowText
    DOC_RTF.CustomSettings.HeaderFont.Height = -11
    DOC_RTF.CustomSettings.HeaderFont.Name = 'MS Sans Serif'
    DOC_RTF.CustomSettings.HeaderFont.Style = [fsBold]
    DOC_RTF.CustomSettings.TableFont.Charset = DEFAULT_CHARSET
    DOC_RTF.CustomSettings.TableFont.Color = clWindowText
    DOC_RTF.CustomSettings.TableFont.Height = -11
    DOC_RTF.CustomSettings.TableFont.Name = 'MS Sans Serif'
    DOC_RTF.CustomSettings.TableFont.Style = []
    DOC_RTF.CellWidth = 1400
    DOC_RTF.TopMargin = 101
    DOC_RTF.BottomMargin = 101
    DOC_RTF.LeftMargin = 461
    DOC_RTF.RightMargin = 562
    EXCEL.Options = [reSetMargins, reUseBorders]
    EXCEL.ColumnWidth = 20
    EXCEL.Protected = False
    EXCEL.Footer = '&P'
    EXCEL.DefaultFont.Charset = DEFAULT_CHARSET
    EXCEL.DefaultFont.Color = clWindowText
    EXCEL.DefaultFont.Height = -11
    EXCEL.DefaultFont.Name = 'MS Sans Serif'
    EXCEL.DefaultFont.Style = []
    EXCEL.HeaderFont.Charset = DEFAULT_CHARSET
    EXCEL.HeaderFont.Color = clWindowText
    EXCEL.HeaderFont.Height = -11
    EXCEL.HeaderFont.Name = 'MS Sans Serif'
    EXCEL.HeaderFont.Style = [fsBold]
    EXCEL.TableFont.Charset = DEFAULT_CHARSET
    EXCEL.TableFont.Color = clWindowText
    EXCEL.TableFont.Height = -11
    EXCEL.TableFont.Name = 'MS Sans Serif'
    EXCEL.TableFont.Style = []
    EXCEL.TopMargin = 0.300000000000000000
    EXCEL.BottomMargin = 0.300000000000000000
    EXCEL.LeftMargin = 0.300000000000000000
    EXCEL.RightMargin = 0.300000000000000000
    Options = [xoClipboardMessage, xoFooterLine, xoHeaderLine, xoShowExportDate, xoShowHeader, xoShowProgress, xoUseAlignments]
    Version = '2.37'
    DBGrid = Form9.dbgBukuDetail
    Left = 80
    Top = 328
  end
  object pBukuDetail: TSMPrintData
    Language.AutoDetect = False
    Language.LanguageID = lnEnglish
    TwoPass = False
    Style.FixedCols = True
    Style.FixedRows = True
    Style.RowStyle = rsNormal
    Style.OddColor = clWhite
    Style.EvenColor = clWhite
    MacroChar = '%'
    WordWrap = False
    Header.Strings = (
      '%A%L%DT%FB'
      ' ')
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    Footer.Strings = (
      '%A%Rpage #%PN/bar #%BN')
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    AnimatedStatus = True
    Frame.Color = clBlack
    Frame.FrameType = []
    Frame.BackColor = clWhite
    Frame.PicType = btNone
    PrinterSetting.PrinterIndex = -1
    PrinterSetting.Margins.ByDefault = True
    PrinterSetting.Margins.Left = 0
    PrinterSetting.Margins.Top = 0
    PrinterSetting.Margins.Right = 0
    PrinterSetting.Margins.Bottom = 0
    PrinterSetting.PaperSize = psDefault
    PrinterSetting.PaperSizeWidth = 0
    PrinterSetting.PaperSizeHeight = 0
    PrinterSetting.Orientation = spoDefault
    PrinterSetting.OutputBin = sbDefault
    PrinterSetting.Duplex = sdDefault
    HighLights = <>
    Calculations = <>
    BlankIfZero = False
    GapHorizontal = 2
    GapVertical = 2
    GridLine.Color = clBtnShadow
    DBGrid = Form9.dbgBukuDetail
    SelectedRecord = False
    PrintRecNo = rnNone
    AutoFit = False
    ColumnSource = csDBGrid
    WordWrapHeader = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Left = 136
    Top = 328
  end
  object tBuku: TZQuery
    Connection = PerpusTara
    Active = True
    SQL.Strings = (
      'select * from buku')
    Params = <>
    Left = 24
    Top = 64
  end
  object sAnggota: TSMDBFindDialog
    Caption = 'Record search'
    ShowDialog = True
    DataSource = dsAnggota
    FindOption = []
    FindMode = fmBeginPart
    FindScore = fsFromFirst
    SayResult = False
    Left = 24
    Top = 384
  end
  object fAnggota: TSMDBFilterDialog
    Caption = 'Filter setup dialog'
    Dataset = tAnggota
    FilterMode = fmFilterDataset
    WildCard = '%'
    Left = 80
    Top = 384
  end
  object exAnggota: TmxDBGridExport
    DateFormat = 'M/d/yyyy'
    TimeFormat = 'h:mm AMPM'
    DateTimeFormat = 'h:mm AMPM M/d/yyyy'
    ExportType = xtExcel
    ExportTypes = [xtHTML, xtExcel, xtWord, xtTXT, xtCSV, xtTAB, xtRTF, xtDIF, xtSYLK, xtClipboard]
    ExportStyle = xsView
    HTML.CustomColors.Background = clWhite
    HTML.CustomColors.DefaultLink = clRed
    HTML.CustomColors.DefaultFontFace = 'Arial,Helvetica'
    HTML.CustomColors.VisitedLink = clAqua
    HTML.CustomColors.ActiveLink = clBlue
    HTML.CustomColors.DefaultText = clBlack
    HTML.CustomColors.TableFontColor = clBlack
    HTML.CustomColors.TableFontFace = 'Arial,Helvetica'
    HTML.CustomColors.TableBackground = 16777167
    HTML.CustomColors.TableOddBackground = clWhite
    HTML.CustomColors.HeaderBackground = 3368601
    HTML.CustomColors.HeadersFontColor = clWhite
    HTML.Options = [hoShowGridLines, hoBoldHeaders, hoAutoLink, hoOddRowColoring, hoDisplayTitle]
    HTML.Template = ctStandard
    Messages.Caption = 'Exporting DBGrid'
    Messages.CopiedToClipboard = 'Data was copied to clipboard!'
    Messages.CancelCaption = '&Cancel'
    Messages.CreatedText = 'Created:'
    Messages.DocumentFilter.HTML = 'HTML Documents'
    Messages.DocumentFilter.Excel = 'Excel Files'
    Messages.DocumentFilter.Word = 'Word Documents'
    Messages.DocumentFilter.Text = 'Text Files'
    Messages.DocumentFilter.Comma = 'CSV (Comma delimited)'
    Messages.DocumentFilter.Tab = 'Text (Tab delimited)'
    Messages.DocumentFilter.RTF = 'Rich Text Format'
    Messages.DocumentFilter.DIF = 'Data Interchange Format'
    Messages.DocumentFilter.SYLK = 'SYLK Files'
    Messages.ExportCaption = '&Export'
    Messages.ExportToFile = 'Export &to file'
    Messages.FalseText = 'False'
    Messages.Height = 80
    Messages.SaveTitle = 'Save document'
    Messages.SelectFormat = 'E&xport formats:'
    Messages.Text = 'Processing...'
    Messages.TrueText = 'True'
    Messages.Width = 300
    Messages.ViewOnly = '&View only'
    TruncateSymbol = '...'
    RowNumberFormat = '%d'
    DOC_RTF.Template = rtStandard
    DOC_RTF.Options = [roShowGridLines, roOddRowColoring]
    DOC_RTF.CustomSettings.TableBackground = 16777167
    DOC_RTF.CustomSettings.TableOddBackground = clWhite
    DOC_RTF.CustomSettings.HeaderBackground = 3368601
    DOC_RTF.CustomSettings.DefaultFont.Charset = DEFAULT_CHARSET
    DOC_RTF.CustomSettings.DefaultFont.Color = clWindowText
    DOC_RTF.CustomSettings.DefaultFont.Height = -11
    DOC_RTF.CustomSettings.DefaultFont.Name = 'MS Sans Serif'
    DOC_RTF.CustomSettings.DefaultFont.Style = []
    DOC_RTF.CustomSettings.HeaderFont.Charset = DEFAULT_CHARSET
    DOC_RTF.CustomSettings.HeaderFont.Color = clWindowText
    DOC_RTF.CustomSettings.HeaderFont.Height = -11
    DOC_RTF.CustomSettings.HeaderFont.Name = 'MS Sans Serif'
    DOC_RTF.CustomSettings.HeaderFont.Style = [fsBold]
    DOC_RTF.CustomSettings.TableFont.Charset = DEFAULT_CHARSET
    DOC_RTF.CustomSettings.TableFont.Color = clWindowText
    DOC_RTF.CustomSettings.TableFont.Height = -11
    DOC_RTF.CustomSettings.TableFont.Name = 'MS Sans Serif'
    DOC_RTF.CustomSettings.TableFont.Style = []
    DOC_RTF.CellWidth = 1400
    DOC_RTF.TopMargin = 101
    DOC_RTF.BottomMargin = 101
    DOC_RTF.LeftMargin = 461
    DOC_RTF.RightMargin = 562
    EXCEL.Options = [reSetMargins, reUseBorders]
    EXCEL.ColumnWidth = 20
    EXCEL.Protected = False
    EXCEL.Footer = '&P'
    EXCEL.DefaultFont.Charset = DEFAULT_CHARSET
    EXCEL.DefaultFont.Color = clWindowText
    EXCEL.DefaultFont.Height = -11
    EXCEL.DefaultFont.Name = 'MS Sans Serif'
    EXCEL.DefaultFont.Style = []
    EXCEL.HeaderFont.Charset = DEFAULT_CHARSET
    EXCEL.HeaderFont.Color = clWindowText
    EXCEL.HeaderFont.Height = -11
    EXCEL.HeaderFont.Name = 'MS Sans Serif'
    EXCEL.HeaderFont.Style = [fsBold]
    EXCEL.TableFont.Charset = DEFAULT_CHARSET
    EXCEL.TableFont.Color = clWindowText
    EXCEL.TableFont.Height = -11
    EXCEL.TableFont.Name = 'MS Sans Serif'
    EXCEL.TableFont.Style = []
    EXCEL.TopMargin = 0.300000000000000000
    EXCEL.BottomMargin = 0.300000000000000000
    EXCEL.LeftMargin = 0.300000000000000000
    EXCEL.RightMargin = 0.300000000000000000
    Options = [xoClipboardMessage, xoFooterLine, xoHeaderLine, xoShowExportDate, xoShowHeader, xoShowProgress, xoUseAlignments]
    Version = '2.37'
    DBGrid = Form11.dbgAnggota
    Left = 136
    Top = 384
  end
  object pAnggota: TSMPrintData
    Language.AutoDetect = False
    Language.LanguageID = lnEnglish
    TwoPass = False
    Style.FixedCols = True
    Style.FixedRows = True
    Style.RowStyle = rsNormal
    Style.OddColor = clWhite
    Style.EvenColor = clWhite
    MacroChar = '%'
    WordWrap = False
    Header.Strings = (
      '%A%L%DT%FB'
      ' ')
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    Footer.Strings = (
      '%A%Rpage #%PN/bar #%BN')
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    AnimatedStatus = True
    Frame.Color = clBlack
    Frame.FrameType = []
    Frame.BackColor = clWhite
    Frame.PicType = btNone
    PrinterSetting.PrinterIndex = -1
    PrinterSetting.Margins.ByDefault = True
    PrinterSetting.Margins.Left = 0
    PrinterSetting.Margins.Top = 0
    PrinterSetting.Margins.Right = 0
    PrinterSetting.Margins.Bottom = 0
    PrinterSetting.PaperSize = psDefault
    PrinterSetting.PaperSizeWidth = 0
    PrinterSetting.PaperSizeHeight = 0
    PrinterSetting.Orientation = spoDefault
    PrinterSetting.OutputBin = sbDefault
    PrinterSetting.Duplex = sdDefault
    HighLights = <>
    Calculations = <>
    BlankIfZero = False
    GapHorizontal = 2
    GapVertical = 2
    GridLine.Color = clBtnShadow
    DBGrid = Form11.dbgAnggota
    DataSet = tAnggota
    SelectedRecord = False
    PrintRecNo = rnNone
    AutoFit = False
    ColumnSource = csDBGrid
    WordWrapHeader = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Left = 24
    Top = 440
  end
  object sTransaksi: TSMDBFindDialog
    Caption = 'Record search'
    ShowDialog = True
    DataSource = dsTransaksi
    FindOption = []
    FindMode = fmBeginPart
    FindScore = fsFromFirst
    SayResult = False
    Left = 80
    Top = 440
  end
  object fTransaksi: TSMDBFilterDialog
    Caption = 'Filter setup dialog'
    Dataset = tTransaksi
    FilterMode = fmFilterDataset
    WildCard = '%'
    Left = 136
    Top = 440
  end
  object exTransaksi: TmxDBGridExport
    DateFormat = 'M/d/yyyy'
    TimeFormat = 'h:mm AMPM'
    DateTimeFormat = 'h:mm AMPM M/d/yyyy'
    ExportType = xtExcel
    ExportTypes = [xtHTML, xtExcel, xtWord, xtTXT, xtCSV, xtTAB, xtRTF, xtDIF, xtSYLK, xtClipboard]
    ExportStyle = xsView
    HTML.CustomColors.Background = clWhite
    HTML.CustomColors.DefaultLink = clRed
    HTML.CustomColors.DefaultFontFace = 'Arial,Helvetica'
    HTML.CustomColors.VisitedLink = clAqua
    HTML.CustomColors.ActiveLink = clBlue
    HTML.CustomColors.DefaultText = clBlack
    HTML.CustomColors.TableFontColor = clBlack
    HTML.CustomColors.TableFontFace = 'Arial,Helvetica'
    HTML.CustomColors.TableBackground = 16777167
    HTML.CustomColors.TableOddBackground = clWhite
    HTML.CustomColors.HeaderBackground = 3368601
    HTML.CustomColors.HeadersFontColor = clWhite
    HTML.Options = [hoShowGridLines, hoBoldHeaders, hoAutoLink, hoOddRowColoring, hoDisplayTitle]
    HTML.Template = ctStandard
    Messages.Caption = 'Exporting DBGrid'
    Messages.CopiedToClipboard = 'Data was copied to clipboard!'
    Messages.CancelCaption = '&Cancel'
    Messages.CreatedText = 'Created:'
    Messages.DocumentFilter.HTML = 'HTML Documents'
    Messages.DocumentFilter.Excel = 'Excel Files'
    Messages.DocumentFilter.Word = 'Word Documents'
    Messages.DocumentFilter.Text = 'Text Files'
    Messages.DocumentFilter.Comma = 'CSV (Comma delimited)'
    Messages.DocumentFilter.Tab = 'Text (Tab delimited)'
    Messages.DocumentFilter.RTF = 'Rich Text Format'
    Messages.DocumentFilter.DIF = 'Data Interchange Format'
    Messages.DocumentFilter.SYLK = 'SYLK Files'
    Messages.ExportCaption = '&Export'
    Messages.ExportToFile = 'Export &to file'
    Messages.FalseText = 'False'
    Messages.Height = 80
    Messages.SaveTitle = 'Save document'
    Messages.SelectFormat = 'E&xport formats:'
    Messages.Text = 'Processing...'
    Messages.TrueText = 'True'
    Messages.Width = 300
    Messages.ViewOnly = '&View only'
    TruncateSymbol = '...'
    RowNumberFormat = '%d'
    DOC_RTF.Template = rtStandard
    DOC_RTF.Options = [roShowGridLines, roOddRowColoring]
    DOC_RTF.CustomSettings.TableBackground = 16777167
    DOC_RTF.CustomSettings.TableOddBackground = clWhite
    DOC_RTF.CustomSettings.HeaderBackground = 3368601
    DOC_RTF.CustomSettings.DefaultFont.Charset = DEFAULT_CHARSET
    DOC_RTF.CustomSettings.DefaultFont.Color = clWindowText
    DOC_RTF.CustomSettings.DefaultFont.Height = -11
    DOC_RTF.CustomSettings.DefaultFont.Name = 'MS Sans Serif'
    DOC_RTF.CustomSettings.DefaultFont.Style = []
    DOC_RTF.CustomSettings.HeaderFont.Charset = DEFAULT_CHARSET
    DOC_RTF.CustomSettings.HeaderFont.Color = clWindowText
    DOC_RTF.CustomSettings.HeaderFont.Height = -11
    DOC_RTF.CustomSettings.HeaderFont.Name = 'MS Sans Serif'
    DOC_RTF.CustomSettings.HeaderFont.Style = [fsBold]
    DOC_RTF.CustomSettings.TableFont.Charset = DEFAULT_CHARSET
    DOC_RTF.CustomSettings.TableFont.Color = clWindowText
    DOC_RTF.CustomSettings.TableFont.Height = -11
    DOC_RTF.CustomSettings.TableFont.Name = 'MS Sans Serif'
    DOC_RTF.CustomSettings.TableFont.Style = []
    DOC_RTF.CellWidth = 1400
    DOC_RTF.TopMargin = 101
    DOC_RTF.BottomMargin = 101
    DOC_RTF.LeftMargin = 461
    DOC_RTF.RightMargin = 562
    EXCEL.Options = [reSetMargins, reUseBorders]
    EXCEL.ColumnWidth = 20
    EXCEL.Protected = False
    EXCEL.Footer = '&P'
    EXCEL.DefaultFont.Charset = DEFAULT_CHARSET
    EXCEL.DefaultFont.Color = clWindowText
    EXCEL.DefaultFont.Height = -11
    EXCEL.DefaultFont.Name = 'MS Sans Serif'
    EXCEL.DefaultFont.Style = []
    EXCEL.HeaderFont.Charset = DEFAULT_CHARSET
    EXCEL.HeaderFont.Color = clWindowText
    EXCEL.HeaderFont.Height = -11
    EXCEL.HeaderFont.Name = 'MS Sans Serif'
    EXCEL.HeaderFont.Style = [fsBold]
    EXCEL.TableFont.Charset = DEFAULT_CHARSET
    EXCEL.TableFont.Color = clWindowText
    EXCEL.TableFont.Height = -11
    EXCEL.TableFont.Name = 'MS Sans Serif'
    EXCEL.TableFont.Style = []
    EXCEL.TopMargin = 0.300000000000000000
    EXCEL.BottomMargin = 0.300000000000000000
    EXCEL.LeftMargin = 0.300000000000000000
    EXCEL.RightMargin = 0.300000000000000000
    Options = [xoClipboardMessage, xoFooterLine, xoHeaderLine, xoShowExportDate, xoShowHeader, xoShowProgress, xoUseAlignments]
    Version = '2.37'
    DBGrid = Form12.dbgTransaksi
    Left = 24
    Top = 496
  end
  object pTransaksi: TSMPrintData
    Language.AutoDetect = False
    Language.LanguageID = lnEnglish
    TwoPass = False
    Style.FixedCols = True
    Style.FixedRows = True
    Style.RowStyle = rsNormal
    Style.OddColor = clWhite
    Style.EvenColor = clWhite
    MacroChar = '%'
    WordWrap = False
    Header.Strings = (
      '%A%L%DT%FB'
      ' ')
    HeaderFont.Charset = DEFAULT_CHARSET
    HeaderFont.Color = clWindowText
    HeaderFont.Height = -11
    HeaderFont.Name = 'MS Sans Serif'
    HeaderFont.Style = []
    Footer.Strings = (
      '%A%Rpage #%PN/bar #%BN')
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    AnimatedStatus = True
    Frame.Color = clBlack
    Frame.FrameType = []
    Frame.BackColor = clWhite
    Frame.PicType = btNone
    PrinterSetting.PrinterIndex = -1
    PrinterSetting.Margins.ByDefault = True
    PrinterSetting.Margins.Left = 0
    PrinterSetting.Margins.Top = 0
    PrinterSetting.Margins.Right = 0
    PrinterSetting.Margins.Bottom = 0
    PrinterSetting.PaperSize = psDefault
    PrinterSetting.PaperSizeWidth = 0
    PrinterSetting.PaperSizeHeight = 0
    PrinterSetting.Orientation = spoDefault
    PrinterSetting.OutputBin = sbDefault
    PrinterSetting.Duplex = sdDefault
    HighLights = <>
    Calculations = <>
    BlankIfZero = False
    GapHorizontal = 2
    GapVertical = 2
    GridLine.Color = clBtnShadow
    DBGrid = Form12.dbgTransaksi
    DataSet = tTransaksi
    SelectedRecord = False
    PrintRecNo = rnNone
    AutoFit = False
    ColumnSource = csDBGrid
    WordWrapHeader = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    Left = 80
    Top = 496
  end
  object flistBuku: TSMDBFilterDialog
    Caption = 'Filter setup dialog'
    Dataset = trBuku
    FilterMode = fmFilterDataset
    WildCard = '%'
    Left = 136
    Top = 496
  end
  object slistBuku: TSMDBFindDialog
    Caption = 'Record search'
    ShowDialog = True
    DataSource = dsBuku
    FindOption = []
    FindMode = fmBeginPart
    FindScore = fsFromFirst
    SayResult = False
    Left = 24
    Top = 544
  end
  object dsKategori: TDataSource
    DataSet = tKategori
    Left = 80
    Top = 544
  end
  object dsPenerbit: TDataSource
    DataSet = tPenerbit
    Left = 136
    Top = 544
  end
  object sPenulis: TSMDBFindDialog
    Caption = 'Record search'
    ShowDialog = True
    DataSource = dsPenulis
    FindOption = []
    FindMode = fmBeginPart
    FindScore = fsFromFirst
    SayResult = False
    Left = 24
    Top = 600
  end
  object fPenulis: TSMDBFilterDialog
    Caption = 'Filter setup dialog'
    Dataset = tPenulis
    FilterMode = fmFilterDataset
    WildCard = '%'
    Left = 80
    Top = 600
  end
end
