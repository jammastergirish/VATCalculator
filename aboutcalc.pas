unit aboutcalc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ComCtrls, ExtCtrls, ShellAPI;

type
  TAbout = class(TForm)
    Image: TImage;
    Info: TRichEdit;
    OKButton: TButton;
    BevelTop: TBevel;
    Label3: TLabel;
    PhysMem: TLabel;
    Label4: TLabel;
    FreeRes: TLabel;
    BevelBottom: TBevel;
    mgoLogo: TImage;
    procedure OKButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mgoLogoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  About: TAbout;

implementation

{$R *.DFM}

procedure TAbout.OKButtonClick(Sender: TObject);
begin
     Close;
end;

procedure TAbout.FormCreate(Sender: TObject);
var
  MS: TMemoryStatus;
begin
  GlobalMemoryStatus(MS);
  PhysMem.Caption := FormatFloat('#,###" KB"', MS.dwTotalPhys / 1024);
  FreeRes.Caption := Format('%d %%', [MS.dwMemoryLoad]);
end;

procedure TAbout.mgoLogoClick(Sender: TObject);
begin
   ShellExecute(0, nil, 'http://www.musicgoeson.com/software/', nil, nil, SW_SHOWDEFAULT);
end;

end.
