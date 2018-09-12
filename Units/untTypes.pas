unit untTypes;

interface

type
  { TIntParam }

  TIntParam = record
    Name: string;
    Value: Integer;
  end;

resourcestring
  SBooleanTrue = '[��]';
  SBooleanFalse = '[���]';
  SFlags = '�����';
  SFMFlags = '����� ��';
  SFMFlagsEx = '���. ����� ��';
  SFMMode = '����� ��';
  SASPDMode = '����� ����';
  SIsCorruptedFMRecords = '���������� 3 ��� ����� �������';
  SIsCorruptedFiscalizationInfo = '���������� ������ ������������';
  SQuantityPointPosition = '����������� �������� ����������';
  SPresenterOut = '������ �� ������ �� ����������';
  SPresenterIn = '������ �� ����� � ����������';
  SIsEKLZOverflow = '���� ����� ���������';
  SIsDrawerOpen = '�������� ���� ������';
  SLidPositionSensor = '������ ������� �������';
  SReceiptRibbonLever = '����� ������������ ���� ������';
  SJournalRibbonLever = '����� ������������ ������� ������';
  SReceiptRibbonOpticalSensor = '���������� ������ ����';
  SJournalRibbonOpticalSensor = '���������� ������ �������';
  SEKLZIsPresent = '���� ����';
  SPointPosition = '2 ����� ����� ������� � ����';
  SSlipDocumentIsPresent = '������ ������ ��';
  SSlipDocumentIsMoving = '������� ������ ��';
  SReceiptRibbonIsPresent = '����� ������� �����';
  SJournalRibbonIsPresent = '����� ����������� �����';
  SStatusQuery = ' ������ ���������:';
  SPrinterMode = ' �����: ';
  SPrinterSoftwareVersion = '������ ��';
  SPrinterSoftwareBuild = '������ ��';
  SPrinterSoftwareDate = '���� ��';
  SFMSoftwareVersion = '������ �� ��';
  SFMSoftwareBuild = '������ �� ��';
  SFMSoftwareDate = '���� �� ��';
  SPrinterSubMode = '��������';
  SPrinterModeStatus = '������ ������';
  SLogicalNumber = '����� ��� � ����';
  SDocumentNumber = '����� ���������';
  SPortNumber = '����� �����';
  SRegistrationNumber = '���������� ������������';
  SFreeRegistration = '�������� ������������';
  SSessionNumber = '��������� �������� �����';
  SFreeRecordInFM = '��������� ������� � ��';
  SDate = '����';
  SPrinterTime = '�����';
  SSerialNumber = '��������� �����';
  SINN = '���';
  SIsFM24HoursOver = '24 ���� � �� ���������';
  SIsFMSessionOpen = '����� � �� �������';
  SIsLastFMRecordCorrupted = '��������� ������ � �� ����������';
  SIsBatteryLow = '������� �� �������� ����� 80 %';
  SFMOverflow = '������������ ��';
  SLicenseIsPresent = '�������� �������';
  SFM2IsPresent = '��2 ����';
  SFM1IsPresent = '��1 ����';
  SShortStatusQuery = ' ������� ������ ���������:';
  SQuantityOfOperations = '���������� �������� � ����';
  SBatteryVoltage = '���������� �������, �';
  SPowerSourceVoltage = '���������� ���������, �';
  SFMResultCode = '������ ��';
  SEKLZResultCode = '������ ����';
  SPrinterParameters = ' ��������� ��������:';
  SUCodePage = ' ������� ��������    : ';
  SUDescription = ' �������� ���������� : ';
  SUMajorProtocolVersion = ' ������ ���������    : ';
  SUMinorProtocolVersion = ' ��������� ��������� : ';
  SUMajorType = ' ��� ����������      : ';
  SUMinorType = ' ������ ����������   : ';
  SUModel = ' ������ ����������   : ';
  SPrinterLockedAfterInvalidTaxPassword =
    '������� ������������ ��-�� ����� ������������� ' +
    '������ ���������� ����������';
  SPrinterInTechnologicalMode =
    '������� ��������� � ������ ���������������� ���������';
  SModelParameters = ' ��������� ������:';
  SDriverVersionCaption = ' ������ ��������:';
  SDriverMajorVersion = '������';
  SDriverMinorVersion = '���������';
  SDriverRelease = '�����';
  SDriverBuild = '������';
  SDriverVersion = '������ ������';
  SFullStatus = ' ������ ���������';

  SUserAbort = '<�������� �������������>';
  SErrorAbort = '<�������� � ���������� ������: %d %s>';

  SCashRegisters      = ' �������� ��������:';
  SOperationRegisters = ' ������������ ��������:';
  STableInfo = ' ������� %d. %s. �����:%d �����:%d';
  STableHeader = ' ���.����. ������������:��������';
  STables = ' �������:';
  SOperatorNumber = '����� ���������';
  SCurrentDate = '������� ����';
  SCurrentTime = '������� �����';
  SSaleReceiptNumber = '���������� ����� ������';
  SBuyReceiptNumber = '���������� ����� �������';
  SRetSaleReceiptNumber = '���������� ����� �������� ������';
  SRetBuyReceiptNumber = '���������� ����� �������� �������';
  SDayOpenDate = '���� ������ �������� �����';
  SDayOpenTime = '����� ������ �������� �����';
  SCashTotal = '�������� � �����';
  SFlagSerialized = '�������������';
  SFlagFiscalized = '���������������';
  SFlagActivated = '��������������';
  SFlagDayOpened = '����� �������';
  SFlagDayExausted = '24 ���� ���������';
  SPrintBufferEmpty = '����� ������ ����';
  SStatusByte = '���� ���������';
  STimeout = '�������';
  SEnterComputerName = '������� ��� ����������';
  SData = '������';
  SMacNumber = '����� ���';
  SContinueAfterError = '������ %d: %s'#10#13'����������?';
  SBlockNumber = '�������� ������: %d';
  SPump = '���';
  STicket = '����';
  SPrice = '����';
  SSumm1 = '����� 1';
  SSumm2 = '����� 2';
  SSumm3 = '����� 3';
  SSumm4 = '����� 4';
  SNumber = '�����';
  SQuantity = '����������';
  SDiscount = '������ �� ���';
  SString = '������';
  STax1 = '����� 1';
  STax2 = '����� 2';
  STax3 = '����� 3';
  STax4 = '����� 4';
  SGeneral = '��������';
  SNo = '���';
  SGroup1 = '1 ������';
  SGroup2 = '2 ������';
  SGroup3 = '3 ������';
  SGroup4 = '4 ������';
  SStringForPrinting = '������ ��� ������';
  SExtended = '��������������';
  SSlipDocumentWidth = '������';
  SSlipDocumentLength = '�����';
  SPrintingAlignment = '����������';
  SSlipLineSpacing = '����������� �������� ����� ��������: %d � %d';
  SExciseCode = '��� ������';

  SSlipCopyType = '������������ ������';
  SSlipReceiptType = '��� ����';
  SSlipCopyOffset1 = '�������� 1';
  SSlipCopyOffset2 = '�������� 2';
  SSlipCopyOffset3 = '�������� 3';
  SSlipCopyOffset4 = '�������� 4';
  SSlipCopyOffset5 = '�������� 5';
  SSlipNumberOfCopies = '���������� �����';
  SLine1 = '������ 1';
  SLine2 = '������ 2';
  SDepartment = '�����';
  STableName = '�������� �������';
  SRowCount = '���������� �����: ';
  SFieldCount = '���������� �����';
  SFieldName = '�������� ����';
  SFieldTypeString = '��� ����: ������';
  SFieldTypeNumber = '��� ����: �����';
  SFieldSize = '������ ����';
  SMinValue = '���. ��������';
  SMaxValue = '����. ��������';
  STableStructure = '��������� ����';
  SNewTaxPassword = '����� ������ ��';
  SFiscalizationNumber = '����� ������������';
  SStartDay = '��������� �����';
  SEndDay = '�������� �����';
  STaxPasswordConfirmation = '����� ������ ������ ���������� ���������� (%d)'#13#10 +
    '� ������ ������ ������� ����� ������������ �� ����� ����������� ������.'#13#10 +
    '����������?';

  SSale = '�������';
  SBuy = '�������';
  SRetSale = '������� �������';
  SRetBuy = '������� �������';
  SSaleStorno = '������ �������';
  SBuyStorno = '������ �������';
  SRetSaleStorno = '������ �������� �������';
  SRetBuyStorno = '������ �������� �������';

  SReceipt = '���';
  SLine = '������';

  SAlignmentText = '�� ������'#13#10'�����'#13#10'������';
  SPrintWidth576 = '������ ������ ������. 576 �����';
  SLeftBound = '����� �������. ����� 1 ����������';
  SRightBound = '������ �������. ����� 576 ����������';
  SPrintWidth560 = '����� - ������ ������ 560 �����, � �� 576';
  SPrinterType = '��� ���';
  SAttention = '��������!';
  SConfirmFiscalization = '������������ �������� ������ ��������.'#13#10+
    '�� ������ ����������?';

const
  BoolToStr: array [Boolean] of string = (SBooleanFalse, SBooleanTrue);

implementation

end.
