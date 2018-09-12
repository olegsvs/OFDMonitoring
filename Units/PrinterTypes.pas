unit PrinterTypes;

interface

const
  CashRegisterMin = $00;
  CashRegisterMax = $FF;

  OperationRegisterMin = $00;
  OperationRegisterMax = $FF;

  CloseSlipExParamMin = 0;
  CloseSlipExParamMax = $6D;

function GetCloseSlipExParamName(Number: Integer): string;
function GetSlipDiscountExParamName(Number: Integer): string;
function GetSlipOpenExParamName(Number: Integer): string;
function GetSlipRegExParamName(Number: Integer): string;

implementation

resourcestring
  SNoDescrpiption = '�������� ����������';

  SCloseSlipExParam00 = '���������� ����� � ��������';
  SCloseSlipExParam01 = '������ �����';
  SCloseSlipExParam02 = '������ ������';
  SCloseSlipExParam03 = '������ ��������';
  SCloseSlipExParam04 = '������ ������ 2';
  SCloseSlipExParam05 = '������ ������ 3';
  SCloseSlipExParam06 = '������ ������ 4';
  SCloseSlipExParam07 = '������ �����';
  SCloseSlipExParam08 = '������ ������� �� ������ �';
  SCloseSlipExParam09 = '������ ������� �� ������ �';
  SCloseSlipExParam0A = '������ ������� �� ������ �';
  SCloseSlipExParam0B = '������ ������� �� ������ �';
  SCloseSlipExParam0C = '������ ����� �� ������ �';
  SCloseSlipExParam0D = '������ ����� �� ������ �';
  SCloseSlipExParam0E = '������ ����� �� ������ �';
  SCloseSlipExParam0F = '������ ����� �� ������ �';
  SCloseSlipExParam10 = '������ ����� �� ���������� ������';
  SCloseSlipExParam11 = '������ ����� ������';
  SCloseSlipExParam12 = '����� ������';
  SCloseSlipExParam13 = '����� "����"';
  SCloseSlipExParam14 = '����� ����� �����';
  SCloseSlipExParam15 = '����� "���������"';
  SCloseSlipExParam16 = '����� ����� ��������';
  SCloseSlipExParam17 = '����� �������� ���� ������ 2';
  SCloseSlipExParam18 = '����� ����� ���� ������ 2';
  SCloseSlipExParam19 = '����� �������� ���� ������ 3';
  SCloseSlipExParam1A = '����� ����� ���� ������ 3';
  SCloseSlipExParam1B = '����� �������� ���� ������ 4';
  SCloseSlipExParam1C = '����� ����� ���� ������ 4';
  SCloseSlipExParam1D = '����� "�����"';
  SCloseSlipExParam1E = '����� ����� �����';
  SCloseSlipExParam1F = '����� �������� ������ �';
  SCloseSlipExParam20 = '����� ������� ������ �';
  SCloseSlipExParam21 = '����� ������ ������ �';
  SCloseSlipExParam22 = '����� ����� ������ �';
  SCloseSlipExParam23 = '����� �������� ������ �';
  SCloseSlipExParam24 = '����� ������� ������ �';
  SCloseSlipExParam25 = '����� ������ ������ �';
  SCloseSlipExParam26 = '����� ����� ������ �';
  SCloseSlipExParam27 = '����� �������� ������ �';
  SCloseSlipExParam28 = '����� ������� ������ �';
  SCloseSlipExParam29 = '����� ������ ������ �';
  SCloseSlipExParam2A = '����� ����� ������ �';
  SCloseSlipExParam2B = '����� �������� ������ �';
  SCloseSlipExParam2C = '����� ������� ������ �';
  SCloseSlipExParam2D = '����� ������ ������ �';
  SCloseSlipExParam2E = '����� ����� ������ �';
  SCloseSlipExParam2F = '����� "�����"';
  SCloseSlipExParam30 = '����� ����� �� ���������� ������';
  SCloseSlipExParam31 = '����� ������ � %';
  SCloseSlipExParam32 = '����� ����� ������';
  SCloseSlipExParam33 = '���������� �������� ������';
  SCloseSlipExParam34 = '���������� �������� ����� �����';
  SCloseSlipExParam35 = '���������� �������� ����� ��������';
  SCloseSlipExParam36 = '���������� �������� ����� ���� ������ 2';
  SCloseSlipExParam37 = '���������� �������� ����� ���� ������ 3';
  SCloseSlipExParam38 = '���������� �������� ����� ���� ������ 4';
  SCloseSlipExParam39 = '���������� �������� ����� �����';
  SCloseSlipExParam3A = '���������� �������� �������� ������ �';
  SCloseSlipExParam3B = '���������� �������� ������� ������ �';
  SCloseSlipExParam3C = '���������� �������� ������ ������ �';
  SCloseSlipExParam3D = '���������� �������� ����� ������ �';
  SCloseSlipExParam3E = '���������� �������� �������� ������ �';
  SCloseSlipExParam3F = '���������� �������� ������� ������ �';
  SCloseSlipExParam40 = '���������� �������� ������ ������ �';
  SCloseSlipExParam41 = '���������� �������� ����� ������ �';
  SCloseSlipExParam42 = '���������� �������� �������� ������ �';
  SCloseSlipExParam43 = '���������� �������� ������� ������ �';
  SCloseSlipExParam44 = '���������� �������� ������ ������ �';
  SCloseSlipExParam45 = '���������� �������� ����� ������ �';
  SCloseSlipExParam46 = '���������� �������� �������� ������ �';
  SCloseSlipExParam47 = '���������� �������� ������� ������ �';
  SCloseSlipExParam48 = '���������� �������� ������ ������ �';
  SCloseSlipExParam49 = '���������� �������� ����� ������ �';
  SCloseSlipExParam4A = '���������� �������� ����� �� ���������� ������';
  SCloseSlipExParam4B = '���������� �������� ������ � %';
  SCloseSlipExParam4C = '���������� �������� ����� ������';
  SCloseSlipExParam4D = '�������� ������';
  SCloseSlipExParam4E = '�������� "����"';
  SCloseSlipExParam4F = '�������� ����� �����';
  SCloseSlipExParam50 = '�������� "���������"';
  SCloseSlipExParam51 = '�������� ����� ��������';
  SCloseSlipExParam52 = '�������� �������� ���� ������ 2';
  SCloseSlipExParam53 = '�������� ����� ���� ������ 2';
  SCloseSlipExParam54 = '�������� �������� ���� ������ 3';
  SCloseSlipExParam55 = '�������� ����� ���� ������ 3';
  SCloseSlipExParam56 = '�������� �������� ���� ������ 4';
  SCloseSlipExParam57 = '�������� ����� ���� ������ 4';
  SCloseSlipExParam58 = '�������� "�����"';
  SCloseSlipExParam59 = '�������� ����� �����';
  SCloseSlipExParam5A = '�������� �������� ������ �';
  SCloseSlipExParam5B = '�������� ������� ������ �';
  SCloseSlipExParam5C = '�������� ������ ������ �';
  SCloseSlipExParam5D = '�������� ����� ������ �';
  SCloseSlipExParam5E = '�������� �������� ������ �';
  SCloseSlipExParam5F = '�������� ������� ������ �';
  SCloseSlipExParam60 = '�������� ������ ������ �';
  SCloseSlipExParam61 = '�������� ����� ������ �';
  SCloseSlipExParam62 = '�������� �������� ������ �';
  SCloseSlipExParam63 = '�������� ������� ������ �';
  SCloseSlipExParam64 = '�������� ������ ������ �';
  SCloseSlipExParam65 = '�������� ����� ������ �';
  SCloseSlipExParam66 = '�������� �������� ������ �';
  SCloseSlipExParam67 = '�������� ������� ������ �';
  SCloseSlipExParam68 = '�������� ������ ������ �';
  SCloseSlipExParam69 = '�������� ����� ������ �';
  SCloseSlipExParam6A = '�������� "�����"';
  SCloseSlipExParam6B = '�������� ����� �� ���������� ������';
  SCloseSlipExParam6C = '�������� ������ � %';
  SCloseSlipExParam6D = '�������� ����� ������';


  SSlipDiscountExParam00 = '���-�� ����� � ��������';
  SSlipDiscountExParam01 = '������ ������';
  SSlipDiscountExParam02 = '������ �������� ��������';
  SSlipDiscountExParam03 = '������ �����';
  SSlipDiscountExParam04 = '����� ������';
  SSlipDiscountExParam05 = '����� �������� ��������';
  SSlipDiscountExParam06 = '����� �����';
  SSlipDiscountExParam07 = '���-�� �������� ������';
  SSlipDiscountExParam08 = '���-�� �������� �����';
  SSlipDiscountExParam09 = '�������� ������';
  SSlipDiscountExParam0A = '�������� �������� �����';
  SSlipDiscountExParam0B = '�������� �����';

  SSlipOpenExParam00 = '����� �����';
  SSlipOpenExParam01 = '����� ��������� ���������';
  SSlipOpenExParam02 = '����� ������ ����';
  SSlipOpenExParam03 = '����� ��� � ������ ���';
  SSlipOpenExParam04 = '������ �����';
  SSlipOpenExParam05 = '������ ��������� ���������';
  SSlipOpenExParam06 = '������ ������ ����';
  SSlipOpenExParam07 = '������ �������� ������� ���������';
  SSlipOpenExParam08 = '�������� �����';
  SSlipOpenExParam09 = '�������� ��������� ���������';
  SSlipOpenExParam0A = '�������� ������ ����';
  SSlipOpenExParam0B = '�������� ��� � ������ ���';
  SSlipOpenExParam0C = '�������� �������� ������� ���������';

  SSlipRegExParam00 = '������ ������ ���-��';
  SSlipRegExParam01 = '���������� ����� � ��������';
  SSlipRegExParam02 = '������ ������';
  SSlipRegExParam03 = '������ ������������ ���-�� �� ����';
  SSlipRegExParam04 = '������ �����';
  SSlipRegExParam05 = '������ ������';
  SSlipRegExParam06 = '����� ������';
  SSlipRegExParam07 = '����� ���-��';
  SSlipRegExParam08 = '����� ����� ���������';
  SSlipRegExParam09 = '����� ����';
  SSlipRegExParam0A = '����� �����';
  SSlipRegExParam0B = '����� ������';
  SSlipRegExParam0C = '���-�� �������� ������';
  SSlipRegExParam0D = '���-�� �������� ���-��';
  SSlipRegExParam0E = '���-�� �������� ����';
  SSlipRegExParam0F = '���-�� �������� �����';
  SSlipRegExParam10 = '���-�� �������� ������';
  SSlipRegExParam11 = '�������� ������';
  SSlipRegExParam12 = '�������� ������������ ���-�� �� ����';
  SSlipRegExParam13 = '�������� �����';
  SSlipRegExParam14 = '�������� ������';

  
function GetCloseSlipExParamName(Number: Integer): string;
begin
  case Number of
    $00: Result := SCloseSlipExParam00;
    $01: Result := SCloseSlipExParam01;
    $02: Result := SCloseSlipExParam02;
    $03: Result := SCloseSlipExParam03;
    $04: Result := SCloseSlipExParam04;
    $05: Result := SCloseSlipExParam05;
    $06: Result := SCloseSlipExParam06;
    $07: Result := SCloseSlipExParam07;
    $08: Result := SCloseSlipExParam08;
    $09: Result := SCloseSlipExParam09;
    $0A: Result := SCloseSlipExParam0A;
    $0B: Result := SCloseSlipExParam0B;
    $0C: Result := SCloseSlipExParam0C;
    $0D: Result := SCloseSlipExParam0D;
    $0E: Result := SCloseSlipExParam0E;
    $0F: Result := SCloseSlipExParam0F;

    $10: Result := SCloseSlipExParam10;
    $11: Result := SCloseSlipExParam11;
    $12: Result := SCloseSlipExParam12;
    $13: Result := SCloseSlipExParam13;
    $14: Result := SCloseSlipExParam14;
    $15: Result := SCloseSlipExParam15;
    $16: Result := SCloseSlipExParam16;
    $17: Result := SCloseSlipExParam17;
    $18: Result := SCloseSlipExParam18;
    $19: Result := SCloseSlipExParam19;
    $1A: Result := SCloseSlipExParam1A;
    $1B: Result := SCloseSlipExParam1B;
    $1C: Result := SCloseSlipExParam1C;
    $1D: Result := SCloseSlipExParam1D;
    $1E: Result := SCloseSlipExParam1E;
    $1F: Result := SCloseSlipExParam1F;

    $20: Result := SCloseSlipExParam20;
    $21: Result := SCloseSlipExParam21;
    $22: Result := SCloseSlipExParam22;
    $23: Result := SCloseSlipExParam23;
    $24: Result := SCloseSlipExParam24;
    $25: Result := SCloseSlipExParam25;
    $26: Result := SCloseSlipExParam26;
    $27: Result := SCloseSlipExParam27;
    $28: Result := SCloseSlipExParam28;
    $29: Result := SCloseSlipExParam29;
    $2A: Result := SCloseSlipExParam2A;
    $2B: Result := SCloseSlipExParam2B;
    $2C: Result := SCloseSlipExParam2C;
    $2D: Result := SCloseSlipExParam2D;
    $2E: Result := SCloseSlipExParam2E;
    $2F: Result := SCloseSlipExParam2F;

    $30: Result := SCloseSlipExParam30;
    $31: Result := SCloseSlipExParam31;
    $32: Result := SCloseSlipExParam32;
    $33: Result := SCloseSlipExParam33;
    $34: Result := SCloseSlipExParam34;
    $35: Result := SCloseSlipExParam35;
    $36: Result := SCloseSlipExParam36;
    $37: Result := SCloseSlipExParam37;
    $38: Result := SCloseSlipExParam38;
    $39: Result := SCloseSlipExParam39;
    $3A: Result := SCloseSlipExParam3A;
    $3B: Result := SCloseSlipExParam3B;
    $3C: Result := SCloseSlipExParam3C;
    $3D: Result := SCloseSlipExParam3D;
    $3E: Result := SCloseSlipExParam3E;
    $3F: Result := SCloseSlipExParam3F;

    $40: Result := SCloseSlipExParam40;
    $41: Result := SCloseSlipExParam41;
    $42: Result := SCloseSlipExParam42;
    $43: Result := SCloseSlipExParam43;
    $44: Result := SCloseSlipExParam44;
    $45: Result := SCloseSlipExParam45;
    $46: Result := SCloseSlipExParam46;
    $47: Result := SCloseSlipExParam47;
    $48: Result := SCloseSlipExParam48;
    $49: Result := SCloseSlipExParam49;
    $4A: Result := SCloseSlipExParam4A;
    $4B: Result := SCloseSlipExParam4B;
    $4C: Result := SCloseSlipExParam4C;
    $4D: Result := SCloseSlipExParam4D;
    $4E: Result := SCloseSlipExParam4E;
    $4F: Result := SCloseSlipExParam4F;

    $50: Result := SCloseSlipExParam50;
    $51: Result := SCloseSlipExParam51;
    $52: Result := SCloseSlipExParam52;
    $53: Result := SCloseSlipExParam53;
    $54: Result := SCloseSlipExParam54;
    $55: Result := SCloseSlipExParam55;
    $56: Result := SCloseSlipExParam56;
    $57: Result := SCloseSlipExParam57;
    $58: Result := SCloseSlipExParam58;
    $59: Result := SCloseSlipExParam59;
    $5A: Result := SCloseSlipExParam5A;
    $5B: Result := SCloseSlipExParam5B;
    $5C: Result := SCloseSlipExParam5C;
    $5D: Result := SCloseSlipExParam5D;
    $5E: Result := SCloseSlipExParam5E;
    $5F: Result := SCloseSlipExParam5F;

    $60: Result := SCloseSlipExParam60;
    $61: Result := SCloseSlipExParam61;
    $62: Result := SCloseSlipExParam62;
    $63: Result := SCloseSlipExParam63;
    $64: Result := SCloseSlipExParam64;
    $65: Result := SCloseSlipExParam65;
    $66: Result := SCloseSlipExParam66;
    $67: Result := SCloseSlipExParam67;
    $68: Result := SCloseSlipExParam68;
    $69: Result := SCloseSlipExParam69;
    $6A: Result := SCloseSlipExParam6A;
    $6B: Result := SCloseSlipExParam6B;
    $6C: Result := SCloseSlipExParam6C;
    $6D: Result := SCloseSlipExParam6D;
  else
    Result := SNoDescrpiption;
  end;
end;

function GetSlipDiscountExParamName(Number: Integer): string;
begin
  case Number of
    $00: Result := SSlipDiscountExParam00;
    $01: Result := SSlipDiscountExParam01;
    $02: Result := SSlipDiscountExParam02;
    $03: Result := SSlipDiscountExParam03;
    $04: Result := SSlipDiscountExParam04;
    $05: Result := SSlipDiscountExParam05;
    $06: Result := SSlipDiscountExParam06;
    $07: Result := SSlipDiscountExParam07;
    $08: Result := SSlipDiscountExParam08;
    $09: Result := SSlipDiscountExParam09;
    $0A: Result := SSlipDiscountExParam0A;
    $0B: Result := SSlipDiscountExParam0B;
  else
    Result := SNoDescrpiption;
  end;
end;

function GetSlipOpenExParamName(Number: Integer): string;
begin
  case Number of
    $00: Result := SSlipOpenExParam00;
    $01: Result := SSlipOpenExParam01;
    $02: Result := SSlipOpenExParam02;
    $03: Result := SSlipOpenExParam03;
    $04: Result := SSlipOpenExParam04;
    $05: Result := SSlipOpenExParam05;
    $06: Result := SSlipOpenExParam06;
    $07: Result := SSlipOpenExParam07;
    $08: Result := SSlipOpenExParam08;
    $09: Result := SSlipOpenExParam09;
    $0A: Result := SSlipOpenExParam0A;
    $0B: Result := SSlipOpenExParam0B;
    $0C: Result := SSlipOpenExParam0C;
  else
    Result := SNoDescrpiption;
  end;
end;

function GetSlipRegExParamName(Number: Integer): string;
begin
  case Number of
    $00: Result := SSlipRegExParam00;
    $01: Result := SSlipRegExParam01;
    $02: Result := SSlipRegExParam02;
    $03: Result := SSlipRegExParam03;
    $04: Result := SSlipRegExParam04;
    $05: Result := SSlipRegExParam05;
    $06: Result := SSlipRegExParam06;
    $07: Result := SSlipRegExParam07;
    $08: Result := SSlipRegExParam08;
    $09: Result := SSlipRegExParam09;
    $0A: Result := SSlipRegExParam0A;
    $0B: Result := SSlipRegExParam0B;
    $0C: Result := SSlipRegExParam0C;
    $0D: Result := SSlipRegExParam0D;
    $0E: Result := SSlipRegExParam0E;
    $0F: Result := SSlipRegExParam0F;
    $10: Result := SSlipRegExParam10;
    $11: Result := SSlipRegExParam11;
    $12: Result := SSlipRegExParam12;
    $13: Result := SSlipRegExParam13;
    $14: Result := SSlipRegExParam14;
  else
    Result := SNoDescrpiption;
  end;
end;

end.
