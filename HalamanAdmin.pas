unit HalamanAdmin;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SMDBCtrl, Grids, DBGrids, SMDBGrid, StdCtrls, jpeg,
  Buttons;

type
  TForm8 = class(TForm)
    img1: TImage;
    Label1: TLabel;
    Shape1: TShape;
    Shape2: TShape;
    lbl_usr: TLabel;
    Label2: TLabel;
    btn_ext: TBitBtn;
    lbl_jumang: TLabel;
    lbl_jumbuk: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbl_trs: TLabel;
    Label7: TLabel;
    btn_refresh: TBitBtn;
    Label6: TLabel;
    lbl_jumkat: TLabel;
    lbl_detkat: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    lbl_jumpen: TLabel;
    Label8: TLabel;
    lbl_jumnulis: TLabel;
    Label12: TLabel;
    procedure btn_extClick(Sender: TObject);
    procedure btn_datbukClick(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure Label7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btn_refreshClick(Sender: TObject);
    procedure lbl_detkatClick(Sender: TObject);
    procedure Label10Click(Sender: TObject);
    procedure Label12Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

uses HalamanAdminBuku, HalamanAdminAnggota, HalamanAdminTransaksi,
  HalamanUtama, HalamanAwal, DataModule, HalamanAdminKategori,
  HalamanAdminPenerbit, HalamanAdminPenulis;

{$R *.dfm}

procedure TForm8.btn_extClick(Sender: TObject);
begin
  Form8.Hide;
  Form1.Show;
end;

procedure TForm8.btn_datbukClick(Sender: TObject);
begin
  Form8.Hide;
  Form9.Show;
end;

procedure TForm8.Label3Click(Sender: TObject);
begin
  Form8.Hide;
  Form11.Show;
end;

procedure TForm8.Label4Click(Sender: TObject);
begin
  Form8.Hide;
  Form9.Show;
end;

procedure TForm8.Label7Click(Sender: TObject);
begin
  Form8.Hide;
  Form12.Show;
end;

procedure TForm8.BitBtn1Click(Sender: TObject);
begin
  Form8.Hide;
  Form1.Show;
end;

procedure TForm8.btn_refreshClick(Sender: TObject);
begin
  damod.tAnggota.Refresh;
  damod.tTransaksi.Refresh;
  damod.tBuku.Refresh;
  damod.tKategori.Refresh;
  damod.tPenerbit.Refresh;
  damod.tPenulis.Refresh;
  Form8.lbl_jumang.Caption:= IntToStr(damod.tAnggota.RecordCount);
  Form8.lbl_jumbuk.Caption:=IntToStr(damod.tBuku.RecordCount);
  Form8.lbl_trs.Caption:=IntToStr(damod.tTransaksi.RecordCount);
  Form8.lbl_jumkat.Caption:=IntToStr(damod.tKategori.RecordCount);
  Form8.lbl_jumpen.Caption:=IntToStr(damod.tPenerbit.RecordCount);
  Form8.lbl_jumnulis.Caption:=IntToStr(damod.tPenulis.RecordCount);
end;

procedure TForm8.lbl_detkatClick(Sender: TObject);
begin
  Form8.Hide;
  Form14.Show;            
end;

procedure TForm8.Label10Click(Sender: TObject);
begin
  Form8.Hide;
  Form15.Show;
end;

procedure TForm8.Label12Click(Sender: TObject);
begin
  Form8.Hide;
  Form16.Show;
end;

end.
