unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Buttons;

type
  CompInfo=record
    index,top,left,width,height,fontsize:integer;
  end;
  complist=array of CompInfo;

  { TForm1 }


  TForm1 = class(TForm)
    ButtonSum: TButton;
    ButtonMinus: TButton;
    ButtonMult: TButton;
    ButtonDiv: TButton;
    ButtonClear: TButton;
    ButtonSQRT: TButton;
    ButtonBack: TButton;
    ButtonOne: TButton;
    ButtonTwo: TButton;
    ButtonThree: TButton;
    ButtonFour: TButton;
    ButtonFive: TButton;
    ButtonSix: TButton;
    ButtonSeven: TButton;
    ButtonEight: TButton;
    ButtonNine: TButton;
    ButtonZero: TButton;
    ButtonEqually: TButton;
    Edit1: TEdit;
    procedure ButtonSumClick(Sender: TObject);
    procedure ButtonMinusClick(Sender: TObject);
    procedure ButtonMultClick(Sender: TObject);
    procedure ButtonDivClick(Sender: TObject);
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonSQRTClick(Sender: TObject);
    procedure ButtonBackClick(Sender: TObject);
    procedure ButtonOneClick(Sender: TObject);
    procedure ButtonTwoClick(Sender: TObject);
    procedure ButtonThreeClick(Sender: TObject);
    procedure ButtonFourClick(Sender: TObject);
    procedure ButtonFiveClick(Sender: TObject);
    procedure ButtonSixClick(Sender: TObject);
    procedure ButtonSevenClick(Sender: TObject);
    procedure ButtonEightClick(Sender: TObject);
    procedure ButtonNineClick(Sender: TObject);
    procedure ButtonZeroClick(Sender: TObject);
    procedure ButtonEquallyClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);

  private
    { private declarations }
    DefWidth,defHeight:integer;
    clist:complist;
  public
    { public declarations }

  end;

var
  Form1: TForm1;
  ch1, ch2, rez: real;
  znak: char;

implementation
uses math;

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
begin
  defwidth:=width;
  defheight:=height;
  for i:= 0 to ComponentCount-1 do
    if (Components[i].Classname = 'TRadioButton')
    or (Components[i].Classname ='TCheckBox')
    or (Components[i].Classname ='TButton')
    or (Components[i].Classname ='TBitBtn')
    or (Components[i].Classname ='TSpeedButton')
    or (Components[i].Classname ='TEdit')
    or (Components[i].Classname ='TRadioGroup')
    or (Components[i].Classname ='TCheckGroup')
    or (Components[i].Classname ='TListBox')
    or (Components[i].Classname ='TComboBox')
    or (Components[i].Classname ='TEdit')
    or (Components[i].Classname ='TSpinEdit')
    or (Components[i].Classname ='TLabel') then begin
      setlength(clist,Length(clist)+1);
      clist[Length(clist)-1].top:=(Components[i] as tcontrol).top;
      clist[Length(clist)-1].left:=(Components[i]as tcontrol).left;
      clist[Length(clist)-1].width:=(Components[i] as tcontrol).width;
      clist[Length(clist)-1].height:=(Components[i]as tcontrol).height;
      clist[Length(clist)-1].fontsize:=(Components[i]as tcontrol).font.Size;
      clist[Length(clist)-1].index:=i;
    end;
end;

procedure TForm1.FormResize(Sender: TObject);
var i:integer;
begin
  if width >1000 then width:=800;
  if width<150   then width:=250;
  if height>800 then height:=800;
  if height<150 then height:=250;
  For i:=0 to length(clist)-1 do begin
    (components[clist[i].index] as tcontrol).Top:=round(clist[i].top*height/defheight);
    (components[clist[i].index] as tcontrol).height:=round(clist[i].height*height/defheight);
    (components[clist[i].index] as tcontrol).left:=round(clist[i].left*width/defwidth);
    (components[clist[i].index] as tcontrol).width:=round(clist[i].width*width/defwidth);
    (components[clist[i].index] as tcontrol).font.Size:=round(clist[i].fontsize*min(width/defwidth,height/defheight));
  end;
end;



procedure TForm1.ButtonOneClick(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + '1';
end;

procedure TForm1.ButtonBackClick(Sender: TObject);
var j, i:string;
begin
  j:=Edit1.Text;
  if j <> '' then Delete(j, Length(j), 1);
  Edit1.Text:=j;
end;

procedure TForm1.ButtonClearClick(Sender: TObject);
begin
  Edit1.Clear;
end;

procedure TForm1.ButtonSQRTClick(Sender: TObject);
begin
  if Edit1.Text = '' then abort;
  ch1 := StrToFloat(Edit1.Text);
  if ch1 > 0 then
  rez := sqrt(ch1);
  Edit1.Text:=FloatToStr(rez);
  if ch1<0 then Edit1.Text:='';
end;

procedure TForm1.ButtonSumClick(Sender: TObject);
begin
  if Edit1.Text = '' then abort;
  ch1:=StrToFloat(Edit1.Text);
  znak:= '+';
  Edit1.Clear;
end;


procedure TForm1.ButtonMinusClick(Sender: TObject);
begin
  if Edit1.Text = '' then abort;
  ch1:=StrToFloat(Edit1.Text);
  znak:= '-';
  Edit1.Clear;
end;

procedure TForm1.ButtonMultClick(Sender: TObject);
begin
  if Edit1.Text = '' then abort;
  ch1:=StrToFloat(Edit1.Text);
  znak:= '*';
  Edit1.Clear;
end;

procedure TForm1.ButtonDivClick(Sender: TObject);
begin
  if Edit1.Text = '' then abort;
  ch1:=StrToFloat(Edit1.Text);
  znak:= '/';
  Edit1.Clear;
end;

procedure TForm1.ButtonTwoClick(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + '2';
end;

procedure TForm1.ButtonThreeClick(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + '3';
end;

procedure TForm1.ButtonFourClick(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + '4';
end;

procedure TForm1.ButtonFiveClick(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + '5';
end;

procedure TForm1.ButtonSixClick(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + '6';
end;

procedure TForm1.ButtonSevenClick(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + '7';
end;

procedure TForm1.ButtonEightClick(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + '8';
end;

procedure TForm1.ButtonNineClick(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + '9';
end;

procedure TForm1.ButtonZeroClick(Sender: TObject);
begin
  Edit1.Text:=Edit1.Text + '0';
end;

procedure TForm1.ButtonEquallyClick(Sender: TObject);
begin
  if Edit1.Text = '' then abort;
  ch2 := StrToFloat(Edit1.Text);
  Edit1.Clear;
  if znak = '+' then
  begin
    rez := ch1 + ch2;
  end;
  if znak = '-' then
  begin
    rez := ch1 - ch2;
  end;
  if znak = '*' then
  begin
    rez := ch1 * ch2;
  end;
  if znak = '/' then
  begin
    if ch2 = 0 then begin ShowMessage('Деление на ноль невозможно!'); Abort; end;
    rez := ch1 / ch2;
  end;
  Edit1.Text:= FloatToStr(rez);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
  Edit1.MaxLength:=12;
end;

end.

