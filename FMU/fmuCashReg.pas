unit fmuCashReg;

interface

uses
    // VCL
  Windows, ComCtrls, StdCtrls, Controls, Classes, SysUtils, Forms, ExtCtrls,
  Buttons,
  // This
  untPages, untUtil, untDriver, untTypes;

type
  { TfmCashReg }

  TfmCashReg = class(TPage)
    Memo: TMemo;
    btnRead: TBitBtn;
    btnStop: TButton;
    btnReadAll: TButton;
    procedure btnReadClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnReadAllClick(Sender: TObject);
  private
    FStopFlag: Boolean;
    procedure AddRegisters;
    procedure AddAllRegisters;
    procedure AddCaption(const S: string);
    procedure Terminate(const Message: string);
    procedure AddCashRegisters(const S: string; L: Integer; H: Integer);
  end;

implementation

{$R *.DFM}

{ TfmCashReg }

procedure TfmCashReg.AddCaption(const S: string);
begin
  Memo.Lines.Add('');
  Memo.Lines.Add(S);
  Memo.Lines.Add(' ' + StringOfChar('-', 56));
end;

procedure TfmCashReg.AddCashRegisters(const S: string; L: Integer; H: Integer);
var
  i: Integer;
  RegisterName: string;
begin
  AddCaption(S);
  for i := L to H do
  begin
    if FStopFlag then
      Terminate('<�������� �������������>');
    Driver.RegisterNumber := i;
    if Driver.GetCashReg <> 0 then
    begin
      Terminate(Format('<�������� � ���������� ������: %d %s>',
                  [Driver.ResultCode, Driver.ResultCodeDescription]));
    end;
    if i in [0..High(CashRegisterName)] then
      RegisterName := CashRegisterName[i]
    else
      RegisterName := '<�������� ����������>';

    Memo.Lines.Add(Format(' %3d.%-44s : %s',
      [i, RegisterName, CurrToStr(Driver.ContentsOfCashRegister)]));
    Application.ProcessMessages;
  end;
end;

procedure TfmCashReg.AddRegisters;
begin
  AddCashRegisters(' ����������:', $00, $57);
  AddCashRegisters(' ������ ��:', $58, $67);
  AddCashRegisters(' ���������� ��:', $68, $77);
  AddCashRegisters(' ����������:', $78, $78);
  AddCashRegisters(' ����������:', $79, $D0);
  AddCashRegisters(' ������ ��:', $D1, $E0);
  AddCashRegisters(' ���������� ��:', $E1, $F0);
  AddCashRegisters(' ����������:', $F1, $F3);
  AddCashRegisters(' ������������ �����:', $F4, $F4);
  AddCashRegisters(' �����:', $F5, $F8);
  AddCashRegisters(' ����� ��������������:', $F9, $FC);
end;

procedure TfmCashReg.AddAllRegisters;
var
  i: Integer;
begin
  for i := 0 to 255 do
  begin
    if FStopFlag then
      Terminate('<�������� �������������>');
    Driver.RegisterNumber := i;
    if Driver.GetCashReg <> 0 then
    begin
      Terminate(Format('<�������� � ���������� ������: %d %s>',
                  [Driver.ResultCode, Driver.ResultCodeDescription]));
    end;
    Memo.Lines.Add(Format(' %3d.%-56s : %s',
      [i, Driver.NameCashReg, CurrToStr(Driver.ContentsOfCashRegister)]));
    Application.ProcessMessages;
  end;
end;

procedure TfmCashReg.btnReadClick(Sender: TObject);
begin
  EnableButtons(False);
  btnStop.Enabled := True;
  try
    try
      FStopFlag := False;
      Memo.Clear;
      AddCaption(' �������� ��������:');
      AddRegisters;
      // ������������ Memo �� ������
      Memo.SelStart := 0;
      Memo.SelLength := 0;
    except
      on E: EAbort do
        Memo.Lines.Add(E.Message);
    end;
  finally
    EnableButtons(True);
    btnStop.Enabled := False;
  end;
end;

procedure TfmCashReg.Terminate(const Message: string);
begin
  raise EAbort.Create(Message);
end;

procedure TfmCashReg.btnStopClick(Sender: TObject);
begin
  FStopFlag := True;
end;

procedure TfmCashReg.btnReadAllClick(Sender: TObject);
begin
  EnableButtons(False);
  btnStop.Enabled := True;
  try
    try
      FStopFlag := False;
      Memo.Clear;
      AddCaption(' �������� ��������:');
      AddAllRegisters;
      // ������������ Memo �� ������
      Memo.SelStart := 0;
      Memo.SelLength := 0;
    except
      on E: EAbort do
        Memo.Lines.Add(E.Message);
    end;
  finally
    EnableButtons(True);
    btnStop.Enabled := False;
  end;
end;

end.
