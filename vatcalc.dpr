program vatcalc;

uses
  Forms,
  aboutcalc in 'aboutcalc.pas' {About},
  maincalc in 'maincalc.pas' {Main},
  splashcalc in 'splashcalc.pas' {Splash};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'VAT Calculator';
  Application.CreateForm(TSplash, Splash);
  Application.CreateForm(TMain, Main);
  Application.CreateForm(TAbout, About);
  Application.Run;
end.
