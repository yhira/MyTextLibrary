program MyTextLibrary;


{%File 'Readme.txt'}

uses  
  FastMM4,
  FastMove,
  FastCode,
  Forms,
  Windows,
  Dialogs,
  Main in 'Main.pas' {MainForm},
  BugReport in 'BugReport.pas' {BugReportForm},
  LibraryItem in 'LibraryItem.pas',
  FolderSet in 'FolderSet.pas' {FolderSetDlg},
  TextSet in 'TextSet.pas' {TextSetDlg},
  FileType in 'FileType.pas' {FileTypeDlg},
  Option in 'Option.pas' {OptionDlg},
  Settings in 'Settings.pas',
  ListEdit in 'ListEdit.pas' {ListEditDlg},
  AddContents in 'AddContents.pas',
  About in 'About.pas' {AboutForm},
  BookMarker in 'BookMarker.pas' {BookMarkForm},
  Splash in 'Splash.pas' {SplashWindow};

{$R *.res}

const
 MutexName = 'EX_Mutex_MyTextLibrary';
var
 hMutex: THANDLE;


begin
  hMutex := OpenMutex(MUTEX_ALL_ACCESS, False, MutexName);
  if hMutex <> 0 then
  begin
    CloseHandle(hMutex);
    Application.MessageBox('ìÒèdãNìÆÇ≈Ç´Ç‹ÇπÇÒ', 'íçà”', MB_ICONWARNING);
    Exit;
  end;
  hMutex := CreateMutex(nil, False, MutexName);

  Application.Initialize;
  Application.Title := 'MyTextLibrary';
  Application.HelpFile := '';
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
  ReleaseMutex(hMutex);

end.
