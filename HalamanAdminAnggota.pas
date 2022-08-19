unit HalamanAdminAnggota;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SMDBCtrl, StdCtrls, Buttons, jpeg, Grids, DBGrids,
  SMDBGrid;

type
  TForm11 = class(TForm)
    dbgAnggota: TSMDBGrid;
    img1: TImage;
    Label1: TLabel;
    Shape1: TShape;
    BitBtn1: TBitBtn;
    SMDBNavigator1: TSMDBNavigator;
    procedure SMDBNavigator1Click(Sender: TObject; Button: TSMNavigateBtn);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

uses DataModule, HalamanAdmin;

{$R *.dfm}

procedure TForm11.SMDBNavigator1Click(Sender: TObject;
  Button: TSMNavigateBtn);
begin
  case Button of
    sbFilter : damod.fAnggota.Execute;
    sbFind : damod.sAnggota.Execute;
    sbExport : damod.exAnggota.Select;
    sbPrint : damod.pAnggota.Print;
  end;
end;

procedure TForm11.BitBtn1Click(Sender: TObject);
begin
  damod.tAnggota.Refresh;
  Form11.Hide;
  Form8.Show;
end;

end.
