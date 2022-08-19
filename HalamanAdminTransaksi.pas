unit HalamanAdminTransaksi;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SMDBCtrl, StdCtrls, Buttons, Grids, DBGrids, SMDBGrid,
  jpeg;

type
  TForm12 = class(TForm)
    img1: TImage;
    Label1: TLabel;
    Shape1: TShape;
    dbgTransaksi: TSMDBGrid;
    BitBtn1: TBitBtn;
    SMDBNavigator1: TSMDBNavigator;
    procedure BitBtn1Click(Sender: TObject);
    procedure SMDBNavigator1Click(Sender: TObject; Button: TSMNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form12: TForm12;

implementation

uses HalamanAdmin, DataModule;

{$R *.dfm}

procedure TForm12.BitBtn1Click(Sender: TObject);
begin
  damod.tTransaksi.Refresh;
  Form12.Hide;
  Form8.Show;
end;

procedure TForm12.SMDBNavigator1Click(Sender: TObject;
  Button: TSMNavigateBtn);
begin
  case Button of
    sbFilter : damod.fTransaksi.Execute;
    sbFind : damod.sTransaksi.Execute;
    sbExport : damod.exTransaksi.Select;
    sbPrint : damod.pTransaksi.Print;
  end;
end;

end.
