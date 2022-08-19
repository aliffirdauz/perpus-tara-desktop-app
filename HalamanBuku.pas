unit HalamanBuku;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, DBCtrls, DB, ZAbstractRODataset,
  ZAbstractDataset, ZDataset, ZAbstractConnection, ZConnection, ExtCtrls,
  jpeg;

type
  TForm5 = class(TForm)
    img1: TImage;
    Label1: TLabel;
    Shape1: TShape;
    shp2: TShape;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dbedt_jdl: TDBEdit;
    dbedt_ngarang: TDBEdit;
    dbedt_nerbit: TDBEdit;
    dbedt_kateg: TDBEdit;
    dbedt_jmhal: TDBEdit;
    btn_pnjm: TBitBtn;
    btn_bck: TBitBtn;
    Shape2: TShape;
    Label8: TLabel;
    DBMemo1: TDBMemo;
    procedure btn_bckClick(Sender: TObject);
    procedure btn_pnjmClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  waktu : TDate;

implementation

uses HalamanUtama,HalamanPinjam,DataModule;

{$R *.dfm}

procedure TForm5.btn_bckClick(Sender: TObject);
begin
  form5.Hide;
  form3.show;
end;

procedure TForm5.btn_pnjmClick(Sender: TObject);
begin
  Form6.dbedt_judulp.Text := damod.tBuku.Fields[1].AsString;
  Form6.dbedt_stok.Text := damod.tBuku.Fields[5].AsString;
  waktu := Now;
  Form6.dtp_p.Date := waktu;
  Form6.dtp_k.Date := waktu + 7;
  Form5.Hide;
  form6.Show;
end;

end.
