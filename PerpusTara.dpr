program PerpusTara;

uses
  Forms,
  HalamanAwal in 'HalamanAwal.pas' {Form1},
  HalamanDaftarUser in 'HalamanDaftarUser.pas' {Form2},
  HalamanUtama in 'HalamanUtama.pas' {Form3},
  HalamanDaftarAnggota in 'HalamanDaftarAnggota.pas' {Form4},
  HalamanBuku in 'HalamanBuku.pas' {Form5},
  HalamanPinjam in 'HalamanPinjam.pas' {Form6},
  HalamanPengembalian in 'HalamanPengembalian.pas' {Form7},
  DataModule in 'DataModule.pas' {damod: TDataModule},
  HalamanAdmin in 'HalamanAdmin.pas' {Form8},
  HalamanAdminBuku in 'HalamanAdminBuku.pas' {Form9},
  HalamanAdminTambahBuku in 'HalamanAdminTambahBuku.pas' {Form10},
  HalamanAdminAnggota in 'HalamanAdminAnggota.pas' {Form11},
  HalamanAdminTransaksi in 'HalamanAdminTransaksi.pas' {Form12},
  halamanStruk in '..\..\..\..\..\Semester 3\IFA-207 PEMROGRAMAN DASAR\Praktikum\Tugas Akhir\dokum\halamanStruk.pas' {Form13},
  HalamanAdminKategori in 'HalamanAdminKategori.pas' {Form14},
  HalamanAdminPenerbit in 'HalamanAdminPenerbit.pas' {Form15},
  HalamanAdminPenulis in 'HalamanAdminPenulis.pas' {Form16};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(Tdamod, damod);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm15, Form15);
  Application.CreateForm(TForm16, Form16);
  Application.Run;
end.
