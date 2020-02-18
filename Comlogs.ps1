$TAMPASSWORD = "f4c91n45"
$tamdrive = "G"
$commlogpath = "I:\CommLogs\" + $month + "\" + $day + "_Comlog.pdf"

$wshell = New-Object -ComObject wscript.shell;

$day = (get-date).day
$month = Get-Date -Format MMMM

& ${tamdrive}:\WINTAM\utilmgr.exe

Sleep 5
$wshell.SendKeys($TAMPASSWORD)
Sleep 2
$wshell.SendKeys('{TAB}')
$wshell.SendKeys('{TAB}')
$wshell.SendKeys('~')
Sleep 5

$utilver = (Get-Item ${tamdrive}:\WINTAM\utilmgr.exe).VersionInfo.FileVersion

If ($utilver = "19.0"){
    & C:\WINTAM\AppliedSystems.TAM.CompanyInterface.Stub.exe Batch_Transmit
    }
else {
    & '${tamdrive}:\Wintam\WAPCO.exe' IVANS
    }

Sleep 2
$wshell.SendKeys('~')

Sleep 2    

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
$wshell.SendKeys("{ }")

$process.WaitForExit()
start-sleep -s 

$process = Get-Process | Where-Object {$_.ProcessName -eq $target}
Sleep 15
Stop-Process -processname utilmgr
exit
}
}                   
