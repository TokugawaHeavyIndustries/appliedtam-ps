$TAMUSERNAME = "ADMIN"
$TAMPASSWORD = "$QJFAM(4"
$wshell = New-Object -ComObject wscript.shell;
$tamfiles = ""

& "G:\WINTAM\UNLOCK32.EXE"
Sleep 5
$wshell.SendKeys($TAMUSERNAME)
$wshell.SendKeys("{TAB}")
$wshell.SendKeys($TAMPASSWORD)
Sleep 2
$wshell.SendKeys('~')
Sleep 5
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys(" ")
Sleep 2
$wshell.SendKeys(" ")
Sleep 2
$wshell.SendKeys(" ")
Sleep 2
Stop-Process -processname unlock32

& "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Applied Systems\Night Utilities.lnk"

Sleep 5
$wshell.SendKeys($TAMUSERNAME)
$wshell.SendKeys("{TAB}")
$wshell.SendKeys($TAMPASSWORD)
Sleep 2
$wshell.SendKeys('~')
Sleep 10
$wshell.SendKeys("{ALT}")
$wshell.SendKeys("R")
Sleep 5
$wshell.SendKeys('~')
