unit HalamanPinjam;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, DB, ZAbstractRODataset, ZAbstractDataset,
  ZDataset, ZAbstractConnection, ZConnection, ExtCtrls, jpeg, Mask, DBCtrls,
  Buttons, Grids, DBGrids;

type
  TForm6 = class(TForm)
    img1: TImage;
    Label1: TLabel;
    Shape1: TShape;
    shp2: TShape;
    Label2: TLabel;
    lbl_tglp: TLabel;
    lbl_lp: TLabel;
    lbl_ket: TLabel;
    dtp_p: TDateTimePicker;
    btn_pnjm: TBitBtn;
    btn_bck: TBitBtn;
    Label7: TLabel;
    edt_ket: TEdit;
    lbl_jumstok: TLabel;
    Label9: TLabel;
    dbedt_stok: TDBEdit;
    dbtxt_kodang: TDBText;
    edt_lama: TEdit;
    lbl_tglk: TLabel;
    dtp_k: TDateTimePicker;
    lbl_judulp: TLabel;
    dbedt_judulp: TDBEdit;
    procedure btn_bckClick(Sender: TObject);
    procedure btn_pnjmClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  stok,p,k,kt : string;
  stokakhir,a,b,c : Integer;

implementation

uses HalamanBuku, HalamanUtama, DataModule, HalamanAwal, halamanStruk;

{$R *.dfm}

procedure TForm6.btn_bckClick(Sender: TObject);
begin
  Form6.Hide;
  form5.show;
end;

procedure TForm6.btn_pnjmClick(Sender: TObject);
begin
  stok := dbedt_stok.Text;
  stokakhir := StrToInt(stok);
  stokakhir := stokakhir - 1;
  dbedt_stok.Text := IntToStr(stokakhir);
  p := DateToStr(dtp_p.Date);
  k := DateToStr(dtp_k.Date);
  kt := 'Sedang Dipinjam';
  if (dbedt_stok.Text < '1') then
  begin
    Application.MessageBox('MAAF! STOK BUKU SEDANG KOSONG, ANDA DAPAT MEMESANNYA LAIN WAKTU.','Warning!',MB_OK+MB_ICONWARNING);
    form6.Hide;
    form3.show;
  end
  else
  begin
    damod.tBuku.Close;
    damod.tBuku.SQL.Clear;
    damod.tBuku.SQL.Add('UPDATE buku');
    damod.tBuku.SQL.Add('SET jumlah_stok="'+dbedt_stok.Text+'"');
    damod.tBuku.SQL.Add('WHERE judul="'+dbedt_judulp.Text+'"');
    damod.tBuku.ExecSQL;

    damod.tBuku.SQL.Text:='SELECT id_buku FROM buku WHERE judul LIKE "'+dbedt_judulp.Text+'%"';
    damod.tBuku.Active:= True;
    damod.tAnggota.SQL.Text:='SELECT id_anggota FROM anggota WHERE username_anggota LIKE"'+Form1.edt_usr.Text+'%"';
    damod.tAnggota.Active:= True;
    b:=damod.tBuku.FieldByName('id_buku').AsInteger;
    a:=damod.tAnggota.FieldByName('id_anggota').AsInteger;

    with damod.tTransaksi do
    begin
      Append;
      FieldByName('tanggal_pinjam').AsDateTime:=dtp_p.Date;
      FieldByName('tanggal_kembali').AsDateTime:=dtp_k.Date;
      FieldByName('keterangan').AsString:='Sedang Dipinjam';
      FieldByName('id_buku').AsInteger:=b;
      FieldByName('id_anggota').AsInteger:=a;
      Post;
      Refresh;
    end;
    Application.MessageBox('SELAMAT ANDA BERHASIL MEMINJAM BUKU, JANGAN SAMPAI TERLAMBAT MENGEMBALIKANNYA YA!','Information',MB_OK+MB_ICONINFORMATION);

    damod.tAnggota.SQL.Text:='SELECT id_transaksi FROM transaksi WHERE tanggal_pinjam LIKE"'+p+'%"';
    damod.tAnggota.Active:= True;
    c:=damod.tTransaksi.FieldByName('id_transaksi').AsInteger;

    Form13.struk.Lines.Append('================================');
    Form13.struk.Lines.Append('========DETAIL PEMINJAMAN========');
    Form13.struk.Lines.Append('');
    Form13.struk.Lines.Append('ID Transaksi     = '+IntToStr(c));
    Form13.struk.Lines.Append('Username         = '+Form1.edt_usr.Text);
    Form13.struk.Lines.Append('Judul Buku       = '+dbedt_judulp.Text);
    Form13.struk.Lines.Append('Tanggal Pinjam   = '+p);
    Form13.struk.Lines.Append('Tanggal Kembali  = '+k);
    Form13.struk.Lines.Append('Durasi Pinjam    = 7 hari');
    Form13.struk.Lines.Append('');
    Form13.struk.Lines.Append('Mohon untuk menjaga struk ini');
    Form13.struk.Lines.Append('dan mengingat ID Transaksi anda');
    Form13.struk.Lines.Append('untuk pengembalian buku nanti.');
    Form13.struk.Lines.Append('');
    Form13.struk.Lines.Append('=====PERPUSTAKAAN NUSANTARA=====');
    Form13.struk.Lines.Append('================================');

    Form6.Hide;
    Form13.Show;

  end;
end;

end.
