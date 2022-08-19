unit HalamanDaftarUser;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection;

type
  TForm2 = class(TForm)
    img1: TImage;
    lbl1: TLabel;
    shp1: TShape;
    shp2: TShape;
    lbl_usrbaru: TLabel;
    lbl_passbaru: TLabel;
    btn_logwan: TBitBtn;
    edt_usrwan: TEdit;
    edt_passwan: TEdit;
    btn_bck: TBitBtn;
    CheckBox1: TCheckBox;
    procedure btn_logwanClick(Sender: TObject);
    procedure btn_bckClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  a : integer;

implementation

uses HalamanUtama, HalamanAwal, DataModule, HalamanAdmin;

{$R *.dfm}

procedure TForm2.btn_logwanClick(Sender: TObject);
begin
  if ((edt_usrwan.Text='') or (edt_passwan.Text='')) then
  begin
    Application.MessageBox('USERNAME ATAU PASSWORD ANDA KOSONG, MOHON ISI TERLEBIH DAHULU!','Warning!',MB_OK+MB_ICONWARNING);
  end
  else
  begin
    if (damod.tPuswan.Locate('username_puswan',edt_usrwan.Text,[])) and (damod.tPuswan.Locate('password_puswan',edt_passwan.Text,[])) then
    begin
       Application.MessageBox('BERHASIL MASUK!','Information',MB_OK+MB_ICONINFORMATION);
       Form8.lbl_jumang.Caption:= IntToStr(damod.tAnggota.RecordCount);
       Form8.lbl_jumbuk.Caption:=IntToStr(damod.tBuku.RecordCount);
       Form8.lbl_trs.Caption:=IntToStr(damod.tTransaksi.RecordCount);
       Form8.lbl_jumkat.Caption:=IntToStr(damod.tKategori.RecordCount);
       Form8.lbl_jumpen.Caption:=IntToStr(damod.tPenerbit.RecordCount);
       Form8.lbl_jumnulis.Caption:=IntToStr(damod.tPenulis.RecordCount);
       edt_usrwan.Text:='';
       edt_passwan.Text:='';
       Form2.Hide;
       Form8.Show;
    end
    else
    begin
        Application.MessageBox('USERNAME ATAU PASSWORD ANDA BELUM TERDAFTAR, SEGERA HUBUNGI PIHAK TIK!','Warning!',MB_OK+MB_ICONWARNING);
    end;
  end;
end;

procedure TForm2.btn_bckClick(Sender: TObject);
begin
  Form1.edt_usr.Text:='';
  Form1.edt_pass.Text:='';
  edt_usrwan.Text:='';
  edt_passwan.Text:='';
  Form2.Hide;
  form1.show;
end;

procedure TForm2.CheckBox1Click(Sender: TObject);
begin
  if (Form2.edt_passwan.PasswordChar<>#0)then
  begin
  Form2.edt_passwan.PasswordChar:=#0;
  end
  else
  begin
  Form2.edt_passwan.PasswordChar:='*';
  end;
end;

end.
