unit HalamanAwal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, Buttons, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;

type
  TForm1 = class(TForm)
    img1: TImage;
    lbl1: TLabel;
    lbl_usr: TLabel;
    shp1: TShape;
    shp2: TShape;
    lbl_pass: TLabel;
    edt_usr: TEdit;
    edt_pass: TEdit;
    btn_login: TBitBtn;
    btn_reg: TBitBtn;
    btn_ext: TBitBtn;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    procedure btn_loginClick(Sender: TObject);
    procedure btn_regClick(Sender: TObject);
    procedure btn_extClick(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses HalamanDaftarUser, HalamanUtama, HalamanDaftarAnggota, DataModule,
  HalamanPinjam;

{$R *.dfm}

procedure TForm1.btn_loginClick(Sender: TObject);
begin
  if ((edt_usr.Text='') or (edt_pass.Text='')) then
  begin
    Application.MessageBox('USERNAME ATAU PASSWORD ANDA KOSONG, MOHON ISI TERLEBIH DAHULU!','Warning!',MB_OK+MB_ICONWARNING);
  end
  else
  begin
    if (damod.tAnggota.Locate('username_anggota',edt_usr.Text,[])) then
    begin
      if (damod.tAnggota.Locate('password_anggota',edt_pass.Text,[])) then
      begin
        Application.MessageBox('SELAMAT DATANG DI PERPUSTAKAAN NUSANTARA!','Information',MB_OK+MB_ICONINFORMATION);
        damod.trBuku.Refresh;
        Form1.Hide;
        Form3.Show;
      end
      else
      begin
        Application.MessageBox('PASSWORD SALAH, COBA LAGI!','Warning!',MB_OK+MB_ICONWARNING);
      end;
    end
    else
    begin
        Application.MessageBox('USERNAME ANDA BELUM TERDAFTAR, SEGERA LAKUKAN REGISTRASI TERLEBIH DAHULU!','Warning!',MB_OK+MB_ICONWARNING);
    end;
  end;
end;

procedure TForm1.btn_regClick(Sender: TObject);
begin
  form1.Hide;
  Form4.Show;
end;

procedure TForm1.btn_extClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.Label1Click(Sender: TObject);
begin
  Form1.Hide;
  Form2.Show;
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if (Form1.edt_pass.PasswordChar<>#0)then
  begin
  Form1.edt_pass.PasswordChar:=#0;
  end
  else
  begin
  Form1.edt_pass.PasswordChar:='*';
  end;
end;

end.
