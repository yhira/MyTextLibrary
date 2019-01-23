unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls;

type
  TForm1 = class(TForm)
    TreeView1: TTreeView;
    procedure TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
    { Private êÈåæ }
    OldItem: TTreeNode;
  public
    { Public êÈåæ }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.TreeView1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
  AnItem: TTreeNode;
  r, re:TRect;
begin
  if not Assigned(OldItem) then exit;
  r := OldItem.DisplayRect(true);
  with TreeView1.Canvas do begin
    Brush.Color := TreeView1.Color;
    Pen.Color := clWhite;
    Pen.Width := 3;
    Font := TreeView1.Font;
    TextRect(r,r.Left+2,r.Top+1,OldItem.Text);
    re := Rect(r.Left, r.Top -3, r.Right, r.Bottom -2);

    //if (GetAsyncKeyState(VK_CONTROL) and $8000) = 0 then begin
      Brush.Style := bsClear;
      //Rectangle(r.Left,r.Top,r.Right,r.Bottom)
    //end else begin
      MoveTo(r.Left+1,r.Bottom-1);
      LineTo(r.Right-1,r.Bottom-1);
  end;
  //Accept := True;
  AnItem := TreeView1.GetNodeAt(X, Y);
  if not Assigned(AnItem) then exit;
  r := AnItem.DisplayRect(true);
  with TreeView1.Canvas do begin
    Brush.Color := TreeView1.Color;
    Pen.Color := clRed;
    Pen.Width := 3;
    Font := TreeView1.Font;
    TextRect(r,r.Left+2,r.Top+1,AnItem.Text);
    re := Rect(r.Left, r.Top -3, r.Right, r.Bottom -2);

    //if (GetAsyncKeyState(VK_CONTROL) and $8000) = 0 then begin
      Brush.Style := bsClear;
      //Rectangle(r.Left,r.Top,r.Right,r.Bottom)
    //end else begin
      MoveTo(r.Left+1,r.Bottom-1);
      LineTo(r.Right-1,r.Bottom-1);
    //end;
    OldItem := AnItem;
  end;
end;

end.

