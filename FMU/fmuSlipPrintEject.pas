unit fmuSlipPrintEject;

interface

uses
  // VCL
  Classes, Controls, StdCtrls, ExtCtrls, Buttons,
  // This
  untPages, untDriver, untTypes;

type
  { TfmSlipPrint }

  TfmSlipPrintEject = class(TPage)
    btnPrintSlipDocument: TBitBtn;
    chkIsClearUnfiscalInfo: TCheckBox;
    cbInfoType: TComboBox;
    lblInfoType: TLabel;
    btnEject: TButton;
    grpPrint: TGroupBox;
    grpEject: TGroupBox;
    cbEjectDirection: TComboBox;
    lblEjectDirection: TLabel;
    btnTestSlip: TButton;
    btnReprint: TButton;
    procedure btnPrintSlipDocumentClick(Sender: TObject);
    procedure btnEjectClick(Sender: TObject);
    procedure btnTestSlipClick(Sender: TObject);
    procedure btnReprintClick(Sender: TObject);
  public
    procedure UpdateObject; override;
  end;

implementation

{$R *.DFM}

{ TfmSlipPrint }

procedure TfmSlipPrintEject.UpdateObject;
begin
  if DriverExists then
  begin
    Driver.InfoType := cbInfoType.ItemIndex;
    Driver.IsClearUnfiscalInfo := chkIsClearUnfiscalInfo.Checked;
  end;
end;

// ��������
procedure TfmSlipPrintEject.btnPrintSlipDocumentClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    UpdateObject;
    Check(Driver.PrintSlipDocument);
    Driver.OperationBlockFirstString := 0;
  finally
    EnableButtons(True);
  end;
end;

// ����������
procedure TfmSlipPrintEject.btnReprintClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Check(Driver.ReprintSlipDocument);
    Driver.OperationBlockFirstString := 0;
  finally
    EnableButtons(True);
  end;
end;

// ����������
procedure TfmSlipPrintEject.btnEjectClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Driver.EjectDirection := cbEjectDirection.ItemIndex;
    Check(Driver.EjectSlipDocument);
  finally
    EnableButtons(True);
  end;
end;

// �������� ���
procedure TfmSlipPrintEject.btnTestSlipClick(Sender: TObject);
begin
  EnableButtons(False);
  try
    Check(Driver.WaitForPrinting);
    // ������� �����
    Check(Driver.ClearSlipDocumentBuffer);

    // ��������� ������������ ������
    Driver.StringNumber := 1;
    Driver.StringForPrinting := SLine1;
    Driver.FillSlipDocumentWithUnfiscalInfo;

    Driver.StringNumber := 2;
    Driver.StringForPrinting := SLine2;
    Driver.FillSlipDocumentWithUnfiscalInfo;

    // ��������� ����������� ��
    Driver.CheckType := 0;
    Driver.CopyType := 0;
    Driver.NumberOfCopies := 0;
    Driver.CopyOffset1 := 0;
    Driver.CopyOffset2 := 0;
    Driver.CopyOffset3 := 0;
    Driver.CopyOffset4 := 0;
    Driver.CopyOffset5 := 0;
    Check(Driver.OpenStandardFiscalSlipDocument);

    Driver.OperationBlockFirstString := Driver.OperationBlockFirstString +
      Driver.ReadTableDef(12, 1, 6, 6) + 3;

    Check(Driver.WaitForPrinting);

    // ������ ����������� ����������� �� ��
    Driver.Quantity := 1.25;
    Driver.Price := 127.34;
    Driver.Department := 1;
    Driver.Tax1 := 0;
    Driver.Tax2 := 0;
    Driver.Tax3 := 0;
    Driver.Tax4 := 0;
    Driver.StringForPrinting := SStringForPrinting;
    Check(Driver.StandardRegistrationOnSlipDocument);

    Driver.OperationBlockFirstString := Driver.OperationBlockFirstString +
      Driver.ReadTableDef(13, 1, 2, 3);

    Check(Driver.WaitForPrinting);

    // ������ ����������� ������ �� ��
    Driver.Summ1 := 14.5;
    Driver.Tax1 := 0;
    Driver.Tax2 := 0;
    Driver.Tax3 := 0;
    Driver.Tax4 := 0;
    Driver.StringForPrinting := '';
    Check(Driver.StandardDiscountOnSlipDocument);

    Driver.OperationBlockFirstString := Driver.OperationBlockFirstString +
      Driver.StringQuantityinOperation;

    Check(Driver.WaitForPrinting);

    // ������ ����������� �������� �� ��
    Driver.Summ1 := 14.5;
    Driver.Tax1 := 0;
    Driver.Tax2 := 0;
    Driver.Tax3 := 0;
    Driver.Tax4 := 0;
    Driver.StringForPrinting := '';
    Check(Driver.StandardChargeOnSlipDocument);

    Driver.OperationBlockFirstString := Driver.OperationBlockFirstString +
      Driver.StringQuantityinOperation;

    Check(Driver.WaitForPrinting);

    // ������ ����������� �������� ��
    Driver.Summ1 := 1235;
    Driver.Summ2 := 0;
    Driver.Summ3 := 0;
    Driver.Summ4 := 0;
    Driver.DiscountOnCheck := 2.35;
    Driver.Tax1 := 0;
    Driver.Tax2 := 0;
    Driver.Tax3 := 0;
    Driver.Tax4 := 0;
    Driver.StringForPrinting := '';
    Check(Driver.StandardCloseCheckOnSlipDocument);

    Check(Driver.WaitForPrinting);

    // �������� ��
    Driver.IsClearUnfiscalInfo := True;
    Driver.InfoType := 2;
    Check(Driver.PrintSlipDocument);

    Check(Driver.WaitForPrinting);
  finally
    EnableButtons(True);
  end;
end;

end.
