$checkpath = "F:\Close Day Night Utiltiies Com Log\closeday_donotrun.txt"

If ((Get-Content $checkpath) -eq $null) {

$TAMUSERNAME = "ADMIN"
$TAMPASSWORD = "AN%A9vn2"
$wshell = New-Object -ComObject wscript.shell;

$day = (Get-Date).day
$month = Get-Date -Format MM
$year = Get-Date -Format yyyy
$dayofweek = (Get-Date).DayOfWeek

if ($dayofweek -eq "Friday"){
$tomorrowday = $day + 3 }
else { $tomorrowday = $day + 1 }


& "C:\Users\Administrator\Desktop\Applied TAM.lnk"

Sleep 10

$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")

Sleep 5

$wshell.SendKeys($TAMUSERNAME)
Sleep 5
$wshell.SendKeys("{TAB}")
$wshell.SendKeys($TAMPASSWORD)
$wshell.SendKeys("~")
Sleep 5
$wshell.SendKeys("~")

Sleep 15

$wshell.SendKeys("{TAB}")
$wshell.SendKeys(" ")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys(" ")

Sleep 15

$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys(" ")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys(" ")

Sleep 15

$wshell.SendKeys("{TAB}")
$wshell.SendKeys($month)
Sleep 5
$wshell.SendKeys($tomorrowday)
Sleep 5
$wshell.SendKeys($year)
Sleep 2
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys(" ")

Sleep 15

$wshell.SendKeys(" ")
$wshell.SendKeys($month)
Sleep 2
$wshell.SendKeys($tomorrowday)
Sleep 2
$wshell.SendKeys($year)
Sleep 2
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys(" ")

Sleep 30

$wshell.SendKeys("~")

Sleep 30

$wshell.SendKeys("~")

Sleep 20

$wshell.SendKeys("~")

Sleep 20

$wshell.SendKeys("~")

Sleep 20

$wshell.SendKeys("~")

Sleep 20

$wshell.SendKeys("~")

Sleep 20

Stop-Process -processname AppliedSystems.Tam.Client.General.Closeday
Stop-Process -processname Homebase

}

else

{ 

}
