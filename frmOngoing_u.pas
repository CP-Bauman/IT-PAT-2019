unit frmOngoing_u;

// Christiaan Bauman
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Classes,
  Controls, StdCtrls, ComCtrls;

type
  TfrmOngoing = class(TForm)
    RedRank: TRichEdit;
    RedPairings: TRichEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmOngoing: TfrmOngoing;

implementation

uses
  frmBrugDatabase_u;
{$R *.dfm}

procedure TfrmOngoing.FormShow(Sender: TObject);
var
  tfile: TextFile;
  sLine, sname: string;
begin
  RedRank.Paragraph.TabCount := 1;
  RedRank.Paragraph.tab[1] := 150;
  RedRank.Clear;
  RedPairings.Clear;
  AssignFile(tfile, frmBridgeDatabase.sCurrentTour + '.txt');
  reset(tfile);
  while not(Eof(tfile)) do
  begin
    Readln(tfile, sLine);
    if sLine = 'PlayersPoints' then
    begin
      Readln(tfile, sLine);
       while not (sline = 'Pairings') do
     begin
        sname := copy(sLine, 1, pos(',', sLine) -1);
        delete(sLine, 1, pos(',', sLine));
        RedRank.lines.Add(sname + #9 + sLine);
        Readln(tfile, sLine);
     end;
      Readln(tfile, sLine);
      RedPairings.lines.Add(sLine);
    end;

  end;

end;

end.
