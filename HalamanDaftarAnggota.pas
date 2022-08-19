unit HalamanDaftarAnggota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, jpeg, DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, ZAbstractConnection,
  ZConnection;

type
  TForm4 = class(TForm)
    img1: TImage;
    lbl1: TLabel;
    shp1: TShape;
    shp2: TShape;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edt_namaang: TEdit;
    edt_tlahir: TEdit;
    DateTimePicker1: TDateTimePicker;
    edt_notelp: TEdit;
    edt_alamat: TEdit;
    btn_save: TBitBtn;
    btn_bck: TBitBtn;
    lbl_usrnm: TLabel;
    lbl_passwd: TLabel;
    edt_usrnm: TEdit;
    edt_passwd: TEdit;
    rb_p: TRadioButton;
    rb_w: TRadioButton;
    procedure btn_bckClick(Sender: TObject);
    procedure btn_saveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
  a:Integer;

implementation

uses HalamanUtama, HalamanDaftarUser, HalamanAwal, DataModule;

{$R *.dfm}

procedure TForm4.btn_bckClick(Sender: TObject);
begin
  Form4.Hide;
  form1.show;
end;

procedure TForm4.btn_saveClick(Sender: TObject);
begin
  if ((edt_namaang.Text='') or (edt_tlahir.Text='') or (edt_notelp.Text='') or (edt_alamat.Text='') or (rb_p.Checked=False) and (rb_w.Checked=False) or (DateTimePicker1.DateTime=Now)
       or (edt_usrnm.Text='') or (edt_passwd.Text='')) then
  begin
    Application.MessageBox('TERDAPAT DATA YANG KOSONG, MOHON LENGKAPI TERLEBIH DAHULU!','Warning!',MB_OK+MB_ICONWARNING);
  end
  else if (damod.tAnggota.Locate('username_anggota',edt_usrnm.Text,[])) then
  begin
    Application.MessageBox('USERNAME TELAH DIPAKAI,MOHON GANTI USERNAME ANDA!','Warning!',MB_OK+MB_ICONWARNING);
  end
  else
  begin
    with damod.tAnggota do
    begin
      Append;
      FieldByName('nama_anggota').AsString:=edt_namaang.Text;
      if (rb_p.Checked=True) then
      begin
        FieldByName('jenis_kelamin_anggota').AsString:='L';
      end
      else if(rb_w.Checked=True) then
      begin
        FieldByName('jenis_kelamin_anggota').AsString:='P';
      end;
      FieldByName('tempat_lahir_anggota').AsString:=edt_tlahir.Text;
      FieldByName('tanggal_lahir_anggota').AsDateTime:=DateTimePicker1.date;
      FieldByName('noTelp_anggota').AsString:=edt_notelp.Text;
      FieldByName('alamat_anggota').AsString:=edt_alamat.Text;
      FieldByName('username_anggota').AsString:=edt_usrnm.Text;
      FieldByName('password_anggota').AsString:=edt_passwd.Text;
      Post;
      Refresh;
      Application.MessageBox('SELAMAT ANDA TELAH MENJADI ANGGOTA PERPUSTAKAAN NUSANTARA!','Information',MB_OK+MB_ICONINFORMATION);
      edt_namaang.Text:='';
      rb_p.Checked:=False;
      rb_w.Checked:=False;
      edt_tlahir.Text:='';
      DateTimePicker1.Date:=Now;
      edt_notelp.Text:='';
      edt_alamat.Text:='';
      edt_usrnm.Text:='';
      edt_passwd.Text:='';
      Form4.Hide;
      form1.show;
    end;
  end;
end;

end.
