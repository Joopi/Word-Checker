unit Unit1;

{$mode objfpc}{$H+}

{MAIN UNIT, CONTROLS THE LOGIC}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Unit2, Unit3, Controls, Graphics, Dialogs, StdCtrls;

type

  { TappName }

  TappName = class(TForm)
    setupButton: TButton;
    startButton: TButton;
    Headline: TLabel;
    Amount: TLabel;
    procedure setupButtonClick(Sender: TObject);
    procedure startButtonClick(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  appName: TappName;
  sndr: TObject;

implementation

{$R *.lfm}

{ TappName }

procedure TappName.setupButtonClick(Sender: TObject);
begin
  Unit2.SetupForm.Show;
end;

procedure TappName.startButtonClick(Sender: TObject);
begin
  if (counter > 0) and not(setupForm.Visible) then
  begin
    Unit3.Checker.Show;
    Unit3.Checker.setButtonHandler(sndr);
    Unit3.Checker.checkWords(sndr);
  end else
    showMessage('Please setup the word checker before starting.');
end;


end.

