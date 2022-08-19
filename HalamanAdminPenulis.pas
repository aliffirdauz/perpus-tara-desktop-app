unit HalamanAdminPenulis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, SMDBCtrl, Grids, DBGrids, SMDBGrid,
  jpeg;

type
  TForm16 = class(TForm)
    Label1: TLabel;
    Shape1: TShape;
    img1: TImage;
    dbgAnggota: TSMDBGrid;
    SMDBNavigator1: TSMDBNavigator;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure SMDBNavigator1Click(Sender: TObject; Button: TSMNavigateBtn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

uses HalamanAdmin;

{$R *.dfm}

procedure TForm16.BitBtn1Click(Sender: TObject);
begin
  Form16.Hide;
  Form8.Show;
end;

procedure TForm16.SMDBNavigator1Click(Sender: TObject;
  Button: TSMNavigateBtn);
begin
  case Button of
    sbFilter : damod.fPenulis.Execute;
    sbFind : damod.sPenulis.Execute;
  end;
end;

end.
