; XBOX DVR Disabler setup script

[Setup]
AppName=Xbox DVR Disabler
AppVersion=1.0
AppPublisher=/u/milicjant
DefaultDirName={pf}\Xbox DVR Disabler
DefaultGroupName=Xbox DVR Disabler
UninstallDisplayIcon={app}\xboxdvrdisabler.exe
Compression=lzma2
SolidCompression=yes
OutputBaseFilename=xboxdvrdisabler_setup
OutputDir=../dist

[Registry]
; keys for 32-bit systems
Root: HKCU32; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; \
    ValueType: String; ValueName: "{app}\xboxdvrdisabler.exe"; ValueData: "RUNASADMIN"; \
    Flags: uninsdeletekeyifempty uninsdeletevalue; Check: not IsWin64
Root: HKLM32; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; \
    ValueType: String; ValueName: "{app}\xboxdvrdisabler.exe"; ValueData: "RUNASADMIN"; \
    Flags: uninsdeletekeyifempty uninsdeletevalue; Check: not IsWin64

; keys for 64-bit systems
Root: HKCU64; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; \
    ValueType: String; ValueName: "{app}\xboxdvrdisabler.exe"; ValueData: "RUNASADMIN"; \
    Flags: uninsdeletekeyifempty uninsdeletevalue; Check: IsWin64
Root: HKLM64; Subkey: "SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers"; \
    ValueType: String; ValueName: "{app}\xboxdvrdisabler.exe"; ValueData: "RUNASADMIN"; \
    Flags: uninsdeletekeyifempty uninsdeletevalue; Check: IsWin64

[Run]
Filename: "schtasks.exe"; Parameters: "/Create /F /SC ONLOGON /RL HIGHEST /TN ""Xbox DVR Auto disable"" /TR ""{app}\xboxdvrdisabler.exe"""
Filename: "{app}\xboxdvrdisabler.exe"; Flags: nowait postinstall skipifsilent shellexec; Description: "Disable Xbox DVR"
 
[UninstallRun]
Filename: "schtasks.exe"; Parameters: "/Delete /F /TN ""Xbox DVR Auto disable"""


[Files]
Source: "../xboxdvrdisabler.exe"; DestDir: "{app}"
Source: "../LICENSE.txt"; DestDir: "{app}"; Flags: isreadme

[Icons]
Name: "{group}\Xbox DVR Disabler"; Filename: "{app}\xboxdvrdisabler.exe"
Name: "{group}\Uninstall"; Filename: "{uninstallexe}"

