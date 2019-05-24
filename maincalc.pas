unit maincalc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, ExtCtrls, ComCtrls, ShellAPI;

type
  TMain = class(TForm)
    PanelExVAT: TPanel;
    AmountIncludingVATLabelExVAT: TLabel;
    AmountOfVATLabelExVAT: TLabel;
    AmountExcludingVATLabelExVAT: TLabel;
    PoundSignLabelExVAT: TLabel;
    CalculateVATButtonExVAT: TButton;
    AmountExVATEditExVAT: TEdit;
    AmountIncludingVATEditExVAT: TEdit;
    AmountOfVATEditExVAT: TEdit;
    PanelIncVAT: TPanel;
    AmountExcludingVATLabelIncVAT: TLabel;
    AmountOfVATLabelIncVAT: TLabel;
    AmountIncludingVATLabelIncVAT: TLabel;
    PoundSignLabelIncVAT: TLabel;
    CalculateVATButtonIncVAT: TButton;
    AmountIncVATEditIncVAT: TEdit;
    AmountExludingVATEditExVAT: TEdit;
    AmountOfVATEditIncVAT: TEdit;
    MainMenu: TMainMenu;
    AmountExcludingVATMenu: TMenuItem;
    CalculateVAT1Menu: TMenuItem;
    AmountIncludingVATMenu: TMenuItem;
    CalculateVAT2Menu: TMenuItem;
    HelpMenu: TMenuItem;
    AboutMenu: TMenuItem;
    StatusBar: TStatusBar;
    TimerClock: TTimer;
    OnlineMenu: TMenuItem;
    CheckforUpgradesMenu: TMenuItem;
    N1: TMenuItem;
    VATCalculatorOnlineMenu: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure TimerClockTimer(Sender: TObject);
    procedure AboutMenuClick(Sender: TObject);
    procedure VATCalculatorOnlineMenuClick(Sender: TObject);
    procedure CheckforUpgradesMenuClick(Sender: TObject);
    procedure CalculateVATButtonExVATClick(Sender: TObject);
    procedure CalculateVATButtonIncVATClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    procedure DisplayHint(Sender: TObject);
  end;

var
  Main: TMain;

implementation

uses aboutcalc, splashcalc;

{$R *.DFM}

procedure TMain.FormCreate(Sender: TObject);
begin
     Application.OnHint := DisplayHint;
end;

procedure TMain.DisplayHint(Sender: TObject);
begin
  if Length(Application.Hint) > 0 then
  begin
    StatusBar.SimplePanel := True;
    StatusBar.SimpleText := GetLongHint(Application.Hint);
  end
  else StatusBar.SimplePanel := False;
end;

procedure TMain.TimerClockTimer(Sender: TObject);
begin
  StatusBar.Panels[2].Text := TimeToStr(Time);
end;

procedure TMain.AboutMenuClick(Sender: TObject);
begin
   About.Show;
end;

procedure TMain.VATCalculatorOnlineMenuClick(Sender: TObject);
begin
   ShellExecute(0, nil, 'http://www.musicgoeson.com/software/vatcalc/?version=1.5.0.0', nil, nil, SW_SHOWDEFAULT);
end;

procedure TMain.CheckforUpgradesMenuClick(Sender: TObject);
begin
   ShellExecute(0, nil, 'http://www.musicgoeson.com/software/vatcalc/upgrade.php?version=1.5.0.0', nil, nil, SW_SHOWDEFAULT);
end;

procedure TMain.CalculateVATButtonExVATClick(Sender: TObject);
   var
   exvat, incvat, amountvat: double;
   errcode : integer;
   begin
   Val(AmountExVATEditExVAT.Text, exvat, errcode );
   if errcode <> 0 then
   beep
   else
   begin
   incvat := exvat * 0.175;
   AmountIncludingVATEditExVAT.Text := '£ '+ FloatToStr(exvat + incvat);
   amountvat := incvat;
   AmountOfVATEditExVAT.Text := '£ '+ FloatToStr(amountvat);
   end;
end;

procedure TMain.CalculateVATButtonIncVATClick(Sender: TObject);
   var
   incvat, exvat, amountvat: double;
   errcode : integer;
   begin
   Val(AmountIncVATEditIncVAT.Text, incvat, errcode );
   if errcode <> 0 then
   beep
   else
   begin
   exvat := incvat * 100 / 117.5;
   AmountExludingVATEditExVAT.Text := '£ '+ FloatToStr(exvat);
   amountvat := incvat - exvat;
   AmountOfVATEditIncVAT.Text := '£ '+ FloatToStr(amountvat);
   end;
end;

procedure TMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Splash.close;
end;

end.
