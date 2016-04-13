program Translator;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, pascalscript, Unit1, Unit2, Unit3
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource := True;
  Application.Initialize;
  Application.CreateForm(TappName, appName);
  Application.CreateForm(TSetupForm, SetupForm);
  Application.CreateForm(TChecker, Checker);
  Application.Run;
end.

