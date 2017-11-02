unit MainForm;

interface

uses
  System.Classes,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.OleCtrls,
  SHDocVw,
  uAddressBar;

type
  TForm1 = class(TForm)
    WebBrowser1: TWebBrowser;
    AddressBar1: TAddressBar;
    procedure FormCreate(Sender: TObject);
    procedure WebBrowser1TitleChange(ASender: TObject; const Text: WideString);
    procedure WebBrowser1BeforeNavigate2(ASender: TObject;
      const pDisp: IDispatch; const URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
  end;

const
  DEFAULT_URL: string = 'http://ClipFlair.net';

var
  Form1: TForm1;

implementation

{$R *.dfm}
// --- Events ---

procedure TForm1.FormCreate(Sender: TObject);
begin
  with AddressBar1 do
  begin
    WebBrowser := WebBrowser1;

    // check for command-line parameter
    if paramCount <> 0 then
      HomeURL := paramStr(1)
    else
      HomeURL := DEFAULT_URL;

    GoHome;
  end;
end;

procedure TForm1.WebBrowser1BeforeNavigate2(ASender: TObject;
  const pDisp: IDispatch; const URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
begin
  with AddressBar1 do
  begin
    edURL.Text := URL;
  end;
end;

procedure TForm1.WebBrowser1TitleChange(ASender: TObject;
  const Text: WideString);
begin
  Caption := Text;
end;

end.
