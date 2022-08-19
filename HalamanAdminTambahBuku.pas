unit HalamanAdminTambahBuku;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, jpeg, ExtDlgs, DB, DBCtrls;

type
  TForm10 = class(TForm)
    img1: TImage;
    shp2: TShape;
    lbl1: TLabel;
    shp1: TShape;
    btn_add: TBitBtn;
    btn_bck: TBitBtn;
    Label1: TLabel;
    edt_jdl: TEdit;
    Label2: TLabel;
    edt_snps: TEdit;
    Label3: TLabel;
    edt_ttbit: TEdit;
    Label4: TLabel;
    edt_isbn: TEdit;
    Label5: TLabel;
    edt_stk: TEdit;
    Label6: TLabel;
    edt_hal: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    cb_kat: TComboBox;
    cb_pen: TComboBox;
    Label9: TLabel;
    cb_nulis: TComboBox;
    edt_idnulis: TEdit;
    edt_idkat: TEdit;
    edt_idpen: TEdit;
    edt_idbuku: TEdit;
    procedure btn_bckClick(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cb_nulisChange(Sender: TObject);
    procedure cb_katChange(Sender: TObject);
    procedure cb_penChange(Sender: TObject);
//    procedure btn_cvrClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses HalamanAdminBuku, DataModule;

{$R *.dfm}

procedure TForm10.btn_bckClick(Sender: TObject);
begin
  Form10.Hide;
  Form9.Show;
end;

procedure TForm10.btn_addClick(Sender: TObject);
begin
  if ((edt_jdl.Text<>'')and(edt_snps.Text<>'')and(edt_ttbit.Text<>'')and(edt_isbn.Text<>'')
       and (cb_nulis.Text<>'') and(edt_stk.Text<>'')and(edt_hal.Text<>'')and(cb_kat.Text<>'')and(cb_pen.Text<>'')) then
    begin
      with damod.tBuku do
      begin
        Append;
        FieldByName('judul').AsString:=edt_jdl.Text;
        FieldByName('sinopsis').AsString:=edt_snps.Text;
        FieldByName('tahun_terbit').AsString:=edt_ttbit.Text;
        FieldByName('ISBN').AsString:=edt_isbn.Text;
        FieldByName('jumlah_stok').AsString:=edt_stk.Text;
        FieldByName('jumlah_halaman').AsString:=edt_hal.Text;
        FieldByName('id_kategori').AsString:=edt_idkat.Text;
        FieldByName('id_penerbit').AsString:=edt_idpen.Text;
        Post;
        Refresh;

      end;

      with damod.tBuku do
      begin
        SQL.Clear;
        SQL.Add('SELECT * FROM buku WHERE judul =' + QuotedStr(edt_jdl.Text));
        Open;
      end;
      edt_idbuku.Text:= damod.tBuku.FieldbyName('id_buku').AsString;
      damod.tBuku.SQL.Clear;
      damod.tBuku.SQL.Add('SELECT * FROM buku');
      damod.tBuku.Open;

      with damod.trBuku do
      begin
        Append;
        FieldByName('id_buku').AsString:=edt_idbuku.Text;
        FieldByName('id_penulis').AsString:=edt_idnulis.Text;
        Post;
        Refresh;
      end;
        Application.MessageBox('Buku berhasil ditambahkan!', 'Information',
        MB_OK + MB_ICONINFORMATION);
        edt_jdl.Text:='';
        edt_snps.Text:='';
        edt_ttbit.Text:='';
        edt_isbn.Text:='';
        cb_nulis.Text:='';
        edt_stk.Text:='';
        edt_hal.Text:='';
        cb_kat.Text:='';
        cb_pen.Text:='';
    end
  else
    begin
      Application.MessageBox('Terdapat kolom yang kosong!', 'Error', MB_OK + 
        MB_ICONSTOP);
    end;
end;

procedure TForm10.FormShow(Sender: TObject);
begin
  with damod.tPenulis do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM Penulis';
    Open;

    damod.tPenulis.First;
    while not damod.tPenulis.Eof do
    begin
      cb_nulis.Items.Add(damod.tPenulis.FieldByName('nama_penulis').AsString);
      damod.tPenulis.Next;
    end;
  end;

  with damod.tKategori do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM kategori';
    Open;

    damod.tKategori.First;
    while not damod.tKategori.Eof do
    begin
      cb_kat.Items.Add(damod.tKategori.FieldByName('nama_kategori').AsString);
      damod.tKategori.Next;
    end;
  end;

  with damod.tPenerbit do
  begin
    Close;
    SQL.Clear;
    SQL.Text := 'SELECT * FROM penerbit';
    Open;

    damod.tPenerbit.First;
    while not damod.tPenerbit.Eof do
    begin
      cb_pen.Items.Add(damod.tPenerbit.FieldByName('nama_penerbit').AsString);
      damod.tPenerbit.Next;
    end;
  end;
end;

procedure TForm10.cb_nulisChange(Sender: TObject);
begin
  with damod.tPenulis do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM penulis WHERE nama_penulis =' + QuotedStr(cb_nulis.Text));
    Open;
  end;
  edt_idnulis.Text:= damod.tPenulis.FieldbyName('id_penulis').AsString;
  damod.tPenulis.SQL.Clear;
  damod.tPenulis.SQL.Add('SELECT * FROM penulis');
  damod.tPenulis.Open;
end;

procedure TForm10.cb_katChange(Sender: TObject);
begin
  with damod.tKategori do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM kategori WHERE nama_kategori =' + QuotedStr(cb_kat.Text));
    Open;
  end;
  edt_idkat.Text:= damod.tKategori.FieldbyName('id_kategori').AsString;
  damod.tKategori.SQL.Clear;
  damod.tKategori.SQL.Add('SELECT * FROM kategori');
  damod.tKategori.Open;
end;

procedure TForm10.cb_penChange(Sender: TObject);
begin
  with damod.tPenerbit do
  begin
    SQL.Clear;
    SQL.Add('SELECT * FROM penerbit WHERE nama_penerbit =' + QuotedStr(cb_pen.Text));
    Open;
  end;
  edt_idpen.Text:= damod.tPenerbit.FieldbyName('id_penerbit').AsString;
  damod.tPenerbit.SQL.Clear;
  damod.tPenerbit.SQL.Add('SELECT * FROM kategori');
  damod.tPenerbit.Open;
end;

end.
