unit OFDThread;

interface

uses
  Windows, Messages, StdCtrls, Controls, ExtCtrls, Classes, Forms, SysUtils,
    Dialogs,
  Registry, ComCtrls, ImgList, ComObj, Graphics, Menus, Shellapi, ToolWin,
    DrvFRLib_TLB;

type
  TOFDthread = class(TThread)
  private
    procedure test;
    procedure requestOFD;
    { Private declarations }
  protected
    procedure Execute; override;
  public
    ip, email: string;
    RichTDK: TRichEdit;
    CheckBox: TCheckBox;
    CheckBox2: TCheckBox;
    Drv: TDrvFR;
  end;
var
  tmpString: string;
implementation

procedure TOFDthread.test;
begin
  RichTDK.Lines.Add(tmpString);
end;

procedure TOFDthread.requestOFD;
var
  port: Integer;
  docs: Integer;
begin
  port := 7778;
  //MemoTDK.Clear;
  screen.Cursor := crHourglass;
  try
    Drv.ConnectionType := 6;
    Drv.IPAddress := IP;
    Drv.UseIPAddress := True;
    Drv.TCPPort := port; // TCP ���� ���
    Drv.Timeout := 5000; // ������� � ��
    Drv.Password := 30; // ������ ���������� ��������������
    tmpString := ('������� ������� ������ � ' + IP + ':' + IntToStr(port) + ' '
      + DateToStr(Now) + ' ' + TimeToStr(Now));
    Synchronize(test);
    if Drv.Connect <> 0 then // ��������� �����������
    begin
      tmpString := ('��� ����� � ���, ���: ' + Drv.ResultCodeDescription);
      Synchronize(test);
      RichTDK.SelAttributes.Color := clRed;
      Synchronize(test);
      tmpString := ('����������� �������������� �� ' + email +
        '(������ mail_con.vbs)');
      Synchronize(test);
      if (CheckBox2.checked = true) then
      begin
        tmpString := ('�������� ��������� ��������');
        Synchronize(test);
        ShellExecute(0, nil, 'mail_con.vbs', PChar(ip + ' ' + email), nil,
          SW_SHOW);
      end
      else
      begin
        tmpString := ('�������� ��������� ���������');
        Synchronize(test);
      end;
    end;
    Drv.TableNumber := 20;
    Drv.FieldNumber := 3;
    Drv.RowNumber := 1;
    if Drv.ReadTable = 0 then
    begin
      tmpString := ('������ ������� [20] "������ ������ ��"');
      Synchronize(test);
      tmpString := ('������ ���� [��� 1 ���� 3] ' + Drv.FieldName);
      Synchronize(test);
      if not Drv.FieldType then
      begin
        docs := Drv.ValueOfFieldInteger;
        if (docs = 0) then
          RichTDK.SelAttributes.Color := clGreen;
        if (docs > 0) then
          RichTDK.SelAttributes.Color := clPurple;
        if (docs > 200) then
          RichTDK.SelAttributes.Color := clRed;
        tmpString := ('�������������� ����������: ' + IntToStr(docs));
        Synchronize(test);
        if (Drv.ValueOfFieldInteger > 100) then
        begin
          RichTDK.SelAttributes.Color := clRed;
          tmpString := ('����������� �������������� �� ' + email +
            '(������ mail.vbs)');
          Synchronize(test);
          if (CheckBox.checked = true) then
          begin
            tmpString := ('�������� ��������� ��������');
            Synchronize(test);
            ShellExecute(0, nil, 'mail.vbs', PChar(ip + ' ' +
              IntToStr(Drv.ValueOfFieldInteger) + ' ' + email), nil, SW_SHOW);
          end
          else
          begin
            tmpString := ('�������� ��������� ���������');
            Synchronize(test);
          end;
        end;
      end
      else
      begin
        RichTDK.SelAttributes.Color := clRed;
        tmpString := ('������ Driver.FieldType ���: ' +
          Drv.ResultCodeDescription);
        Synchronize(test);
      end;
    end
    else
    begin
      RichTDK.SelAttributes.Color := clRed;
      tmpString := ('������ Driver.ReadTable ���: ' +
        Drv.ResultCodeDescription);
      Synchronize(test);
    end;
  finally
    tmpString := ('');
    Synchronize(test);
    Drv.Free;
  end;
end;

procedure TOFDthread.Execute;
begin
  requestOFD;
  exit;
end;
end.

