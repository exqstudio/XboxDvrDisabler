program xboxdvrdisabler;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, MainForm, uniqueinstance_package
  { you can add units after this };

{$R *.res}

begin
  Application.Title:='Xbox DVR Disabler';
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TMForm, MForm);
  Application.Run;
end.

