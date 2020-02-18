$TAMUSERNAME = "un"
$TAMPASSWORD = "pw"
$wshell = New-Object -ComObject wscript.shell;


$day = (get-date).day
$month = Get-Date -Format MMMM

$commlogpath = "I:\CommLogs\" + $month + "\" + $day + "_Comlog.pdf"



& 'G:\WINTAM\WAPCO.EXE' ALERTS
Sleep 5


Sleep 5
$wshell.SendKeys('~')
Sleep 5
$wshell.SendKeys($TAMUSERNAME)
$wshell.SendKeys('{TAB}')
$wshell.SendKeys($TAMPASSWORD)
Sleep 2
$wshell.SendKeys('~')
Sleep 5

$target = "AppliedSystems.TAM.Business.CompanyInterface.ComLog"
$process = Get-Process | Where-Object {$_.ProcessName -eq $target}
while ($true)
{
while (!($process))



	{
$process = Get-Process | Where-Object {$_.ProcessName -eq $target}
start-sleep -s 45
	}
if ($process)
{
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{TAB}")
$wshell.SendKeys("{ }")

$process.WaitForExit()
start-sleep -s 

$process = Get-Process | Where-Object {$_.ProcessName -eq $target}
Sleep 15
Stop-Process -processname utilmgr
exit
}
}                   
