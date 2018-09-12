unit fmuMain;

interface

uses
  // VCL
  Windows, Messages, StdCtrls, Controls, ExtCtrls, Classes, Forms, SysUtils,
  Dialogs,
  Registry, ComCtrls, ImgList, ComObj, Graphics, Menus, Shellapi, ToolWin,
  Clipbrd, IniFiles,
  // This
  BaseForm, untPages, untUtil, fmuPrintText, fmuPrintHeader, fmuPrintImage,
  fmuPrintImage2, fmuReceipt, fmuSlipDiscountCharge, fmuSlipOpen,
  fmuSlipRegistration, fmuSlipClose, fmuSlipConfigure, fmuSlipBuffer,
  fmuSlipPrintEject, fmuReports, fmuReadDump, fmuWriteSerial, fmuFiscalMemory,
  fmuBelarus, fmuTaxOfficer, fmuLogicDevice, fmuTable, fmuConnection, fmuAbout,
  fmuFont, fmuPresenter, fmuIBMPrinter, fmuCashControl, fmuConnectionTest,
  fmuPrintServer, fmuPrintLine, fmuPrintBarcode, fmuPrintTest, fmuTotalizers,
  fmuDeviceStatus, fmuWorkTotalizer, fmuCashTotalizer, fmuPrintBuffer,
  fmuFindDevice, fmuDateTime, fmuResetSettings, fmuPrintAttribute,
  fmuEJDocument, fmuEJSession, fmuEJOperations, fmuEJStatus, fmuEJReportPrint,
  fmuEJReports, fmuEJActivizationResult, fmuTabbedPage, fmuPrintOperations,
  fmuFullStatus, fmuBillAcceptor, untTestParams, fmuTestReceipt, fmuCashDrawer,
  fmuPrintBarcodePrinter, fmuTestMultiReceipt, fmuTaxOfficer2,
  fmuMasterPayReceipt, fmuMasterPayBuffer, fmuMasterPayText,
  DrvFRLib_TLB, untVInfo, untDriver, GlobalConst, LangUtils,
  fmu2DBarcode, fmuPDF417, fmuReportBuffer, fmuCommand, fmuTestEncoding,
  fmuModemParam, fmuWares, fmuCashCore, XPMan, unit1, sSkinProvider,
  sSkinManager, acProgressBar, sListBox, sRichEdit, acTitleBar;

type
  { TfmMain }

  TfmMain = class(TBaseForm)
    pnlMain: TPanel;
    ListBox: TListBox;
    Splitter: TSplitter;
    pnlSite: TPanel;
    pnlInfo: TPanel;
    Bevel2: TBevel;
    Bevel1: TBevel;
    lblRxData: TLabel;
    lblTxData: TLabel;
    lblResult: TLabel;
    lblTime: TLabel;
    lblOperator: TLabel;
    lblPassword: TLabel;
    edtInput: TEdit;
    edtOutput: TEdit;
    edtResult: TEdit;
    edtTime: TEdit;
    btnProperties: TButton;
    btnClose: TButton;
    edtOperator: TEdit;
    edtPassword: TEdit;
    Button2: TButton;
    Edit1: TEdit;
    Button3: TButton;
    Button4: TButton;
    Button1: TButton;
    XPManifest1: TXPManifest;
    Timer1: TTimer;
    Edit2: TEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    sProgressBar1: TsProgressBar;
    sListBox1: TsListBox;
    RichTDK: TsRichEdit;
    CheckBox3: TCheckBox;
    Edit3: TEdit;
    Label1: TLabel;
    Button5: TButton;
    procedure btnAboutClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure miExitClick(Sender: TObject);
    procedure miMailtoClick(Sender: TObject);
    procedure tbMailtoClick(Sender: TObject);
    procedure ListViewChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
    procedure ListBoxClick(Sender: TObject);
    procedure ListBoxDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure btnPropertiesClick(Sender: TObject);
    procedure edtPasswordChange(Sender: TObject);
    procedure edtPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure miShowPropertiesClick(Sender: TObject);
    procedure SplitterCanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
    procedure edtPasswordExit(Sender: TObject);
    procedure CheckOFD(IP: string);
    procedure OnThreadDone(ASender: TObject);
    procedure OnThreadDoneList(ASender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure OFDListCheck;
    procedure RichTDKChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button5Click(Sender: TObject);
  private
    FPage: TPage;
    FPages: TPages;
    FEJournalPage: TfmTabbedPage;

    function GetTabIndex: Integer;

    procedure Mailto;
    procedure SaveParams;
    procedure UpdateListBox;
    procedure SetTab(ATabIndex: Integer);
    procedure SetPageIndex(Index, TabIndex: Integer);
    procedure ShowPage(APage: TPage; ACaption: string);
    procedure GetPageIndex(APage: TPage; var Index, TabIndex: Integer);

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure SetPage(APage: TPage);
  end;

var
  fmMain: TfmMain;
  globalTest: integer;
  globalTestMax: integer;
  trh: TOFDthread;
implementation

{$R *.DFM}

const
  REGSTR_KEY_DRVFRTST = '\SOFTWARE\ShtrihM\Tests\DrvFR\A4\Param';

resourcestring
  SPageSlip = 'ПД';
  SPageStatus = 'Состояние';
  SPageText = 'Печать текста';
  SPageRegistration = 'Регистрация';
  SReports = 'Отчеты';
  SPageGraphics = 'Печать графики';
  SPageService = 'Сервис';
  SPageParams = 'Параметры устройства';
  SPageEJournal = 'ЭКЛЗ';
  SPageAdvanced = 'Прочее';
  SApplicationName = 'Тест%%20драйвера';
  SMilliseconds = 'мс';
  SApplicationVersion = 'Версия теста: ';
  SInvalidPassword = 'Некорректное значение в поле "Password"';
  SRestartApplication = 'Для измения языка необходимо перезапустить приложение';

  { TfmMain }

constructor TfmMain.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

destructor TfmMain.Destroy;
begin
  sListBox1.Items.SaveToFile('ip-addresses.txt');
  SaveParams;
  FPage := nil;
  FPages.Free;
  FreeDriver;
  FreeTestParams;
  inherited Destroy;
end;

procedure TfmMain.SaveParams;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    if Reg.OpenKey(REGSTR_KEY_DRVFRTST, True) then
    begin
      SaveControlParams(Name, Self, Reg);
      Reg.WriteInteger('PageIndex', ListBox.ItemIndex);
      Reg.WriteInteger('TabIndex', GetTabIndex);
    end;
  finally
    Reg.Free;
  end;
end;

procedure TfmMain.btnAboutClick(Sender: TObject);
begin
  ShowAboutBox(Handle, Application.Title,
    [SApplicationVersion + GetModuleVersion]);
end;

procedure TfmMain.FormCreate(Sender: TObject);
var
  DataIni: TIniFile;
begin
  //FPages := TPages.Create;
  //PageNotifier.OnChange := PagesChanged;
  //CreatePages;
  //InitializePages;
  //LoadParams;
  //FOldEditWndProc := edtPassword.WindowProc;
  //edtPassword.WindowProc := NewEditWndProc;
  edit3.text := 'servicedesk@tdkolomna.ru';
  if FileExists(extractfilepath(paramstr(0)) + 'email.ini') then
  begin
    DataIni := TIniFile.Create(extractfilepath(paramstr(0)) + 'email.ini');
    try
      edit3.Text := DataIni.ReadString('INFO', 'email', '');
    finally
      FreeAndNil(DataIni);
    end;
  end
  else
    edit3.text := 'servicedesk@tdkolomna.ru';
  if FileExists('ip-addresses.txt') then
    sListBox1.Items.LoadFromFile('ip-addresses.txt');
  if (sListBox1.Items.Count > 0) then
    sListBox1.Selected[0] := True;
  if (ParamCount = 3) then
  begin
    if (ParamStr(1) = 'SendEmailsOfd') then
      CheckBox2.Checked := true;
    //касса имеет более 200 неотправленных - отправлять ли письмо
    if (ParamStr(2) = 'StartCheckList') then
      Button2.OnClick(nil);
    if (ParamStr(3) = 'SendEmailsOffline') then
      CheckBox3.Checked := true; //касса офлайн - посылаем ли письмо
  end;
  if (ParamCount = 2) then
  begin
    if (ParamStr(1) = 'SendEmailsOfd') then
      CheckBox2.Checked := true;
    //касса имеет более 200 неотправленных - отправлять ли письмо
    if (ParamStr(2) = 'StartCheckList') then
      Button2.OnClick(nil);
    //if(ParamStr(3) = 'SendEmailsOffline') then CheckBox3.Checked:=true;  //касса офлайн - посылаем ли письмо
  end;
  Application.Title := Caption + ' ' + DeviceName;
  Caption := Caption + ' ' + DeviceName + ' ' + GetFileVersionInfoStr;
  //edtPassword.Text := IntToStr(Driver.Password);
end;

procedure TfmMain.btnCloseClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.ShowPage(APage: TPage; ACaption: string);
begin
  if APage <> FPage then
  begin
    if FPage <> nil then
    begin

      FPage.UpdateObject;
    end;
    if APage <> nil then
    begin
      APage.Align := alClient;
      APage.Visible := True;

      APage.UpdatePage;
      APage.Width := pnlSite.ClientWidth;
      APage.Height := pnlSite.ClientHeight;
    end;
    if FPage <> nil then
    begin
      FPage.Visible := False;
    end;
    FPage := APage;
    UpdateListBox;
  end;
end;

procedure TfmMain.miExitClick(Sender: TObject);
begin
  Close;
end;

procedure TfmMain.Mailto;
var
  S: WideString;
begin
  S := Format('mailto:support@shtrih-m.ru?subject=%s%%20%%20%s',
    [SApplicationName, GetModuleVersion]);
  ShellExecuteW(Handle, 'open', PWideChar(S), nil, nil, SW_SHOWDEFAULT);
end;

procedure TfmMain.miMailtoClick(Sender: TObject);
begin
  Mailto;
end;

procedure TfmMain.tbMailtoClick(Sender: TObject);
begin
  Mailto;
end;

procedure TfmMain.UpdateListBox;
var
  MaxWidth: Integer;
begin
  if FPage <> nil then
  begin
    MaxWidth := Width - FPage.Constraints.MinWidth - 20;
    if MaxWidth > ListBox.Constraints.MinWidth then
      ListBox.Constraints.MaxWidth := MaxWidth
    else
      ListBox.Constraints.MaxWidth := ListBox.Constraints.MinWidth;
  end;
end;

procedure TfmMain.ListViewChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  ShowPage(TPage(Item.Data), Item.Caption);
end;

procedure TfmMain.ListBoxClick(Sender: TObject);
var
  Item: TPage;
begin
  Item := TPage(ListBox.Items.Objects[ListBox.ItemIndex]);
  ShowPage(Item, ListBox.Items[ListBox.ItemIndex]);
end;

procedure TfmMain.ListBoxDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  S: WideString;
begin
  ListBox.Canvas.FillRect(Rect);
  S := Format('%.2d. %s', [Index + 1, ListBox.Items[Index]]);
  ListBox.Canvas.TextOut(Rect.Left + 8, Rect.Top + 4, S);
end;

procedure TfmMain.btnPropertiesClick(Sender: TObject);
begin
  Driver.ShowProperties;
  edtPassword.Text := IntToStr(Driver.Password);
  FEJournalPage.EnableButtons(Driver.GetCapEJournal);
  if FPage <> nil then
    FPage.UpdatePage;
end;

procedure TfmMain.edtPasswordChange(Sender: TObject);
begin
  Driver.Password := StrToInt(edtPassword.Text);
end;

procedure TfmMain.edtPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', Chr(VK_TAB), Chr(VK_DELETE), Chr(VK_BACK)]) then
    Key := #0;
end;

procedure TfmMain.miShowPropertiesClick(Sender: TObject);
begin
  Driver.ShowProperties;
end;

function TfmMain.GetTabIndex: Integer;
var
  Item: TPage;
begin
  Result := 0;
  if (ListBox.Count = 0) or (ListBox.ItemIndex < 0) then
    Exit;
  if not (ListBox.Items.Objects[ListBox.ItemIndex] is TPage) then
    Exit;
  Item := TPage(ListBox.Items.Objects[ListBox.ItemIndex]);
  if Item.ComponentCount = 0 then
    Exit;
  if Item.Components[0] is TPageControl then
    Result := TPageControl(Item.Components[0]).ActivePageIndex
  else
    Result := 0;
end;

procedure TfmMain.SetTab(ATabIndex: Integer);
var
  Item: TPage;
begin
  Item := TPage(ListBox.Items.Objects[ListBox.ItemIndex]);
  if Item.ComponentCount < 0 then
    Exit;
  if Item.Components[0] is TPageControl then
    if TPageControl(Item.Components[0]).PageCount > ATabIndex then
      TPageControl(Item.Components[0]).ActivePageIndex := ATabIndex;
end;

procedure TfmMain.SplitterCanResize(Sender: TObject; var NewSize: Integer;
  var Accept: Boolean);
begin
  if NewSize > 200 then
    Accept := False
  else
    Accept := True;
end;

procedure TfmMain.SetPage(APage: TPage);
var
  i, j: Integer;
begin
  GetPageIndex(APage, i, j);
  SetPageIndex(i, j);
end;

procedure TfmMain.GetPageIndex(APage: TPage; var Index, TabIndex: Integer);
var
  i: Integer;
  j: Integer;
  Item: TPage;
begin
  Index := -1;
  TabIndex := -1;
  for i := 0 to ListBox.Items.Count - 1 do
  begin
    Item := TPage(ListBox.Items.Objects[i]);
    if Item = APage then
    begin
      Index := i;
      Break;
    end;
    if Item.ComponentCount = 0 then
      Continue;
    if Item.Components[0] is TPageControl then
    begin
      for j := 0 to TPageControl(Item.Components[0]).PageCount - 1 do
      begin
        if TPageControl(Item.Components[0]).Pages[j].ContainsControl(APage) then
        begin
          Index := i;
          TabIndex := j;
          Break;
        end;
      end;
    end;
  end;
end;

procedure TfmMain.SetPageIndex(Index, TabIndex: Integer);
begin
  if Index < 0 then
    Exit;
  ListBox.ItemIndex := Index;
  ListBoxClick(Self);
  if TabIndex < 0 then
    Exit;
  SetTab(TabIndex);
end;

procedure TfmMain.edtPasswordExit(Sender: TObject);
begin
  edtPassword.Text := IntToStr(Driver.Password);
end;

procedure TfmMain.CheckOFD(IP: string);
var
  port: Integer;
  Drv: TDrvFR;
begin
  Drv := TDrvFR.Create(nil);
  port := 7778;
  //MemoTDK.Clear;
  screen.Cursor := crHourglass;
  EnableButtons(False);
  try
    Drv.ConnectionType := 6;
    Drv.IPAddress := IP;
    Drv.UseIPAddress := True;
    Drv.TCPPort := port; // TCP Порт ККТ
    Drv.Timeout := 5000; // Таймаут в мс
    Drv.Password := 30; // Пароль системного администратора
    RichTDK.Lines.Add('Попытка запроса данных с ' + IP + ':' + IntToStr(port) +
      ' ' + DateToStr(Now) + ' ' + TimeToStr(Now));
    if Drv.Connect <> 0 then // Проверяем подключение
    begin
      RichTDK.SelAttributes.Color := clRed;
      RichTDK.Lines.SaveToFile('ofd_monitoring_log.txt');
      RichTDK.Lines.Add('Нет связи с ККМ, код: ' + Drv.ResultCodeDescription);
      RichTDK.SelAttributes.Color := clRed;
      RichTDK.Lines.add('отправление предупреждения на ServiceDesk(mail_con.vbs)');
      //ShellExecute(0, nil, 'mail_con.vbs', PChar(ip), nil, SW_SHOW);
    end;
    Drv.TableNumber := 20;
    Drv.FieldNumber := 3;
    Drv.RowNumber := 1;
    if Drv.ReadTable = 0 then
    begin
      RichTDK.Lines.Add('Имя поля [20:3:1] ' + Drv.FieldName);
      if not Drv.FieldType then
      begin
        RichTDK.Lines.SaveToFile('ofd_monitoring_log.txt');
        RichTDK.Lines.Add('Неотправленных документов: ' +
          IntToStr(Drv.ValueOfFieldInteger));
        if (Drv.ValueOfFieldInteger > 200) then
        begin
          RichTDK.SelAttributes.Color := clRed;
          RichTDK.Lines.add('отправление предупреждения на ServiceDesk(mail.vbs)');
          //ShellExecute(0, nil, 'mail.vbs', PChar(ip + ' ' + IntToStr(Drv.ValueOfFieldInteger)), nil, SW_SHOW);
        end;
      end
      else
      begin
        RichTDK.SelAttributes.Color := clRed;
        RichTDK.Lines.Add('Ошибка Driver.FieldType код: ' +
          Drv.ResultCodeDescription);
      end;
    end
    else
    begin
      RichTDK.SelAttributes.Color := clRed;
      RichTDK.Lines.Add('Ошибка Driver.ReadTable код: ' +
        Drv.ResultCodeDescription);
    end;
  finally
    RichTDK.Lines.Add('');
    Drv.Free;
  end;
end;

procedure TfmMain.Button2Click(Sender: TObject);
var
  i: integer;
  Drv: TDrvFR;
begin
  EnableButtons(False);
  Drv := TDrvFR.Create(nil);
  globalTestMax := sListBox1.Items.Count - 1;
  i := 0;
  trh := TOFDthread.Create(True);
  trh.Priority := tpIdle;
  trh.RichTDK := RichTDK;
  trh.CheckBox := CheckBox2;
  trh.CheckBox2 := CheckBox3;
  trh.email := edit3.Text;
  trh.Drv := Drv;
  trh.ip := slistBox1.Items[i];
  trh.Resume;
  trh.OnTerminate := OnThreadDoneList;
  globalTest := i;
  EnableButtons(True);
  screen.Cursor := crDefault;
end;

procedure TfmMain.OFDListCheck();
var
  Drv: TDrvFR;
begin
  sProgressBar1.Max := sListBox1.Items.Count;
  sProgressBar1.Position := globalTest + 1;
  //RichTDK.Lines.Add(IntToStr(globalTestMax) + ' ' + IntToStr(globalTest));
  if (not (globalTestMax <= globalTest)) then
  begin
    EnableButtons(False);
    Drv := TDrvFR.Create(nil);
    trh := TOFDthread.Create(True);
    trh.Priority := tpIdle;
    trh.RichTDK := RichTDK;
    trh.Drv := Drv;
    trh.CheckBox := CheckBox2;
    trh.CheckBox2 := CheckBox3;
    trh.email := edit3.Text;
    globalTest := globalTest + 1;
    trh.ip := slistBox1.Items[globalTest];
    trh.Resume;
    trh.OnTerminate := OnThreadDoneList;
  end
  else
  begin
    sProgressBar1.Position := 0;
    OnThreadDone(nil);
  end;
end;

procedure TfmMain.Button3Click(Sender: TObject);
begin
  sListBox1.Items.Add(Edit1.Text);
end;

procedure TfmMain.Button4Click(Sender: TObject);
begin
  sListBox1.DeleteSelected;
end;

procedure TfmMain.Button1Click(Sender: TObject);
var
  Drv: TDrvFR;
begin
  EnableButtons(False);
  Drv := TDrvFR.Create(nil);
  trh := TOFDthread.Create(True);
  trh.Priority := tpIdle;
  trh.RichTDK := RichTDK;
  trh.CheckBox := CheckBox2;
  trh.CheckBox2 := CheckBox3;
  trh.email := edit3.Text;
  trh.Drv := Drv;
  trh.ip := slistBox1.Items[slistBox1.ItemIndex];
  trh.Resume;
  trh.OnTerminate := OnThreadDone;
end;

procedure TfmMain.OnThreadDone(ASender: TObject);
begin
  EnableButtons(True);
  screen.Cursor := crDefault;
end;

procedure TfmMain.OnThreadDoneList(ASender: TObject);
begin
  OFDListCheck;
end;

procedure TfmMain.CheckBox1Click(Sender: TObject);
begin
  if (CheckBox1.Checked) then
  begin
    EnableButtons(false);
    Timer1.Enabled := true;
    Timer1.Interval := StrToInt(Edit2.Text) * 1000 * 60;
    Timer1.OnTimer(nil);
  end
  else
  begin
    Timer1.Enabled := false;
  end;
end;

procedure TfmMain.Timer1Timer(Sender: TObject);
var
  i: Integer;
  Drv: TDrvFR;
begin
  RichTDK.Lines.Add('Старт по интервалу ' + DateToStr(Now) + ' ' +
    TimeToStr(Now));
  EnableButtons(False);
  Drv := TDrvFR.Create(nil);
  trh := TOFDthread.Create(True);
  trh.CheckBox := CheckBox2;
  trh.CheckBox2 := CheckBox3;
  trh.email := edit3.Text;
  globalTestMax := sListBox1.Items.Count - 1;
  i := 0;
  trh.Priority := tpIdle;
  trh.RichTDK := RichTDK;
  trh.Drv := Drv;
  trh.ip := slistBox1.Items[i];
  trh.Resume;
  trh.OnTerminate := OnThreadDoneList;
  globalTest := i;
  EnableButtons(True);
  screen.Cursor := crDefault;
end;

procedure TfmMain.RichTDKChange(Sender: TObject);
begin
  RichTDK.SelStart := RichTDK.GetTextLen;
  SendMessage(RichTDK.handle, EM_SCROLLCARET, 0, 0);
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if (not (trh = nil)) then
    trh.Terminate;
end;

procedure TfmMain.Button5Click(Sender: TObject);
var
  DataIni: TIniFile;
begin
  DataIni := TIniFile.Create(extractfilepath(paramstr(0)) + 'email.ini');
  try
    DataIni.WriteString('INFO', 'email', edit3.Text);
  finally
    FreeAndNil(DataIni);
  end;
end;

end.

