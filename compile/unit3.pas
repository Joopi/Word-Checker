unit Unit3;

{$mode objfpc}{$H+}

{GENERAL CANCER. IF YOU ARE LOOKING TO LEARN ANYTHING IGNORE THIS UNIT}

interface

uses
  Classes, SysUtils, lclintf, FileUtil, Forms, Controls, Graphics, Dialogs,
  StdCtrls;

type

  { TChecker }

  TChecker = class(TForm)
    answerCheck: TEdit;
    Alphabet: TComboBox;
    nextButton: TButton;
    Label1: TLabel;
    correctAnswer: TLabel;
    RButton1: TButton;
    Edit1: TEdit;
    Enter: TButton;
    secDisplay: TLabel;
    Label2: TLabel;
    questionCheck: TLabel;
    RButton10: TButton;
    RButton11: TButton;
    RButton12: TButton;
    RButton13: TButton;
    RButton14: TButton;
    RButton15: TButton;
    RButton16: TButton;
    RButton17: TButton;
    RButton18: TButton;
    RButton19: TButton;
    RButton2: TButton;
    RButton20: TButton;
    RButton21: TButton;
    RButton22: TButton;
    RButton23: TButton;
    RButton24: TButton;
    RButton25: TButton;
    RButton26: TButton;
    RButton27: TButton;
    RButton28: TButton;
    RButton29: TButton;
    RButton3: TButton;
    RButton30: TButton;
    RButton31: TButton;
    RButton32: TButton;
    RButton33: TButton;
    RButton4: TButton;
    RButton5: TButton;
    RButton6: TButton;
    RButton7: TButton;
    RButton8: TButton;
    RButton9: TButton;
    procedure AlphabetChange(Sender: TObject);
    procedure EnterClick(Sender: TObject);
    procedure nextButtonClick(Sender: TObject);
    procedure setButtonHandler(Sender: TObject);
    procedure buttonHandler(Sender: TObject);
    procedure checkWords(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Checker: TChecker;
  setButtonHandler : procedure;
  buttonArray : array of TButton;
  aBooleans : array of boolean;
  index, corrects : integer;
  pressed : boolean;

implementation
  uses unit2;
{$R *.lfm}

{ TChecker }

procedure TChecker.buttonHandler(sender : TObject);
begin
  Checker.answerCheck.Text:= Checker.answerCheck.Text + TButton(sender).Caption;
end;

procedure TChecker.setButtonHandler(sender : TObject);
var
  i : integer;
begin
  setLength(ButtonArray, 33);
  ButtonArray[0] := Checker.RButton1;
  ButtonArray[1] := Checker.RButton2;
  ButtonArray[2] := Checker.RButton3;
  ButtonArray[3] := Checker.RButton4;
  ButtonArray[4] := Checker.RButton5;
  ButtonArray[5] := Checker.RButton6;
  ButtonArray[6] := Checker.RButton7;
  ButtonArray[7] := Checker.RButton8;
  ButtonArray[8] := Checker.RButton9;
  ButtonArray[9] := Checker.RButton10;
  ButtonArray[10] := Checker.RButton11;
  ButtonArray[11] := Checker.RButton12;
  ButtonArray[12] := Checker.RButton13;
  ButtonArray[13] := Checker.RButton14;
  ButtonArray[14] := Checker.RButton15;
  ButtonArray[15] := Checker.RButton16;
  ButtonArray[16] := Checker.RButton17;
  ButtonArray[17] := Checker.RButton18;
  ButtonArray[18] := Checker.RButton19;
  ButtonArray[19] := Checker.RButton20;
  ButtonArray[20] := Checker.RButton21;
  ButtonArray[21] := Checker.RButton22;
  ButtonArray[22] := Checker.RButton23;
  ButtonArray[23] := Checker.RButton24;
  ButtonArray[24] := Checker.RButton25;
  ButtonArray[25] := Checker.RButton26;
  ButtonArray[26] := Checker.RButton27;
  ButtonArray[27] := Checker.RButton28;
  ButtonArray[28] := Checker.RButton29;
  ButtonArray[29] := Checker.RButton30;
  ButtonArray[30] := Checker.RButton31;
  ButtonArray[31] := Checker.RButton32;
  ButtonArray[32] := Checker.RButton33;

  for i := 0 to high(buttonArray) do
  begin
    buttonArray[i].Visible := false;
    buttonArray[i].OnClick := @Checker.buttonHandler;
  end;
end;

procedure TChecker.AlphabetChange(Sender: TObject);
var
  i : integer;
begin
  if Alphabet.Caption = 'Cyrillic' then
  begin
    for i := 0 to high(buttonArray) do
      buttonArray[i].Visible := true;
  end else
  begin
    for i := 0 to high(buttonArray) do
      buttonArray[i].Visible := false;
  end;
end;

procedure TChecker.EnterClick(Sender: TObject);
var
  i : integer;
begin
  nextButton.Visible := true;
  if (answerCheck.Caption = unit2.answers[index]) then
  begin
    inc(corrects);
    aBooleans[index] := true;
    correctAnswer.Caption := 'Correct!';
  end else
  begin
    correctAnswer.Caption := 'Wrong! Correct answer: "' + answers[index] + '"';
    aBooleans[index] := true;
  end;
  i := getTickCount64;
  while (getTickCount64 < (i + 10000)) and not(pressed) and (checker.visible = true) do
  begin
    application.ProcessMessages;
    sleep(25);
  end;
  correctAnswer.Caption := '';
  pressed := false;
  if index = high(answers) then
  begin
    if corrects < trunc(length(answers)/2) then
      showMessage('You have got some work to do. ' + intToStr(corrects) + '/' + intToStr(length(answers))) else
      showMessage('Keep up the good work! ' + intToStr(corrects) + '/' + intToStr(length(answers)));
    nextButton.Visible := false;
    Checker.Visible := false;
  end;
end;

procedure TChecker.nextButtonClick(Sender: TObject);
begin
  pressed := true;
  answerCheck.Caption := '';
  nextButton.Visible := false;
end;

procedure TChecker.checkWords(Sender : TObject);
var
  i : integer;
begin
  Alphabet.Items.Clear;
  Alphabet.Items.Add('Cyrillic');
  setLength(aBooleans, length(answers));
  for i := 0 to high(aBooleans) do
    aBooleans[i] := false;
  corrects := 0;
  index := 0;
  for index := 0 to unit2.counter - 1 do
  begin

    nextButton.Visible := false;
    i := getTickCount64;
    questionCheck.Caption := unit2.questions[index];

    if (Checker.visible = false) then
      exit;

    while (getTickCount64 < (i + (strToInt(unit2.SetupForm.seconds.Caption) * 1000))) and (aBooleans[index] = false) and (Checker.visible = true)do
    begin
      application.ProcessMessages;
      secDisplay.Caption := intToStr((strToInt(unit2.SetupForm.seconds.Caption) - round((getTickCount64 - i) / 1000)));
      sleep(25);
    end;

    if aBooleans[index] = false then
    begin

      nextButton.Visible := true;
      correctAnswer.Caption := 'You ran out of time!';
      i := getTickCount64;

      while (getTickCount64 < (i + 10000)) and (not(pressed)) and (Checker.visible = true) do
      begin
        application.ProcessMessages;
        sleep(25);
      end;

      correctAnswer.Caption := '';

      if index = high(answers) then
      begin
        if corrects < trunc(length(answers)/2) then
          showMessage('You have got some work to do. ' + intToStr(corrects) + '/' + intToStr(length(answers))) else
          showMessage('Keep up the good work! ' + intToStr(corrects) + '/' + intToStr(length(answers)));
        Checker.Visible := false;
      end;

    end;

  end;
end;

end.

