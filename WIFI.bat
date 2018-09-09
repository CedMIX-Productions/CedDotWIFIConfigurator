echo off
cls
set testtitle=WiFi util for Windows (tm) by CedMIX Productions
cls
goto mainmenu


:mainmenu
title %testtitle% - Select your option
cls
echo m     m   "    mmmmmm   "                    m      "    ""#
echo #  #  # mmm    #      mmm           m   m  mm#mm  mmm      #
echo " #"# #   #    #mmmmm   #           #   #    #      #      #
echo  ## ##"   #    #        #           #   #    #      #      #
echo  #   #  mm#mm  #      mm#mm         "mm"#    "mm  mm#mm    "mm
echo Please choose your action for your wifi needs (more options soon!)
echo [1] for showing your wifi adpater properties
echo [2] for showing your AP properties
echo [3] for showing your WIFI PASSWORDS
echo [4] to CHANGE your AP prirority either Auto or Manual
echo [5] to DELETE APs (THIS CANNOT BE UNDONE)
echo [6] to Backup and Restore all of your WIFI configs
echo [7] to Generate wireless adapter report
echo [8] for Wifi DIAGNOSTICS
echo [9] for Credit Information
echo [10] to check current ip configuration
echo [11] to QUIT
echo Created by CedMIX Productions
echo e-mail: tg15ced.paltep@gmail.com
set input=
set /p input= Choose option:
if %input%==1 goto drvprop if NOT goto mainmenu
if %input%==2 goto approp if NOT goto mainmenu
if %input%==3 goto wifipsk if NOT goto mainmenu
if %input%==4 goto appriror if NOT goto mainmenu
if %input%==5 goto delap if NOT goto mainmenu
if %input%==6 goto bkupundres2r if NOT goto mainmenu
if %input%==7 goto apstat if NOT goto mainmenu
if %input%==8 goto wifidiag if NOT goto mainmenu
if %input%==9 goto credits if NOT goto mainmenu
if %input%==10 goto ipstat if NOT goto mainmenu
if %input%==11 goto quit if NOT goto mainmenu

:ipstat
title %testtitle% - Showing your current IP Information:
cls
echo on
ipconfig /all
echo off
echo ####################
echo Press any key to return to main menu
echo ####################
pause
echo off
goto mainmenu


:approp
title %testtitle% - Showing your access point properties:
cls
echo on
netsh wlan show profiles
ipconfig /all
echo off
echo ####################
echo Press any key to return to main menu
echo ####################
pause
echo off
goto mainmenu

:drvprop
title %testtitle% - Showing your wifi driver properties:
cls
echo on
netsh wlan show drivers
echo off
echo ####################
echo Press any key to return to main menu
echo ####################
pause
echo off
goto mainmenu

:wifipsk
title %testtitle% - Showing ALL preconnected APs
cls
echo on
netsh wlan show profiles
echo off
echo ####################
echo ENTER SSID
echo Protip: Use double quotation ("<anything>") with SSIDs with spaces :)
set ssidname=
set /p ssidname= Please type your selected SSID here (case sensitive):
title %testtitle% - Showing WIFI PASSWORD
echo on
netsh wlan show profile name=%ssidname% key=clear
echo off
echo Tip: search for a line called "Key Content" (that contains your password)
echo ####################
echo Press any key to return to main menu
echo ####################
pause
echo off
goto mainmenu

:appriror
title %testtitle% - AutoConnect option for AP
cls
echo Please choose your action to whether connect your wifi adapter automatically or manually
echo [1] Set connection mode to AUTOMATIC
echo [2] Set connection mode to MANUAL
set apauto=
set /p apauto= Choose option:
if %apauto%==1 goto autoap if NOT goto appriror
if %apauto%==2 goto manap if NOT goto appriror

:manap
title %testtitle% - Showing ALL preconnected APs
cls
echo Please select your AP of choice to change the setting to MANUAL:
echo on
netsh wlan show profiles
echo off
echo ####################
echo ENTER SSID
echo Protip: Use double quotation ("<anything>") with SSIDs with spaces :)
set ssidname=
set /p ssidname= Please type your selected SSID here (case sensitive):
title %testtitle% - Changing to MANUAL mode...
echo on
Netsh WLAN set profileparameter name="%ssidname%" connectionmode=manual
echo off
title %testtitle% - SSID set to manual
echo The ssid name %ssidname% has connection mode set to manual
echo ####################
echo Press any key to return to main menu
echo ####################
pause
echo off
goto mainmenu

:autoap
title %testtitle% - Showing ALL preconnected APs
cls
echo Please select your AP of choice to change the setting to AUTO:
echo on
netsh wlan show profiles
echo off
echo ####################
echo ENTER SSID
echo Protip: Use double quotation ("<anything>") with SSIDs with spaces :)
set ssidname=
set /p ssidname= Please type your selected SSID here (case sensitive):
title %testtitle% - Changing to AUTOMATIC mode...
echo on
Netsh WLAN set profileparameter name="%ssidname%" connectionmode=auto
echo off
title %testtitle% - SSID set to auto
echo The ssid name %ssidname% has connection mode set to auto
echo ####################
echo Press any key to return to main menu
echo ####################
pause
echo off
goto mainmenu

:delap
title %testtitle% - Delete for AP
cls
echo WARNING: THIS WILL DELETE A WIFI PROFILE! If you don't want to delete your ap
echo type 2 to return to the main menu 
echo DO YOU WANT TO CONTINUE DELETING YOUR WIRELESS AP?
echo [1] YES (delete ap)
echo [2] NO (return to main menu)
set rmap=
set /p rmap= Choose option:
if %rmap%==1 goto delap_1 if NOT goto delap
if %rmap%==2 goto mainmenu if NOT goto mainmenu

:delap_1
title %testtitle% - Showing ALL preconnected APs
cls
echo Please select your AP of choice to DELETE:
echo on
netsh wlan show profiles
echo off
echo ####################
echo ENTER SSID
echo Protip: Use double quotation ("<anything>") with SSIDs with spaces :)
set ssidname=
set /p ssidname= Please type your selected SSID here (case sensitive):
title %testtitle% - Are you sure to DELETE your WIRELESS AP?
echo Are you sure to DELETE your WIRELESS AP?
echo THIS ACTION CANNOT BE UNDONE!
echo [1] YES (confirm delete)
echo [2] NO (cancel and go back to main menu)
set delurap=
set /p delurap= Choose option:
if %delurap%==1 goto delap_2 if NOT goto delap_2
if %delurap%==2 goto mainmenu if NOT goto mainmenu
:delap_2
echo on
Netsh WLAN delete profile name="%ssidname%"
echo off
title %testtitle% - SSID PERMANENTLY DELETED
echo The ssid name %ssidname% has deleted
echo ####################
echo Press any key to return to main menu
echo ####################
pause
echo off
goto mainmenu

:bkupundres2r
title %testtitle% - Backup and Restore for WIFI utility for Windows (tm)
cls
echo Please choose your action to whether backup or restore your wifi settings
echo [1] BACKUP your WIFI settings
echo [2] RESTORE your WIFI settings
set bkupap=
set /p bkupap= Choose option:
if %bkupap%==1 goto bkupwifi if NOT goto bkupundres2r
if %bkupap%==2 goto res2rwifi if NOT goto bkupundres2r

:bkupwifi
title %testtitle% - Backing up wifi config
cls
set backupdir=%systemdrive%\WIFI_Backup
if exist "%systemdrive%\WIFI_Backup" (goto bkupwifi2) else (goto nobkupwifi)
:nobkupwifi
mkdir "%backupdir%"
goto bkupwifi2
:bkupwifi2
echo on
Netsh WLAN export profile key=clear folder="%backupdir%"
echo off
title %testtitle% - Backup complete to %backupdir%
echo Your wifi backup files are at %backupdir%
echo ####################
echo Press any key to return to main menu
echo ####################
pause
echo off
goto mainmenu

:res2rwifi
title %testtitle% - Restore wifi config
cls
echo off
echo Please type the directory of your backup directory:
echo For noobs: use the tab key to instantly fill the directory you want to choose
echo (e.g. "C:\WIFI_Backup")
set /p restoreapdir=
pushd %restoreapdir%
echo loading directory of %restoreapdir%
dir %restoreapdir% /w
echo.
echo Please select the SSID Name you want to restore:
echo TIP: The naming scheme of these files are only the following:
echo For noobs: use the tab key to instantly fill the *.xml file
echo "Wi-Fi-<ssidname>.xml"
set /p restoreapxml=
echo on
Netsh WLAN add profile filename="%restoreapxml%"
echo off
title %testtitle% - Restore wifi config complete
echo Your wifi config are restored
echo ####################
echo Press any key to return to main menu
echo ####################
pause
echo off
popd
goto mainmenu

:apstat
title %testtitle% - AP stat generator
cls
echo off
echo Please wait while creating the WIFI report
Netsh WLAN show WLANreport
title %testtitle% - AP stat generated
echo Opening report now!
start C:\ProgramData\Microsoft\Windows\WLANReport\WLAN-report-latest.html
echo ####################
echo Press any key to return to main menu
echo ####################
pause
echo off
goto mainmenu

:credits
title %testtitle% - Credits!
cls
echo This batch program is made by Cedie Paltep at CedMIX Productions
echo Check out his Batch AntiVirus at Github!
echo at https://github.com/CedMIX-Productions/CedBatch-Virus-Remover
echo If you have questions and/or bugs feel free to contact me in Github or in GMAIL
echo tg15ced.paltep@gmail.com
echo ####################
echo Press any key to return to main menu
echo ####################
pause
echo off
goto mainmenu

:wifidiag
title %testtitle% - Wifi DIAGNOSTICS
echo off
cls
date /t
time /t
echo Pls run in admin mode first!!
pause
cls
goto wifidiag_1
:wifidiag_1
title %testtitle% - Wifi DIAGNOSTICS (detecting OS)
echo Detecting Windows(tm) operating system
cls
for /f %%i in ('ver^|find "5.1."') do set OS=Windows XP&& set osrecognized=1
for /f %%i in ('ver^|find "5.2."') do set OS=Windows 2003&& set osrecognized=1
for /f %%i in ('ver^|find "6.0."') do set OS=Windows Vista&& set osrecognized=2
for /f %%i in ('ver^|find "6.1."') do set OS=Windows 7&& set osrecognized=2
for /f %%i in ('ver^|find "6.2."') do set OS=Windows 8&& set osrecognized=2
for /f %%i in ('ver^|find "6.3."') do set OS=Windows 8.1&& set osrecognized=2
for /f %%i in ('ver^|find "10."')  do set OS=Windows 10&& set osrecognized=2
if "%osrecognized%"=="2" (goto advdiag) ^
else (goto legacydiag)


:advdiag
title %testtitle% - Wifi DIAGNOSTICS (Windows 7/8.x/10 Mode)
echo Current OS: Windows(tm) Vista/7/8.1/10
echo IP DUMPER Load options:
choice /c ab /m "Press A for IP flusher, Press B for MS NET Diagnostics"
IF ERRORLEVEL 1 IF NOT ERRORLEVEL 2 goto ipflush
IF ERRORLEVEL 2 goto msnetdt

:legacydiag
title %testtitle% - Wifi DIAGNOSTICS (Windows XP/Server 2003)
echo Current OS: Windows(tm) XP/Server 2003
echo Ipflusher will load instead...
pause
goto ipflush

:ipflush
title %testtitle% - Wifi DIAGNOSTICS (Diagnosing using IPCONFIG)
echo Check IP address
ipconfig /all
echo.
pause
echo Release IP Address
ipconfig /release
echo.
echo Renew IP Address
ipconfig /renew
echo.
echo Flush DNS
ipconfig /flushdns
echo.
echo Renew DNS
ipconfig /registerdns
echo.
goto fin

:msnetdt
echo Check IP address
ipconfig /all
echo.
pause
title %testtitle% - Wifi DIAGNOSTICS (Diagnosing using NetMSDT)
echo Loading MS NET DIAGNOSTICS
echo *Please Wait*
msdt -skip TRUE -path %systemroot%\diagnostics\system\networking -ep NetworkDiagnosticPNI
goto fin

:fin
cls
title %testtitle% - Wifi DIAGNOSTICS (Network test)
echo Executing autoping portable:
echo date and time taken:
date /t
time /t
echo Pinging Windows Update Servers
echo Server 1: update.microsoft.com
ping -a update.microsoft.com
echo Server 2: download.windowsupdate.com
ping -a download.windowsupdate.com
echo Pinging speedtest.net
ping -a speedtest.net
echo Pinging dns.google.com
ping -a dns.google.com
echo Pinging youtube.com
ping -a youtube.com
echo Done!
title %testtitle% - Diagnostic complete :)
echo ####################
echo Press any key to return to main menu
echo ####################
pause
echo off
goto mainmenu

:quit
title %testtitle% - Quitting program
title Command Prompt
cls
echo Microsoft Windows [Version 10.0.17134.228]&echo (c) 2018 Microsoft Corporation. All rights reserved.