unit HalamanUtama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, Grids, DBGrids, ExtCtrls, StdCtrls,
  jpeg, Buttons, DBCtrls, SMDBGrid, SMDBCtrl;

type
  TForm3 = class(TForm)
    lbl1: TLabel;
    shp1: TShape;
    shp2: TShape;
    btn_kembuku: TBitBtn;
    Label1: TLabel;
    Shape1: TShape;
    btn_ext: TBitBtn;
    btn_pinbuk: TBitBtn;
    img1: TImage;
    listBuku: TSMDBGrid;
    SMDBNav_listbuku: TSMDBNavigator;
    procedure btn_dftangClick(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btn_kembukuClick(Sender: TObject);
    procedure btn_extClick(Sender: TObject);
    procedure btn_pinbukClick(Sender: TObject);
    procedure SMDBNav_listbukuClick(Sender: TObject;
      Button: TSMNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  a,b,jdl:string;
  k,p:Integer;

implementation

uses HalamanDaftarAnggota, HalamanBuku, HalamanPengembalian, DataModule,
  HalamanAwal;

{$R *.dfm}

procedure TForm3.btn_dftangClick(Sender: TObject);
begin
  Form3.Hide;
  form4.show;  
end;

procedure TForm3.DBGrid1CellClick(Column: TColumn);
begin
  Form3.Hide;
  form5.show;
end;

procedure TForm3.btn_kembukuClick(Sender: TObject);
begin
  Form7.dtp_kk.Date:=Now;
  Form3.Hide;
  form7.show;
end;

procedure TForm3.btn_extClick(Sender: TObject);
begin
  Form1.edt_usr.Text:='';
  Form1.edt_pass.Text:='';
  Form3.Hide;
  Form1.Show;
end;

procedure TForm3.btn_pinbukClick(Sender: TObject);
begin
  Form5.dbedt_jdl.Text:=damod.trBuku.FieldValues['Judul Buku'];
  damod.tBuku.SQL.Text:= 'SELECT * FROM buku WHERE judul LIKE "'+Form5.dbedt_jdl.Text+'%"';
  damod.tBuku.Active:= True;
  b:=damod.tBuku.FieldByName('id_buku').AsString;
  Form5.DBMemo1.Text:=damod.tBuku.FieldByName('sinopsis').AsString;
  Form5.dbedt_jmhal.Text:=damod.tBuku.FieldByName('jumlah_halaman').AsString;
  k:=damod.tBuku.FieldByName('id_kategori').AsInteger;
  p:=damod.tBuku.FieldByName('id_penerbit').AsInteger;
  Form5.dbedt_ngarang.Text:=damod.trBuku.FieldValues['Penulis'];
  damod.tKategori.SQL.Text:= 'SELECT nama_kategori from kategori WHERE id_kategori LIKE "'+IntToStr(k)+'%"';
  damod.tKategori.Active:= True;
  Form5.dbedt_kateg.Text:=damod.tKategori.FieldByName('nama_kategori').AsString;
  damod.tPenerbit.SQL.Text:= 'SELECT nama_penerbit from penerbit WHERE id_penerbit LIKE "'+IntToStr(p)+'%"';
  damod.tPenerbit.Active:= True;
  Form5.dbedt_nerbit.Text:=damod.tPenerbit.FieldByName('nama_penerbit').AsString;

  Form3.Hide;
  Form5.Show;
end;

procedure TForm3.SMDBNav_listbukuClick(Sender: TObject;
  Button: TSMNavigateBtn);
begin
  case Button of
    sbFilter : damod.flistBuku.Execute;
    sbFind : damod.slistBuku.Execute;
  end;
end;

end.
