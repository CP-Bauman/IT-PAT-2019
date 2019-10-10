program frmBrugDatabase_p;

uses
  Forms,
  frmBrugDatabase_u in 'frmBrugDatabase_u.pas' {frmBridgeDatabase},
  dmBrugDatabase_u in 'dmBrugDatabase_u.pas' {DataModule1: TDataModule},
  frmOngoing_u in 'frmOngoing_u.pas' {frmOngoing},
  frmEnterTournament_u in 'frmEnterTournament_u.pas' {frmEnterTournament};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmBridgeDatabase, frmBridgeDatabase);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmOngoing, frmOngoing);
  Application.CreateForm(TfrmEnterTournament, frmEnterTournament);
  Application.Run;
end.
