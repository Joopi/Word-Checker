unit Unit2;

{$mode objfpc}{$H+}

{SOMEWHAT COMPLICATED METHODS, IF YOU ARE LOOKING TO LEARN, READ HERE}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TSetupForm }

  TSetupForm = class(TForm)
    Answer: TEdit;
    Button1: TButton;
    Button2: TButton;
    minus: TButton;
    plus: TButton;
    ClearOne: TButton;
    ClearAll: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    seconds: TLabel;
    LatestAnswer: TLabel;
    LatestQuestion: TLabel;
    Question: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ClearAllClick(Sender: TObject);
    procedure ClearOneClick(Sender: TObject);
    procedure minusClick(Sender: TObject);
    procedure plusClick(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  SetupForm: TSetupForm;
  questions, answers : Array of String;
  counter : integer;

implementation
uses
  unit1;
{$R *.lfm}

{ TSetupForm }

procedure TSetupForm.Button1Click(Sender: TObject);
begin
  if (length(answer.text) > 0) and (length(question.text) > 0) then
  begin
    setLength(questions, length(questions) + 1);
    setLength(answers, length(answers) + 1);
    questions[high(questions)] := Question.Text;
    answers[high(answers)] := Answer.Text;
    latestQuestion.caption := Question.text;
    latestAnswer.caption := Answer.text;
    counter := length(answers);
    unit1.appName.Amount.Caption:= intToStr(Counter);
    answer.Text := '';
    question.Text := '';
  end else
    ShowMessage('Please fill in both of the text fields provided.');
end;

procedure TSetupForm.Button2Click(Sender: TObject);
begin
  if counter > 0 then
     setupForm.Close else
     showMessage('Please fill in the form provided atleast once before beginning.');
end;

procedure TSetupForm.ClearAllClick(Sender: TObject);
begin
  if counter > 0 then
  begin
    setLength(questions, 0);
    setLength(answers, 0);
    latestQuestion.caption := '';
    latestAnswer.caption := '';
    counter := 0;
    unit1.appName.Amount.Caption := intToStr(counter);
  end else showMessage('There is nothing to clear!');
end;

procedure TSetupForm.ClearOneClick(Sender: TObject);
begin
  if counter > 0 then
  begin
    dec(counter);
    unit1.appName.Amount.Caption:= intToStr(counter);
    setLength(questions, length(questions) -1);
    setLength(answers, length(answers) -1);
    if counter > 0 then
    begin
      latestQuestion.caption := questions[high(questions)];
      latestAnswer.caption := answers[high(answers)];
    end else
    begin
      latestQuestion.caption := '';
      latestAnswer.caption := '';
    end;
  end else showMessage('What are you doing?');
end;

procedure TSetupForm.minusClick(Sender: TObject);
begin
  if StrToInt(seconds.Caption) > 5 then
     seconds.Caption := intToStr(StrToInt(seconds.Caption) -1) else
        showMessage('A minimum of five seconds.');
end;

procedure TSetupForm.plusClick(Sender: TObject);
begin
  seconds.Caption := intToStr(StrToInt(seconds.Caption) + 1);
end;

end.

