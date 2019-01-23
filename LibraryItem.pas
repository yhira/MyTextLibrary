unit LibraryItem;

interface

uses
  Classes, Windows, SysUtils, Forms, Controls, ComCtrls, Dialogs;

type
  //TFileType = (ftFolder, ftText, ftRootFolder);

  TFolderItem = class(TObject)
  private
    FReadOnlyBool: Boolean;
    FImageIndex: Integer;
    FName: String;
    FComment: String;
    FPath: String;
    FCreationDay: TDateTime;
    FFullName: String;
    //FDspType: Integer;
    //FFileType: TFileType;
    procedure SetComment(const Value: String);
    procedure SetCreationDay(const Value: TDateTime);
    procedure SetImageIndex(const Value: Integer);
    procedure SetReadOnlyBool(const Value: Boolean);
    //procedure SetFileType(const Value: TFileType);
    //function NameCheckRecursive(DirPath, AName: String): String;
  protected
    procedure SetName(const Value: String); virtual;
    procedure SetPath(const Value: String);  virtual;
    procedure SetFullName(const Value: String);  virtual;
    function ECharToJChar(s: WideString): WideString; virtual;
    function EmptyChech(s: String): String;
    function LongNameCheck(s: WideString): WideString;
  public
    property Name: String read FName write SetName;
    property Comment: String read FComment write SetComment;
    property Path: String read FPath write SetPath;
    property FullName: String read FFullName write SetFullName;
    property ImageIndex: Integer read FImageIndex write SetImageIndex;
    property CreationDay: TDateTime read FCreationDay write SetCreationDay;
    property ReadOnlyBool: Boolean read FReadOnlyBool write SetReadOnlyBool;
    //property DspType: String read FDspType write SetDspType;
    //property FileType: TFileType read FFileType write SetFileType;
    //:property UpdateDay: TDateTime;
    constructor Create(Owner: TTreeNode); virtual;
    function AddObject(Target: TTreeView; Owner: TTreeNode; const S: String; Ptr: Pointer): TTreeNode;
    procedure SaveStreem(Streem: TFileStream; Itm: TFolderItem; ItemFree: Boolean = True);
    function LoadStreem(Streem: TFileStream; var Itm: TFolderItem): TFolderItem;
  end;

  TRootFolderItem = class(TFolderItem)
  end;

//  TDustBoxItem = class(TRootFolderItem)
//  end;



  TTextItem = class(TFolderItem)
  private
    FBookmarker: TStringList;
    FExtension: String;
    FUpdateDay: TDateTime;
    FDspType: String;
    procedure SetBookmarker(const Value: TStringList);
    procedure SetUpdateDay(const Value: TDateTime);
    procedure SetDspType(const Value: String);

  protected

    procedure SetName(const Value: String); override;
    procedure SetPath(const Value: String);  override;
    procedure SetExtension(const Value: String);
    function ECharToJChar(s: WideString): WideString; override;
  public
    property Bookmarker: TStringList read FBookmarker write SetBookmarker;
    property UpdateDay: TDateTime read FUpdateDay write SetUpdateDay;
    property Extension: String read FExtension write SetExtension;
    property DspType: String read FDspType write SetDspType;
    constructor Create(Owner: TTreeNode); override;
    destructor Destroy; override;
    procedure SaveStreem(Streem: TFileStream; Itm: TTextItem; ItemFree: Boolean = True);
    function LoadStreem(Streem: TFileStream; var Itm: TTextItem): TTextItem;
  end;


implementation


var
  ErrorDirChar: String = '\/:;*?"<>|';

  ZenDirChar: array[0..9] of String[2] =
    ('��','�^','�F','�G','��','�H','�h','��','��','�b');

  ErrorFileChar: String = '\/:;*?"<>|';

  ZenFileChar: array[0..9] of String[2] =
    ('��','�^','�F','�G','��','�H','�h','��','��','�b');


{ TFolderItem }
const
  DATA_FOLDET_PATH = 'LibraryData';


function TFolderItem.AddObject(Target: TTreeView; Owner: TTreeNode; const S: String;
  Ptr: Pointer): TTreeNode;
begin
  Result := Target.Items.AddChildObject(Owner, S, Ptr);
end;

constructor TFolderItem.Create(Owner: TTreeNode);
begin
  FName := '�V�K�t�H���_';
  FComment := '';
  if Owner = nil then
    Path := ExtractFilePath(Application.ExeName)
  else
    Path := TFolderItem(Owner.Data).Path + TFolderItem(Owner.Data).Name;
  FImageIndex := 0;
  FCreationDay := Now;
  FReadOnlyBool := False;
  //FDspType := 0;
end;




function TFolderItem.LoadStreem(Streem: TFileStream;
  var Itm: TFolderItem): TFolderItem;
var
  s: String;
  Len: Integer;
  Day: TDateTime;
begin
  with Streem do
  begin
    //���O
    read(len, SizeOf(len));
    SetLength(s, len);
    Read(PChar(s)^, len);
    Itm.Name := s;
    //TFolderItem(Node.Data).Name := s;
    //�R�����g
    read(len, SizeOf(len));
    SetLength(s, len);
    Read(PChar(s)^, len);
    Itm.Comment := s;
    //TFolderItem(Node.Data).Comment := s;
    //�p�X
    read(len, SizeOf(len));
    SetLength(s, len);
    Read(PChar(s)^, len);
    Itm.Path := s;
    //TFolderItem(Node.Data).Path := s;
     //�A�C�R��
    read(len, SizeOf(len));
    Itm.ImageIndex := len;
     //TFolderItem(Node.Data).ImageIndex  := len;
    //�쐬��
    Read(day, SizeOf(day));
    Itm.CreationDay := day;
    //TFolderItem(Node.Data).CreationDay := day;
    //�ǂ݂Ƃ��p
    Read(len, SizeOf(len));
    if len = 0 then
      Itm.ReadOnlyBool := True
    else
      Itm.ReadOnlyBool := False;
    //�\���`��    
  end;

  Result := Itm;
end;

procedure TFolderItem.SaveStreem(Streem: TFileStream; Itm: TFolderItem; ItemFree: Boolean = True);
var
  s: String;
  Len: Integer;
  Day: TDateTime;
begin
  with Streem do
  begin
    //���O
    s := Itm.Name;
    len := Length(s);
    Write(len, SizeOf(len));
    Write(PChar(s)^, len);
    //�R�����g
    s := Itm.Comment;
    len := Length(s);
    Write(len, SizeOf(len));
    Write(PChar(s)^, len);
    //�p�X
    s := Itm.Path;
    len := Length(s);
    Write(len, SizeOf(len));
    Write(PChar(s)^, len);
     //�A�C�R��
    len := Itm.ImageIndex;
    Write(len, SizeOf(len));
    //�쐬��
    day := Itm.CreationDay;
    Write(day, SizeOf(day));
    //�ǂ݂Ƃ��p
    if Itm.ReadOnlyBool then
      len := 0 else len := 1;
    Write(len, SizeOf(len));
    //�\���`��

    if ItemFree then begin
      Itm.Free;
//      Itm := nil;
    end;
  end;

end;

procedure TFolderItem.SetComment(const Value: String);
begin
  FComment := Value;
end;

procedure TFolderItem.SetCreationDay(const Value: TDateTime);
begin
  FCreationDay := Value;
end;

//procedure TFolderItem.SetFileType(const Value: TFileType);
//begin
//  FFileType := Value;
//end;

procedure TFolderItem.SetImageIndex(const Value: Integer);
begin
  FImageIndex := Value;
end;

procedure TFolderItem.SetName(const Value: String);
begin
  FName := Value;
  FName := EmptyChech(FName);
  FName := LongNameCheck(FName);
  FName := ECharToJChar(FName);
  FFullName := FPath + FName;
end;

procedure TFolderItem.SetPath(const Value: String);
begin
  FPath := Value;
  FPath := IncludeTrailingPathDelimiter(FPath);
  FFullName := FPath + FName;
end;

procedure TFolderItem.SetReadOnlyBool(const Value: Boolean);
begin
  FReadOnlyBool := Value;
end;

function TFolderItem.ECharToJChar(s: WideString): WideString;
var
  i, Index: Integer;
begin
  Result := '';
  for i := 1 to Length(s) do
  begin
    Index := AnsiPos(s[i], ErrorDirChar);
    if Index <> 0 then
      Result := Result + ZenDirChar[Index - 1]
    else
      Result := Result + Copy(s, i, 1);
  end;

end;

function TFolderItem.EmptyChech(s: String): String;
begin
  if s = '' then
  begin
    Application.MessageBox('���O���󗓂ł��B', PChar(Application.Title), MB_ICONINFORMATION);
    Result := Name;
    Abort;
  end
  else
    Result := s;    
end;


function TFolderItem.LongNameCheck(s: WideString):WideString;
begin
  if Length(s) > 100 then
  begin
    Application.MessageBox('���O���������܂��B100�����ȉ��ɂ��ĉ������B', PChar(Application.Title), MB_ICONINFORMATION);
    Result := s;
    Abort;
  end
  else
    Result := s;
end;


procedure TFolderItem.SetFullName(const Value: String);
begin
  FFullName := Value;
end;

{ TTextItem }

constructor TTextItem.Create(Owner: TTreeNode);
begin
  FName := '�V�K�e�L�X�g�t�@�C��';
  FComment := '';
  if Owner = nil then
    Path := ExtractFilePath(Application.ExeName)
  else
    Path := TFolderItem(Owner.Data).Path + TFolderItem(Owner.Data).Name;
  FImageIndex := 7;
  FCreationDay := Now;
  FUpdateDay := Now;
  FReadOnlyBool := False;
  FExtension := '.txt';
  FBookmarker := TStringList.Create;
  FDspType := '�e�L�X�g�t�@�C��';
end;

destructor TTextItem.Destroy;
begin
  FBookmarker.Free;
  inherited;
end;

function TTextItem.ECharToJChar(s: WideString): WideString;
var
  i, Index: Integer;
begin
  Result := '';
  for i := 1 to Length(s) do
  begin
    Index := AnsiPos(s[i], ErrorFileChar);
    if Index <> 0 then
      Result := Result + ZenFileChar[Index - 1]
    else
      Result := Result + Copy(s, i, 1);
  end;
end;

function TTextItem.LoadStreem(Streem: TFileStream;
  var Itm: TTextItem): TTextItem;
var
  s: String;
  Len: Integer;
  Day: TDateTime;
begin
  with Streem do
  begin
    //���O
    read(len, SizeOf(len));
    SetLength(s, len);
    Read(PChar(s)^, len);
    Itm.Name := s;
    //TFolderItem(Node.Data).Name := s;
    //�R�����g
    read(len, SizeOf(len));
    SetLength(s, len);
    Read(PChar(s)^, len);
    Itm.Comment := s;
    //TFolderItem(Node.Data).Comment := s;
    //�p�X
    read(len, SizeOf(len));
    SetLength(s, len);
    Read(PChar(s)^, len);
    Itm.Path := s;
    //TFolderItem(Node.Data).Path := s;
     //�A�C�R��
    read(len, SizeOf(len));
    Itm.ImageIndex := len;
     //TFolderItem(Node.Data).ImageIndex  := len;
    //�쐬��
    Read(day, SizeOf(day));
    Itm.CreationDay := day;
    //TFolderItem(Node.Data).CreationDay := day;
    //�ǂ݂Ƃ��p
    Read(len, SizeOf(len));
    if len = 0 then
      Itm.ReadOnlyBool := True
    else
      Itm.ReadOnlyBool := False;
    //������
    read(len, SizeOf(len));
    SetLength(s, len);
    Read(PChar(s)^, len);
    Itm.Bookmarker.Text := s;
    //�X�V��
    Read(day, SizeOf(day));
    Itm.UpdateDay := Day;
    //�g���q
    read(len, SizeOf(len));
    SetLength(s, len);
    Read(PChar(s)^, len);
    Itm.Extension := s; 
    //�\���`�� 
    read(len, SizeOf(len));
    SetLength(s, len);
    Read(PChar(s)^, len);
    Itm.DspType := s;

  end;

  Result := Itm;
end;

procedure TTextItem.SaveStreem(Streem: TFileStream; Itm: TTextItem; ItemFree: Boolean = True);
var
  s: String;
  Len: Integer;
  Day: TDateTime;
begin
  with Streem do
  begin
    //���O
    s := Itm.Name;
    len := Length(s);
    Write(len, SizeOf(len));
    Write(PChar(s)^, len);
    //�R�����g
    s := Itm.Comment;
    len := Length(s);
    Write(len, SizeOf(len));
    Write(PChar(s)^, len);
    //�p�X
    s := Itm.Path;
    len := Length(s);
    Write(len, SizeOf(len));
    Write(PChar(s)^, len);
     //�A�C�R��
    len := Itm.ImageIndex;
    Write(len, SizeOf(len));
    //�쐬��
    day := Itm.CreationDay;
    Write(day, SizeOf(day));
    //�ǂ݂Ƃ��p
    if Itm.ReadOnlyBool then
      len := 0 else len := 1;
    Write(len, SizeOf(len));
    //������
    s := Itm.Bookmarker.Text;
    len := Length(s);
    Write(len, SizeOf(len));
    Write(PChar(s)^, len);
    //�X�V��
    day := Itm.UpdateDay;
    Write(day, SizeOf(day));
    //�g���q
    s := Itm.Extension;
    len := Length(s);
    Write(len, SizeOf(len));
    Write(PChar(s)^, len);   
    //�\���`��   
    s := Itm.DspType;
    len := Length(s);
    Write(len, SizeOf(len));
    Write(PChar(s)^, len);

    if ItemFree then begin
      Itm.Free;
//      Itm := nil;
    end;
  end;

end;

procedure TTextItem.SetBookmarker(const Value: TStringList);
begin
  FBookmarker := Value;
end;

procedure TTextItem.SetDspType(const Value: String);
begin
  FDspType := Value;
end;

procedure TTextItem.SetExtension(const Value: String);
begin
  FExtension := Value;
  FFullName := FPath + FName + FExtension;
end;


procedure TTextItem.SetName(const Value: String);
begin
  FName := Value; 
  FName := EmptyChech(FName);
  FName := LongNameCheck(FName);
  FName := ECharToJChar(FName);
  FFullName := FPath + FName + FExtension;
end;

procedure TTextItem.SetPath(const Value: String);
begin
  FPath := Value;
  FPath := IncludeTrailingPathDelimiter(FPath);
  FFullName := FPath + FName + FExtension;
end;

procedure TTextItem.SetUpdateDay(const Value: TDateTime);
begin
  FUpdateDay := Value;
end;

end.
