#SingleInstance,force
GDIP_Startup()
;FE2C55
FirstStartPath = %A_Appdata%\firststartscript2.ini
FirstStart := FileExist(FirstStartPath)
updateversion = 1.3

scriptDir = %A_AppdataCommon%\PriorityTool
scriptCache = %A_AppdataCommon%\PriorityTool\logs
scriptSelect = %A_AppdataCommon%\PriorityTool\logs 2
scriptSelectCache = %A_AppdataCommon%\PriorityTool\logs 2\lastchanges.log
scriptLogStatus = %A_AppdataCommon%\PriorityTool\logs\ifCache.log
scriptLog = %A_AppdataCommon%\PriorityTool\logs\cache.log

FileCreateDir, %scriptDir%
FileCreateDir, %scriptCache%

if !FileExist(scriptLogStatus)
{
    FileAppend, 0, %scriptLogStatus%
    FileReadLine, ifLog, %scriptLogStatus%, 1
}
else if FileExist(scriptLogStatus)
{
FileReadLine, ifLog, %scriptLogStatus%, 1
FileAppend, 
}
firstrun := 0
firstrun2 := 0
firstrun3 := 0
toggleCheckAll := 0

SteamStatus := 0
EpicGamesStatus := 0
RiotClientStatus := 0
DiscordStatus := 0
TeamSpeakStatus := 0
SpotifyStatus := 0
ChromeStatus := 0
FirefoxStatus := 0
OperaStatus := 0
OriginStatus := 0
RockstarLauncherStatus := 0
UbisoftStatus := 0
BattleNetStatus := 0

UpDownColor := 1

LoopCount := 0
FileLoopCount := 0

PriorityMode := 32

Gui, +alwaysontop
toggle := 0
gui, color, C6C7F0
Gui, Font, S10 CDefault Bold, Segoe UI
Gui, Add, Text, x72 y19 w150 h30 cPurple +Center, Priority Tool Menu
Gui, Add, Button, x72 y49 w150 h30 gExplorerFunc1 vExplorerFunc, Kill Explorer
Gui, Add, Button, x72 y84 w150 h30 gPriorityMode1 vPriorityMode, Low Priority Mode
Gui, Add, Button, x72 y119 w150 h30 gAdvancedProperties, Advanced
Gui, Add, Button, x72 y154 w150 h30 gCustomProccesses, Custom Processes
Gui, Show, w298 h200, Priority Tool

if !FirstStart
{
    gui, 1:-alwaysontop
	MsgBox,64,Change Logs,Обновление %updateversion%`n`n- Добавлен импорт готовых профилей с зараннее прописанными процессами.`n- Добавлены новые процессы в основной вкладке.
	gui, 1:+alwaysontop
    
	FileAppend,,%FirstStartPath%
}



return
ExplorerFunc1:
guicontrolget, ExplorerFunc
if (toggle==0)
{
	toggle := 1
	GuiControl,, ExplorerFunc, Return Explorer
	Run, taskkill /f /im explorer.exe,,hide
}
else if (toggle==1)
{
	toggle := 0
	GuiControl,, ExplorerFunc, Kill Explorer
	Run, explorer.exe
}
return
PriorityMode1:
GuiControlGet, PriorityMode
if firstrun
{
gui, mode:+alwaysontop
gui, 1:-alwaysontop
gui, mode:show
return
}

firstrun := 1
GuiControlGet, PriorityMode
gui, mode:+alwaysontop
gui, 1:-alwaysontop
gui, mode:new
gui, mode:font, s10 bold, Segoe UI
Gui, mode:color, C6C7F0
gui, mode:add, text, x45 y8, Check All
CheckAll := New Flat_Round_Switch_Type_1(x := 10 , y := 7 , w := 30 , Text := "Check All" ,Font:="Segoe UI",FontSize:= "10 Bold" , FontColor:="Black" ,Window:="mode",Background_Color:="",State:=0,Label := "CheckAllL")

gui, mode:add, text, x45 y46, Steam
Steam := New Flat_Round_Switch_Type_1(x := 10 , y := 45 , w := 30 , Text := "Steam" ,Font:="Segoe UI",FontSize:= "10 Bold" , FontColor:="Black" ,Window:="mode",Background_Color:="",State:=0,Label := "SteamL")

gui, mode:add, text, x45 y71, Epic Games
EpicGames := New Flat_Round_Switch_Type_1(x := 10 , y := 70 , w := 30 , Text := "Epic Games" ,Font:="Segoe UI",FontSize:= "10 Bold" , FontColor:="Black" ,Window:="mode",Background_Color:="",State:=0,Label := "EpicGamesL")

gui, mode:add, text, x45 y96, Riot Client
RiotClient := New Flat_Round_Switch_Type_1(x := 10 , y := 95 , w := 30 , Text := "RiotClient" ,Font:="Segoe UI",FontSize:= "10 Bold" , FontColor:="Black" ,Window:="mode",Background_Color:="",State:=0,Label := "RiotClientL")

gui, mode:add, text, x45 y121, Discord
Discord := New Flat_Round_Switch_Type_1(x := 10 , y := 120 , w := 30 , Text := "Epic Games" ,Font:="Segoe UI",FontSize:= "10 Bold" , FontColor:="Black" ,Window:="mode",Background_Color:="",State:=0,Label := "DiscordL")

gui, mode:add, text, x45 y146, Team Speak
TeamSpeak := New Flat_Round_Switch_Type_1(x := 10 , y := 145 , w := 30 , Text := "Epic Games" ,Font:="Segoe UI",FontSize:= "10 Bold" , FontColor:="Black" ,Window:="mode",Background_Color:="",State:=0,Label := "TeamSpeakL")

gui, mode:add, text, x45 y171, Spofity
Spotify := New Flat_Round_Switch_Type_1(x := 10 , y := 170 , w := 30 , Text := "Epic Games" ,Font:="Segoe UI",FontSize:= "10 Bold" , FontColor:="Black" ,Window:="mode",Background_Color:="",State:=0,Label := "SpotifyL")

gui, mode:add, text, x45 y196, Chrome
Chrome := New Flat_Round_Switch_Type_1(x := 10 , y := 195 , w := 30 , Text := "Epic Games" ,Font:="Segoe UI",FontSize:= "10 Bold" , FontColor:="Black" ,Window:="mode",Background_Color:="",State:=0,Label := "ChromeL")

gui, mode:add, text, x45 y221, Firefox
Firefox := New Flat_Round_Switch_Type_1(x := 10 , y := 220 , w := 30 , Text := "Epic Games" ,Font:="Segoe UI",FontSize:= "10 Bold" , FontColor:="Black" ,Window:="mode",Background_Color:="",State:=0,Label := "FirefoxL")

gui, mode:add, text, x45 y246, Opera/Opera GX
Opera := New Flat_Round_Switch_Type_1(x := 10 , y := 245 , w := 30 , Text := "Epic Games" ,Font:="Segoe UI",FontSize:= "10 Bold" , FontColor:="Black" ,Window:="mode",Background_Color:="",State:=0,Label := "OperaL")

gui, mode:add, text, x45 y271, Origin
Origin := New Flat_Round_Switch_Type_1(x := 10 , y := 270 , w := 30 , Text := "Epic Games" ,Font:="Segoe UI",FontSize:= "10 Bold" , FontColor:="Black" ,Window:="mode",Background_Color:="",State:=0,Label := "OriginL")

gui, mode:add, text, x45 y296, Rockstar Launcher
Rockstar := New Flat_Round_Switch_Type_1(x := 10 , y := 295 , w := 30 , Text := "Epic Games" ,Font:="Segoe UI",FontSize:= "10 Bold" , FontColor:="Black" ,Window:="mode",Background_Color:="",State:=0,Label := "RockstarL")

gui, mode:add, text, x45 y321, Ubisoft
Ubisoft := New Flat_Round_Switch_Type_1(x := 10 , y := 320 , w := 30 , Text := "Epic Games" ,Font:="Segoe UI",FontSize:= "10 Bold" , FontColor:="Black" ,Window:="mode",Background_Color:="",State:=0,Label := "UbisoftL")

gui, mode:add, text, x45 y346, Battle Net
BattleNet := New Flat_Round_Switch_Type_1(x := 10 , y := 345 , w := 30 , Text := "Epic Games" ,Font:="Segoe UI",FontSize:= "10 Bold" , FontColor:="Black" ,Window:="mode",Background_Color:="",State:=0,Label := "BattleNetL")

Gui, mode:Show, w200 h495, SetPriority


gui, mode:add, button, x10 y375 w180 h50 gStartLow, Apply
gui, mode:add, button, x10 y435 w180 h50 gReturnLow, Return Priority
return
SteamL:
if (Steam.State==1)
	SteamStatus := 1
else if (Steam.State==0)
	SteamStatus := 0
return
EpicGamesL:
if (EpicGames.State==1)
	EpicGamesStatus := 1
else if (EpicGames.State==0)
	EpicGamesStatus := 0
return
RiotClientL:
if (RiotClient.State==1)
	RiotClientStatus := 1
else if (RiotClient.State==0)
	RiotClientStatus := 0
return
DiscordL:
if (Discord.State==1)
	DiscordStatus := 1
else if (Discord.State==0)
	DiscordStatus := 0
return
TeamspeakL:
if (Teamspeak.State==1)
	TeamSpeakStatus := 1
else if (Teamspeak.State==0)
	TeamSpeakStatus := 0
return
SpotifyL:
if (Spotify.State==1)
	SpotifyStatus := 1
else if (Spotify.State==0)
	SpotifyStatus := 0
return
ChromeL:
if (Chrome.State==1)
	ChromeStatus := 1
else if (Chrome.State==0)
	ChromeStatus := 0
return
FirefoxL:
if (Firefox.State==1)
	FirefoxStatus := 1
else if (Firefox.State==0)
    FirefoxStatus := 0
return
OperaL:
if (Opera.State==1)
	OperaStatus := 1
else if (Opera.State==0)
	OperaStatus := 0
return
OriginL:
if (Origin.State==1)
	OriginStatus := 1
else if (Origin.State==0)
	OriginStatus := 0
return
RockstarL:
if (Rockstar.State==1)
	RockstarLauncherStatus := 1
else if (Origin.State==0)
	RockstarLauncherStatus := 0
return
UbisoftL:
if (Ubisoft.State==1)
	UbisoftStatus := 1
else if (Ubisoft.State==0)
	UbisoftStatus := 0
return
BattleNetL:
if (BattleNet.State==1)
	BattleNetStatus := 1
else if (BattleNet.State==0)
	BattleNetStatus := 0
return
CheckAllL:
if (toggleCheckAll==0)
{
toggleCheckAll := 1
    ;Steam Draw On
Steam.State := 1
SteamStatus := 1
        (Steam.Draw_On())
        if(Steam.Label)  
            gosub,% Steam.Label
    ;EpicGames Draw On
EpicGames.State := 1
EpicGamesStatus := 1
        (EpicGames.Draw_On())
        if(EpicGames.Label)  
            gosub,% EpicGames.Label
    ;RiotClient Draw On
RiotClient.State := 1
RiotClientStatus := 1
        (RiotClient.Draw_On())
        if(RiotClient.Label)  
            gosub,% RiotClient.Label
    ;Discord Draw On
Discord.State := 1
DiscordStatus := 1
        (Discord.Draw_On())
        if(Discord.Label)  
            gosub,% Discord.Label
    ;TeamSpeak Draw On
TeamSpeak.State := 1
TeamSpeakStatus := 1
        (TeamSpeak.Draw_On())
        if(TeamSpeak.Label)  
            gosub,% TeamSpeak.Label
    ;Spotify Draw On
Spotify.State := 1
SpotifyStatus := 1
        (Spotify.Draw_On())
        if(Spotify.Label)  
            gosub,% Spotify.Label
    ;Chrome Draw On
Chrome.State := 1
ChromeStatus := 1
        (Chrome.Draw_On())
        if(Chrome.Label)  
            gosub,% Chrome.Label
    ;Firefox Draw On
Firefox.State := 1
FirefoxStatus := 1
        (Firefox.Draw_On())
        if(Firefox.Label)  
            gosub,% Firefox.Label
    ;Opera Draw On
Opera.State := 1
OperaStatus := 1
        (Opera.Draw_On())
        if(Opera.Label)  
            gosub,% Opera.Label
    ;Origin Draw On
Origin.State := 1
OriginStatus := 1
        (Origin.Draw_On())
        if(Origin.Label)  
            gosub,% Origin.Label
    ;Rockstar Launcher Draw On
Rockstar.State := 1
RockstarLauncherStatus := 1
        (Rockstar.Draw_On())
        if(Rockstar.Label)  
            gosub,% Rockstar.Label
    ;Ubisoft Draw On
Ubisoft.State := 1
UbisoftStatus := 1
        (Ubisoft.Draw_On())
        if(Ubisoft.Label)  
            gosub,% Ubisoft.Label
    ;BattleNet Draw On
BattleNet.State := 1
BattleNetStatus := 1
        (BattleNet.Draw_On())
        if(BattleNet.Label)  
            gosub,% BattleNet.Label
}


else if (toggleCheckAll==1)
{
toggleCheckAll := 0
    ;Steam Draw Off
Steam.State := 0
SteamStatus := 0
        (Steam.Draw_Off())
        if(Steam.Label)  
            gosub,% Steam.Label
    ;EpicGames Draw Off
EpicGames.State := 0
EpicGamesStatus := 0
        (EpicGames.Draw_Off())
        if(EpicGames.Label)  
            gosub,% EpicGames.Label
    ;RiotClient Draw Off
RiotClient.State := 0
RiotClientStatus := 0
        (RiotClient.Draw_Off())
        if(RiotClient.Label)  
            gosub,% RiotClient.Label
    ;Discord Draw Off
Discord.State := 0
DiscordStatus := 0
        (Discord.Draw_Off())
        if(Discord.Label)  
            gosub,% Discord.Label
    ;TeamSpeak Draw Off
TeamSpeak.State := 0
TeamSpeakStatus := 0
        (TeamSpeak.Draw_Off())
        if(TeamSpeak.Label)  
            gosub,% TeamSpeak.Label
    ;Spotify Draw Off
Spotify.State := 0
SpotifyStatus := 0
        (Spotify.Draw_Off())
        if(Spotify.Label)  
            gosub,% Spotify.Label
    ;Chrome Draw Off
Chrome.State := 0
ChromeStatus := 0
        (Chrome.Draw_Off())
        if(Chrome.Label)  
            gosub,% Chrome.Label
    ;Firefox Draw Off
Firefox.State := 0
FirefoxStatus := 0
        (Firefox.Draw_Off())
        if(Firefox.Label)  
            gosub,% Firefox.Label
    ;Opera Draw Off
Opera.State := 0
OperaStatus := 0
        (Opera.Draw_Off())
        if(Opera.Label)  
            gosub,% Opera.Label
    ;Origin Draw Off
Origin.State := 0
OriginStatus := 0
        (Origin.Draw_Off())
        if(Origin.Label)  
            gosub,% Origin.Label
    ;Rockstar Launcher Draw Off
Rockstar.State := 0
RockstarLauncherStatus := 0
        (Rockstar.Draw_Off())
        if(Rockstar.Label)  
            gosub,% Rockstar.Label
    ;Ubisoft Draw Off
Ubisoft.State := 0
UbisoftStatus := 0
        (Ubisoft.Draw_Off())
        if(Ubisoft.Label)  
            gosub,% Ubisoft.Label
    ;BattleNet Draw Off
BattleNet.State := 0
BattleNetStatus := 0
        (BattleNet.Draw_Off())
        if(BattleNet.Label)  
            gosub,% BattleNet.Label
}

return
StartLow:
Gui, mode:hide
gui, 1:+alwaysontop
if RiotClientStatus
{
Run, wmic process where name="vgtray.exe" call setpriority 64,,Hide
}

if EpicGamesStatus
{
Run, wmic process where name"EpicGamesLauncher.exe" call setpriority 64,,Hide
run, wmic process where name="EpicWebHelper.exe" call setprioroty 64,,Hide
Run, wmic process where name"FortniteClient-Win64-Shipping.exe" call setpriority 128,,Hide
}

if SteamStatus
{
Run, wmic process where name="steam.exe" call setpriority 64,,Hide
Run, wmic process where name="steamwebhelper.exe" call setpriority 64,,Hide
Run, wmic process where name="GameOverleyUi.exe" call setpriority 64,,Hide
}

If SpotifyStatus
{
Run, wmic process where name="spotify.exe" call setpriority 64,,Hide
}

if TeamSpeakStatus
{
Run, wmic process where name="ts3client_win64.exe" call setpriority 64,,Hide
}

if DiscordStatus
{
Run, wmic process where name="Discord.exe" call setpriority 64,,Hide
}

if ChromeStatus
{
Run, wmic process where name="Chrome.exe" call setpriority 64,,Hide
}

if FirefoxStatus
{
Run, wmic process where name="Firefox.exe" call setpriority 64,,Hide
}

if OperaStatus
{
Run, wmic process where name="Opera.exe" call setpriority 64,,Hide
}

if OriginStatus
{
Run, wmic process where name="Origin.exe" call setpriority 64,,Hide
Run, wmic process where name="OriginClientService.exe" call setpriority 64,,Hide
}

if RockstarLauncherStatus
{
Run, wmic process where name="Launcher.exe" call setpriority 64,,Hide
Run, wmic process where name="RockstarService.exe" call setpriority 64,,Hide
Run, wmic process where name="SocialClubHelper.exe" call setpriority 64,,Hide
}

if UbisoftStatus
{
Run, wmic process where name="upc.exe" call setpriority 64,,Hide
Run, wmic process where name="UplayWebCore.exe" call setpriority 64,,Hide
}

if BattleNetLauncher
{
Run, wmic process where name="Agent.exe" call setpriority 64,,Hide
Run, wmic process where name="Battle.net.exe" call setpriority 64,,Hide
}
;-------------------------------------------------------------------------------------
if !RiotClientStatus
{
Run, wmic process where name="vgtray.exe" call setpriority 32,,Hide
}

if !EpicGamesStatus
{
Run, wmic process where name"EpicGamesLauncher.exe" call setpriority 32,,Hide
run, wmic process where name="EpicWebHelper.exe" call setprioroty 32,,Hide
Run, wmic process where name"FortniteClient-Win64-Shipping.exe" call setpriority 32,,Hide
}

if !SteamStatus
{
Run, wmic process where name="steam.exe" call setpriority 32,,Hide
Run, wmic process where name="steamwebhelper.exe" call setpriority 32,,Hide
Run, wmic process where name="GameOverleyUi.exe" call setpriority 32,,Hide
}

If !SpotifyStatus
{
Run, wmic process where name="spotify.exe" call setpriority 32,,Hide
}

if !TeamSpeakStatus
{
Run, wmic process where name="ts3client_win64.exe" call setpriority 32,,Hide
}

if !DiscordStatus
{
Run, wmic process where name="Discord.exe" call setpriority 32,,Hide
}

if !ChromeStatus
{
Run, wmic process where name="Chrome.exe" call setpriority 32,,Hide
}

if !FirefoxStatus
{
Run, wmic process where name="Firefox.exe" call setpriority 32,,Hide
}

if !OperaStatus
{
Run, wmic process where name="Opera.exe" call setpriority 32,,Hide
}

if !OriginStatus
{
Run, wmic process where name="Origin.exe" call setpriority 32,,Hide
Run, wmic process where name="OriginClientService.exe" call setpriority 32,,Hide
}

if !RockstarLauncherStatus
{
Run, wmic process where name="Launcher.exe" call setpriority 32,,Hide
Run, wmic process where name="RockstarService.exe" call setpriority 32,,Hide
Run, wmic process where name="SocialClubHelper.exe" call setpriority 32,,Hide
}

if !UbisoftStatus
{
Run, wmic process where name="upc.exe" call setpriority 32,,Hide
Run, wmic process where name="UplayWebCore.exe" call setpriority 32,,Hide
}

if !BattleNetLauncher
{
Run, wmic process where name="Agent.exe" call setpriority 32,,Hide
Run, wmic process where name="Battle.net.exe" call setpriority 32,,Hide
}

gui, 1:-alwaysontop
MsgBox,64,Success,Done,1
gui, 1:+alwaysontop

return
ReturnLow:
toggleCheckAll := 0
    ;CheckAll Off
CheckAll.State := 0
        (CheckAll.Draw_Off())
        if(CheckAll.Label)  
            gosub,% CheckAll.Label
    ;Steam Draw Off
Steam.State := 0
SteamStatus := 0
        (Steam.Draw_Off())
        if(Steam.Label)  
            gosub,% Steam.Label
    ;EpicGames Draw Off
EpicGames.State := 0
EpicGamesStatus := 0
        (EpicGames.Draw_Off())
        if(EpicGames.Label)  
            gosub,% EpicGames.Label
    ;RiotClient Draw Off
RiotClient.State := 0
RiotClientStatus := 0
        (RiotClient.Draw_Off())
        if(RiotClient.Label)  
            gosub,% RiotClient.Label
    ;Discord Draw Off
Discord.State := 0
DiscordStatus := 0
        (Discord.Draw_Off())
        if(Discord.Label)  
            gosub,% Discord.Label
    ;TeamSpeak Draw Off
TeamSpeak.State := 0
TeamSpeakStatus := 0
        (TeamSpeak.Draw_Off())
        if(TeamSpeak.Label)  
            gosub,% TeamSpeak.Label
    ;Spotify Draw Off
Spotify.State := 0
SpotifyStatus := 0
        (Spotify.Draw_Off())
        if(Spotify.Label)  
            gosub,% Spotify.Label
    ;Chrome Draw Off
Chrome.State := 0
ChromeStatus := 0
        (Chrome.Draw_Off())
        if(Chrome.Label)  
            gosub,% Chrome.Label
    ;Firefox Draw Off
Firefox.State := 0
FirefoxStatus := 0
        (Firefox.Draw_Off())
        if(Firefox.Label)  
            gosub,% Firefox.Label
    ;Opera Draw Off
Opera.State := 0
OperaStatus := 0
        (Opera.Draw_Off())
        if(Opera.Label)  
            gosub,% Opera.Label
    ;Origin Draw Off
Origin.State := 0
OriginStatus := 0
        (Origin.Draw_Off())
        if(Origin.Label)  
            gosub,% Origin.Label
    ;Rockstar Launcher Draw Off
Rockstar.State := 0
RockstarLauncherStatus := 0
        (Rockstar.Draw_Off())
        if(Rockstar.Label)  
            gosub,% Rockstar.Label
    ;Ubisoft Draw Off
Ubisoft.State := 0
UbisoftStatus := 0
        (Ubisoft.Draw_Off())
        if(Ubisoft.Label)  
            gosub,% Ubisoft.Label
    ;BattleNet Draw Off
BattleNet.State := 0
BattleNetStatus := 0
        (BattleNet.Draw_Off())
        if(BattleNet.Label)  
            gosub,% BattleNet.Label
SoundPlay, *64
;RiotClientStatus
Run, wmic process where name="vgtray.exe" call setpriority 32,,Hide

;EpicGamesStatus
Run, wmic process where name"EpicGamesLauncher.exe" call setpriority 32,,Hide
run, wmic process where name="EpicWebHelper.exe" call setprioroty 32,,Hide
Run, wmic process where name"FortniteClient-Win64-Shipping.exe" call setpriority 32,,Hide

;SteamStatus
Run, wmic process where name="steam.exe" call setpriority 32,,Hide
Run, wmic process where name="steamwebhelper.exe" call setpriority 32,,Hide
Run, wmic process where name="GameOverleyUi.exe" call setpriority 32,,Hide

;SpotifyStatus
Run, wmic process where name="spotify.exe" call setpriority 32,,Hide

;TeamSpeakStatus
Run, wmic process where name="ts3client_win64.exe" call setpriority 32,,Hide

;DiscordStatus
Run, wmic process where name="Discord.exe" call setpriority 32,,Hide

;ChromeStatus
Run, wmic process where name="Chrome.exe" call setpriority 32,,Hide

;FirefoxStatus
Run, wmic process where name="Firefox.exe" call setpriority 32,,Hide

;OperaStatus
Run, wmic process where name="Opera.exe" call setpriority 32,,Hide

;OriginStatus
Run, wmic process where name="Origin.exe" call setpriority 32,,Hide
Run, wmic process where name="OriginClientService.exe" call setpriority 32,,Hide

;RockstarLauncherStatus
Run, wmic process where name="Launcher.exe" call setpriority 32,,Hide
Run, wmic process where name="RockstarService.exe" call setpriority 32,,Hide
Run, wmic process where name="SocialClubHelper.exe" call setpriority 32,,Hide

;UbisoftStatus
Run, wmic process where name="upc.exe" call setpriority 32,,Hide
Run, wmic process where name="UplayWebCore.exe" call setpriority 32,,Hide

;BattleNetLauncher
Run, wmic process where name="Agent.exe" call setpriority 32,,Hide
Run, wmic process where name="Battle.net.exe" call setpriority 32,,Hide


gui, 1:-alwaysontop
gui, mode:hide
MsgBox,64,Success,Done,1
gui, 1:+alwaysontop
return
CustomProccesses: ;`````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````idaa
if firstrun2
{
gui, custommenu:+alwaysontop
gui, 1:-alwaysontop
gui, custommenu:show
return
}

firstrun2 := 1
gui, custommenu:new
gui, custommenu:+alwaysontop
gui, 1:-alwaysontop
gui, custommenu:font, s10 bold, Segoe UI
Gui, custommenu:color, C6C7F0

gui, custommenu:add, button, x40 y10 w120 h40 gImportFile, Import File
gui, custommenu:add, text, x40 y65 w120 h40 +center, Process Priority
gui, custommenu:add, DropDownList, x40 y90 w120 h150 vPriorityList2, Low||Below Normal|Normal|Above Normal|High|Real Time|
gui, custommenu:add, button, x40 y125 w120 h30 Disabled gSubmitImport1 vSubmitImport, Apply

Gui, custommenu:show, w200 h170, Import
return
ImportFile: ;`````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
GuiControlget, SubmitImport
GuiControlGet, PriorityList2
FileSelectFile, SelectedFile, 3, , Open a file, Import File (*.import; *.cfg; *.config;)
if (SelectedFile!="")
{
    GuiControl, enable, SubmitImport
}
return
SubmitImport1:
Gui, custommenu:hide
GuiControlget, PriorityList2
If (PriorityList2=="Low")
    PriorityMode := 64
Else If (PriorityList2=="Below Normal")
    PriorityMode := 16384
Else If (PriorityList2=="Normal")
    PriorityMode := 32
Else If (PriorityList2=="Above Normal")
    PriorityMode := 32768
Else If (PriorityList2=="High")
    PriorityMode := 128
Else If (PriorityList2=="Real Time")
    PriorityMode := 256

Loop, Read, %SelectedFile%
  numlines := A_Index
if(numlines>50)
{
gui, custommenu:-alwaysontop
MsgBox,16,Error!,Sorry, but you cannot import a file which contains more than 50 processes!
gui, custommenu:+alwaysontop
return
}

loop, %numlines%
{
LoopCount++
FileReadLine, line%LoopCount%, %SelectedFile%, %LoopCount%
}

Run, wmic process where name="%line1%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line2%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line3%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line4%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line5%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line6%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line7%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line8%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line9%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line10%" call setpriority %PriorityMode%,,Hide ;10

Run, wmic process where name="%line11%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line12%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line13%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line14%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line15%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line16%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line17%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line18%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line19%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line20%" call setpriority %PriorityMode%,,Hide ;20

Run, wmic process where name="%line21%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line22%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line23%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line24%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line25%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line26%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line27%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line28%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line29%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line30%" call setpriority %PriorityMode%,,Hide ;30

Run, wmic process where name="%line31%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line32%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line33%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line34%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line35%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line36%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line37%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line38%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line39%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line40%" call setpriority %PriorityMode%,,Hide ;40

Run, wmic process where name="%line41%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line42%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line43%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line44%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line45%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line46%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line47%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line48%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line49%" call setpriority %PriorityMode%,,Hide
Run, wmic process where name="%line50%" call setpriority %PriorityMode%,,Hide ;50
gui, custommenu:-AlwaysOnTop
MsgBox,64,Success,Process Priorities Have Been Successfully Applied!
return

return
GuiClose: ;`````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
if(toggle==1)
	MsgBox,68,Warning, Do you want to return exlorer?
IfMsgBox, Yes
	Run, explorer.exe
ExitApp
return
#WHEELUP:: ;`````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
if (UpDownColor!=10)
{
UpDownColor ++
if(UpDownColor==1) ;1
    {
    Gui, 1:color, C6C7F0
    Gui, mode:color, C6C7F0
    gui, custommenu:color, C6C7F0
    }
else if(UpDownColor==2) ;2
    {
    Gui, 1:color, 0000FF
    Gui, mode:color, 0000FF
    gui, custommenu:color, 0000FF
    }
else if(UpDownColor==3) ;3
    {
    Gui, 1:color, 000080
    Gui, mode:color, 000080
    gui, custommenu:color, 000080
    }
else if(UpDownColor==4) ;4
    {
    Gui, 1:color, 808000
    Gui, mode:color, 808000
    gui, custommenu:color, 808000
    }
else if(UpDownColor==5) ;5
    {
    Gui, 1:color, 008000
    Gui, mode:color, 008000
    gui, custommenu:color, 008000
    }
else if(UpDownColor==6) ;6
    {
    Gui, 1:color, 800080
    Gui, mode:color, 800080
    gui, custommenu:color, 800080
    }
else if(UpDownColor==7) ;7
    {
    Gui, 1:color, FF0000
    Gui, mode:color, FF0000
    gui, custommenu:color, FF0000
    }
else if(UpDownColor==8) ;8
    {
    Gui, 1:color, FFFFFF
    Gui, mode:color, FFFFFF
    gui, custommenu:color, FFFFFF
    }
else if(UpDownColor==9) ;9
    {
    Gui, 1:color, C0C0C0
    Gui, mode:color, C0C0C0
    gui, custommenu:color, C0C0C0
    }
else if(UpDownColor==10) ;10
    {
    Gui, 1:color, 000000
    Gui, mode:color, 000000
    gui, custommenu:color, 000000   
    }
}
return
#WHEELDOWN::
if (UpDownColor!=1)
{
UpDownColor --
if(UpDownColor==1) ;1
    {
    Gui, 1:color, C6C7F0
    Gui, mode:color, C6C7F0
    gui, custommenu:color, C6C7F0
    }
else if(UpDownColor==2) ;2
    {
    Gui, 1:color, 0000FF
    Gui, mode:color, 0000FF
    gui, custommenu:color, 0000FF
    }
else if(UpDownColor==3) ;3
    {
    Gui, 1:color, 000080
    Gui, mode:color, 000080
    gui, custommenu:color, 000080
    }
else if(UpDownColor==4) ;4
    {
    Gui, 1:color, 808000
    Gui, mode:color, 808000
    gui, custommenu:color, 808000
    }
else if(UpDownColor==5) ;5
    {
    Gui, 1:color, 008000
    Gui, mode:color, 008000
    gui, custommenu:color, 008000
    }
else if(UpDownColor==6) ;6
    {
    Gui, 1:color, 800080
    Gui, mode:color, 800080
    gui, custommenu:color, 800080
    }
else if(UpDownColor==7) ;7
    {
    Gui, 1:color, FF0000
    Gui, mode:color, FF0000
    gui, custommenu:color, FF0000
    }
else if(UpDownColor==8) ;8
    {
    Gui, 1:color, FFFFFF
    Gui, mode:color, FFFFFF
    gui, custommenu:color, FFFFFF
    }
else if(UpDownColor==9) ;9
    {
    Gui, 1:color, C0C0C0
    Gui, mode:color, C0C0C0
    gui, custommenu:color, C0C0C0
    }
else if(UpDownColor==10) ;10
    {
    Gui, 1:color, 000000
    Gui, mode:color, 000000
    gui, custommenu:color, 000000
    }
}
return
AdvancedProperties: ;`````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````````
if firstrun3
{
gui, advanced:+alwaysontop
gui, 1:-alwaysontop
gui, advanced:show
return
}

firstrun3 := 1
gui, 1:-alwaysontop
gui, advanced:new
gui, advanced:+alwaysontop
gui, advanced:color, C6C7F0
Gui, advanced:Font, S10 CDEFAULT Bold, Segoe UI
Gui, advanced:Add, GroupBox, x472 y10 w240 h310, PC Specs
Gui, advanced:Add, Text, x242 y10 w200 h20 +Center, Driver Tools
Gui, advanced:Add, text, x242 y35 w200 h20 +center, Soon


Gui, advanced:Add, Button, x10 y85 w70 h33 gClearTMP, Clear TMP
Gui, advanced:Add, Button, x90 y85 w75 h33 gClearRam, Clear RAM

Gui, advanced:Add, Button, x10 y290 w160 h33 +center gOk4, OK

Gui, advanced:Add, Text, x45 y11 w120 h20 , DWM Low Priority
DWM := New Flat_Round_Switch_Type_1(x := 10 , y := 10 , w := 30 , Text := "Check All" ,Font:="Segoe UI",FontSize:= "10 Bold" , FontColor:="Black" ,Window:="advanced",Background_Color:="",State:=0,Label := "DWML")

Gui, advanced:Add, Text, x45 y36 w120 h20 , Idle Winlogon
WinLogon := New Flat_Round_Switch_Type_1(x := 10 , y := 35 , w := 30 , Text := "Check All" ,Font:="Segoe UI",FontSize:= "10 Bold" , FontColor:="Black" ,Window:="advanced",Background_Color:="",State:=0,Label := "WinLogonL")

Gui, advanced:Add, Text, x45 y61 w150 h20 , Svchost Low Priority
svchost := New Flat_Round_Switch_Type_1(x := 10 , y := 60 , w := 30 , Text := "Check All" ,Font:="Segoe UI",FontSize:= "10 Bold" , FontColor:="Black" ,Window:="advanced",Background_Color:="",State:=0,Label := "svchostL")

;Gui, advanced:Add, text, x45 y261 w150 h20, Enable Cache Logging
;Gui, advanced:Add, text, x185 y262 w40 h20 cBlue gCacheInfo, (?)
;cachestate := New Flat_Round_Switch_Type_1(x := 10 , y := 260 , w := 30 , Text := "Check All" ,Font:="Segoe UI",FontSize:= "10 Bold" , FontColor:="Black" ,Window:="advanced",Background_Color:="",State:=0,Label := "cachestateL")

Gui, advanced:Show, w729 h331, Advanced Settings
return
CacheInfo:
gui, advanced:-alwaysontop
MsgBox,64,Info,"Enable Cache Logging (ECL)" is a function, which saves your changed data in a special path, which return every your chosen function even after re-launching the program.`n`nImportant: Every selected functions before ECL will NOT save!
gui, advanced:+alwaysontop
return
cachestateL: 
/*
scriptDir = %A_AppdataCommon%\PriorityTool
scriptCache = %A_AppdataCommon%\PriorityTool\logs
scriptLogStatus = %A_AppdataCommon%\PriorityTool\logs\ifCache.log
scriptLog = %A_AppdataCommon%\PriorityTool\logs\cache.log
*/
if (cachestate.State==1)
{
FileDelete, %scriptLogStatus%
sleep, 20
FileAppend, 1, %scriptLogStatus%
}

else if (cachestate.State==0)
{
FileDelete, %scriptLog%
FileDelete, %scriptLogStatus%
sleep, 20
FileAppend, 0, %scriptLogStatus%
}
return
DWML:
If(DWM.State==1)
    Run, wmic process where name="dwm.exe" call setpriority 64,,Hide
else If(DWM.State==0)
    Run, wmic process where name="dwm.exe" call setpriority 32,,Hide
return
WinLogonL:
If(WinLogon.State==1)
    Run, wmic process where name="WinLogon.exe" call setpriority 64,,Hide
else If(WinLogon.State==0)
    Run, wmic process where name="WinLogon.exe" call setpriority 32,,Hide
return
svchostL:
If(svchost.State==1)
    Run, wmic process where name="svchost.exe" call setpriority 64,,Hide
else If(svchost.State==0)
    Run, wmic process where name="svchost.exe" call setpriority 32,,Hide
return
ClearRam:
RunWait, ram\Peace Computer Standby List Cleaner.exe
gui, advanced:-alwaysontop
MsgBox,64,Success,Done
gui, advanced:+alwaysontop
return
ClearTMP:
RunWait, temp\clean.bat,,hide
RunWait, temp\TempCleaner.exe
gui, advanced:-alwaysontop
MsgBox,64,Success,Done
gui, advanced:+alwaysontop
return
Ok4:
gui, advanced:hide
return


;************************************************************************************************************************************************************
class Flat_Round_Switch_Type_1  {
    __New(x,y,w:=19,Text:="Text",Font:="Segoe UI",FontSize:= "10 Bold" , FontColor:="FFFFFF" ,Window:="1",Background_Color:="36373A",State:=0,Label:=""){
        This.State:=State
        This.X:=x
        This.Y:=y
        This.W:=w
        This.H:=21
        This.Text:=Text
        This.Font:=Font
        This.FontSize:=FontSize
        This.FontColor:= "0xFF" FontColor
        This.Background_Color:= "0xFF" Background_Color
        This.Window:=Window
        This.Create_Off_Bitmap()
        This.Create_On_Bitmap()
        This.Create_Trigger()
        This.Label:=Label
        sleep,20
        if(This.State)
            This.Draw_On()
        else
            This.Draw_Off()
    }
    Create_Trigger(){
        Gui , % This.Window ": Add" , Picture , % "x" This.X " y" This.Y " w" This.W " h" This.H " 0xE hwndhwnd"
        This.Hwnd:=hwnd
        BD := THIS.Switch_State.BIND( THIS ) 
        GUICONTROL +G , % This.Hwnd , % BD
    }
    Create_Off_Bitmap(){
        ;Bitmap Created Using: HB Bitmap Maker
        pBitmap:=Gdip_CreateBitmap( This.W , 21 ) 
         G := Gdip_GraphicsFromImage( pBitmap )
        Gdip_SetSmoothingMode( G , 2 )
        Brush := Gdip_BrushCreateSolid( This.Background_Color )
        Gdip_FillRectangle( G , Brush , -1 , -1 , This.W+2 , 23 )
        Gdip_DeleteBrush( Brush )
        Pen := Gdip_CreatePen( "0xFF44474A" , 1 )
        Gdip_DrawRoundedRectangle( G , Pen , 1 , 2 , 26 , 14 , 5 )
        Gdip_DeletePen( Pen )
        Pen := Gdip_CreatePen( "0xFF1B1D1E" , 1 )
        Gdip_DrawRoundedRectangle( G , Pen , 1 , 2 , 26 , 13 , 5 )
        Gdip_DeletePen( Pen )
        Brush := Gdip_BrushCreateSolid( "0xFF262827" )
        Gdip_FillRoundedRectangle( G , Brush , 1 , 2 , 26 , 13 , 5 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0xFF303334" )
        Gdip_FillRoundedRectangle( G , Brush , 2 , 3 , 24 , 11 , 5 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0x8827282B" )
        Gdip_FillEllipse( G , Brush , 0 , 0 , 18 , 18 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0xFF1A1C1F" )
        Gdip_FillEllipse( G , Brush , 0 , 0 , 17 , 17 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_CreateLineBrushFromRect( 3 , 2 , 11 , 14 , "0xFF60646A" , "0xFF393B3F" , 1 , 1 )
        Gdip_FillEllipse( G , Brush , 1 , 1 , 15 , 15 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_CreateLineBrushFromRect( 5 , 3 , 10 , 12 , "0xFF4D5055" , "0xFF36383B" , 1 , 1 )
        Gdip_FillEllipse( G , Brush , 2 , 2 , 13 , 13 )
        Gdip_DeleteBrush( Brush )
        ;Adding text
        ;-------------------------------------------------------------
        Brush := Gdip_BrushCreateSolid( This.FontColor )
        Gdip_TextToGraphics( G , This.Text , "s" This.FontSize " vCenter c" Brush " x33 y0" , This.Font , This.W-33, This.H )
        Gdip_DeleteBrush( Brush )
        ;-------------------------------------------------------------
        Gdip_DeleteGraphics( G )
        This.Off_Bitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap)
        Gdip_DisposeImage(pBitmap)
    }
    Create_On_Bitmap(){
        ;Bitmap Created Using: HB Bitmap Maker
        pBitmap:=Gdip_CreateBitmap( This.W , 21 ) 
         G := Gdip_GraphicsFromImage( pBitmap )
        Gdip_SetSmoothingMode( G , 2 )
        Brush := Gdip_BrushCreateSolid( This.Background_Color )
        Gdip_FillRectangle( G , Brush , -1 , -1 , This.W+2 , 23 )
        Gdip_DeleteBrush( Brush )
        Pen := Gdip_CreatePen( "0xFF44474A" , 1 )
        Gdip_DrawRoundedRectangle( G , Pen , 1 , 2 , 26 , 14 , 5 )
        Gdip_DeletePen( Pen )
        Pen := Gdip_CreatePen( "0xFF1B1D1E" , 1 )
        Gdip_DrawRoundedRectangle( G , Pen , 1 , 2 , 26 , 13 , 5 )
        Gdip_DeletePen( Pen )
        ;------------------------------------------------------------------
        ;On Background Colors
        Brush := Gdip_BrushCreateSolid( "0xFF8846C2" )
        Gdip_FillRoundedRectangle( G , Brush , 2 , 3 , 25 , 11 , 5 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0xFFA866E2" )
        ;--------------------------------------------------------------------
        Gdip_FillRoundedRectangle( G , Brush , 2 , 5 , 23 , 9 , 4 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0x8827282B" )
        Gdip_FillEllipse( G , Brush , 11 , 0 , 18 , 18 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_BrushCreateSolid( "0xFF1A1C1F" )
        Gdip_FillEllipse( G , Brush , 11 , 0 , 17 , 17 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_CreateLineBrushFromRect( 3 , 2 , 11 , 14 , "0xFF60646A" , "0xFF393B3F" , 1 , 1 )
        Gdip_FillEllipse( G , Brush , 12 , 1 , 15 , 15 )
        Gdip_DeleteBrush( Brush )
        Brush := Gdip_CreateLineBrushFromRect( 5 , 3 , 10 , 12 , "0xFF4D5055" , "0xFF36383B" , 1 , 1 )
        Gdip_FillEllipse( G , Brush , 13 , 2 , 13 , 13 )
        Gdip_DeleteBrush( Brush )
        ;Adding text
        ;-------------------------------------------------------------
        Brush := Gdip_BrushCreateSolid( This.FontColor )
        Gdip_TextToGraphics( G , This.Text , "s" This.FontSize " vCenter c" Brush " x33 y0" , This.Font , This.W-33, This.H )
        Gdip_DeleteBrush( Brush )
        ;-------------------------------------------------------------
        Gdip_DeleteGraphics( G )
        This.On_Bitmap := Gdip_CreateHBITMAPFromBitmap(pBitmap)
        Gdip_DisposeImage(pBitmap)
    }
    Switch_State(){
        (This.State:=!This.State)?(This.Draw_On()):(This.Draw_Off())
        if(This.Label)  
            gosub,% This.Label
    }
    Draw_Off(){
        SetImage( This.Hwnd , This.Off_Bitmap )
    }
    Draw_On(){
        SetImage( This.Hwnd , This.On_Bitmap )
    }
}
 
 
 
 
 
;######################################################################################################################################
;#####################################################                          #######################################################
;#####################################################        Gdip LITE         #######################################################
;#####################################################                          #######################################################
;######################################################################################################################################
; Gdip standard library v1.45 by tic (Tariq Porter) 07/09/11
; Modifed by Rseding91 using fincs 64 bit compatible Gdip library 5/1/2013
BitBlt(ddc, dx, dy, dw, dh, sdc, sx, sy, Raster=""){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdi32\BitBlt", Ptr, dDC, "int", dx, "int", dy, "int", dw, "int", dh, Ptr, sDC, "int", sx, "int", sy, "uint", Raster ? Raster : 0x00CC0020)
}
Gdip_DrawImage(pGraphics, pBitmap, dx="", dy="", dw="", dh="", sx="", sy="", sw="", sh="", Matrix=1){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    if (Matrix&1 = "")
        ImageAttr := Gdip_SetImageAttributesColorMatrix(Matrix)
    else if (Matrix != 1)
        ImageAttr := Gdip_SetImageAttributesColorMatrix("1|0|0|0|0|0|1|0|0|0|0|0|1|0|0|0|0|0|" Matrix "|0|0|0|0|0|1")
    if(sx = "" && sy = "" && sw = "" && sh = ""){
        if(dx = "" && dy = "" && dw = "" && dh = ""){
            sx := dx := 0, sy := dy := 0
            sw := dw := Gdip_GetImageWidth(pBitmap)
            sh := dh := Gdip_GetImageHeight(pBitmap)
        }else   {
            sx := sy := 0,sw := Gdip_GetImageWidth(pBitmap),sh := Gdip_GetImageHeight(pBitmap)
        }
    }
    E := DllCall("gdiplus\GdipDrawImageRectRect", Ptr, pGraphics, Ptr, pBitmap, "float", dx, "float", dy, "float", dw, "float", dh, "float", sx, "float", sy, "float", sw, "float", sh, "int", 2, Ptr, ImageAttr, Ptr, 0, Ptr, 0)
    if ImageAttr
        Gdip_DisposeImageAttributes(ImageAttr)
    return E
}
Gdip_SetImageAttributesColorMatrix(Matrix){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    VarSetCapacity(ColourMatrix, 100, 0)
    Matrix := RegExReplace(RegExReplace(Matrix, "^[^\d-\.]+([\d\.])", "$1", "", 1), "[^\d-\.]+", "|")
    StringSplit, Matrix, Matrix, |
    Loop, 25
    {
        Matrix := (Matrix%A_Index% != "") ? Matrix%A_Index% : Mod(A_Index-1, 6) ? 0 : 1
        NumPut(Matrix, ColourMatrix, (A_Index-1)*4, "float")
    }
    DllCall("gdiplus\GdipCreateImageAttributes", A_PtrSize ? "UPtr*" : "uint*", ImageAttr)
    DllCall("gdiplus\GdipSetImageAttributesColorMatrix", Ptr, ImageAttr, "int", 1, "int", 1, Ptr, &ColourMatrix, Ptr, 0, "int", 0)
    return ImageAttr
}
Gdip_GetImageWidth(pBitmap){
   DllCall("gdiplus\GdipGetImageWidth", A_PtrSize ? "UPtr" : "UInt", pBitmap, "uint*", Width)
   return Width
}
Gdip_GetImageHeight(pBitmap){
   DllCall("gdiplus\GdipGetImageHeight", A_PtrSize ? "UPtr" : "UInt", pBitmap, "uint*", Height)
   return Height
}
Gdip_DeletePen(pPen){
   return DllCall("gdiplus\GdipDeletePen", A_PtrSize ? "UPtr" : "UInt", pPen)
}
Gdip_DeleteBrush(pBrush){
   return DllCall("gdiplus\GdipDeleteBrush", A_PtrSize ? "UPtr" : "UInt", pBrush)
}
Gdip_DisposeImage(pBitmap){
   return DllCall("gdiplus\GdipDisposeImage", A_PtrSize ? "UPtr" : "UInt", pBitmap)
}
Gdip_DeleteGraphics(pGraphics){
   return DllCall("gdiplus\GdipDeleteGraphics", A_PtrSize ? "UPtr" : "UInt", pGraphics)
}
Gdip_DisposeImageAttributes(ImageAttr){
    return DllCall("gdiplus\GdipDisposeImageAttributes", A_PtrSize ? "UPtr" : "UInt", ImageAttr)
}
Gdip_DeleteFont(hFont){
   return DllCall("gdiplus\GdipDeleteFont", A_PtrSize ? "UPtr" : "UInt", hFont)
}
Gdip_DeleteStringFormat(hFormat){
   return DllCall("gdiplus\GdipDeleteStringFormat", A_PtrSize ? "UPtr" : "UInt", hFormat)
}
Gdip_DeleteFontFamily(hFamily){
   return DllCall("gdiplus\GdipDeleteFontFamily", A_PtrSize ? "UPtr" : "UInt", hFamily)
}
CreateCompatibleDC(hdc=0){
   return DllCall("CreateCompatibleDC", A_PtrSize ? "UPtr" : "UInt", hdc)
}
SelectObject(hdc, hgdiobj){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("SelectObject", Ptr, hdc, Ptr, hgdiobj)
}
DeleteObject(hObject){
   return DllCall("DeleteObject", A_PtrSize ? "UPtr" : "UInt", hObject)
}
GetDC(hwnd=0){
    return DllCall("GetDC", A_PtrSize ? "UPtr" : "UInt", hwnd)
}
GetDCEx(hwnd, flags=0, hrgnClip=0){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("GetDCEx", Ptr, hwnd, Ptr, hrgnClip, "int", flags)
}
ReleaseDC(hdc, hwnd=0){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("ReleaseDC", Ptr, hwnd, Ptr, hdc)
}
DeleteDC(hdc){
   return DllCall("DeleteDC", A_PtrSize ? "UPtr" : "UInt", hdc)
}
Gdip_SetClipRegion(pGraphics, Region, CombineMode=0){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipSetClipRegion", Ptr, pGraphics, Ptr, Region, "int", CombineMode)
}
CreateDIBSection(w, h, hdc="", bpp=32, ByRef ppvBits=0){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    hdc2 := hdc ? hdc : GetDC()
    VarSetCapacity(bi, 40, 0)
    NumPut(w, bi, 4, "uint"), NumPut(h, bi, 8, "uint"), NumPut(40, bi, 0, "uint"), NumPut(1, bi, 12, "ushort"), NumPut(0, bi, 16, "uInt"), NumPut(bpp, bi, 14, "ushort")
    hbm := DllCall("CreateDIBSection", Ptr, hdc2, Ptr, &bi, "uint", 0, A_PtrSize ? "UPtr*" : "uint*", ppvBits, Ptr, 0, "uint", 0, Ptr)
    if !hdc
        ReleaseDC(hdc2)
    return hbm
}
Gdip_GraphicsFromImage(pBitmap){
    DllCall("gdiplus\GdipGetImageGraphicsContext", A_PtrSize ? "UPtr" : "UInt", pBitmap, A_PtrSize ? "UPtr*" : "UInt*", pGraphics)
    return pGraphics
}
Gdip_GraphicsFromHDC(hdc){
    DllCall("gdiplus\GdipCreateFromHDC", A_PtrSize ? "UPtr" : "UInt", hdc, A_PtrSize ? "UPtr*" : "UInt*", pGraphics)
    return pGraphics
}
Gdip_GetDC(pGraphics){
    DllCall("gdiplus\GdipGetDC", A_PtrSize ? "UPtr" : "UInt", pGraphics, A_PtrSize ? "UPtr*" : "UInt*", hdc)
    return hdc
}
 
 
Gdip_Startup(){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    if !DllCall("GetModuleHandle", "str", "gdiplus", Ptr)
        DllCall("LoadLibrary", "str", "gdiplus")
    VarSetCapacity(si, A_PtrSize = 8 ? 24 : 16, 0), si := Chr(1)
    DllCall("gdiplus\GdiplusStartup", A_PtrSize ? "UPtr*" : "uint*", pToken, Ptr, &si, Ptr, 0)
    return pToken
}
Gdip_TextToGraphics(pGraphics, Text, Options, Font="Arial", Width="", Height="", Measure=0){
    IWidth := Width, IHeight:= Height
    RegExMatch(Options, "i)X([\-\d\.]+)(p*)", xpos)
    RegExMatch(Options, "i)Y([\-\d\.]+)(p*)", ypos)
    RegExMatch(Options, "i)W([\-\d\.]+)(p*)", Width)
    RegExMatch(Options, "i)H([\-\d\.]+)(p*)", Height)
    RegExMatch(Options, "i)C(?!(entre|enter))([a-f\d]+)", Colour)
    RegExMatch(Options, "i)Top|Up|Bottom|Down|vCentre|vCenter", vPos)
    RegExMatch(Options, "i)NoWrap", NoWrap)
    RegExMatch(Options, "i)R(\d)", Rendering)
    RegExMatch(Options, "i)S(\d+)(p*)", Size)
    if !Gdip_DeleteBrush(Gdip_CloneBrush(Colour2))
        PassBrush := 1, pBrush := Colour2
    if !(IWidth && IHeight) && (xpos2 || ypos2 || Width2 || Height2 || Size2)
        return -1
    Style := 0, Styles := "Regular|Bold|Italic|BoldItalic|Underline|Strikeout"
    Loop, Parse, Styles, |
    {
        if RegExMatch(Options, "\b" A_loopField)
        Style |= (A_LoopField != "StrikeOut") ? (A_Index-1) : 8
    }
    Align := 0, Alignments := "Near|Left|Centre|Center|Far|Right"
    Loop, Parse, Alignments, |
    {
        if RegExMatch(Options, "\b" A_loopField)
            Align |= A_Index//2.1      ; 0|0|1|1|2|2
    }
    xpos := (xpos1 != "") ? xpos2 ? IWidth*(xpos1/100) : xpos1 : 0
    ypos := (ypos1 != "") ? ypos2 ? IHeight*(ypos1/100) : ypos1 : 0
    Width := Width1 ? Width2 ? IWidth*(Width1/100) : Width1 : IWidth
    Height := Height1 ? Height2 ? IHeight*(Height1/100) : Height1 : IHeight
    if !PassBrush
        Colour := "0x" (Colour2 ? Colour2 : "ff000000")
    Rendering := ((Rendering1 >= 0) && (Rendering1 <= 5)) ? Rendering1 : 4
    Size := (Size1 > 0) ? Size2 ? IHeight*(Size1/100) : Size1 : 12
    hFamily := Gdip_FontFamilyCreate(Font)
    hFont := Gdip_FontCreate(hFamily, Size, Style)
    FormatStyle := NoWrap ? 0x4000 | 0x1000 : 0x4000
    hFormat := Gdip_StringFormatCreate(FormatStyle)
    pBrush := PassBrush ? pBrush : Gdip_BrushCreateSolid(Colour)
    if !(hFamily && hFont && hFormat && pBrush && pGraphics)
        return !pGraphics ? -2 : !hFamily ? -3 : !hFont ? -4 : !hFormat ? -5 : !pBrush ? -6 : 0
    CreateRectF(RC, xpos, ypos, Width, Height)
    Gdip_SetStringFormatAlign(hFormat, Align)
    Gdip_SetTextRenderingHint(pGraphics, Rendering)
    ReturnRC := Gdip_MeasureString(pGraphics, Text, hFont, hFormat, RC)
    if vPos
    {
        StringSplit, ReturnRC, ReturnRC, |
        if (vPos = "vCentre") || (vPos = "vCenter")
            ypos += (Height-ReturnRC4)//2
        else if (vPos = "Top") || (vPos = "Up")
            ypos := 0
        else if (vPos = "Bottom") || (vPos = "Down")
            ypos := Height-ReturnRC4
        CreateRectF(RC, xpos, ypos, Width, ReturnRC4)
        ReturnRC := Gdip_MeasureString(pGraphics, Text, hFont, hFormat, RC)
    }
    if !Measure
        E := Gdip_DrawString(pGraphics, Text, hFont, hFormat, pBrush, RC)
    if !PassBrush
        Gdip_DeleteBrush(pBrush)
    Gdip_DeleteStringFormat(hFormat)
    Gdip_DeleteFont(hFont)
    Gdip_DeleteFontFamily(hFamily)
    return E ? E : ReturnRC
}
Gdip_DrawString(pGraphics, sString, hFont, hFormat, pBrush, ByRef RectF){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    if (!A_IsUnicode)
    {
        nSize := DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sString, "int", -1, Ptr, 0, "int", 0)
        VarSetCapacity(wString, nSize*2)
        DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sString, "int", -1, Ptr, &wString, "int", nSize)
    }
    return DllCall("gdiplus\GdipDrawString", Ptr, pGraphics, Ptr, A_IsUnicode ? &sString : &wString, "int", -1, Ptr, hFont, Ptr, &RectF, Ptr, hFormat, Ptr, pBrush)
}
Gdip_CreateLineBrush(x1, y1, x2, y2, ARGB1, ARGB2, WrapMode=1){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    CreatePointF(PointF1, x1, y1), CreatePointF(PointF2, x2, y2)
    DllCall("gdiplus\GdipCreateLineBrush", Ptr, &PointF1, Ptr, &PointF2, "Uint", ARGB1, "Uint", ARGB2, "int", WrapMode, A_PtrSize ? "UPtr*" : "UInt*", LGpBrush)
    return LGpBrush
}
Gdip_CreateLineBrushFromRect(x, y, w, h, ARGB1, ARGB2, LinearGradientMode=1, WrapMode=1){
    CreateRectF(RectF, x, y, w, h)
    DllCall("gdiplus\GdipCreateLineBrushFromRect", A_PtrSize ? "UPtr" : "UInt", &RectF, "int", ARGB1, "int", ARGB2, "int", LinearGradientMode, "int", WrapMode, A_PtrSize ? "UPtr*" : "UInt*", LGpBrush)
    return LGpBrush
}
Gdip_CloneBrush(pBrush){
    DllCall("gdiplus\GdipCloneBrush", A_PtrSize ? "UPtr" : "UInt", pBrush, A_PtrSize ? "UPtr*" : "UInt*", pBrushClone)
    return pBrushClone
}
Gdip_FontFamilyCreate(Font){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    if (!A_IsUnicode)
    {
        nSize := DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &Font, "int", -1, "uint", 0, "int", 0)
        VarSetCapacity(wFont, nSize*2)
        DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &Font, "int", -1, Ptr, &wFont, "int", nSize)
    }
    DllCall("gdiplus\GdipCreateFontFamilyFromName", Ptr, A_IsUnicode ? &Font : &wFont, "uint", 0, A_PtrSize ? "UPtr*" : "UInt*", hFamily)
    return hFamily
}
Gdip_SetStringFormatAlign(hFormat, Align){
   return DllCall("gdiplus\GdipSetStringFormatAlign", A_PtrSize ? "UPtr" : "UInt", hFormat, "int", Align)
}
Gdip_StringFormatCreate(Format=0, Lang=0){
   DllCall("gdiplus\GdipCreateStringFormat", "int", Format, "int", Lang, A_PtrSize ? "UPtr*" : "UInt*", hFormat)
   return hFormat
}
Gdip_FontCreate(hFamily, Size, Style=0){
   DllCall("gdiplus\GdipCreateFont", A_PtrSize ? "UPtr" : "UInt", hFamily, "float", Size, "int", Style, "int", 0, A_PtrSize ? "UPtr*" : "UInt*", hFont)
   return hFont
}
Gdip_CreatePen(ARGB, w){
   DllCall("gdiplus\GdipCreatePen1", "UInt", ARGB, "float", w, "int", 2, A_PtrSize ? "UPtr*" : "UInt*", pPen)
   return pPen
}
Gdip_CreatePenFromBrush(pBrush, w){
    DllCall("gdiplus\GdipCreatePen2", A_PtrSize ? "UPtr" : "UInt", pBrush, "float", w, "int", 2, A_PtrSize ? "UPtr*" : "UInt*", pPen)
    return pPen
}
Gdip_BrushCreateSolid(ARGB=0xff000000){
    DllCall("gdiplus\GdipCreateSolidFill", "UInt", ARGB, A_PtrSize ? "UPtr*" : "UInt*", pBrush)
    return pBrush
}
Gdip_BrushCreateHatch(ARGBfront, ARGBback, HatchStyle=0){
    DllCall("gdiplus\GdipCreateHatchBrush", "int", HatchStyle, "UInt", ARGBfront, "UInt", ARGBback, A_PtrSize ? "UPtr*" : "UInt*", pBrush)
    return pBrush
}
CreateRectF(ByRef RectF, x, y, w, h){
   VarSetCapacity(RectF, 16)
   NumPut(x, RectF, 0, "float"), NumPut(y, RectF, 4, "float"), NumPut(w, RectF, 8, "float"), NumPut(h, RectF, 12, "float")
}
Gdip_SetTextRenderingHint(pGraphics, RenderingHint){
    return DllCall("gdiplus\GdipSetTextRenderingHint", A_PtrSize ? "UPtr" : "UInt", pGraphics, "int", RenderingHint)
}
Gdip_MeasureString(pGraphics, sString, hFont, hFormat, ByRef RectF){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    VarSetCapacity(RC, 16)
    if !A_IsUnicode
    {
        nSize := DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sString, "int", -1, "uint", 0, "int", 0)
        VarSetCapacity(wString, nSize*2)
        DllCall("MultiByteToWideChar", "uint", 0, "uint", 0, Ptr, &sString, "int", -1, Ptr, &wString, "int", nSize)
    }
    DllCall("gdiplus\GdipMeasureString", Ptr, pGraphics, Ptr, A_IsUnicode ? &sString : &wString, "int", -1, Ptr, hFont, Ptr, &RectF, Ptr, hFormat, Ptr, &RC, "uint*", Chars, "uint*", Lines)
    return &RC ? NumGet(RC, 0, "float") "|" NumGet(RC, 4, "float") "|" NumGet(RC, 8, "float") "|" NumGet(RC, 12, "float") "|" Chars "|" Lines : 0
}
CreateRect(ByRef Rect, x, y, w, h){
    VarSetCapacity(Rect, 16)
    NumPut(x, Rect, 0, "uint"), NumPut(y, Rect, 4, "uint"), NumPut(w, Rect, 8, "uint"), NumPut(h, Rect, 12, "uint")
}
CreateSizeF(ByRef SizeF, w, h){
   VarSetCapacity(SizeF, 8)
   NumPut(w, SizeF, 0, "float"), NumPut(h, SizeF, 4, "float")
}
CreatePointF(ByRef PointF, x, y){
   VarSetCapacity(PointF, 8)
   NumPut(x, PointF, 0, "float"), NumPut(y, PointF, 4, "float")
}
Gdip_DrawArc(pGraphics, pPen, x, y, w, h, StartAngle, SweepAngle){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipDrawArc", Ptr, pGraphics, Ptr, pPen, "float", x, "float", y, "float", w, "float", h, "float", StartAngle, "float", SweepAngle)
}
Gdip_DrawPie(pGraphics, pPen, x, y, w, h, StartAngle, SweepAngle){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipDrawPie", Ptr, pGraphics, Ptr, pPen, "float", x, "float", y, "float", w, "float", h, "float", StartAngle, "float", SweepAngle)
}
Gdip_DrawLine(pGraphics, pPen, x1, y1, x2, y2){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipDrawLine", Ptr, pGraphics, Ptr, pPen, "float", x1, "float", y1, "float", x2, "float", y2)
}
Gdip_DrawLines(pGraphics, pPen, Points){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    StringSplit, Points, Points, |
    VarSetCapacity(PointF, 8*Points0)
    Loop, %Points0%
    {
        StringSplit, Coord, Points%A_Index%, `,
        NumPut(Coord1, PointF, 8*(A_Index-1), "float"), NumPut(Coord2, PointF, (8*(A_Index-1))+4, "float")
    }
    return DllCall("gdiplus\GdipDrawLines", Ptr, pGraphics, Ptr, pPen, Ptr, &PointF, "int", Points0)
}
Gdip_FillRectangle(pGraphics, pBrush, x, y, w, h){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipFillRectangle", Ptr, pGraphics, Ptr, pBrush, "float", x, "float", y, "float", w, "float", h)
}
Gdip_FillRoundedRectangle(pGraphics, pBrush, x, y, w, h, r){
    Region := Gdip_GetClipRegion(pGraphics)
    Gdip_SetClipRect(pGraphics, x-r, y-r, 2*r, 2*r, 4)
    Gdip_SetClipRect(pGraphics, x+w-r, y-r, 2*r, 2*r, 4)
    Gdip_SetClipRect(pGraphics, x-r, y+h-r, 2*r, 2*r, 4)
    Gdip_SetClipRect(pGraphics, x+w-r, y+h-r, 2*r, 2*r, 4)
    E := Gdip_FillRectangle(pGraphics, pBrush, x, y, w, h)
    Gdip_SetClipRegion(pGraphics, Region, 0)
    Gdip_SetClipRect(pGraphics, x-(2*r), y+r, w+(4*r), h-(2*r), 4)
    Gdip_SetClipRect(pGraphics, x+r, y-(2*r), w-(2*r), h+(4*r), 4)
    Gdip_FillEllipse(pGraphics, pBrush, x, y, 2*r, 2*r)
    Gdip_FillEllipse(pGraphics, pBrush, x+w-(2*r), y, 2*r, 2*r)
    Gdip_FillEllipse(pGraphics, pBrush, x, y+h-(2*r), 2*r, 2*r)
    Gdip_FillEllipse(pGraphics, pBrush, x+w-(2*r), y+h-(2*r), 2*r, 2*r)
    Gdip_SetClipRegion(pGraphics, Region, 0)
    Gdip_DeleteRegion(Region)
    return E
}
Gdip_GetClipRegion(pGraphics){
    Region := Gdip_CreateRegion()
    DllCall("gdiplus\GdipGetClip", A_PtrSize ? "UPtr" : "UInt", pGraphics, "UInt*", Region)
    return Region
}
Gdip_SetClipRect(pGraphics, x, y, w, h, CombineMode=0){
   return DllCall("gdiplus\GdipSetClipRect",  A_PtrSize ? "UPtr" : "UInt", pGraphics, "float", x, "float", y, "float", w, "float", h, "int", CombineMode)
}
Gdip_SetClipPath(pGraphics, Path, CombineMode=0){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipSetClipPath", Ptr, pGraphics, Ptr, Path, "int", CombineMode)
}
Gdip_ResetClip(pGraphics){
   return DllCall("gdiplus\GdipResetClip", A_PtrSize ? "UPtr" : "UInt", pGraphics)
}
Gdip_FillEllipse(pGraphics, pBrush, x, y, w, h){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipFillEllipse", Ptr, pGraphics, Ptr, pBrush, "float", x, "float", y, "float", w, "float", h)
}
Gdip_FillRegion(pGraphics, pBrush, Region){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipFillRegion", Ptr, pGraphics, Ptr, pBrush, Ptr, Region)
}
Gdip_FillPath(pGraphics, pBrush, Path){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipFillPath", Ptr, pGraphics, Ptr, pBrush, Ptr, Path)
}
Gdip_CreateRegion(){
    DllCall("gdiplus\GdipCreateRegion", "UInt*", Region)
    return Region
}
Gdip_DeleteRegion(Region){
    return DllCall("gdiplus\GdipDeleteRegion", A_PtrSize ? "UPtr" : "UInt", Region)
}
Gdip_CreateBitmap(Width, Height, Format=0x26200A){
    DllCall("gdiplus\GdipCreateBitmapFromScan0", "int", Width, "int", Height, "int", 0, "int", Format, A_PtrSize ? "UPtr" : "UInt", 0, A_PtrSize ? "UPtr*" : "uint*", pBitmap)
    Return pBitmap
}
Gdip_SetSmoothingMode(pGraphics, SmoothingMode){
   return DllCall("gdiplus\GdipSetSmoothingMode", A_PtrSize ? "UPtr" : "UInt", pGraphics, "int", SmoothingMode)
}
Gdip_DrawRectangle(pGraphics, pPen, x, y, w, h){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipDrawRectangle", Ptr, pGraphics, Ptr, pPen, "float", x, "float", y, "float", w, "float", h)
}
Gdip_DrawRoundedRectangle(pGraphics, pPen, x, y, w, h, r){
    Gdip_SetClipRect(pGraphics, x-r, y-r, 2*r, 2*r, 4)
    Gdip_SetClipRect(pGraphics, x+w-r, y-r, 2*r, 2*r, 4)
    Gdip_SetClipRect(pGraphics, x-r, y+h-r, 2*r, 2*r, 4)
    Gdip_SetClipRect(pGraphics, x+w-r, y+h-r, 2*r, 2*r, 4)
    E := Gdip_DrawRectangle(pGraphics, pPen, x, y, w, h)
    Gdip_ResetClip(pGraphics)
    Gdip_SetClipRect(pGraphics, x-(2*r), y+r, w+(4*r), h-(2*r), 4)
    Gdip_SetClipRect(pGraphics, x+r, y-(2*r), w-(2*r), h+(4*r), 4)
    Gdip_DrawEllipse(pGraphics, pPen, x, y, 2*r, 2*r)
    Gdip_DrawEllipse(pGraphics, pPen, x+w-(2*r), y, 2*r, 2*r)
    Gdip_DrawEllipse(pGraphics, pPen, x, y+h-(2*r), 2*r, 2*r)
    Gdip_DrawEllipse(pGraphics, pPen, x+w-(2*r), y+h-(2*r), 2*r, 2*r)
    Gdip_ResetClip(pGraphics)
    return E
}
Gdip_DrawEllipse(pGraphics, pPen, x, y, w, h){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    return DllCall("gdiplus\GdipDrawEllipse", Ptr, pGraphics, Ptr, pPen, "float", x, "float", y, "float", w, "float", h)
}
Gdip_CreateHBITMAPFromBitmap(pBitmap, Background=0xffffffff){
    DllCall("gdiplus\GdipCreateHBITMAPFromBitmap", A_PtrSize ? "UPtr" : "UInt", pBitmap, A_PtrSize ? "UPtr*" : "uint*", hbm, "int", Background)
    return hbm
}
SetImage(hwnd, hBitmap){
    SendMessage, 0x172, 0x0, hBitmap,, ahk_id %hwnd%
    E := ErrorLevel
    DeleteObject(E)
    return E
}
Gdip_FillPolygon(pGraphics, pBrush, Points, FillMode=0){
    Ptr := A_PtrSize ? "UPtr" : "UInt"
    StringSplit, Points, Points, |
    VarSetCapacity(PointF, 8*Points0)
    Loop, %Points0%
    {
        StringSplit, Coord, Points%A_Index%, `,
        NumPut(Coord1, PointF, 8*(A_Index-1), "float"), NumPut(Coord2, PointF, (8*(A_Index-1))+4, "float")
    }
    return DllCall("gdiplus\GdipFillPolygon", Ptr, pGraphics, Ptr, pBrush, Ptr, &PointF, "int", Points0, "int", FillMode)
}
;#####################################################################################
; Default = 0
; LowQuality = 1
; HighQuality = 2
; Bilinear = 3
; Bicubic = 4
; NearestNeighbor = 5
; HighQualityBilinear = 6
; HighQualityBicubic = 7
Gdip_SetInterpolationMode(pGraphics, InterpolationMode)
{
   return DllCall("gdiplus\GdipSetInterpolationMode", A_PtrSize ? "UPtr" : "UInt", pGraphics, "int", InterpolationMode)
}