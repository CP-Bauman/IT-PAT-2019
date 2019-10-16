unit frmBrugDatabase_u;

// Christiaan Bauman
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, StdCtrls, ComCtrls, ExtCtrls, Spin, Grids, DBGrids,
  StrUtils, dmBrugDatabase_u,
  pngimage, jpeg, Data.DB, DateUtils, frmOngoing_u, math;

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
    lblEditName: TLabel;
    lblEditSurname: TLabel;
    lblEditEmail: TLabel;
    lblEditCell: TLabel;
    lblEditCountry: TLabel;
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
    edtEntryfee: TLabel;
    lblTournamentDate: TLabel;
    sedNrofGames: TSpinEdit;
    sedEntryFee: TSpinEdit;
    sedDateDay: TSpinEdit;
    sedDateMonth: TSpinEdit;
    sedDateYear: TSpinEdit;
    sedPlayerMax: TSpinEdit;
    lblPlayerMax: TLabel;
    lblRatMin: TLabel;
    lblRatMax: TLabel;
    sedRatMin: TSpinEdit;
    sedRatMax: TSpinEdit;
    lblRank: TLabel;
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
    Image2: TImage;
    redRanking: TRichEdit;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    redSearch: TRichEdit;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Label1: TLabel;
    redOngoing: TRichEdit;
    lblArrow: TLabel;
    lblArrow2: TLabel;
    redEnterTournament: TRichEdit;
    cbMyTournaments: TComboBox;
    pnlMyTournament: TPanel;
    lblTourName: TLabel;
    lblPlayAmount: TLabel;
    lblPlayDate: TLabel;
    Label8: TLabel;
    redMyTournament: TRichEdit;
    redPairings: TRichEdit;
    btnStartTournament: TButton;
    btnNextRound: TButton;
    btnPreviousRound: TButton;
    gbWinner: TGroupBox;
    btnSideA: TButton;
    btnSideB: TButton;
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
    procedure Button4Click(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure pcTabsChange(Sender: TObject);
    procedure btnEditChangePasswdClick(Sender: TObject);
    procedure btnEditSaveClick(Sender: TObject);
    procedure sedDateMonthChange(Sender: TObject);
    procedure sedDateYearChange(Sender: TObject);
    procedure redOngoingClick(Sender: TObject);
    procedure redOngoingMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);

    procedure redEnterTournamentMouseMove(Sender: TObject; Shift: TShiftState;
      X, Y: Integer);
    procedure redEnterTournamentClick(Sender: TObject);
    procedure cbMyTournamentsChange(Sender: TObject);
    procedure btnStartTournamentClick(Sender: TObject);
    procedure btnSideAClick(Sender: TObject);
  private
    arrTournaments: array [0 .. 100] of String;
    arrEnterTour: array [0 .. 100] of String;
    arrMyTournaments: array [0 .. 100] of string;
    arrpair: array [0 .. 100] of String;
    arrRank: array [0 .. 100] of string;
    // arrpairs: array [0 .. 100] of string;
    iTourAmount, iEnterTour, iMytour, ital2, ital, iGames, iround: Integer;
    sLogedinID: string;
    function NumToName(iNumber: Integer): String;
    { Private declarations }
  public
    sCurrentTour, sEnterTour: string;
    { Public declarations }
  end;

var

  frmBridgeDatabase: TfrmBridgeDatabase;

implementation

{$R *.dfm}

procedure TfrmBridgeDatabase.btnCreateTourClick(Sender: TObject);
var
  iMonth: Integer;
  sID, sTournamentName, sDate: string;
  bPublic: Boolean;
  tler: textfile;
begin
  if Length(edtTournamentName.text) < 5 then
  begin
    ShowMessage('Tournament name too short');
    exit;
  end;

  if rgTourType.ItemIndex = -1 then
  begin
    ShowMessage('Please choose Tournament Type');
    exit;
  end;

  case rgTourType.ItemIndex of
    0:
      bPublic := False;
    1:
      bPublic := True;

  end;

  sDate := IntToStr(sedDateDay.value) + '/' + IntToStr(sedDateMonth.value)
    + '/' + IntToStr(sedDateYear.value);
  sID := IntToStr(TimeToMilliseconds(time)) + IntToStr(dayof(date)) + IntToStr
    (monthof(date)) + IntToStr(YearOf(date));

  with dmBrugDatabase_u.DataModule1 do
  begin
    tblTournament.last;
    tblTournament.insert;
    tblTournament['ID'] := sID;
    tblTournament['TournamentName'] := edtTournamentName.text;
    tblTournament['TourDate'] := sDate;
    tblTournament['GameAmount'] := sedNrofGames.value;
    tblTournament['RatingMin'] := sedRatMin.value;
    tblTournament['RatingMax'] := sedRatMax.value;
    tblTournament['Prizemoney'] := sedPrize.value;
    tblTournament['PlayerMax'] := sedPlayerMax.value;
    tblTournament['PlayerAmount'] := 0;
    tblTournament['Owner'] := sLogedinID;
    tblTournament['Location'] := NumToName(cbTourLocation.ItemIndex);
    tblTournament['EntryFee'] := sedEntryFee.value;
    tblTournament['PublicTournament'] := bPublic;
    tblTournament.Post;

  end;

  AssignFile(tler, sID + '.txt');
  Rewrite(tler);

  Writeln(tler, 'PlayersPoints');

  Writeln(tler, 'Pairings');
  CloseFile(tler);
  ShowMessage('Your tournament has been created!');

  edtTournamentName.clear;
  sedNrofGames.value := 1;
  sedEntryFee.value := 0;
  sedPlayerMax.value := 2;
  sedRatMin.value := 600;
  sedRatMax.value := 700;
  sedPrize.value := 0;
  rgTourType.ItemIndex := -1;
  sedDateDay.value := dayof(date) + 1;
  sedDateMonth.value := monthof(date);
  sedDateYear.value := YearOf(date);

end;

procedure TfrmBridgeDatabase.btnEditBackClick(Sender: TObject);
begin
  tsProfile.Visible := True;
  pcTabs.ActivePage := tsProfile;
end;

procedure TfrmBridgeDatabase.btnEditChangePasswdClick(Sender: TObject);
var
  sPassword, sConfirm: string;
begin
  dmBrugDatabase_u.DataModule1.tblUsers.First;
  while not(dmBrugDatabase_u.DataModule1.tblUsers.eof) do
  begin
    if dmBrugDatabase_u.DataModule1.tblUsers['ID Number'] = sLogedinID then
    begin
      if InputBox('Change Password', #31'Old Password:', '')
        = dmBrugDatabase_u.DataModule1.tblUsers['Password'] then
      begin
        sPassword := InputBox('Change Password', #31'New Password:', '');
        sConfirm := InputBox('Change Password', #31'Confirm Password:', '');
        if sPassword = sConfirm then
        begin
          dmBrugDatabase_u.DataModule1.tblUsers.edit;
          dmBrugDatabase_u.DataModule1.tblUsers['Password'] := sPassword;
          ShowMessage('Password changed succesfully');
        end;

      end
      else
        ShowMessage('Password incorrect');

      break;
    end
    else
      dmBrugDatabase_u.DataModule1.tblUsers.Next;
  end;
  dmBrugDatabase_u.DataModule1.tblUsers.Post;
end;

procedure TfrmBridgeDatabase.btnEditSaveClick(Sender: TObject);
begin
  dmBrugDatabase_u.DataModule1.tblUsers.First;
  while not(dmBrugDatabase_u.DataModule1.tblUsers.eof) do
  begin
    if dmBrugDatabase_u.DataModule1.tblUsers['ID Number'] = sLogedinID then
    begin
      dmBrugDatabase_u.DataModule1.tblUsers.edit;
      dmBrugDatabase_u.DataModule1.tblUsers['Name'] := edtEditName.text;
      dmBrugDatabase_u.DataModule1.tblUsers['Surname'] := edtEditSurname.text;
      dmBrugDatabase_u.DataModule1.tblUsers['Email'] := edtEditEmail.text;
      dmBrugDatabase_u.DataModule1.tblUsers['Phone Number'] := edtEditCell.text;
      dmBrugDatabase_u.DataModule1.tblUsers['Country'] := NumToName
        (cbEditCountry.ItemIndex);
      break;
    end
    else
      dmBrugDatabase_u.DataModule1.tblUsers.Next;
  end;
  dmBrugDatabase_u.DataModule1.tblUsers.Post;
  ShowMessage('Changes have been Saved');
end;

procedure TfrmBridgeDatabase.btnGuestClick(Sender: TObject);
var
  sID, sPassword, sDOB, sName, sSurname, sCountry: string;
  iRanking: Integer;
begin
  edtID.clear;
  edtPassword.clear;
  edtSearch.clear;
  redSearch.clear;
  redSearch.ReadOnly := True;
  redSearch.Paragraph.TabCount := 11;
  redSearch.Paragraph.Tab[1] := 100;
  redSearch.Paragraph.Tab[2] := 200;
  redSearch.Paragraph.Tab[3] := 300;
  redSearch.Paragraph.Tab[4] := 400;
  redSearch.Paragraph.Tab[5] := 500;
  redSearch.Paragraph.Tab[6] := 600;
  redSearch.Paragraph.Tab[7] := 700;
  redSearch.Paragraph.Tab[8] := 800;
  redSearch.Paragraph.Tab[9] := 900;
  redSearch.Paragraph.Tab[10] := 1000;

  redSearch.SelAttributes.style := [fsbold];
  redSearch.lines.add('''Name' + #9 + 'Surname' + #9 + 'ID' + #9 + 'Wins' +
      #9 + 'Loses' + #9 + 'Winrate' + #9 + 'Rating' + #9 + 'Rank' + #9 +
      'Tournament amount' + #9 + 'Games Played' + #9 + 'Country');

  redRanking.clear;
  redRanking.ReadOnly := True;
  redRanking.Paragraph.TabCount := 10;
  redRanking.Paragraph.Tab[1] := 50;
  redRanking.Paragraph.Tab[2] := 200;
  redRanking.Paragraph.Tab[3] := 350;
  redRanking.Paragraph.Tab[4] := 500;
  redRanking.Paragraph.Tab[5] := 650;
  redRanking.Paragraph.Tab[6] := 800;
  redRanking.Paragraph.Tab[7] := 950;
  redRanking.Paragraph.Tab[8] := 1100;
  redRanking.Paragraph.Tab[9] := 1250;

  redRanking.SelAttributes.style := [fsbold];
  redRanking.lines.add
    ('Ranking' + #9 + 'Name' + #9 + 'Surname' + #9 + 'Wins' + #9 + 'Loses' +
      #9 + 'Winrate' + #9 + 'Rating' + #9 + 'Tournament amount' + #9 +
      'Games Played' + #9 + 'Country');

  dmBrugDatabase_u.DataModule1.tblPlayer.edit;
  dmBrugDatabase_u.DataModule1.tblPlayer.Sort := 'Rating DESC';

  dmBrugDatabase_u.DataModule1.tblPlayer.First;

  iRanking := 0;
  while not(dmBrugDatabase_u.DataModule1.tblPlayer.eof) do
  begin

    dmBrugDatabase_u.DataModule1.tblUsers.First;

    while not(dmBrugDatabase_u.DataModule1.tblUsers.eof) do
    begin
      if dmBrugDatabase_u.DataModule1.tblUsers['ID Number']
        = dmBrugDatabase_u.DataModule1.tblPlayer['ID'] then
      begin
        sName := dmBrugDatabase_u.DataModule1.tblUsers['Name'];
        sSurname := dmBrugDatabase_u.DataModule1.tblUsers['Surname'];
        sCountry := dmBrugDatabase_u.DataModule1.tblUsers['Country'];
        break;
      end
      else
        dmBrugDatabase_u.DataModule1.tblUsers.Next;

    end;
    inc(iRanking);
    dmBrugDatabase_u.DataModule1.tblPlayer.edit;
    dmBrugDatabase_u.DataModule1.tblPlayer['Rank'] := iRanking;

    redRanking.lines.add
      (IntToStr(dmBrugDatabase_u.DataModule1.tblPlayer['Rank'])
        + #9 + sName + #9 + sSurname + #9 + IntToStr
        (dmBrugDatabase_u.DataModule1.tblPlayer['Wins']) + #9 + IntToStr
        (dmBrugDatabase_u.DataModule1.tblPlayer['Loses']) + #9 + IntToStr
        (dmBrugDatabase_u.DataModule1.tblPlayer['WinRate']) + #9 + IntToStr
        (dmBrugDatabase_u.DataModule1.tblPlayer['Rating']) + #9 + IntToStr
        (dmBrugDatabase_u.DataModule1.tblPlayer['TournamentAmount'])
        + #9 + IntToStr(dmBrugDatabase_u.DataModule1.tblPlayer['Loses']
          + dmBrugDatabase_u.DataModule1.tblPlayer['Wins']) + #9 + sCountry);
    dmBrugDatabase_u.DataModule1.tblPlayer.Next;
  end;
  dmBrugDatabase_u.DataModule1.tblPlayer.edit;
  dmBrugDatabase_u.DataModule1.tblPlayer.Post;

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
  sID, sPassword, sDOB, sName, sSurname, sCountry, sTodayDate: string;
  iRanking: Integer;
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
        sLogedinID := dmBrugDatabase_u.DataModule1.tblUsers['ID Number'];
        edtID.clear;
        edtPassword.clear;
        edtSearch.clear;
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
        sDOB := copy(sDOB, 1, 2) + '/' + copy(sDOB, 3, 2) + '/' + copy(sDOB, 5,
          2);
        lblProfDOB.Caption := sDOB;
        lblProfCountry.Caption := dmBrugDatabase_u.DataModule1.tblUsers
          ['Country'];
        lblProfEmail.Caption := dmBrugDatabase_u.DataModule1.tblUsers['Email'];
        lblProfCell.Caption := dmBrugDatabase_u.DataModule1.tblUsers
          ['Phone Number'];

        redSearch.clear;
        redSearch.ReadOnly := True;
        redSearch.Paragraph.TabCount := 11;
        redSearch.Paragraph.Tab[1] := 100;
        redSearch.Paragraph.Tab[2] := 200;
        redSearch.Paragraph.Tab[3] := 300;
        redSearch.Paragraph.Tab[4] := 400;
        redSearch.Paragraph.Tab[5] := 500;
        redSearch.Paragraph.Tab[6] := 600;
        redSearch.Paragraph.Tab[7] := 700;
        redSearch.Paragraph.Tab[8] := 800;
        redSearch.Paragraph.Tab[9] := 900;
        redSearch.Paragraph.Tab[10] := 1000;

        redSearch.SelAttributes.style := [fsbold];
        redSearch.lines.add
          ('''Name' + #9 + 'Surname' + #9 + 'ID' + #9 + 'Wins' + #9 +
            'Loses' + #9 + 'Winrate' + #9 + 'Rating' + #9 + 'Rank' + #9 +
            'Tournament amount' + #9 + 'Games Played' + #9 + 'Country');

        redRanking.clear;
        redRanking.ReadOnly := True;
        redRanking.Paragraph.TabCount := 10;
        redRanking.Paragraph.Tab[1] := 50;
        redRanking.Paragraph.Tab[2] := 200;
        redRanking.Paragraph.Tab[3] := 350;
        redRanking.Paragraph.Tab[4] := 500;
        redRanking.Paragraph.Tab[5] := 650;
        redRanking.Paragraph.Tab[6] := 800;
        redRanking.Paragraph.Tab[7] := 950;
        redRanking.Paragraph.Tab[8] := 1100;
        redRanking.Paragraph.Tab[9] := 1250;

        redRanking.SelAttributes.style := [fsbold];
        redRanking.lines.add
          ('Ranking' + #9 + 'Name' + #9 + 'Surname' + #9 + 'Wins' + #9 +
            'Loses' + #9 + 'Winrate' + #9 + 'Rating' + #9 +
            'Tournament amount' + #9 + 'Games Played' + #9 +
            'Country');

        redOngoing.clear;
        redOngoing.ReadOnly := True;
        redOngoing.Paragraph.TabCount := 7;
        redOngoing.Paragraph.Tab[1] := 100;
        redOngoing.Paragraph.Tab[2] := 200;
        redOngoing.Paragraph.Tab[3] := 300;
        redOngoing.Paragraph.Tab[4] := 400;
        redOngoing.Paragraph.Tab[5] := 500;
        redOngoing.Paragraph.Tab[6] := 600;

        redOngoing.SelAttributes.style := [fsbold];
        redOngoing.lines.add('Tournament Name' + #9 + 'Date' + #9 +
            'Amount of games' + #9 + 'Minimum Rating' + #9 + 'Maximum Rating' +
            #9 + 'Prize Money' + #9 + 'Location');

        sedDateDay.value := dayof(date) + 1;
        sedDateMonth.value := monthof(date);
        sedDateYear.value := YearOf(date);

        redEnterTournament.clear;
        redEnterTournament.ReadOnly := True;
        redEnterTournament.Paragraph.TabCount := 7;
        redEnterTournament.Paragraph.Tab[1] := 100;
        redEnterTournament.Paragraph.Tab[2] := 200;
        redEnterTournament.Paragraph.Tab[3] := 300;
        redEnterTournament.Paragraph.Tab[4] := 400;
        redEnterTournament.Paragraph.Tab[5] := 500;
        redEnterTournament.Paragraph.Tab[6] := 600;
        redEnterTournament.Paragraph.Tab[7] := 700;
        redEnterTournament.SelAttributes.style := [fsbold];
        redEnterTournament.lines.add
          ('Tournament Name' + #9 + 'Date' + #9 + 'Amount of games' + #9 +
            'Minimum Rating' + #9 + 'Maximum Rating' + #9 + 'Entry Fee' + #9 +
            'Prize Money' + #9 + 'Location');

        sedDateYear.MinValue := YearOf(date);
        sedDateMonth.MinValue := monthof(date);
        sedDateDay.MinValue := dayof(date) + 1;

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
          tsMyTournament.TabVisible := True;
          tsNotices.TabVisible := True;
          tsEdit.TabVisible := False;
          tsProfile.Visible := True;
          pcTabs.ActivePage := tsProfile;

        end
        else
        begin
          tsLogin.TabVisible := False;
          tsRegister.TabVisible := False;
          tsProfile.TabVisible := True;
          tsRanking.TabVisible := True;
          tsSearch.TabVisible := True;
          tsCreateTournament.TabVisible := False;
          tsOngoing.TabVisible := True;
          tsEnterTournament.TabVisible := True;
          tsMyTournament.TabVisible := False;
          tsNotices.TabVisible := True;
          tsEdit.TabVisible := False;
          tsProfile.Visible := True;
          pcTabs.ActivePage := tsProfile;
        end;
        sTodayDate := IntToStr(dayof(date)) + '/' + IntToStr(monthof(date))
          + '/' + IntToStr(YearOf(date));
        iTourAmount := 0;
        DataModule1.tblTournament.First;
        while not(DataModule1.tblTournament.eof) do
        begin
          if sTodayDate = DataModule1.tblTournament['TourDate'] then
          begin
            redOngoing.lines.add
              (DataModule1.tblTournament['TournamentName']
                + #9 + DataModule1.tblTournament['TourDate'] + #9 + IntToStr
                (DataModule1.tblTournament['GameAmount']) + #9 + IntToStr
                (DataModule1.tblTournament['RatingMin']) + #9 + IntToStr
                (DataModule1.tblTournament['RatingMax']) + #9 + 'R' + IntToStr
                (DataModule1.tblTournament['PrizeMoney'])
                + #9 + DataModule1.tblTournament['Location']);
            arrTournaments[iTourAmount] := DataModule1.tblTournament['ID'];
            inc(iTourAmount);
          end;
          DataModule1.tblTournament.Next;
        end;

        iEnterTour := 0;
        DataModule1.tblTournament.First;
        while not(DataModule1.tblTournament.eof) do
        begin
          if DataModule1.tblTournament['PublicTournament'] = True then
          begin
            if YearOf(date) < strtoint(copy(sTodayDate,
                Length(DataModule1.tblTournament['TourDate']) - 3, 4)) then
            begin
              redEnterTournament.lines.add
                (DataModule1.tblTournament['TournamentName']
                  + #9 + DataModule1.tblTournament['TourDate']
                  + #9 + IntToStr(DataModule1.tblTournament['GameAmount'])
                  + #9 + IntToStr(DataModule1.tblTournament['RatingMin'])
                  + #9 + IntToStr(DataModule1.tblTournament['RatingMax'])
                  + #9 + 'R' + IntToStr
                  (DataModule1.tblTournament['PrizeMoney'])
                  + #9 + DataModule1.tblTournament['Location']);
              arrEnterTour[iEnterTour] := DataModule1.tblTournament['ID'];
              inc(iEnterTour);
            end
            else if monthof(date) < strtoint
              (copy(DataModule1.tblTournament['TourDate'],
                pos('/', DataModule1.tblTournament['TourDate']) + 1,
                pos('/', copy(DataModule1.tblTournament['TourDate'], pos('/',
                      DataModule1.tblTournament['TourDate']) + 1), 3) - 1)) then
            begin
              redEnterTournament.lines.add
                (DataModule1.tblTournament['TournamentName']
                  + #9 + DataModule1.tblTournament['TourDate']
                  + #9 + IntToStr(DataModule1.tblTournament['GameAmount'])
                  + #9 + IntToStr(DataModule1.tblTournament['RatingMin'])
                  + #9 + IntToStr(DataModule1.tblTournament['RatingMax'])
                  + #9 + 'R' + IntToStr
                  (DataModule1.tblTournament['PrizeMoney'])
                  + #9 + DataModule1.tblTournament['Location']);
              arrEnterTour[iEnterTour] := DataModule1.tblTournament['ID'];
              inc(iEnterTour);
            end
            else if dayof(date) < strtoint
              (copy(DataModule1.tblTournament['TourDate'], 1,
                pos('/', DataModule1.tblTournament['TourDate']) - 1)) then
            begin
              redEnterTournament.lines.add
                (DataModule1.tblTournament['TournamentName']
                  + #9 + DataModule1.tblTournament['TourDate']
                  + #9 + IntToStr(DataModule1.tblTournament['GameAmount'])
                  + #9 + IntToStr(DataModule1.tblTournament['RatingMin'])
                  + #9 + IntToStr(DataModule1.tblTournament['RatingMax'])
                  + #9 + 'R' + IntToStr
                  (DataModule1.tblTournament['PrizeMoney'])
                  + #9 + DataModule1.tblTournament['Location']);
              arrEnterTour[iEnterTour] := DataModule1.tblTournament['ID'];
              inc(iEnterTour);
            end;

            DataModule1.tblTournament.Next;
          end;
        end;
        DataModule1.tblTournament.First;
        iMytour := 0;

        while not DataModule1.tblTournament.eof do
        begin
          if DataModule1.tblTournament['Owner'] = sLogedinID then
          begin
            arrMyTournaments[iMytour] := DataModule1.tblTournament['ID'];
            cbMyTournaments.Items.add
              (DataModule1.tblTournament['TournamentName']);

          end;
          inc(iMytour);
          DataModule1.tblTournament.Next;
        end;

        dmBrugDatabase_u.DataModule1.tblPlayer.edit;
        dmBrugDatabase_u.DataModule1.tblPlayer.Sort := 'Rating DESC';

        dmBrugDatabase_u.DataModule1.tblPlayer.First;

        iRanking := 0;
        while not(dmBrugDatabase_u.DataModule1.tblPlayer.eof) do
        begin

          dmBrugDatabase_u.DataModule1.tblUsers.First;

          while not(dmBrugDatabase_u.DataModule1.tblUsers.eof) do
          begin
            if dmBrugDatabase_u.DataModule1.tblUsers['ID Number']
              = dmBrugDatabase_u.DataModule1.tblPlayer['ID'] then
            begin
              sName := dmBrugDatabase_u.DataModule1.tblUsers['Name'];
              sSurname := dmBrugDatabase_u.DataModule1.tblUsers['Surname'];
              sCountry := dmBrugDatabase_u.DataModule1.tblUsers['Country'];
              break;
            end
            else
              dmBrugDatabase_u.DataModule1.tblUsers.Next;

          end;
          inc(iRanking);
          dmBrugDatabase_u.DataModule1.tblPlayer.edit;
          dmBrugDatabase_u.DataModule1.tblPlayer['Rank'] := iRanking;

          redRanking.lines.add
            (IntToStr(dmBrugDatabase_u.DataModule1.tblPlayer['Rank'])
              + #9 + sName + #9 + sSurname + #9 + IntToStr
              (dmBrugDatabase_u.DataModule1.tblPlayer['Wins']) + #9 + IntToStr
              (dmBrugDatabase_u.DataModule1.tblPlayer['Loses']) + #9 + IntToStr
              (dmBrugDatabase_u.DataModule1.tblPlayer['WinRate'])
              + #9 + IntToStr(dmBrugDatabase_u.DataModule1.tblPlayer['Rating']
              ) + #9 + IntToStr(dmBrugDatabase_u.DataModule1.tblPlayer
                ['TournamentAmount']) + #9 + IntToStr
              (dmBrugDatabase_u.DataModule1.tblPlayer['Loses']
                + dmBrugDatabase_u.DataModule1.tblPlayer['Wins'])
              + #9 + sCountry);
          dmBrugDatabase_u.DataModule1.tblPlayer.Next;
        end;
        dmBrugDatabase_u.DataModule1.tblPlayer.edit;
        dmBrugDatabase_u.DataModule1.tblPlayer.Post;

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
      dmBrugDatabase_u.DataModule1.tblUsers.Next;
    end;

  end;
  ShowMessage('User does not exist');
end;

procedure TfrmBridgeDatabase.btnRegBackClick(Sender: TObject);
begin
  edtRegId.clear;
  edtRegName.clear;
  edtRegSurname.clear;
  edtRegEmail.clear;
  edtRegCell.clear;
  edtRegPasswd.clear;
  edtRegConPasswd.clear;
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
  sCountry, sID, sIDValidate, sName, sSurname, sEmail, SCell, sPassword,
    sConfirm: string;
  bUsertype, bMale: Boolean;
  i, k, j, l, iIdOddPositions, iIDEvenx2, iEvenDigits, iAdd, iSub: Integer;
  tUserfile: textfile;
begin
  sID := edtRegId.text;
  k := 1;
  iIdOddPositions := 0;
  sIDValidate := sID;
  iEvenDigits := 0;
  sName := edtRegName.text;
  sSurname := edtRegSurname.text;
  SCell := edtRegCell.text;
  sEmail := edtRegEmail.text;
  sPassword := edtRegPasswd.text;
  sConfirm := edtRegConPasswd.text;

  sCountry := NumToName(cbRegCountry.ItemIndex);

  if Length(sID) <> 13 then
  begin
    ShowMessage('Your ID is not 13 Characters'); // Check ID Length
    exit;
  end;

  for i := 1 to 13 do
  begin
    if not(sID[i] in ['0' .. '9']) then
    begin
      ShowMessage('Your ID contains illegal characters');
      // Check ID Characters
      exit;
    end;
  end;

  repeat
    iIdOddPositions := iIdOddPositions + strtoint(sIDValidate[k]);
    Delete(sIDValidate, k, 1);
    inc(k);
  until (k = 7);
  Delete(sIDValidate, k, 1);

  iIDEvenx2 := strtoint(sIDValidate) * 2;

  for j := 1 to Length(IntToStr(iIDEvenx2)) do
  begin
    iEvenDigits := iEvenDigits + strtoint(IntToStr(iIDEvenx2)[j]);
  end;

  iAdd := iIdOddPositions + iEvenDigits;

  iSub := 10 - strtoint(IntToStr(iAdd)[2]);

  if iSub <> strtoint(sID[13]) then
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
    dmBrugDatabase_u.DataModule1.tblUsers.Next
  end;

  if (strtoint(copy(sID, 7, 4)) <= 4999) then
    bMale := False
  else
    bMale := True;

  if Length(sName) < 2 then
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

  if sPassword <> sConfirm then
  begin
    ShowMessage('Passwords does not match');
    exit;
  end;

  with dmBrugDatabase_u.DataModule1 do
  begin
    tblUsers.last;
    tblUsers.insert;
    tblUsers['ID Number'] := sID;
    tblUsers['Name'] := sName;
    tblUsers['Surname'] := sSurname;
    tblUsers['Gender'] := bMale;
    tblUsers['Organiser'] := bUsertype;
    tblUsers['Country'] := sCountry;
    tblUsers['Password'] := sPassword;
    tblUsers['Email'] := sEmail;
    tblUsers['Phone Number'] := SCell;
    tblUsers.Post;

  end;

  if bUsertype = False then
  begin
    dmBrugDatabase_u.DataModule1.tblPlayer.last;
    dmBrugDatabase_u.DataModule1.tblPlayer.insert;
    dmBrugDatabase_u.DataModule1.tblPlayer['ID'] := sID;
    dmBrugDatabase_u.DataModule1.tblPlayer['Rating'] := 600;
    dmBrugDatabase_u.DataModule1.tblPlayer.Post;

    AssignFile(tUserfile, sID + '.txt');
    Rewrite(tUserfile);
    Writeln(tUserfile, sName + ' ' + sSurname + ',' + sID);
    Writeln(tUserfile, '');
    Writeln(tUserfile, 'Tournaments');
    Writeln(tUserfile, '');
    Writeln(tUserfile, 'Opponents');
  end
  else
  begin
    AssignFile(tUserfile, sID + '.txt');
    Rewrite(tUserfile);
    Writeln(tUserfile, sName + ' ' + sSurname + ',' + sID);
    Writeln(tUserfile, '');
    Writeln(tUserfile, 'My Tournaments');
  end;

  tsLogin.TabVisible := True;
  tsRegister.TabVisible := False;
  tsLogin.Visible := True;
  pcTabs.ActivePage := tsLogin;
end;

procedure TfrmBridgeDatabase.btnSearchClick(Sender: TObject);
Var
  iWins, iLoses, iWinrate, iRating, iRank, iTourAmount, iGamesPlayed: Integer;
begin
  // Search for Players
  case rgSearch.ItemIndex of
    0:
      begin
        dmBrugDatabase_u.DataModule1.tblUsers.First;
        redSearch.clear;
        redSearch.SelAttributes.style := [fsbold];
        redSearch.lines.add
          ('''Name' + #9 + 'Surname' + #9 + 'ID' + #9 + 'Wins' + #9 +
            'Loses' + #9 + 'Winrate' + #9 + 'Rating' + #9 + 'Rank' + #9 +
            'Tournament amount' + #9 + 'Games Played' + #9 + 'Country');

        while not(dmBrugDatabase_u.DataModule1.tblUsers.eof) do
        begin
          if (pos(UpperCase(edtSearch.text),
              UpperCase(dmBrugDatabase_u.DataModule1.tblUsers['Name'])) > 0)
            and (dmBrugDatabase_u.DataModule1.tblUsers['Organiser'] = False)
            then
          begin

            dmBrugDatabase_u.DataModule1.tblPlayer.First;

            while not(dmBrugDatabase_u.DataModule1.tblPlayer.eof) do
            begin
              if dmBrugDatabase_u.DataModule1.tblPlayer['ID']
                = dmBrugDatabase_u.DataModule1.tblUsers
                ['ID Number'] then
              begin
                iWins := dmBrugDatabase_u.DataModule1.tblPlayer['Wins'];
                iLoses := dmBrugDatabase_u.DataModule1.tblPlayer['Loses'];
                iWinrate := dmBrugDatabase_u.DataModule1.tblPlayer['WinRate'];
                iRating := dmBrugDatabase_u.DataModule1.tblPlayer['Rating'];
                iRank := dmBrugDatabase_u.DataModule1.tblPlayer['Rank'];
                iTourAmount := dmBrugDatabase_u.DataModule1.tblPlayer
                  ['TournamentAmount'];
                iGamesPlayed := iWins + iLoses;
                break;
              end
              else
                dmBrugDatabase_u.DataModule1.tblPlayer.Next;

            end;

            redSearch.lines.add
              (dmBrugDatabase_u.DataModule1.tblUsers['Name']
                + #9 + dmBrugDatabase_u.DataModule1.tblUsers['Surname']
                + #9 + dmBrugDatabase_u.DataModule1.tblUsers['ID Number']
                + #9 + IntToStr(iWins) + #9 + IntToStr(iLoses) + #9 + IntToStr
                (iWinrate) + #9 + IntToStr(iRating) + #9 + IntToStr(iRank)
                + #9 + IntToStr(iTourAmount) + #9 + IntToStr(iGamesPlayed)
                + #9 + dmBrugDatabase_u.DataModule1.tblUsers['Country']);
            dmBrugDatabase_u.DataModule1.tblPlayer.Next;
          end;
          dmBrugDatabase_u.DataModule1.tblUsers.Next;
        end;

      end;

    1:
      begin
        dmBrugDatabase_u.DataModule1.tblUsers.First;
        redSearch.clear;
        redSearch.SelAttributes.style := [fsbold];
        redSearch.lines.add
          ('''Name' + #9 + 'Surname' + #9 + 'ID' + #9 + 'Wins' + #9 +
            'Loses' + #9 + 'Winrate' + #9 + 'Rating' + #9 + 'Rank' + #9 +
            'Tournament amount' + #9 + 'Games Played' + #9 + 'Country');

        while not(dmBrugDatabase_u.DataModule1.tblUsers.eof) do
        begin
          if (pos(UpperCase(edtSearch.text),
              UpperCase(dmBrugDatabase_u.DataModule1.tblUsers['Surname']))
              > 0) and (dmBrugDatabase_u.DataModule1.tblUsers['Organiser']
              = False) then
          begin

            dmBrugDatabase_u.DataModule1.tblPlayer.First;

            while not(dmBrugDatabase_u.DataModule1.tblPlayer.eof) do
            begin
              if dmBrugDatabase_u.DataModule1.tblPlayer['ID']
                = dmBrugDatabase_u.DataModule1.tblUsers
                ['ID Number'] then
              begin
                iWins := dmBrugDatabase_u.DataModule1.tblPlayer['Wins'];
                iLoses := dmBrugDatabase_u.DataModule1.tblPlayer['Loses'];
                iWinrate := dmBrugDatabase_u.DataModule1.tblPlayer['WinRate'];
                iRating := dmBrugDatabase_u.DataModule1.tblPlayer['Rating'];
                iRank := dmBrugDatabase_u.DataModule1.tblPlayer['Rank'];
                iTourAmount := dmBrugDatabase_u.DataModule1.tblPlayer
                  ['TournamentAmount'];
                iGamesPlayed := iWins + iLoses;
                break;
              end
              else
                dmBrugDatabase_u.DataModule1.tblPlayer.Next;

            end;

            redSearch.lines.add
              (dmBrugDatabase_u.DataModule1.tblUsers['Name']
                + #9 + dmBrugDatabase_u.DataModule1.tblUsers['Surname']
                + #9 + dmBrugDatabase_u.DataModule1.tblUsers['ID Number']
                + #9 + IntToStr(iWins) + #9 + IntToStr(iLoses) + #9 + IntToStr
                (iWinrate) + #9 + IntToStr(iRating) + #9 + IntToStr(iRank)
                + #9 + IntToStr(iTourAmount) + #9 + IntToStr(iGamesPlayed)
                + #9 + dmBrugDatabase_u.DataModule1.tblUsers['Country']);
            dmBrugDatabase_u.DataModule1.tblPlayer.Next;
          end;
          dmBrugDatabase_u.DataModule1.tblUsers.Next;
        end;

      end;
    2:
      begin
        dmBrugDatabase_u.DataModule1.tblUsers.First;
        redSearch.clear;
        redSearch.SelAttributes.style := [fsbold];
        redSearch.lines.add
          ('''Name' + #9 + 'Surname' + #9 + 'ID' + #9 + 'Wins' + #9 +
            'Loses' + #9 + 'Winrate' + #9 + 'Rating' + #9 + 'Rank' + #9 +
            'Tournament amount' + #9 + 'Games Played' + #9 + 'Country');

        while not(dmBrugDatabase_u.DataModule1.tblUsers.eof) do
        begin
          if (pos(edtSearch.text,
              dmBrugDatabase_u.DataModule1.tblUsers['ID Number']) > 0) and
            (dmBrugDatabase_u.DataModule1.tblUsers['Organiser'] = False) then
          begin

            dmBrugDatabase_u.DataModule1.tblPlayer.First;

            while not(dmBrugDatabase_u.DataModule1.tblPlayer.eof) do
            begin
              if dmBrugDatabase_u.DataModule1.tblPlayer['ID']
                = dmBrugDatabase_u.DataModule1.tblUsers
                ['ID Number'] then
              begin
                iWins := dmBrugDatabase_u.DataModule1.tblPlayer['Wins'];
                iLoses := dmBrugDatabase_u.DataModule1.tblPlayer['Loses'];
                iWinrate := dmBrugDatabase_u.DataModule1.tblPlayer['WinRate'];
                iRating := dmBrugDatabase_u.DataModule1.tblPlayer['Rating'];
                iRank := dmBrugDatabase_u.DataModule1.tblPlayer['Rank'];
                iTourAmount := dmBrugDatabase_u.DataModule1.tblPlayer
                  ['TournamentAmount'];
                iGamesPlayed := iWins + iLoses;
                break;
              end
              else
                dmBrugDatabase_u.DataModule1.tblPlayer.Next;

            end;

            redSearch.lines.add
              (dmBrugDatabase_u.DataModule1.tblUsers['Name']
                + #9 + dmBrugDatabase_u.DataModule1.tblUsers['Surname']
                + #9 + dmBrugDatabase_u.DataModule1.tblUsers['ID Number']
                + #9 + IntToStr(iWins) + #9 + IntToStr(iLoses) + #9 + IntToStr
                (iWinrate) + #9 + IntToStr(iRating) + #9 + IntToStr(iRank)
                + #9 + IntToStr(iTourAmount) + #9 + IntToStr(iGamesPlayed)
                + #9 + dmBrugDatabase_u.DataModule1.tblUsers['Country']);
            dmBrugDatabase_u.DataModule1.tblPlayer.Next;
          end;
          dmBrugDatabase_u.DataModule1.tblUsers.Next;
        end;

      end;
  end;

  // while not(dmBrugDatabase_u.DataModule1.tblUsers.eof) do
  // begin
  // if dmBrugDatabase_u.DataModule1.tblUsers['ID Number']  then
  // end;
end;

procedure TfrmBridgeDatabase.btnSideAClick(Sender: TObject);
var
  tfile: textfile;
  sline, sname1, sname2, sTemp: string;
  i, irat1, irat2, X, Y, k, iLynnr, j, l, OldRating1,OldRating2, NewRating1, NewRating2: Integer;
  arrFile: array [0 .. 100] of string;
  A1, A2, B1, B2 : real;
begin

  for i := 0 to ital do
  begin
    if copy(arrpair[iGames], 1, 13) = copy(arrRank[i], 1, 13) then
    begin
      arrRank[i] := copy(arrRank[i], 1, 14) + IntToStr
        (strtoint(copy(arrRank[i], 15, Length(arrRank[i]) - 14)) + 1);
      break;
    end;

  end;
   /////////Rating Calculator///Elo Rating sytem/////
   DataModule1.tblPlayer.First;
  while not(DataModule1.tblPlayer.eof) do
  begin
    if DataModule1.tblPlayer['ID'] = copy
      (arrpair[iGames], 1, 13) then
    begin
      OldRating1 := DataModule1.tblPlayer['Rating'];
      break;
    end;
    DataModule1.tblPlayer.Next;
  end;

  DataModule1.tblPlayer.First;
  while not(DataModule1.tblPlayer.eof) do
  begin
    if DataModule1.tblPlayer['ID'] = copy
      (arrpair[iGames], 15, 13) then
    begin
      OldRating2 := DataModule1.tblPlayer['Rating'];
      break;
    end
    else
    begin
      OldRating2 := OldRating1;
      break;
    end;
    DataModule1.tblUsers.Next;
  end;

  A1 := power(10,(OldRating1/400));
  A2 := power(10,(OldRating2/400));

  B1 := A1/(A1+A2);
  B2 := A2/(A1+A2);

  NewRating1 := oldrating1 + (36*(1-B1));
  NewRating2 := OldRating2 + (36*(0-B2));


    DataModule1.tblPlayer.First;
  while not(DataModule1.tblPlayer.eof) do
  begin
    if DataModule1.tblPlayer['ID'] = copy
      (arrpair[iGames], 1, 13) then
    begin
      DataModule1.tblPlayer['Rating'] := NewRating1;
      DataModule1.tblPlayer['Wins'] := DataModule1.tblPlayer['Wins'] + 1;
      break;
    end;
    DataModule1.tblPlayer.Next;
  end;

  DataModule1.tblPlayer.First;
  while not(DataModule1.tblPlayer.eof) do
  begin
    if DataModule1.tblPlayer['ID'] = copy
      (arrpair[iGames], 15, 13) then
    begin
      DataModule1.tblPlayer['Rating'] := NewRating2;
      DataModule1.tblPlayer['Loses'] := DataModule1.tblPlayer['Loses'] + 1;
      break;
    end
  end;

//////////////////////////////////////

  AssignFile(tfile, arrMyTournaments[cbMyTournaments.ItemIndex] + '.txt');
    append(tfile);
  arrpair[iGames] := arrpair[iGames] + '/1-0';
   Writeln(tfile, copy(arrpair[iGames], 1, 13) + ',' + copy(arrpair[iGames], 15,13) + copy(arrpair[iGames], 28,length(arrpair[iGames]) - 27));
  ShowMessage(arrpair[iGames]);
   CloseFile(tfile);
  inc(iGames);
  DataModule1.tblUsers.First;
  while not(DataModule1.tblUsers.eof) do
  begin
    if dmBrugDatabase_u.DataModule1.tblUsers['ID Number'] = copy
      (arrpair[iGames], 1, 13) then
    begin
      btnSideA.Caption := DataModule1.tblUsers['Name']
        + ' ' + DataModule1.tblUsers['Surname'];
      break;
    end;
    dmBrugDatabase_u.DataModule1.tblUsers.Next;
  end;

  DataModule1.tblUsers.First;
  while not(DataModule1.tblUsers.eof) do
  begin
    if dmBrugDatabase_u.DataModule1.tblUsers['ID Number'] = copy
      (arrpair[iGames], 15, 13) then
    begin
      btnSideB.Caption := DataModule1.tblUsers['Name']
        + ' ' + DataModule1.tblUsers['Surname'];
      break;
    end
    else
    begin
      btnSideB.Caption := 'No Player';
      break;
    end;
    dmBrugDatabase_u.DataModule1.tblUsers.Next;
  end;

  if (iGames >= ital2) then
  begin

    for X := 0 to ital - 1 do
      for Y := X to ital do
      begin

        DataModule1.tblPlayer.First;
        while not DataModule1.tblPlayer.eof do
        begin
          if DataModule1.tblPlayer['ID'] = copy(arrRank[X], 1, 13) then
          begin
            irat1 := (DataModule1.tblPlayer['Rating'] + 30000) *
              ((strtoint(copy(arrRank[X], 15, Length(arrRank[X]) - 14))
                  + 1) + 1);
            break;
          end;

          DataModule1.tblPlayer.Next;
        end;
        DataModule1.tblPlayer.First;
        while not DataModule1.tblPlayer.eof do
        begin
          if DataModule1.tblPlayer['ID'] = copy(arrRank[Y], 1, 13) then
          begin
            irat2 := (DataModule1.tblPlayer['Rating'] + 30000) *
              ((strtoint(copy(arrRank[Y], 15, Length(arrRank[Y]) - 14))
                  + 1) + 1);
            break;
          end;

          DataModule1.tblPlayer.Next;
        end;

        if irat2 > irat1 then
        begin
          sTemp := arrRank[X];
          arrRank[X] := arrRank[Y];
          arrRank[Y] := sTemp;
        end;

      end;
    /// //////
    iLynnr := 1;

    arrFile[0] := 'PlayerRanking';
    for k := 0 to ital - 1 do
    begin
      arrFile[iLynnr] := arrRank[k];
      inc(iLynnr);
    end;
    AssignFile(tfile, arrMyTournaments[cbMyTournaments.ItemIndex] + '.txt');
    reset(tfile);
    arrFile[iLynnr] := 'Pairings';
    inc(iLynnr);
    // for i := 0 to ital2 do
    // begin
    //
    Readln(tfile, sline);
    // inc(iLynnr);
    // end;
    //
    //

    while sline <> 'Pairings' do
    begin

      Readln(tfile, sline);
    end;
     Readln(tfile,sline);
    while not eof(tfile) do
    begin
      arrFile[iLynnr] := sline;
      Readln(tfile, sline);
      inc(iLynnr);
    end;
      arrFile[iLynnr] := sline;
       inc(iLynnr);
    CloseFile(tfile);
    /// ///
    arrFile[iLynnr] := 'Round' + IntToStr(iround);

    inc(iLynnr);
    redPairings.clear;
    redPairings.Paragraph.TabCount := 4;
    redPairings.Paragraph.Tab[0] := 30;
    redPairings.Paragraph.Tab[1] := 120;
    redPairings.Paragraph.Tab[2] := 30;
    redPairings.Paragraph.Tab[3] := 120;
    redPairings.SelAttributes.style := [fsbold];
    redPairings.lines.add('Table' + #9 + 'Side A' + #9 + 'Results' + #9 +
        'Side B');

    ital2 := 0;
    while ital2 < trunc((ital - 1) / 2) do
    begin
      arrpair[ital2] := copy(arrRank[ital2], 1, 13) + ',' + copy
        (arrRank[ital2 + trunc(ital / 2)], 1, 13) + '';

      inc(ital2);
    end;
    if trunc((ital - 1) / 2) <> ital / 2 then
    begin
      arrpair[ital2] := copy(arrRank[ital - 1], 1, 13) + ',' + '';
      inc(ital2);
    end;

    for i := 0 to ital2 - 1 do
    begin
      dmBrugDatabase_u.DataModule1.tblUsers.First;
      while not(dmBrugDatabase_u.DataModule1.tblUsers.eof) do
      begin
        if dmBrugDatabase_u.DataModule1.tblUsers['ID Number'] = copy
          (arrpair[i], 1, 13) then
        begin
          sname1 := DataModule1.tblUsers['Name'] + ' ' + DataModule1.tblUsers
            ['Surname'];
          break;

        end;
        dmBrugDatabase_u.DataModule1.tblUsers.Next;
      end;

      dmBrugDatabase_u.DataModule1.tblUsers.First;
      while not(dmBrugDatabase_u.DataModule1.tblUsers.eof) do
      begin
        if dmBrugDatabase_u.DataModule1.tblUsers['ID Number'] = copy
          (arrpair[i], 15, 13) then
        begin
          sname2 := DataModule1.tblUsers['Name'] + ' ' + DataModule1.tblUsers
            ['Surname'];
          break;
        end
        else
        begin
          sname2 := ''
        end;
        dmBrugDatabase_u.DataModule1.tblUsers.Next;
      end;
       redPairings.lines.add(IntToStr(i + 1) + '.' + #9 + sname1 + #9 + '0-0' +
       #9 + #9 + sname2);

    end;

    btnStartTournament.Enabled := True;
    gbWinner.Visible := False;
    AssignFile(tfile, arrMyTournaments[cbMyTournaments.ItemIndex] + '.txt');
    Rewrite(tfile);
    for j := 0 to iLynnr - 1 do
    begin
      sline := arrFile[j];
      Writeln(tfile, sline);
    end;
    CloseFile(tfile);
  end;

end;

procedure TfrmBridgeDatabase.btnStartTournamentClick(Sender: TObject);
var
  tfile: textfile;
  sline, sname1, sname2: string;
  i, iRank: Integer;

begin
  inc(iround);
  // redMyTournament.clear;
  // redMyTournament.Paragraph.TabCount := 2;
  // redMyTournament.Paragraph.Tab[0] := 50;
  // redMyTournament.Paragraph.Tab[1] := 150;
  // redMyTournament.SelAttributes.style := [fsbold];
  // redMyTournament.lines.add('Rank' + #9 + 'Name' + #9 + 'Points');

  iGames := 0;
  // AssignFile(tfile, arrMyTournaments[cbMyTournaments.ItemIndex] + '.txt');
  // reset(tfile);
  // DataModule1.tblUsers.First;
  // readln(tfile, sline);
  // readln(tfile, sline);
  // iRank := 0;
  // while not(sline = 'Pairings') do
  // begin
  // inc(iRank);
  // DataModule1.tblUsers.First;
  // while not DataModule1.tblUsers.eof do
  // begin
  // if DataModule1.tblUsers['ID Number'] = copy(sline, 1, 13) then
  // begin
  // redMyTournament.lines.add(IntToStr(iRank) + #9 + DataModule1.tblUsers
  // ['Name'] + ' ' + DataModule1.tblUsers['surname'] + #9 + copy(sline,
  // pos(',', sline) + 1, Length(sline) - pos(',', sline)));
  // break;
  // end;

  // DataModule1.tblUsers.Next;
  // end;
  // readln(tfile, sline);
  //
  // end;

  // CloseFile(tfile);

  if btnStartTournament.Caption = 'Start Tournament' then
  begin
    redPairings.clear;
    redPairings.Paragraph.TabCount := 4;
    redPairings.Paragraph.Tab[0] := 30;
    redPairings.Paragraph.Tab[1] := 120;
    redPairings.Paragraph.Tab[2] := 30;
    redPairings.Paragraph.Tab[3] := 120;
    redPairings.lines.add('Round 1');
    redPairings.SelAttributes.style := [fsbold];
    redPairings.lines.add('Table' + #9 + 'Side A' + #9 + 'Results' + #9 +
        'Side B');
    AssignFile(tfile, arrMyTournaments[cbMyTournaments.ItemIndex] + '.txt');
    reset(tfile);
    ital := 0;
    Readln(tfile, sline);
    Readln(tfile, sline);
    while not(sline = 'Pairings') do
    begin

      arrRank[ital] := sline;
      inc(ital);
      Readln(tfile, sline)
    end;
    ital2 := 0;
    while ital2 < trunc((ital - 1) / 2) do
    begin
      arrpair[ital2] := copy(arrRank[ital2], 1, 13) + ',' + copy
        (arrRank[ital2 + trunc(ital / 2)], 1, 13) + '';

      inc(ital2);
    end;
    if trunc((ital - 1) / 2) <> ital / 2 then
    begin
      arrpair[ital2] := copy(arrRank[ital - 1], 1, 13) + ',' + '';
      inc(ital2);
    end;

    CloseFile(tfile);

    append(tfile);
    Writeln(tfile, '');
    Writeln(tfile, 'Round1');
    for i := 0 to ital2 - 1 do
    begin
      dmBrugDatabase_u.DataModule1.tblUsers.First;
      while not(dmBrugDatabase_u.DataModule1.tblUsers.eof) do
      begin
        if dmBrugDatabase_u.DataModule1.tblUsers['ID Number'] = copy
          (arrpair[i], 1, 13) then
        begin
          sname1 := DataModule1.tblUsers['Name'] + ' ' + DataModule1.tblUsers
            ['Surname'];
          break;
        end;
        dmBrugDatabase_u.DataModule1.tblUsers.Next;
      end;

      dmBrugDatabase_u.DataModule1.tblUsers.First;
      while not(dmBrugDatabase_u.DataModule1.tblUsers.eof) do
      begin
        if dmBrugDatabase_u.DataModule1.tblUsers['ID Number'] = copy
          (arrpair[i], 15, 13) then
        begin
          sname2 := DataModule1.tblUsers['Name'] + ' ' + DataModule1.tblUsers
            ['Surname'];
          break;
        end
        else
        begin
          sname2 := ''
        end;
        dmBrugDatabase_u.DataModule1.tblUsers.Next;
      end;
      redPairings.lines.add
        (IntToStr(i + 1) + '.' + #9 + sname1 + #9 + '0-0' + #9 + #9 + sname2);

     

    end;
    CloseFile(tfile);
    btnStartTournament.Caption := 'Enter Results';
  end
  else
  begin
    gbWinner.Visible := True;
    btnStartTournament.enabled := False;
    DataModule1.tblUsers.First;
    while not(DataModule1.tblUsers.eof) do
    begin
      if dmBrugDatabase_u.DataModule1.tblUsers['ID Number'] = copy(arrpair[0],
        1, 13) then
      begin
        btnSideA.Caption := DataModule1.tblUsers['Name']
          + ' ' + DataModule1.tblUsers['Surname'];
        break;
      end;
      dmBrugDatabase_u.DataModule1.tblUsers.Next;
    end;

    DataModule1.tblUsers.First;
    while not(DataModule1.tblUsers.eof) do
    begin
      if dmBrugDatabase_u.DataModule1.tblUsers['ID Number'] = copy(arrpair[0],
        15, 13) then
      begin
        btnSideB.Caption := DataModule1.tblUsers['Name']
          + ' ' + DataModule1.tblUsers['Surname'];
        break;
      end;
      dmBrugDatabase_u.DataModule1.tblUsers.Next;
    end;

  end;
end;

procedure TfrmBridgeDatabase.Button3Click(Sender: TObject);
var
  i: Integer;
begin
  dmBrugDatabase_u.DataModule1.tblUsers.First;
  while not(dmBrugDatabase_u.DataModule1.tblUsers.eof) do
  begin
    if dmBrugDatabase_u.DataModule1.tblUsers['ID Number'] = sLogedinID then
    begin
      edtEditName.text := dmBrugDatabase_u.DataModule1.tblUsers['Name'];
      edtEditSurname.text := dmBrugDatabase_u.DataModule1.tblUsers['Surname'];
      for i := 0 to 198 do
      begin
        if dmBrugDatabase_u.DataModule1.tblUsers['Country']
          = cbEditCountry.Items[i] then
        begin
          cbEditCountry.ItemIndex := i;
          break;
        end;
      end;

      edtEditEmail.text := dmBrugDatabase_u.DataModule1.tblUsers['Email'];
      edtEditCell.text := dmBrugDatabase_u.DataModule1.tblUsers['Phone Number'];
      break;
    end
    else
      dmBrugDatabase_u.DataModule1.tblUsers.Next;
  end;
  tsEdit.TabVisible := True;
  tsEdit.Visible := True;
  pcTabs.ActivePage := tsEdit;
end;

procedure TfrmBridgeDatabase.Button4Click(Sender: TObject);
begin
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

procedure TfrmBridgeDatabase.cbMyTournamentsChange(Sender: TObject);
var
  tler: textfile;
  slyn: string;
  iRank, ital: Integer;

begin

  AssignFile(tler, arrMyTournaments[cbMyTournaments.ItemIndex] + '.txt');
  reset(tler);
  ital := 0;
  Readln(tler, slyn);
  Readln(tler, slyn);
  while not(slyn = 'Pairings') do
  begin

    arrRank[ital] := copy(slyn, 1, 13);
    inc(ital);
    Readln(tler, slyn);
  end;
  iround := 0;
  ital2 := 0;
  while not eof(tler) do
  begin
    if not(slyn = 'Round' + IntToStr(iround + 1)) then
    begin
      Readln(tler, slyn);
      inc(ital2)
    end
    else
    begin
      begin
        ital2 := 0;
        Readln(tler, slyn);
        inc(iround);
      end;
    end;
  end;
  CloseFile(tler);

  redMyTournament.clear;
  redMyTournament.Paragraph.TabCount := 2;
  redMyTournament.Paragraph.Tab[0] := 50;
  redMyTournament.Paragraph.Tab[1] := 150;
  redMyTournament.SelAttributes.style := [fsbold];
  redMyTournament.lines.add('Rank' + #9 + 'Name' + #9 + 'Points');

  redPairings.clear;
  redPairings.Paragraph.TabCount := 4;
  redPairings.Paragraph.Tab[0] := 30;
  redPairings.Paragraph.Tab[1] := 120;
  redPairings.Paragraph.Tab[2] := 30;
  redPairings.Paragraph.Tab[3] := 120;
  redPairings.lines.add('Round 1');
  redPairings.SelAttributes.style := [fsbold];
  redPairings.lines.add
    ('Table' + #9 + 'Side A' + #9 + 'Results' + #9 + 'Side B');
  pnlMyTournament.Visible := True;
  DataModule1.tblTournament.First;

  while not DataModule1.tblTournament.eof do
  begin
    if arrMyTournaments[cbMyTournaments.ItemIndex] = DataModule1.tblTournament
      ['ID'] then
    begin
      lblTourName.Caption := 'Tournament Name:  ' + DataModule1.tblTournament
        ['TournamentName'];

      lblPlayAmount.Caption := 'Amount of Players:  ' + IntToStr
        (DataModule1.tblTournament['PlayerAmount']);
      lblPlayDate.Caption := 'Tournament Date:  ' + DataModule1.tblTournament
        ['TourDate'];
      Label8.Caption := 'Amount of Games:' + IntToStr
        (DataModule1.tblTournament['GameAmount']);
    end;

    DataModule1.tblTournament.Next;

  end;

  AssignFile(tler, arrMyTournaments[cbMyTournaments.ItemIndex] + '.txt');
  reset(tler);
  DataModule1.tblUsers.First;
  Readln(tler, slyn);
  Readln(tler, slyn);
  iRank := 0;
  while not(slyn = 'Pairings') do
  begin
    inc(iRank);
    DataModule1.tblUsers.First;
    while not DataModule1.tblUsers.eof do
    begin
      if DataModule1.tblUsers['ID Number'] = copy(slyn, 1, 13) then
      begin
        redMyTournament.lines.add
          (IntToStr(iRank) + #9 + DataModule1.tblUsers['Name']
            + ' ' + DataModule1.tblUsers['surname'] + #9 + copy(slyn,
            pos(',', slyn) + 1, Length(slyn) - pos(',', slyn)));
        break;
      end;

      DataModule1.tblUsers.Next;
    end;
    Readln(tler, slyn);

  end;
  Readln(tler, slyn);
  CloseFile(tler);
  if iround > 0 then
  begin
    btnStartTournament.Caption := 'Enter Results';

  end
  else
  begin
    btnStartTournament.Caption := 'Start Tournament';
  end;

end;

procedure TfrmBridgeDatabase.FormCreate(Sender: TObject);

begin

  redNotices.ReadOnly := True;
  redNotices.Paragraph.TabCount := 3;
  redNotices.Paragraph.Tab[1] := 150;
  redNotices.Paragraph.Tab[2] := 600;
  redNotices.Paragraph.Tab[3] := 700;

  redNotices.SelAttributes.style := [fsbold];
  redNotices.lines.add
    ('Sender:' + #9 + 'Notice:' + #9 + 'Time:' + #9 + 'Type:');

  tsLogin.Caption := 'Login';
  tsRegister.Caption := 'Register New User';
  tsProfile.Caption := 'My Profile';
  tsRanking.Caption := 'Player rankings';
  tsSearch.Caption := 'Search Player';
  tsCreateTournament.Caption := 'Create Tournament';
  tsOngoing.Caption := 'Ongoing Tournaments';
  tsEnterTournament.Caption := 'Enter Tournament';
  tsMyTournament.Caption := 'My Tournaments';
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

  Image2.Width := tsRegister.Width;
  Image2.Height := tsRegister.Height;

  Image3.Width := tsProfile.Width;
  Image3.Height := tsProfile.Height;

  Image4.Width := tsRanking.Width;
  Image4.Height := tsRanking.Height;

  Image5.Width := tsSearch.Width;
  Image5.Height := tsSearch.Height;

  Image6.Width := tsSearch.Width;
  Image6.Height := tsSearch.Height;

  Image7.Width := tsSearch.Width;
  Image7.Height := tsSearch.Height;

  Image8.Width := tsSearch.Width;
  Image8.Height := tsSearch.Height;

  Image9.Width := tsSearch.Width;
  Image9.Height := tsSearch.Height;

  Image10.Width := tsSearch.Width;
  Image10.Height := tsSearch.Height;

  Image11.Width := tsSearch.Width;
  Image11.Height := tsSearch.Height;

end;

function TfrmBridgeDatabase.NumToName(iNumber: Integer): String;
var
  sCountry: string;
begin
  case iNumber of
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
  Result := sCountry;
end;

procedure TfrmBridgeDatabase.pcTabsChange(Sender: TObject);
begin
  tsEdit.TabVisible := False;
end;

procedure TfrmBridgeDatabase.redOngoingClick(Sender: TObject);
var
  X, Y: string;
  pt: TPoint;
begin
  pt := Mouse.CursorPos;
  pt := redOngoing.ScreenToClient(pt);

  sCurrentTour := arrTournaments[round((pt.Y + 5) / 13) - 2];
  if not(Length(sCurrentTour) < 6) and not(round((pt.Y + 5) / 13) - 2 < 0)
    and not((round((pt.Y + 5) / 13) - 2) > iTourAmount) then
  begin
    frmOngoing.show;
  end;

end;

procedure TfrmBridgeDatabase.redOngoingMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  pt: TPoint;
begin
  pt := Mouse.CursorPos;
  pt := redOngoing.ScreenToClient(pt);
  lblArrow.top := round((pt.Y + 5) / 13) * 13 + 16;
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

procedure TfrmBridgeDatabase.redEnterTournamentMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);

var
  pt: TPoint;
begin
  pt := Mouse.CursorPos;
  pt := redEnterTournament.ScreenToClient(pt);
  lblArrow2.top := round((pt.Y - 10) / 13) * 13 + 10;
end;

procedure TfrmBridgeDatabase.redEnterTournamentClick(Sender: TObject);
var
  pt: TPoint;
  tler: textfile;
  slyn, sTemp: string;
  ital3, i, k, X, Y, irat1, irat2: Integer;
  arrRanking: array [0 .. 1000] of string;
begin

  pt := Mouse.CursorPos;
  pt := redEnterTournament.ScreenToClient(pt);
  sEnterTour := arrEnterTour[round((pt.Y - 10) / 13) - 1];
  DataModule1.tblTournament.First;
  while not DataModule1.tblTournament.eof do
  begin
    if DataModule1.tblTournament['ID'] = sEnterTour then
    begin
      DataModule1.tblTournament.edit;
      DataModule1.tblTournament['PlayerAmount'] := DataModule1.tblTournament
        ['PlayerAmount'] + 1;
      DataModule1.tblTournament.Post;
      break;
    end;
    DataModule1.tblTournament.Next;
  end;

  if not(round((pt.Y - 10) / 13) - 1 < 0) and not
    ((round((pt.Y - 10) / 13) - 1) > iEnterTour - 1) then
  begin
    if FileExists(sEnterTour + '.txt') then
    begin
      AssignFile(tler, sEnterTour + '.txt');
      reset(tler);
      ital3 := 0;
      Readln(tler, slyn);
      Readln(tler, slyn);
      while not(slyn = 'Pairings') do
      begin
        arrRanking[ital3] := slyn;
        inc(ital3);
        Readln(tler, slyn);
      end;

      for k := 0 to ital - 1 do
      begin
        if sLogedinID = copy(arrRanking[k], 1, 13) then
        begin
          ShowMessage('You are already entered in this tournament');
          CloseFile(tler);
          exit;
        end;

      end;

      arrRanking[ital3] := sLogedinID + ',0';

      for X := 0 to ital3 - 1 do
        for Y := X to ital3 do
        begin
          DataModule1.tblPlayer.First;
          while not DataModule1.tblPlayer.eof do
          begin
            if DataModule1.tblPlayer['ID'] = copy(arrRanking[X], 1, 13) then
            begin
              irat1 := DataModule1.tblPlayer['Rating'];
              break;
            end;

            DataModule1.tblPlayer.Next;
          end;
          DataModule1.tblPlayer.First;
          while not DataModule1.tblPlayer.eof do
          begin
            if DataModule1.tblPlayer['ID'] = copy(arrRanking[Y], 1, 13) then
            begin
              irat2 := DataModule1.tblPlayer['Rating'];
              break;
            end;

            DataModule1.tblPlayer.Next;
          end;

          if irat2 > irat1 then
          begin
            sTemp := arrRanking[X];
            arrRanking[X] := arrRanking[Y];
            arrRanking[Y] := sTemp;
          end;

        end;

      Rewrite(tler);
      Writeln(tler, 'PlayerRanking');
      for i := 0 to ital3 do
      begin
        slyn := arrRanking[i];
        Writeln(tler, slyn);
      end;

      Writeln(tler, 'Pairings');

      ShowMessage('You are entered in the tournament');
      CloseFile(tler);
      exit;
    end;
    ShowMessage('You are not entered in this tournament');
  end;
end;

procedure TfrmBridgeDatabase.sedDateMonthChange(Sender: TObject);
begin
  if sedDateMonth.value in [1, 3, 5, 7, 8, 10, 12] then
    sedDateDay.MaxValue := 31
  else if sedDateMonth.value in [4, 6, 9, 11] then
    sedDateDay.MaxValue := 30
  else if (sedDateMonth.value = 2) and (sedDateYear.value MOD 4 = 0) then
    sedDateDay.MaxValue := 29
  else
    sedDateDay.MaxValue := 28;

  if sedDateYear.value = YearOf(date) then
  begin
    sedDateMonth.MinValue := monthof(date);
    if sedDateMonth.value = monthof(date) then
      sedDateDay.MinValue := dayof(date) + 1
    else
      sedDateDay.MinValue := 1
  end
  else
  begin
    sedDateMonth.MinValue := 1;
    sedDateDay.MinValue := 1;
  End;

  if sedDateDay.value > sedDateDay.MaxValue then
    sedDateDay.value := sedDateDay.MaxValue;
end;

procedure TfrmBridgeDatabase.sedDateYearChange(Sender: TObject);
begin
  if sedDateYear.value = YearOf(date) then
  begin
    sedDateMonth.MinValue := monthof(date);
    if sedDateMonth.value = monthof(date) then
      sedDateDay.MinValue := dayof(date) + 1
    else
      sedDateDay.MinValue := 1
  end
  else
  begin
    sedDateMonth.MinValue := 1;
    sedDateDay.MinValue := 1;
  End;
end;

end.
