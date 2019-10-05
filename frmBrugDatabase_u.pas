unit frmBrugDatabase_u;

// Christiaan Bauman
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, ExtCtrls, Spin, Grids, DBGrids,
  StrUtils, dmBrugDatabase_u,
  pngimage, jpeg, Data.DB;

type
  TfrmBridgeDatabase = class(TForm)
    pcTabs: TPageControl;
    tsLogin: TTabSheet;
    lblID: TLabel;
    lblPassword: TLabel;
    edtID: TEdit;
    edtPassword: TEdit;
    btnLogin: TButton;
    btnRegister: TButton;
    btnGuest: TButton;
    tsRegister: TTabSheet;
    lblRegID: TLabel;
    lblRegName: TLabel;
    lblRegSurname: TLabel;
    lblRegPasswd: TLabel;
    lblRegConPasswd: TLabel;
    lblregEmail: TLabel;
    lblRegCell: TLabel;
    lblregCountry: TLabel;
    edtRegId: TEdit;
    edtRegName: TEdit;
    edtRegSurname: TEdit;
    edtRegConPasswd: TEdit;
    edtRegPasswd: TEdit;
    rgRegType: TRadioGroup;
    edtRegEmail: TEdit;
    edtRegCell: TEdit;
    cbRegCountry: TComboBox;
    btnRegBack: TButton;
    btnRegRegister: TButton;
    tsProfile: TTabSheet;
    lblProfID: TLabel;
    lblProfName: TLabel;
    lblProfSurname: TLabel;
    lblProfEmail: TLabel;
    lblProfCell: TLabel;
    lblProfCountry: TLabel;
    lblProfType: TLabel;
    lblProfGender: TLabel;
    lblProfDOB: TLabel;
    Button3: TButton;
    Button4: TButton;
    tsRanking: TTabSheet;
    tsSearch: TTabSheet;
    tsCreateTournament: TTabSheet;
    tsOngoing: TTabSheet;
    tsEnterTournament: TTabSheet;
    tsMyTournament: TTabSheet;
    tsNotices: TTabSheet;
    redNotices: TRichEdit;
    tsEdit: TTabSheet;
    lblEditID: TLabel;
    lblEditName: TLabel;
    lblEditSurname: TLabel;
    lblEditEmail: TLabel;
    lblEditCell: TLabel;
    lblEditCountry: TLabel;
    edtEditID: TEdit;
    edtEditName: TEdit;
    edtEditSurname: TEdit;
    edtEditEmail: TEdit;
    edtEditCell: TEdit;
    cbEditCountry: TComboBox;
    btnEditBack: TButton;
    btnEditSave: TButton;
    btnClose: TBitBtn;
    btnHelp: TBitBtn;
    lblTournamentName: TLabel;
    edtTournamentName: TEdit;
    lblNrofGames: TLabel;
    lblPlayerMin: TLabel;
    edtEntryfee: TLabel;
    lblTournamentDate: TLabel;
    sedNrofGames: TSpinEdit;
    sedEntryFee: TSpinEdit;
    sedDateDay: TSpinEdit;
    sedDateMonth: TSpinEdit;
    sedDateYear: TSpinEdit;
    sedPlayerMin: TSpinEdit;
    sedPlayerMax: TSpinEdit;
    lblPlayerMax: TLabel;
    lblRatMin: TLabel;
    lblRatMax: TLabel;
    sedRatMin: TSpinEdit;
    sedRatMax: TSpinEdit;
    lblRank: TLabel;
    grdRankings: TDBGrid;
    lblSearchPlayer: TLabel;
    rgSearch: TRadioGroup;
    edtSearch: TEdit;
    btnSearch: TButton;
    lblOngoingTournaments: TLabel;
    btnEditChangePasswd: TButton;
    lblTourLocation: TLabel;
    cbTourLocation: TComboBox;
    rgTourType: TRadioGroup;
    btnCreateTour: TButton;
    lblPrize: TLabel;
    sedPrize: TSpinEdit;
    Image1: TImage;
    DBGrid1: TDBGrid;
    grdOngoing: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnRegisterClick(Sender: TObject);
    procedure btnRegBackClick(Sender: TObject);
    procedure btnRegRegisterClick(Sender: TObject);
    procedure rgSearchClick(Sender: TObject);
    procedure btnEditBackClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnGuestClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnCreateTourClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBridgeDatabase: TfrmBridgeDatabase;

implementation

{$R *.dfm}

procedure TfrmBridgeDatabase.btnCreateTourClick(Sender: TObject);
begin
  if Length(edtTournamentName.text) < 5 then
  begin
    ShowMessage('Tournament name too short');
  end;

  if sedNrofGames.Value < 1 then
  begin
    ShowMessage('Too little number of games');
  end;

  if Length(edtTournamentName.text) < 5 then
  begin
    ShowMessage('Tournament name too short');
  end;

end;

procedure TfrmBridgeDatabase.btnEditBackClick(Sender: TObject);
begin
  tsLogin.TabVisible := False;
  tsRegister.TabVisible := False;
  tsProfile.TabVisible := True;
  tsRanking.TabVisible := False;
  tsSearch.TabVisible := False;
  tsCreateTournament.TabVisible := False;
  tsOngoing.TabVisible := False;
  tsEnterTournament.TabVisible := False;
  tsMyTournament.TabVisible := False;
  tsNotices.TabVisible := False;
  tsEdit.TabVisible := False;
  tsProfile.Visible := True;
  pcTabs.ActivePage := tsProfile;
end;

procedure TfrmBridgeDatabase.btnGuestClick(Sender: TObject);
begin
  tsLogin.TabVisible := True;
  tsRegister.TabVisible := False;
  tsProfile.TabVisible := False;
  tsRanking.TabVisible := True;
  tsSearch.TabVisible := True;
  tsCreateTournament.TabVisible := False;
  tsOngoing.TabVisible := True;
  tsEnterTournament.TabVisible := False;
  tsMyTournament.TabVisible := False;
  tsNotices.TabVisible := False;
  tsEdit.TabVisible := False;
  tsRanking.Visible := True;
  pcTabs.ActivePage := tsRanking;
end;

procedure TfrmBridgeDatabase.btnLoginClick(Sender: TObject);
var
  sID, sPassword, sDOB: string;
begin
  sID := edtID.text;
  sPassword := edtPassword.text;
  dmBrugDatabase_u.DataModule1.tblUsers.Active := True;
  dmBrugDatabase_u.DataModule1.tblPlayer.Active := True;
  dmBrugDatabase_u.DataModule1.tblTournament.Active := True;
  dmBrugDatabase_u.DataModule1.tblUsers.First;

  while not(dmBrugDatabase_u.DataModule1.tblUsers.eof) do
  begin
    if dmBrugDatabase_u.DataModule1.tblUsers['ID Number'] = sID then
    begin
      if sPassword = dmBrugDatabase_u.DataModule1.tblUsers['Password'] then
      begin
        edtID.Clear;
        edtPassword.Clear;
        lblProfID.Caption := dmBrugDatabase_u.DataModule1.tblUsers['ID Number'];
        lblProfName.Caption := dmBrugDatabase_u.DataModule1.tblUsers['Name'];
        lblProfSurname.Caption := dmBrugDatabase_u.DataModule1.tblUsers
          ['Surname'];
        if dmBrugDatabase_u.DataModule1.tblUsers['Organiser'] = True then
          lblProfType.Caption := 'Organiser'
        else
          lblProfType.Caption := 'Player';
        if dmBrugDatabase_u.DataModule1.tblUsers['Gender'] = True then
          lblProfGender.Caption := 'Male'
        else
          lblProfGender.Caption := 'Female';
        sDOB := copy(dmBrugDatabase_u.DataModule1.tblUsers['ID Number'], 1, 6);
        sDOB := copy(sDOB, 5, 2) + sDOB;
        Delete(sDOB, 7, 2);
        sDOB := sDOB + copy(sDOB, 3, 2);
        Delete(sDOB, 3, 2);
        sDOB := copy(sDOB, 1, 2) + '/' + copy(sDOB, 3, 2) + '/' +
          copy(sDOB, 5, 2);
        lblProfDOB.Caption := sDOB;
        lblProfCountry.Caption := dmBrugDatabase_u.DataModule1.tblUsers
          ['Country'];
        lblProfEmail.Caption := dmBrugDatabase_u.DataModule1.tblUsers['Email'];
        lblProfCell.Caption := dmBrugDatabase_u.DataModule1.tblUsers
          ['Phone Number'];

         grdRankings.Columns[0].FieldName := 'Name';




        if dmBrugDatabase_u.DataModule1.tblUsers['Organiser'] = True then
        begin
          tsLogin.TabVisible := False;
          tsRegister.TabVisible := False;
          tsProfile.TabVisible := True;
          tsRanking.TabVisible := True;
          tsSearch.TabVisible := True;
          tsCreateTournament.TabVisible := True;
          tsOngoing.TabVisible := True;
          tsEnterTournament.TabVisible := False;
          tsMyTournament.TabVisible := False;
          tsNotices.TabVisible := True;
          tsEdit.TabVisible := False;
          tsProfile.Visible := True;
          pcTabs.ActivePage := tsProfile;

        end
        else
        begin
          tsLogin.TabVisible := False;
          tsRegister.TabVisible := False;
          tsProfile.TabVisible := False;
          tsRanking.TabVisible := True;
          tsSearch.TabVisible := True;
          tsCreateTournament.TabVisible := False;
          tsOngoing.TabVisible := True;
          tsEnterTournament.TabVisible := False;
          tsMyTournament.TabVisible := False;
          tsNotices.TabVisible := False;
          tsEdit.TabVisible := False;
          tsRanking.Visible := True;
          pcTabs.ActivePage := tsRanking;
        end;

        exit;

      end
      else
      begin
        ShowMessage('Password incorrect');
        exit;
      end;
    end
    else
    begin
      dmBrugDatabase_u.DataModule1.tblUsers.next;
    end;

  end;
  ShowMessage('User does not exist');
end;

procedure TfrmBridgeDatabase.btnRegBackClick(Sender: TObject);
begin
  edtRegId.Clear;
  edtRegName.Clear;
  edtRegSurname.Clear;
  edtRegEmail.Clear;
  edtRegCell.Clear;
  edtRegPasswd.Clear;
  edtRegConPasswd.Clear;
  cbRegCountry.ItemIndex := 166;
  rgRegType.ItemIndex := -1;

  tsLogin.TabVisible := True;
  tsRegister.TabVisible := False;
  tsProfile.TabVisible := False;
  tsRanking.TabVisible := False;
  tsSearch.TabVisible := False;
  tsCreateTournament.TabVisible := False;
  tsOngoing.TabVisible := False;
  tsEnterTournament.TabVisible := False;
  tsMyTournament.TabVisible := False;
  tsNotices.TabVisible := False;
  tsEdit.TabVisible := False;
  tsLogin.Visible := True;
  pcTabs.ActivePage := tsLogin;
end;

procedure TfrmBridgeDatabase.btnRegisterClick(Sender: TObject);
begin
  tsLogin.TabVisible := False;
  tsRegister.TabVisible := True;
  tsProfile.TabVisible := False;
  tsRanking.TabVisible := False;
  tsSearch.TabVisible := False;
  tsCreateTournament.TabVisible := False;
  tsOngoing.TabVisible := False;
  tsEnterTournament.TabVisible := False;
  tsMyTournament.TabVisible := False;
  tsNotices.TabVisible := False;
  tsEdit.TabVisible := False;
  tsRegister.Visible := True;
  pcTabs.ActivePage := tsRegister;
end;

procedure TfrmBridgeDatabase.btnRegRegisterClick(Sender: TObject);
var
  sCountry, sID, sIDValidate, sname, sSurname, sEmail, SCell, sPassword,
    sconfirm: string;
  bUsertype, bMale: Boolean;
  i, k, j, l, iIdOddPositions, iIDEvenx2, iEvenDigits, iAdd, iSub: Integer;
begin
  sID := edtRegId.text;
  k := 1;
  iIdOddPositions := 0;
  sIDValidate := sID;
  iEvenDigits := 0;
  sname := edtRegName.text;
  sSurname := edtRegSurname.text;
  SCell := edtRegCell.text;
  sEmail := edtRegEmail.text;
  sPassword := edtRegPasswd.text;
  sconfirm := edtRegConPasswd.text;

  case cbRegCountry.ItemIndex of
    0:
      sCountry := 'Afghanistan';
    1:
      sCountry := 'Albania';
    2:
      sCountry := 'Algeria';
    3:
      sCountry := 'Andorra';
    4:
      sCountry := 'Angola';
    5:
      sCountry := 'Anguilla';
    6:
      sCountry := 'Antigua & Barbuda';
    7:
      sCountry := 'Argentina';
    8:
      sCountry := 'Armenia';
    9:
      sCountry := 'Australia';
    10:
      sCountry := 'Austria';
    11:
      sCountry := 'Azerbaijan';
    12:
      sCountry := 'Bahamas';
    13:
      sCountry := 'Bahrain';
    14:
      sCountry := 'Bangladesh';
    15:
      sCountry := 'Barbados';
    16:
      sCountry := 'Belarus';
    17:
      sCountry := 'Belgium';
    18:
      sCountry := 'Belize';
    19:
      sCountry := 'Benin';
    20:
      sCountry := 'Bermuda';
    21:
      sCountry := 'Bhutan';
    22:
      sCountry := 'Bolivia';
    23:
      sCountry := 'Bosnia & Herzegovina';
    24:
      sCountry := 'Botswana';
    25:
      sCountry := 'Brazil';
    26:
      sCountry := 'Brunei Darussalam';
    27:
      sCountry := 'Bulgaria';
    28:
      sCountry := 'Burkina Faso';
    29:
      sCountry := 'Burundi';
    30:
      sCountry := 'Cambodia';
    31:
      sCountry := 'Cameroon';
    32:
      sCountry := 'Canada';
    33:
      sCountry := 'Cape Verde';
    34:
      sCountry := 'Cayman Islands';
    35:
      sCountry := 'Central African Republic';
    36:
      sCountry := 'Chad';
    37:
      sCountry := 'Chile';
    38:
      sCountry := 'China';
    39:
      sCountry := 'China - Hong Kong / Macau';
    40:
      sCountry := 'Colombia';
    41:
      sCountry := 'Comoros';
    42:
      sCountry := 'Congo';
    43:
      sCountry := 'Congo, Democratic Republic of (DRC)';
    44:
      sCountry := 'Costa Rica';
    45:
      sCountry := 'Croatia';
    46:
      sCountry := 'Cuba';
    47:
      sCountry := 'Cyprus';
    48:
      sCountry := 'Czech Republic';
    49:
      sCountry := 'Denmark';
    50:
      sCountry := 'Djibouti';
    51:
      sCountry := 'Dominica';
    52:
      sCountry := 'Dominican Republic';
    53:
      sCountry := 'Ecuador';
    54:
      sCountry := 'Egypt';
    55:
      sCountry := 'El Salvador';
    56:
      sCountry := 'Equatorial Guinea';
    57:
      sCountry := 'Eritrea';
    58:
      sCountry := 'Estonia';
    59:
      sCountry := 'Eswatini';
    60:
      sCountry := 'Ethiopia';
    61:
      sCountry := 'Fiji';
    62:
      sCountry := 'Finland';
    63:
      sCountry := 'France';
    64:
      sCountry := 'French Guiana';
    65:
      sCountry := 'Gabon';
    66:
      sCountry := 'Gambia, Republic of The';
    67:
      sCountry := 'Georgia';
    68:
      sCountry := 'Germany';
    69:
      sCountry := 'Ghana';
    70:
      sCountry := 'Great Britain';
    71:
      sCountry := 'Greece';
    72:
      sCountry := 'Grenada';
    73:
      sCountry := 'Guadeloupe';
    74:
      sCountry := 'Guatemala';
    75:
      sCountry := 'Guinea';
    76:
      sCountry := 'Guinea-Bissau';
    77:
      sCountry := 'Guyana';
    78:
      sCountry := 'Haiti';
    79:
      sCountry := 'Honduras';
    80:
      sCountry := 'Hungary';
    81:
      sCountry := 'Iceland';
    82:
      sCountry := 'India';
    83:
      sCountry := 'Indonesia';
    84:
      sCountry := 'Iran';
    85:
      sCountry := 'Iraq';
    86:
      sCountry := 'Israel and the Occupied Territories';
    87:
      sCountry := 'Italy';
    88:
      sCountry := 'Ivory Coast (Cote d`Ivoire)';
    89:
      sCountry := 'Jamaica';
    90:
      sCountry := 'Japan';
    91:
      sCountry := 'Jordan';
    92:
      sCountry := 'Kazakhstan';
    93:
      sCountry := 'Kenya';
    94:
      sCountry := 'Korea, Democratic Republic of (North Korea)';
    95:
      sCountry := 'Korea, Republic of (South Korea)';
    96:
      sCountry := 'Kosovo';
    97:
      sCountry := 'Kuwait';
    98:
      sCountry := 'Kyrgyz Republic (Kyrgyzstan)';
    99:
      sCountry := 'Laos';
    100:
      sCountry := 'Latvia';
    101:
      sCountry := 'Lebanon';
    102:
      sCountry := 'Lesotho';
    103:
      sCountry := 'Liberia';
    104:
      sCountry := 'Libya';
    105:
      sCountry := 'Liechtenstein';
    106:
      sCountry := 'Lithuania';
    107:
      sCountry := 'Luxembourg';
    108:
      sCountry := 'Madagascar';
    109:
      sCountry := 'Malawi';
    110:
      sCountry := 'Malaysia';
    111:
      sCountry := 'Maldives';
    112:
      sCountry := 'Mali';
    113:
      sCountry := 'Malta';
    114:
      sCountry := 'Martinique';
    115:
      sCountry := 'Mauritania';
    116:
      sCountry := 'Mauritius';
    117:
      sCountry := 'Mayotte';
    118:
      sCountry := 'Mexico';
    119:
      sCountry := 'Moldova, Republic of';
    120:
      sCountry := 'Monaco';
    121:
      sCountry := 'Mongolia';
    122:
      sCountry := 'Montenegro';
    123:
      sCountry := 'Montserrat';
    124:
      sCountry := 'Morocco';
    125:
      sCountry := 'Mozambique';
    126:
      sCountry := 'Myanmar/Burma';
    127:
      sCountry := 'Namibia';
    128:
      sCountry := 'Nepal';
    129:
      sCountry := 'New Zealand';
    130:
      sCountry := 'Nicaragua';
    131:
      sCountry := 'Niger';
    132:
      sCountry := 'Nigeria';
    133:
      sCountry := 'North Macedonia, Republic of';
    134:
      sCountry := 'Norway';
    135:
      sCountry := 'Oman';
    136:
      sCountry := 'Pacific Islands';
    137:
      sCountry := 'Pakistan';
    138:
      sCountry := 'Panama';
    139:
      sCountry := 'Papua New Guinea';
    140:
      sCountry := 'Paraguay';
    141:
      sCountry := 'Peru';
    142:
      sCountry := 'Philippines';
    143:
      sCountry := 'Poland';
    144:
      sCountry := 'Portugal';
    145:
      sCountry := 'Puerto Rico';
    146:
      sCountry := 'Qatar';
    147:
      sCountry := 'Reunion';
    148:
      sCountry := 'Romania';
    149:
      sCountry := 'Russian Federation';
    150:
      sCountry := 'Rwanda';
    151:
      sCountry := 'Saint Kitts and Nevis';
    152:
      sCountry := 'Saint Lucia';
    153:
      sCountry := 'Saint Vincent and the Grenadines';
    154:
      sCountry := 'Samoa';
    155:
      sCountry := 'Sao Tome and Principe';
    156:
      sCountry := 'Saudi Arabia';
    157:
      sCountry := 'Senegal';
    158:
      sCountry := 'Serbia';
    159:
      sCountry := 'Seychelles';
    160:
      sCountry := 'Sierra Leone';
    161:
      sCountry := 'Singapore';
    162:
      sCountry := 'Slovak Republic (Slovakia)';
    163:
      sCountry := 'Slovenia';
    164:
      sCountry := 'Solomon Islands';
    165:
      sCountry := 'Somalia';
    166:
      sCountry := 'South Africa';
    167:
      sCountry := 'South Sudan';
    168:
      sCountry := 'Spain';
    169:
      sCountry := 'Sri Lanka';
    170:
      sCountry := 'Sudan';
    171:
      sCountry := 'Suriname';
    172:
      sCountry := 'Sweden';
    173:
      sCountry := 'Switzerland';
    174:
      sCountry := 'Syria';
    175:
      sCountry := 'Tajikistan';
    176:
      sCountry := 'Tanzania';
    177:
      sCountry := 'Thailand';
    178:
      sCountry := 'Netherlands';
    179:
      sCountry := 'Timor Leste';
    180:
      sCountry := 'Togo';
    181:
      sCountry := 'Trinidad & Tobago';
    182:
      sCountry := 'Tunisia';
    183:
      sCountry := 'Turkey';
    184:
      sCountry := 'Turkmenistan';
    185:
      sCountry := 'Turks & Caicos Islands';
    186:
      sCountry := 'Uganda';
    187:
      sCountry := 'Ukraine';
    188:
      sCountry := 'United Arab Emirates';
    189:
      sCountry := 'United States of America (USA)';
    190:
      sCountry := 'Uruguay';
    191:
      sCountry := 'Uzbekistan';
    192:
      sCountry := 'Venezuela';
    193:
      sCountry := 'Vietnam';
    194:
      sCountry := 'Virgin Islands (UK)';
    195:
      sCountry := 'Virgin Islands (US)';
    196:
      sCountry := 'Yemen';
    197:
      sCountry := 'Zambia';
    198:
      sCountry := 'Zimbabwe';

  end;
  if Length(sID) <> 13 then
  begin
    ShowMessage('Your ID is not 13 Characters'); // Check ID Length
    exit;
  end;

  for i := 1 to 13 do
  begin
    if not(sID[i] in ['0' .. '9']) then
    begin
      ShowMessage('Your ID contains illegal characters'); // Check ID Characters
      exit;
    end;
  end;

  repeat
    iIdOddPositions := iIdOddPositions + StrToInt(sIDValidate[k]);
    Delete(sIDValidate, k, 1);
    inc(k);
  until (k = 7);
  Delete(sIDValidate, k, 1);

  iIDEvenx2 := StrToInt(sIDValidate) * 2;

  for j := 1 to Length(IntToStr(iIDEvenx2)) do
  begin
    iEvenDigits := iEvenDigits + StrToInt(IntToStr(iIDEvenx2)[j]);
  end;

  iAdd := iIdOddPositions + iEvenDigits;

  iSub := 10 - StrToInt(IntToStr(iAdd)[2]);

  if iSub <> StrToInt(sID[13]) then
  begin
    ShowMessage('ID invalid');
    exit;
  end;

  dmBrugDatabase_u.DataModule1.tblUsers.First;
  while not(dmBrugDatabase_u.DataModule1.tblUsers.eof) do
  begin
    if dmBrugDatabase_u.DataModule1.tblUsers['ID Number'] = sID then
    begin
      ShowMessage('User Already exists');
      exit;
    end;
    dmBrugDatabase_u.DataModule1.tblUsers.next
  end;

  if (StrToInt(copy(sID, 7, 4)) <= 4999) then
    bMale := False
  else
    bMale := True;

  if Length(sname) < 2 then
  begin
    ShowMessage('Name too short');
    exit;
  end;
  if Length(sSurname) < 2 then
  begin
    ShowMessage('Surname too short');
    exit;
  end;

  case rgRegType.ItemIndex of
    - 1:
      begin
        ShowMessage('Please select user type');
        exit;
      end;
    0:
      bUsertype := True;
    1:
      bUsertype := False

  end;

  if Length(sEmail) < 5 then
  begin
    ShowMessage('Invalid Email');
    exit;
  end;

  if not(containsText(sEmail, '@')) then
  begin
    ShowMessage('No Domain');
    exit;
  end;

  if Length(SCell) < 10 then
  begin
    ShowMessage('Number too short');
    exit;
  end;

  if Length(SCell) > 10 then
  begin
    ShowMessage('Number too long');
    exit;
  end;

  for l := 1 to 10 do
  begin
    if not(SCell[l] in ['0' .. '9']) then
    begin
      ShowMessage('Your Phone number contains illegal characters');
      // Check Phone Characters
      exit;
    end;
  end;

  if sPassword <> sconfirm then
  begin
    ShowMessage('Passwords does not match');
    exit;
  end;

  with dmBrugDatabase_u.DataModule1 do
  begin
    tblUsers.last;
    tblUsers.insert;
    tblUsers['ID Number'] := sID;
    tblUsers['Name'] := sname;
    tblUsers['Surname'] := sSurname;
    tblUsers['Gender'] := bMale;
    tblUsers['Organiser'] := bUsertype;
    tblUsers['Country'] := sCountry;
    tblUsers['Password'] := sPassword;
    tblUsers['Email'] := sEmail;
    tblUsers['Phone Number'] := SCell;
    tblUsers.post;

  end;

  if bUsertype = False then
  begin
    dmBrugDatabase_u.DataModule1.tblPlayer['ID Number'] := sID;
    dmBrugDatabase_u.DataModule1.tblPlayer.post;
  end;

  tsLogin.TabVisible := True;
  tsRegister.TabVisible := False;
  tsLogin.Visible := True;
  pcTabs.ActivePage := tsLogin;
end;

procedure TfrmBridgeDatabase.Button3Click(Sender: TObject);
begin
  tsLogin.TabVisible := False;
  tsRegister.TabVisible := False;
  tsProfile.TabVisible := False;
  tsRanking.TabVisible := False;
  tsSearch.TabVisible := False;
  tsCreateTournament.TabVisible := False;
  tsOngoing.TabVisible := False;
  tsEnterTournament.TabVisible := False;
  tsMyTournament.TabVisible := False;
  tsNotices.TabVisible := False;
  tsEdit.TabVisible := True;
  tsEdit.Visible := True;
  pcTabs.ActivePage := tsEdit;
end;

procedure TfrmBridgeDatabase.FormCreate(Sender: TObject);
begin
  redNotices.ReadOnly := True;
  redNotices.Paragraph.TabCount := 3;
  redNotices.Paragraph.Tab[1] := 150;
  redNotices.Paragraph.Tab[2] := 600;
  redNotices.Paragraph.Tab[3] := 700;

  redNotices.SelAttributes.style := [fsbold];
  redNotices.lines.add('Sender:' + #9 + 'Notice:' + #9 + 'Time:' + #9 +
    'Type:');

  tsLogin.Caption := 'Login';
  tsRegister.Caption := 'Register New User';
  tsProfile.Caption := 'My Profile';
  tsRanking.Caption := 'Player rankings';
  tsSearch.Caption := 'Search Player';
  tsCreateTournament.Caption := 'Create Tournament';
  tsOngoing.Caption := 'Ongoing Tournaments';
  tsEnterTournament.Caption := 'Enter Tournament';
  tsMyTournament.Caption := 'My Tournament';
  tsNotices.Caption := 'Notices';
  tsEdit.Caption := 'Edit Profile';

  tsLogin.TabVisible := True;
  tsRegister.TabVisible := False;
  tsProfile.TabVisible := False;
  tsRanking.TabVisible := False;
  tsSearch.TabVisible := False;
  tsCreateTournament.TabVisible := False;
  tsOngoing.TabVisible := False;
  tsEnterTournament.TabVisible := False;
  tsMyTournament.TabVisible := False;
  tsNotices.TabVisible := False;
  tsEdit.TabVisible := False;
  tsLogin.Visible := True;
  pcTabs.ActivePage := tsLogin;

  rgSearch.ItemIndex := 0;
  lblSearchPlayer.Caption := 'Search by Name:';
end;

procedure TfrmBridgeDatabase.FormResize(Sender: TObject);
begin

  lblID.left := round((tsLogin.Width - edtID.Width) / 2);
  edtID.left := round((tsLogin.Width - edtID.Width) / 2);
  lblPassword.left := round((tsLogin.Width - edtPassword.Width) / 2);
  edtPassword.left := round((tsLogin.Width - edtPassword.Width) / 2);
  btnLogin.left := round((tsLogin.Width - btnLogin.Width) / 2);
  btnRegister.left := round((tsLogin.Width - btnRegister.Width) / 2);
  btnGuest.left := round((tsLogin.Width - btnGuest.Width) / 2);

  lblID.top := round((tsLogin.Height - edtID.Height) / 2) - 114;
  edtID.top := round((tsLogin.Height - edtID.Height) / 2) - 89;
  lblPassword.top := round((tsLogin.Height - edtPassword.Height) / 2) - 62;
  edtPassword.top := round((tsLogin.Height - edtPassword.Height) / 2) - 37;
  btnLogin.top := round((tsLogin.Height - btnLogin.Height) / 2) - 10;
  btnRegister.top := round((tsLogin.Height - btnRegister.Height) / 2) + 21;
  btnGuest.top := round((tsLogin.Height - btnGuest.Height) / 2) + 52;

  Image1.Width := tsLogin.Width;
  Image1.Height := tsLogin.Height;

end;

procedure TfrmBridgeDatabase.rgSearchClick(Sender: TObject);
begin
  case rgSearch.ItemIndex of
    0:
      lblSearchPlayer.Caption := 'Search by Name:';
    1:
      lblSearchPlayer.Caption := 'Search by Surname:';
    2:
      lblSearchPlayer.Caption := 'Search by ID Number:';
  end;
end;

end.
