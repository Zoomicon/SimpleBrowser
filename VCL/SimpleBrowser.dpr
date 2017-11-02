program SimpleBrowser;

uses
  Vcl.Forms,
  MainForm in 'MainForm.pas' {Form1},
  uAddressBar in 'uAddressBar.pas' {AddressBar: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
