unit Settings;

interface

uses
  Windows, Messages, SysUtils, Classes, Contnrs, Graphics, heFountain;

type 
  TSearchDsplay = (sdTreeView, sdListView);


  TFileType = class(TObject)
  private
    FEmphasisDisplay: Boolean;  //強調表示するか
    FBlankDeletion: Boolean;    //空白削除
    FNumberContents: Boolean;   //数字を目次
    FName: String;              //ファイル形式名
    FExtension: TStringList;    //適用拡張子
    FContents: TStringList;     //目次に適用する文字
    FEmphasis: TStringList;     //強調表示に適用する文字
    FItemIndex: Integer;
    FExtensionDisplay: Boolean;       //強調表示機能を使うか
    FContentsDisplay: Boolean;        //目次機能を使うか
    FFountain: TFountain;
    procedure SetBlankDeletion(const Value: Boolean);
    procedure SetContents(const Value: TStringList);
    procedure SetEmphasis(const Value: TStringList);
    procedure SetEmphasisDisplay(const Value: Boolean);
    procedure SetExtension(const Value: TStringList);
    procedure SetName(const Value: String);
    procedure SetNumberContents(const Value: Boolean);
    procedure SetItemIndex(const Value: Integer);
    procedure SetExtensionDisplay(const Value: Boolean);
    procedure SetContentsDisplay(const Value: Boolean);
    procedure SetFountain(const Value: TFountain);

  protected

  public
    property Name: String read FName write SetName;
    property Extension: TStringList read FExtension write SetExtension;
    property Contents: TStringList read FContents write SetContents;
    property Emphasis: TStringList read FEmphasis write SetEmphasis;
    property BlankDeletion: Boolean read FBlankDeletion write SetBlankDeletion;
    property EmphasisDisplay: Boolean read FEmphasisDisplay write SetEmphasisDisplay;
    property ContentsDisplay: Boolean read FContentsDisplay write SetContentsDisplay;
    property NumberContents: Boolean read FNumberContents write SetNumberContents;
    property ExtensionDisplay: Boolean read FExtensionDisplay write SetExtensionDisplay;
    property ItemIndex: Integer read FItemIndex write SetItemIndex;
    property Fountain: TFountain read FFountain write SetFountain;
    constructor Create;
    destructor Destroy; override;
  end;

  TDisplay = record
    DefaultDspType: string;
  end;

  TStandard = record
    ContentsDsp: Boolean;
    FolderInfoDsp: Boolean;
    ReadOnlyAll: Boolean;
    Expand: Boolean;
    SearchDsp: TSearchDsplay;
    HotTrack: Boolean;
    PopupHint: Boolean;
  end;

//  TMark = record   //表示マーク
//    NewLine, EOF, FullSpace, UnderLine: Boolean;
//  end;
//
//  TRuler = record  //ルーラー
//    Enabled: Boolean;
//    GaugeRange: Integer;
//    BorderLine: Boolean;
//    StrColor, BackColor: TColor;
//  end;
//
//  TLineNumBer = record   //行番号
//    Enabled:  Boolean;
//    ZeroLead: Boolean;
//    Colum: Integer;
//    BorderLine: Boolean;
//    StrColor, BackColor: TColor;
//  end;
//
//  TEditorSet = record
//    FontName: String;
//    FontSize: Integer;
//    AutoIndent: Boolean;
//    TabWidth: Integer;
//    UndoCount: Integer;
//    Mark: TMark;            //表示マーク
//    Ruler: TRuler;          //ルーラー
//    LineNumBer: TLineNumBer;//行番号
//  end;

  TSetting = class(TObject)
  private
//    FFont: TFont;
    FFileTypeCount: Cardinal;
    FFileTypeList: TObjectList;
    FExtensionList: TStringList;
    //FDspDefaultType: string;
//    procedure SetFont(const Value: TFont);
    procedure SetFileTypeCount(const Value: Cardinal);
    procedure SetFileTypeList(const Value: TObjectList);
    procedure SetExtensionList(const Value: TStringList);
    //procedure SetDisplay(const Value: TDisplay);
    //procedure SetDspDefaultType(const Value: string);
    //procedure SetDspDefaultType(const Value: string);

  protected

  public
//    EditorSet: TEditorSet;
    Display: TDisplay;
    Standard: TStandard;
    property ExtensionList: TStringList read FExtensionList write SetExtensionList;
    property FileTypeList: TObjectList read FFileTypeList write SetFileTypeList;
    property FileTypeCount: Cardinal read FFileTypeCount write SetFileTypeCount;
//    property Font: TFont read FFont write SetFont;
    //property DspDefaultType: string read FDspDefaultType write SetDspDefaultType;
    //property Display: TDisplay read FDisplay write SetDisplay;
    constructor Create;
    destructor Destroy; override;
  end;

const
  DEFAULT_TEXT_NAME = 'テキスト';
  DEFAULT_TEXT_EXTENSION = '*.txt';
  DEFAULT_TEXT_CONTENTS = '■,◆,●,★,☆,○,□,◇,（,〔,［,〈,《,【,♪,≪,(,<,[';
  DEFAULT_TEXT_EMPHASIS = '';

  DEFAULT_INI_NAME = 'INI';
  DEFAULT_INI_EXTENSION = '*.ini';
  DEFAULT_INI_CONTENTS = '[';
  DEFAULT_INI_EMPHASIS = '';

  DEFAULT_RUBY_NAME = 'Ruby';
  DEFAULT_RUBY_EXTENSION = '*.rb,*.wrb';
  DEFAULT_RUBY_CONTENTS = '';
  DEFAULT_RUBY_EMPHASIS = 'alias,and,BEGIN,break,case,class,def,defined,do,else,' +
    'elsif,END,ensure,false,for,if,in,module,next,nil,not,or,redo,rescue,retry,' +
    'return,self,super,then,true,undef,unless,until,when,while,yield';

  DEFAULT_SQL_NAME = 'SQL';
  DEFAULT_SQL_EXTENSION = '*.sql';
  DEFAULT_SQL_CONTENTS = '';
  DEFAULT_SQL_EMPHASIS = 'ABORT,ACCEPT,ACCESS,ADD,ADMIN,ALL,ALTER,AND,ANY,ARRAY,ARRAYLEN,AS,' +
    'ASC,ASSERT,ASSIGN,AT,AUDIT,AUTHORIZATION,AVG,BASE_TABLE,BEGIN,BETWEEN,' +
    'BINARY_ARRAY,BODY,BOOLEAN,BY,CASCADE,CASE,CHAR,CHAR_BASE,CHECK,CLOSE,' +
    'CLUSTER,CLUSTERS,COLAUTH,COLUMN,COMMENT,COMMIT,COMPRESS,CONNECT,CONSTANT,' +
    'CONSTRAINT,CONSTRAINTS,CONTENTS,CRASH,CREATE,CURRENT,CURRVAL,CURSOR,' +
    'DATA_BASE,DATABASE,DATAFILE,DATAFILES,DATE,DBA,DEBUGOFF,DEBUGON,' +
    'DECIMAL,DECLARE,DEFAULT,DEFINE,DEFINITION,DELAY,DELETE,DESC,DIGITS,' +
    'DISPOSE,DISTINCT,DO,DROP,ELSE,ELSIF,END,ENTRY,EXCEPTION,EXCEPTION_INIT,' +
    'EXCLUSIVE,EXECUTE,EXISTS,EXIT,FALSE,FETCH,FILE,FLOAT,FOR,FOREIGN,FORM,' +
    'FROM,FUNCTION,GENERIC,GOTO,GRANT,GROUP,HAVING,IDENTIFIED,IF,IMMEDIATE,IN,' +
    'INCLUDING,INCREMENT,INDEX,INDEXES,INDICATOR,INITIAL,INSERT,INTEGER,' +
    'INTERFACE,INTERSECT,INTO,IS,KEY,LEVEL,LIKE,LIMITED,LOCK,LONG,LOOP,MAX,' +
    'MAXEXTENTS,MIN,MINUS,MLSLABEL,MOD,MODE,NATURAL,NATURALN,NEW,NEXTVAL,' +
    'NOAUDIT,NOCOMPRESS,NOT,NOWAIT,NULL,NUMBER,NUMBER_BASE,OF,OFFLINE,ON,' +
    'ONLINE,OPEN,OPTION,OR,ORDER,OTHERS,OUT,PACKAGE,PARTITION,PCTFREE,' +
    'PLS_INTEGER,POSITIVE,POSITIVEN,PRAGMA,PRIMARY,PRIOR,PRIVATE,PRIVILEGES,' +
    'PROCEDURE,PUBLIC,RAISE,RANGE,RAW,REAL,RECORD,REF,REFERENCES,RELEASE,REMR,' +
    'RENAME,REPLACE,RESOURCE,RETURN,REVERSE,REVOKE,ROLLBACK,ROW,ROWID,ROWLABEL,' +
    'ROWNUM,ROWS,ROWTYPE,RUN,SAVEPOINT,SCHEMA,SELECT,SEPARATE,SEQUENCE,SET,SHARE,' +
    'SIZE,SMALLINT,SPACE,SQL,SQLCODE,SQLERRM,START,STATE,STATEMENT,STDDEV,SUBTYPE,' +
    'SUCCESSFUL,SUM,SYNONYM,SYSDATE,TABAUTH,TABLE,TABLES,TABLESPACE,TASK,TERMINATE,' +
    'THEN,TO,TRIGGER,TRUE,TYPE,UID,UNION,UNIQUE,UPDATE,USE,USER,VALIDATE,VALUES,' +
    'VARCHAR,VARCHAR2,VARIANCE,VIEW,VIEWS,WHEN,WHENEVER,WHERE,WHILE,WITH,WORK,WRITE,XOR';

  DEFAULT_JSP_NAME = 'JSP';
  DEFAULT_JSP_EXTENSION = '*.jsp';
  DEFAULT_JSP_CONTENTS = '';
  DEFAULT_JSP_EMPHASIS = 'else,errorPage,extends,file,final,finally,float,for,goto,if,' +
    'implements,import,include,info,instanceof,int,interface,isErrorPage,isThreadSafe,' +
    'language,long,native,new,package,page,prefix,private,protected,public,return,session,' +
    'short,static,super,switch,synchronized,taglib,this,throw,throws,transient,try,uri,void,' +
    'volatile,while';

  DEFAULT_COBOL_NAME = 'COBOL';
  DEFAULT_COBOL_EXTENSION = '*.cbl,*.cob';
  DEFAULT_COBOL_CONTENTS = '';
  DEFAULT_COBOL_EMPHASIS = 'ACCEPT,ACCESS,ACTUAL,ADD,ADDRESS,ADVANCING,AFTER,ALL,ALPHABET,ALPHABETIC,ALPHABETIC-LOWER,ALPHABETIC-UPPER,' + 'ALPHANUMERIC,ALPHANUMERIC-EDITED,ALSO,ALTER,ALTERNATE,AND,ANY,APPLY,ARE,AREA,AREAS,AS,ASCENDING,ASSIGN,AT,' + 'AUTHOR,AUTO,AUTOMATIC,BACKGROUND-COLOR,BEFORE,BEGINNING,BELL,BINARY,BIT,BITS,BLANK,BLINK,BLOCK,BOOLEAN,BOTTOM,' +
    'BY,CALL,CANCEL,CBL,CD,CF,CH,CHANGED,CHARACTER,CHARACTERS,CLASS,CLASS-ID,CLOCK-UNITS,CLOSE,COBOL,CODE,CODE-SET,' +
    'COLLATING,COLUMN,COMMA,COMMAND,COMMIT,COMMON,COMMUNICATION,COMP,COMP-1,COMP-2,COMP-3,COMP-4,COMP-5,' +
    'COMPUTATIONAL,COMPUTATIONAL-1,COMPUTATIONAL-2,COMPUTATIONAL-3,COMPUTATIONAL-4,COMPUTATIONAL-5,COMPUTE,' +
    'COM-REG,CONFIGURATION,CONNECT,CONTAINS,CONTENT,CONTINUE,CONTROL,CONTROLS,CONVERTING,COPY,CORE-INDEX,CORR,' +
    'CORRESPONDING,COUNT,CRT,CRT-UNDER,CURRENCY,CURRENT,CURSOR,DATA,DATE,DATE-COMPILED,DATE-WRITTEN,DAY,' +
    'DAY-OF-WEEK,DB,DE,DEBUG-CONTENTS,DEBUGGING,DEBUG-ITEM,DEBUG-LINE,DEBUG-NAME,DEBUG-SUB-1,DEBUG-SUB-2,' +
    'DEBUG-SUB-3,DECIMAL-POINT,DECLARATIVES,DELETE,DELIMITED,DELIMITER,DEPENDING,DESCENDING,DESTINATION,DETAIL,' +
    'DISABLE,DISCONNECT,DISPLAY,DIVIDE,DIVISION,DOWN,DUPLICATE,DUPLICATES,DYNAMIC,EGI,EJECT,ELSE,EMI,EMPTY,ENABLE,' +
    'END,END-ACCEPT,END-ADD,END-CALL,END-COMPUTE,END-DELETE,END-DISPLAY,END-DIVIDE,END-EVALUATE,END-EXEC,END-IF,' +
    'ENDING,END-INVOKE,END-MULTIPLY,END-OF-PAGE,END-PERFORM,END-READ,END-RECEIVE,END-RETURN,END-REWRITE,' +
    'END-SEARCH,END-START,END-STRING,END-SUBTRACT,END-UNSTRING,END-WRITE,ENTER,ENTRY,ENVIRONMENT,EOL,EOP,' +
    'EOS,EQUAL,EQUALS,ERASE,ERROR,ESI,EVALUATE,EVERY,EXAMINE,EXCEEDS,EXCEPTION,EXCLUSIVE,EXEC,EXIT,EXOR,EXTEND,' +
    'EXTERNAL,FALSE,FD,FETCH,FILE,FILE-CONTROL,FILE-LIMIT,FILE-LIMITS,FILLER,FINAL,FIND,FIRST,FOOTING,FOR,' +
    'FOREGROUND-COLOR,FORMAT,FREE,FROM,FULL,FUNCTION,GENERATE,GET,GIVING,GLOBAL,GO,GOBACK,GREATER,GRID,GROUP,' +
    'HEADING,HIGHLIGHT,HIGH-VALUE,HIGH-VALUES,ID,IDENTIFICATION,IF,IN,INCLUDE,INDEX,INDEXED,INDICATE,INHERITS,' +
    'INITIAL,INITIALIZE,INITIATE,INPUT,INPUT-OUTPUT,INSPECT,INSTALLATION,INTO,INVALID,INVARIANT,INVOKE,I-O,' +
    'I-O-CONTROL,IS,JUST,JUSTIFIED,KEY,LABEL,LAST,LEADING,LEFT,LEFT-JUSTIFY,LEFTLINE,LENGTH,LESS,LIMIT,LIMITS,' +
    'LINAGE,LINAGE-COUNTER,LINE,LINE-COUNTER,LINES,LINKAGE,LOCK,LOWLIGHT,LOW-VALUE,LOW-VALUES,MANUAL,MEMBER,' +
    'MEMORY,MERGE,MESSAGE,METHOD,METHOD-ID,MODE,MODIFY,MODULES,MORE-LABELS,MOVE,MULTIPLE,MULTIPLY,NAMED,NATIONAL,' +
    'NATIONAL-EDITED,NATIVE,NEGATIVE,NEXT,NO,NOMINAL,NOT,NOTE,NULL,NULLS,NUMBER,NUMERIC,NUMERIC-EDITED,OBJECT,' +
    'OBJECT-COMPUTER,OCCURS,OF,OFF,OMITTED,ON,ONLY,OPEN,OPTIONAL,OR,ORDER,ORGANIZATION,OTHER,OTHERWISE,OUTPUT,' +
    'OVERFLOW,OVERLINE,OWNER,PACKED-DECIMAL,PADDING,PAGE,PAGE-COUNTER,PASSWORD,PERFORM,PF,PH,PIC,PICTURE,PLUS,' +
    'POINTER,POSITION,POSITIONING,POSITIVE,PREVIOUS,PRINTING,PRIOR,PROCEDURE,PROCEDURES,PROCEED,PROCESSING,' +
    'PROGRAM,PROGRAM-ID,PROMPT,PROPERTY,PROTOTYPE,PURGE,QUEUE,QUOTE,QUOTES,RANDOM,RD,READ,READY,RECEIVE,RECONNECT,' +
    'RECORD,RECORDING,RECORD-OVERFLOW,RECORDS,REDEFINES,REEL,REFERENCE,REFERENCES,RELATIVE,RELEASE,RELOAD,' +
    'REMAINDER,REMARKS,REMOVAL,RENAMES,REORG-CRITERIA,REPLACE,REPLACING,REPORT,REPORTING,REPORTS,REPOSITORY,' +
    'REQUIRED,RERUN,RESERVE,RESET,RETAINING,RETURN,RETURN-CODE,RETURNING,REVERSED,REVERSE-VIDEO,REWIND,REWRITE,' +
    'RF,RH,RIGHT,RIGHT-JUSTIFY,ROLLBACK,ROUNDED,RUN,SA,SAME,SCREEN,SD,SEARCH,SECTION,SECURE,SECURITY,SEEK,' +
    'SEGMENT,SEGMENT-LIMIT,SELECT,SELF,SEND,SENTENCE,SEPARATE,SEQUENCE,SEQUENTIAL,SERVICE,SET,SIGN,SIZE,SKIP1,' +
    'SKIP2,SKIP3,SORT,SORT-CORE-SIZE,SORT-FILE-SIZE,SORT-MERGE,SORT-MESSAGE,SORT-MODE-SIZE,SORT-RETURN,SOURCE,' +
    'SOURCE-COMPUTER,SPACE,SPACE-FILL,SPACES,SPECIAL-NAMES,STANDARD,STANDARD-1,STANDARD-2,START,STATUS,STOP,' +
    'STORE,STRING,SUB-QUEUE-1,SUB-QUEUE-2,SUB-QUEUE-3,SUBTRACT,SUM,SUPER,SUPPRESS,SYMBOLIC,SYNC,SYNCHRONIZED,' +
    'TABLE,TALLY,TALLYING,TAPE,TERMINAL,TERMINATE,TEST,TEXT,THAN,THEN,THROUGH,THRU,TIME,TIMES,TO,TOP,TRACE,TRACK,' +
    'TRACK-AREA,TRACK-LIMIT,TRACKS,TRAILING,TRAILING-SIGN,TRANSACTION,TRANSCEIVE,TRUE,TYPE,UNDERLINE,UNEQUAL,' +
    'UNIT,UNIVERSAL,UNLOCK,UNSTRING,UNTIL,UP,UPDATE,UPON,USAGE,USE,USING,VALUE,VALUES,VARYING,WAIT,WHEN,WHEN-COMPILED,' +
    'WITH,WITHIN,WORDS,WORKING-STORAGE,WRITE,WRITE-ONLY,ZERO,ZEROES,ZERO-FILL,ZEROS';

  DEFAULT_JAVA_NAME = 'JAVA';
  DEFAULT_JAVA_EXTENSION = '*.class,*.java';
  DEFAULT_JAVA_CONTENTS = '';
  DEFAULT_JAVA_EMPHASIS = 'abstract,boolean,break,byte,case,catch,char,class,const,' +
    'continue,default,do,double,else,extends,final,finally,float,for,goto,if,implements,' +
    'import,instanceof,int,interface,long,native,new,package,private,protected,public,' +
    'return,short,static,super,switch,synchronized,this,throw,throws,transient,try,void,volatile,while';

  DEFAULT_CPP_NAME = 'C++';
  DEFAULT_CPP_EXTENSION = '*.c,*.cpp,*.h,*.hpp';
  DEFAULT_CPP_CONTENTS = '';
  DEFAULT_CPP_EMPHASIS = 'asm,auto,break,case,catch,char,class,const,continue,default,' +
    'delete,do,double,else,enum,extern,float,for,friend,goto,if,inline,int,long,new,' +
    'operator,private,protected,public,register,return,short,signed,sizeof,static,' +
    'struct,switch,template,this,throw,try,typedef,union,unsigned,virtual,void,volatile,while';

  DEFAULT_HTML_NAME = 'HTML';
  DEFAULT_HTML_EXTENSION = '*.html,*.htm,*.shtml,*.shtm';
  DEFAULT_HTML_CONTENTS = '<!,</html>,<body,<head,<html,<link,<meta,<script,<style';
  DEFAULT_HTML_EMPHASIS = '';

  DEFAULT_PERL_NAME = 'Perl';
  DEFAULT_PERL_EXTENSION = '*.cgi,*.pl,*.pm,*.pod';
  DEFAULT_PERL_CONTENTS = '';
  DEFAULT_PERL_EMPHASIS = 'cmp,do,else,elsif,eq,for,foreach,ge,gt,if,le,lt,ne,package,' +
    'require,return,sub,unless,until,use,while';

  DEFAULT_DELPHI_NAME = 'Delphi';
  DEFAULT_DELPHI_EXTENSION = '*.pas,*.dpr,*.inc';
  DEFAULT_DELPHI_CONTENTS = 'constructor,destructor,end.,function,implementation,private,' +
    'procedure,program,property,protected,public,published,type,unit,uses';
//  DEFAULT_DELPHI_EMPHASIS = '.,:,:=,;,","';
  DEFAULT_DELPHI_EMPHASIS = 'absolute,abstract,and,array,as,asm,assembler,automated,begin,' +
  'case,cdecl,class,const,constructor,default,destructor,dispid,dispinterface,div,do,downto,' +
  'dynamic,else,end,except,export,exports,external,far,file,finalization,finally,for,forward,' +
  'function,goto,if,implementation,in,inherited,initialization,inline,interface,is,label,library,' +
  'message,mod,near,nil,nodefault,not,object,of,or,out,overload,override,packed,pascal,private,' +
  'procedure,program,property,protected,public,published,raise,readonly,record,register,repeat,' +
  'resident,resourcestring,safecall,set,shl,shr,stdcall,stored,string,then,threadvar,to,try,type,' +
  'unit,until,uses,var,virtual,while,with,writeonly,xor';
//    'absolute,abstract,and,array,as,asm,assembler,at,automated,' +
//    'begin,case,cdecl,class,const,constructor,contains,default,destructor,dispid,' +
//    'dispinterface,div,do,downto,dynamic,else,end,except,export,exports,external,' +
//    'far,file,finalization,finally,for,forward,function,goto,if,implementation,' +
//    'implements,in,index,inherited,initialization,inline,interface,is,label,library,' +
//    'message,mod,name,near,nil,nodefault,not,object,of,on,or,out,overload,override,' +
//    'package,packed,pascal,private,procedure,program,property,protected,public,published,' +
//    'raise,read,readonly,record,register,reintroduce,repeat,requires,resident,' +
//    'resourcestring,safecall,set,shl,shr,stdcall,stored,string,then,threadvar,to,try,' +
//    'type,unit,until,uses,var,virtual,while,with,write,writeonly';
//  DEFAULT_DELPHI_EMPHASIS = 'and,array,as,asm,automated,begin,case,class,const,' +
//    'constructor,destructor,dispinterface,div,do,downto,else,end,except,exports,file,' +
//    'finalization,finally,for,function,goto,if,implementation,in,inherited,initialization,' +
//    'inline,interface,is,label,library,mod,nil,not,object,of,or,out,packed,private,'+
//    'procedure,program,property,protected,public,published,raise,record,repeat,resourcestring,' +
//    'set,shl,shr,string,then,threadvar,to,try,type,unit,until,uses,var,while,with,xor';

implementation



{ TFileType }

constructor TFileType.Create;
begin
  FExtension := TStringList.Create;
  FContents := TStringList.Create;
  FEmphasis := TStringList.Create;
  FName := DEFAULT_TEXT_NAME;
  FBlankDeletion := True;
  FEmphasisDisplay := True;
  FNumberContents := True;
  FContentsDisplay := True;
  FExtensionDisplay := True;
  FContents.CommaText := '';
  FEmphasis.CommaText := '';
  FFountain := nil;
end;

destructor TFileType.Destroy;
begin
  FExtension.Free;
  FContents.Free;
  FEmphasis.Free;
  inherited;
end;

procedure TFileType.SetBlankDeletion(const Value: Boolean);
begin
  FBlankDeletion := Value;
end;

procedure TFileType.SetContents(const Value: TStringList);
begin
  FContents := Value;
end;

procedure TFileType.SetContentsDisplay(const Value: Boolean);
begin
  FContentsDisplay := Value;
end;

procedure TFileType.SetEmphasis(const Value: TStringList);
begin
  FEmphasis := Value;
end;

procedure TFileType.SetEmphasisDisplay(const Value: Boolean);
begin
  FEmphasisDisplay := Value;
end;

procedure TFileType.SetExtension(const Value: TStringList);
begin
  FExtension := Value;
end;

procedure TFileType.SetExtensionDisplay(const Value: Boolean);
begin
  FExtensionDisplay := Value;
end;

procedure TFileType.SetFountain(const Value: TFountain);
begin
  FFountain := Value;
end;

procedure TFileType.SetItemIndex(const Value: Integer);
begin
  FItemIndex := Value;
end;

procedure TFileType.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TFileType.SetNumberContents(const Value: Boolean);
begin
  FNumberContents := Value;
end;

{ TSetting }

constructor TSetting.Create;
begin                                
  ExtensionList := TStringList.Create;
  FileTypeList := TObjectList.Create;
end;

destructor TSetting.Destroy;
//var
//  i: Integer;
begin
//  for i := FileTypeList.Count -1 downto 0 do
//    FileTypeList.Items[i].Free;

  FileTypeList.Free;
  ExtensionList.Free;
  inherited;
end;

//procedure TSetting.SetDisplay(const Value: TDisplay);
//begin
//  FDisplay := Value;
//end;

//procedure TSetting.SetDspDefaultType(const Value: string);
//begin
//  FDspDefaultType := Value;
//end;

procedure TSetting.SetExtensionList(const Value: TStringList);
begin
  FExtensionList := Value;
end;

procedure TSetting.SetFileTypeCount(const Value: Cardinal);
begin
  FFileTypeCount := Value;
end;

procedure TSetting.SetFileTypeList(const Value: TObjectList);
begin
  FFileTypeList := Value;
  FileTypeCount := FFileTypeList.Count;
end;

//procedure TSetting.SetFont(const Value: TFont);
//begin
//  FFont := Value;
//end;

end.
