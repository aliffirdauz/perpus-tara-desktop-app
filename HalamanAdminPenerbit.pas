unit HalamanAdminPenerbit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, SMDBCtrl, StdCtrls, Buttons, Grids, DBGrids, SMDBGrid,
  jpeg;

type
  TForm15 = class(TForm)
    Label1: TLabel;
    Shape1: TShape;
    img1: TImage;
    dbgAnggota: TSMDBGrid;
    BitBtn1: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

uses HalamanAdmin;

{$R *.dfm}

procedure TForm15.BitBtn1Click(Sender: TObject);
begin
  Form15.Hide;
  Form8.Show;
end;

end.
