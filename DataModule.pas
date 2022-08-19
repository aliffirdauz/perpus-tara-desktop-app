unit DataModule;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, PrintSM, SMRAuto, mxExport, SMDBFind,
  SMDBFltr;

type
  Tdamod = class(TDataModule)
    PerpusTara: TZConnection;
    tAnggota: TZQuery;
    dsAnggota: TDataSource;
    tPuswan: TZQuery;
    dsPuswan: TDataSource;
    dsBuku: TDataSource;
    trBuku: TZQuery;
    dsAnggotaInput: TDataSource;
    tAnggotaInput: TZQuery;
    dsBukuDetail: TDataSource;
    tPenulis: TZQuery;
    dsPenulis: TDataSource;
    trBukuid_penulis: TIntegerField;
    trBukuid_buku: TIntegerField;
    trBukuPenulis: TStringField;
    tPenerbit: TZQuery;
    tKategori: TZQuery;
    tTransaksi: TZQuery;
    dsTransaksi: TDataSource;
    fBukuDetail: TSMDBFilterDialog;
    sBukuDetail: TSMDBFindDialog;
    exBukuDetail: TmxDBGridExport;
    pBukuDetail: TSMPrintData;
    tBuku: TZQuery;
    sAnggota: TSMDBFindDialog;
    fAnggota: TSMDBFilterDialog;
    exAnggota: TmxDBGridExport;
    pAnggota: TSMPrintData;
    sTransaksi: TSMDBFindDialog;
    fTransaksi: TSMDBFilterDialog;
    exTransaksi: TmxDBGridExport;
    pTransaksi: TSMPrintData;
    trBukuJudulBuku: TStringField;
    flistBuku: TSMDBFilterDialog;
    slistBuku: TSMDBFindDialog;
    dsKategori: TDataSource;
    dsPenerbit: TDataSource;
    sPenulis: TSMDBFindDialog;
    fPenulis: TSMDBFilterDialog;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  damod: Tdamod;

implementation

{$R *.dfm}

end.
