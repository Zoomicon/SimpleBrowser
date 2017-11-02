unit uAddressBar;

interface

uses
  System.ImageList,
  System.Classes,
  System.Actions,
  Vcl.ImgList,
  Vcl.Controls,
  Vcl.ActnList,
  Vcl.StdCtrls,
  Vcl.Forms,
  SHDocVw, Vcl.Bind.Navigator;

type
  TAddressBar = class(TFrame)
    edURL: TEdit;
    btnGo: TButton;
    ActionList1: TActionList;
    actionBrowse: TAction;
    btnHome: TButton;
    ImageList1: TImageList;
    actionHome: TAction;
    btnBack: TButton;
    btnForward: TButton;
    actionBack: TAction;
    actionForward: TAction;
    //Events//
    procedure edURLChange(Sender: TObject);
    //actions//
    procedure actionBrowseExecute(Sender: TObject);
    procedure actionHomeExecute(Sender: TObject);
    procedure actionBackExecute(Sender: TObject);
    procedure actionForwardExecute(Sender: TObject);
  public
    HomeURL: string;
    procedure Go;
    procedure GoHome;
    procedure GoBack;
    procedure GoForward;
  published
    WebBrowser: TWebBrowser;
  end;

implementation

{$R *.dfm}

//Methods//

procedure TAddressBar.Go;
begin
  WebBrowser.Navigate(edURL.Text);
end;

procedure TAddressBar.GoHome;
begin
  edURL.Text := HomeURL;
  btnGo.Click();
end;

procedure TAddressBar.GoBack;
begin
  try
    WebBrowser.GoBack;
  except
    //NOP
  end;
end;

procedure TAddressBar.GoForward;
begin
  try
    WebBrowser.GoForward;
  except
    //NOP
  end;
end;

//Events//

procedure TAddressBar.edURLChange(Sender: TObject);
begin
  actionBrowse.Enabled := Length(edURL.Text) <> 0;
end;

//actions//

procedure TAddressBar.actionBrowseExecute(Sender: TObject);
begin
  Go;
end;

procedure TAddressBar.actionHomeExecute(Sender: TObject);
begin
  GoHome;
end;

procedure TAddressBar.actionBackExecute(Sender: TObject);
begin
  GoBack;
end;

procedure TAddressBar.actionForwardExecute(Sender: TObject);
begin
  GoForward;
end;

end.
