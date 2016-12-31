unit MainForm;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  Menus, StdCtrls, UniqueInstance, Crt, Registry, Windows;

type

  { TMForm }

  TMForm = class(TForm)
    ButtonHide: TButton;
    MemoAbout: TMemo;
    MenuItemAbout: TMenuItem;
    MenuItemExit: TMenuItem;
    MenuItemRun: TMenuItem;
    Popup: TPopupMenu;
    TimerAutorun: TTimer;
    TrayIcon: TTrayIcon;
    UniqueInstance1: TUniqueInstance;
    procedure ButtonHideClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuItemAboutClick(Sender: TObject);
    procedure MenuItemExitClick(Sender: TObject);
    procedure MenuItemRunClick(Sender: TObject);
    procedure TimerAutorunTimer(Sender: TObject);
    procedure UniqueInstance1OtherInstance(Sender: TObject;
      ParamCount: Integer; Parameters: array of String);
  private
    { private declarations }
    FirstShow: Boolean;
  public
    { public declarations }
    procedure DisableDvr;
    procedure ShowNotification(Flag: TBalloonFlags; Str: String);
    procedure AboutShow;
    procedure AboutHide;
  end;

var
  MForm: TMForm;

implementation

{$R *.lfm}

{ TMForm }

procedure TMForm.AboutShow;
begin
  WindowState := wsNormal;
  Show;
end;

procedure TMForm.AboutHide;
begin
  WindowState := wsMinimized;
  Hide;
  ShowInTaskBar := stNever;
end;

procedure TMForm.FormShow(Sender: TObject);
begin
  if FirstShow then
  begin
    AboutHide;
    FirstShow := False;
  end;
end;

procedure TMForm.FormCreate(Sender: TObject);
begin
  FirstShow := True;
end;

procedure TMForm.ButtonHideClick(Sender: TObject);
begin
  AboutHide;
end;

procedure TMForm.MenuItemAboutClick(Sender: TObject);
begin
  AboutShow;
end;

procedure TMForm.MenuItemExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TMForm.MenuItemRunClick(Sender: TObject);
begin
  DisableDvr;
end;

procedure TMForm.TimerAutorunTimer(Sender: TObject);
begin
  DisableDvr;
  TimerAutorun.Enabled := False;
end;


procedure TMForm.UniqueInstance1OtherInstance(Sender: TObject;
  ParamCount: Integer; Parameters: array of String);
begin
  DisableDvr;
end;


procedure TMForm.DisableDvr;
var
  Reg: TRegistry;
begin
 Reg := TRegistry.Create;
 try
   Reg.RootKey := HKEY_LOCAL_MACHINE;
   Reg.OpenKey('\SOFTWARE\Policies\Microsoft\Windows', True);
   Reg.WriteInteger('AllowGameDVR', 0);

   Reg.RootKey := HKEY_CURRENT_USER;
   Reg.OpenKey('\System\GameConfigStore', True);
   Reg.WriteInteger('GameDVR_Enabled', 0);
   Reg.WriteInteger('GameDVR_FSEBehaviorMode', 2);

   ShowNotification(bfInfo, 'Xbox DVR has been disabled!');
 except
   ShowNotification(bfError, 'Can''t change registry. Please make sure application is running with admin priveledges');
 end;
 Reg.Free;
end;

procedure TMForm.ShowNotification(Flag: TBalloonFlags; Str: String);
begin
   TrayIcon.BalloonHint := Str;
   TrayIcon.BalloonFlags := Flag;
   TrayIcon.ShowBalloonHint;
end;

end.
