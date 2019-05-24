unit splashcalc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls;

type
  TSplash = class(TForm)
    Panel: TPanel;
    Text: TStaticText;
    Timer: TTimer;
    Image: TImage;
    mgoLogo: TImage;
    procedure TimerTimer(Sender: TObject);
    procedure FormHide(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Splash: TSplash;

implementation

uses aboutcalc, maincalc;

{$R *.DFM}

procedure TSplash.TimerTimer(Sender: TObject);
begin
     Splash.Hide;
     Main.Show;
end;

procedure TSplash.FormHide(Sender: TObject);
begin
     Timer.Enabled := False;
end;

end.
