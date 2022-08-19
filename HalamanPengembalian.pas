unit HalamanPengembalian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, jpeg, DateUtils;

type
  TForm7 = class(TForm)
    img1: TImage;
    shp2: TShape;
    Label1: TLabel;
    Shape1: TShape;
    Label2: TLabel;
    Label3: TLabel;
    dtp_kk: TDateTimePicker;
    Label4: TLabel;
    edt_idpin: TEdit;
    btn_ext: TBitBtn;
    btn_bck: TBitBtn;
    btn_kmb: TBitBtn;
    procedure btn_extClick(Sender: TObject);
    procedure btn_bckClick(Sender: TObject);
    procedure btn_kmbClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  selisih,j,denda,stokakhir,a,aa : Integer;
  tr, ket,ket2, stok, idb : string;
  pnj : TDate;

implementation

uses HalamanUtama, HalamanPinjam, DataModule, HalamanAwal;

{$R *.dfm}

procedure TForm7.btn_extClick(Sender: TObject);
begin
  Form7.Hide;
  Form1.Show;
end;

procedure TForm7.btn_bckClick(Sender: TObject);
begin
  form7.Hide;
  form3.show;
end;

procedure TForm7.btn_kmbClick(Sender: TObject);
begin
  if(edt_idpin.Text='')then
  begin
    Application.MessageBox('ID Transaksi belum terisi, mohon isi terlebih dahulu!',
      'Warning', MB_OK + MB_ICONWARNING);
  end
  else
  begin
    damod.tTransaksi.SQL.Text:='SELECT id_anggota FROM transaksi WHERE id_transaksi LIKE "'+edt_idpin.Text+'%"';
    damod.tTransaksi.Active:= True;
    a:= damod.tTransaksi.FieldByName('id_anggota').AsInteger;
    damod.tAnggota.SQL.Text:='SELECT id_anggota FROM anggota WHERE username_anggota LIKE "'+Form1.edt_usr.Text+'%"';
    damod.tAnggota.Active:= True;
    aa:= damod.tAnggota.FieldByName('id_anggota').AsInteger;
    if(a<>aa) then
    begin
      Application.MessageBox('ID Transaksi anda salah!', 'Warning', MB_OK +
        MB_ICONWARNING);
    end
    else
    begin
      damod.tTransaksi.SQL.Text:='SELECT tanggal_pinjam FROM transaksi WHERE id_transaksi LIKE "'+edt_idpin.Text+'%"';
      damod.tTransaksi.Active:= True;
      pnj := damod.tTransaksi.FieldByName('tanggal_pinjam').AsDateTime;
      selisih := DaysBetween(dtp_kk.Date, pnj);
      tr:= IntToStr(selisih);
      ket := 'Sudak Dikembalikan Tepat Waktu';
      damod.tTransaksi.SQL.Text:='SELECT id_buku FROM transaksi WHERE id_transaksi LIKE "'+edt_idpin.Text+'%"';
      damod.tTransaksi.Active:= True;
      idb:=damod.tTransaksi.FieldByName('id_buku').AsString;
      damod.tBuku.SQL.Text:='SELECT jumlah_stok FROM buku WHERE id_buku LIKE "'+idb+'%"';
      damod.tBuku.Active:= True;
      stokakhir:=damod.tBuku.FieldByName('jumlah_stok').AsInteger;
      stokakhir := stokakhir + 1;
      if(selisih=7) then
      begin
        damod.tTransaksi.Close;
        damod.tTransaksi.SQL.Clear;
        damod.tTransaksi.SQL.Add('UPDATE transaksi');
        damod.tTransaksi.SQL.Add('SET keterangan="'+ket+'"');
        damod.tTransaksi.SQL.Add('WHERE id_transaksi="'+edt_idpin.Text+'"');
        damod.tTransaksi.ExecSQL;

        damod.tBuku.Close;
        damod.tBuku.SQL.Clear;
        damod.tBuku.SQL.Add('UPDATE buku');
        damod.tBuku.SQL.Add('SET jumlah_stok="'+IntToStr(stokakhir)+'"');
        damod.tBuku.SQL.Add('WHERE id_buku="'+idb+'"');
        damod.tBuku.ExecSQL;

        Application.MessageBox('Buku berhasil dikembalikan. Terima kasih telah mengembalikannya tepat waktu!',
          'Information', MB_OK + MB_ICONINFORMATION);

      end
      else if(selisih<7) then
      begin
        damod.tTransaksi.Close;
        damod.tTransaksi.SQL.Clear;
        damod.tTransaksi.SQL.Add('UPDATE transaksi');
        damod.tTransaksi.SQL.Add('SET keterangan="'+ket+'"');
        damod.tTransaksi.SQL.Add('WHERE id_transaksi="'+edt_idpin.Text+'"');
        damod.tTransaksi.ExecSQL;

        damod.tBuku.Close;
        damod.tBuku.SQL.Clear;
        damod.tBuku.SQL.Add('UPDATE buku');
        damod.tBuku.SQL.Add('SET jumlah_stok="'+IntToStr(stokakhir)+'"');
        damod.tBuku.SQL.Add('WHERE id_buku="'+idb+'"');
        damod.tBuku.ExecSQL;

        Application.MessageBox('Buku berhasil dikembalikan. Terima kasih telah mengembalikan sebelum batas waktu maksimal peminjamannya!',
          'Information', MB_OK + MB_ICONINFORMATION);
      end
      else if(selisih>7) then
      begin
        j:= selisih-7;
        denda := j*10000;
        tr := IntToStr(denda);
        ket2 := 'Sudah Dikembalikan dan mendapat denda Rp'+tr;
        damod.tTransaksi.Close;
        damod.tTransaksi.SQL.Clear;
        damod.tTransaksi.SQL.Add('UPDATE transaksi');
        damod.tTransaksi.SQL.Add('SET keterangan="'+ket2+'"');
        damod.tTransaksi.SQL.Add('WHERE id_transaksi="'+edt_idpin.Text+'"');
        damod.tTransaksi.ExecSQL;

        damod.tBuku.Close;
        damod.tBuku.SQL.Clear;
        damod.tBuku.SQL.Add('UPDATE buku');
        damod.tBuku.SQL.Add('SET jumlah_stok="'+IntToStr(stokakhir)+'"');
        damod.tBuku.SQL.Add('WHERE id_buku="'+idb+'"');
        damod.tBuku.ExecSQL;

        Application.MessageBox('Buku berhasil dikembalikan. Namun anda mengembalikannya melebihi waktu peminjaman, maka anda mendapat denda. Lakukan pembayaran denda ke pustakawan!',
          'Warning', MB_OK + MB_ICONWARNING);
      end;
      edt_idpin.Text:='';
      Form7.Hide;
      Form3.Show;
    end;
  end;
end;

end.
