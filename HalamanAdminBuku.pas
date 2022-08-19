unit HalamanAdminBuku;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SMDBCtrl, Grids, DBGrids, SMDBGrid, StdCtrls, jpeg,
  Buttons;

type
  TForm9 = class(TForm)
    img1: TImage;
    Label1: TLabel;
    Shape1: TShape;
    dbgBukuDetail: TSMDBGrid;
    SMDBNavigator1: TSMDBNavigator;
    btn_bck: TBitBtn;
    btn_adbk: TBitBtn;
    procedure SMDBNavigator1Click(Sender: TObject; Button: TSMNavigateBtn);
    procedure btn_bckClick(Sender: TObject);
    procedure btn_adbkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses DataModule, HalamanAdminTambahBuku, HalamanAdmin;

{$R *.dfm}

procedure TForm9.SMDBNavigator1Click(Sender: TObject;
  Button: TSMNavigateBtn);
begin
  case Button of
    sbFilter : damod.fBukuDetail.Execute;
    sbFind : damod.sBukuDetail.Execute;
    sbExport : damod.exBukuDetail.Select;
    sbPrint : damod.pBukuDetail.Print;
  end;
end;

procedure TForm9.btn_bckClick(Sender: TObject);
begin
  damod.tBuku.Refresh;
  Form9.Hide;
  Form8.Show;
end;

procedure TForm9.btn_adbkClick(Sender: TObject);
begin
  Form9.Hide;
  Form10.Show;
end;

end.
