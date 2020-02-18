$NUScriptPath = "C:\test.ps1"

# DO NOT CHANGE ANYTHING BELOW THIS LINE

function Write-HostCenter { param($Message) Write-Host ("{0}{1}" -f (' ' * (([Math]::Max(0, $Host.UI.RawUI.BufferSize.Width / 2) - [Math]::Floor($Message.Length / 2)))), $Message) }
function Delete-ScheduledTrigger {
    $taskname = "NURerun"
    $triggerToDelete = 1
    $service = New-Object -ComObject Schedule.Service
    $service.Connect($env:COMPUTERNAME)
    $folder = $service.GetFolder('\')
    $task = $folder.GetTask($taskname)
    $definition = $task.Definition
    $numTriggers = $definition.Triggers.Count
    for($triggerId=$numTriggers; $triggerId -gt 0; $triggerId--){
        $definition.Triggers.Remove($triggerId)
        }
    $folder.RegisterTaskDefinition($task.Name, $definition, 4, $null, $null, $null)
    }

$wshell = New-Object -ComObject wscript.shell;
$date = Get-Date -DisplayHint Date
$datestring = Out-String -InputObject $date
$datefinal = $datestring -replace '(^\s+|\s+$)','' -replace '\s+',' '

$WinVer = [System.Environment]::OSVersion.Version.Major

If ($WinVer -eq 10) {
    
    }
Else {
    
    Clear-Host
    Write-Output ""
    Write-Output ""
    Write-Output ""
    Write-HostCenter "This script only works on Windows 10."
    Write-Output ""
    Write-HostCenter "Sorry!"
    Write-Output ""
    Exit

    }

Clear-Host
Write-Output ""
Write-Output ""
Write-Output ""
Write-HostCenter "Hello, today is:"
Write-Output ""
Write-HostCenter $datefinal
Write-Output ""
Write-HostCenter "Would you like to schedule a rerun of Night Utilities?"

$ReadHost = Read-Host " ( y / n ) "
Switch ($ReadHost)
    {
        Y {

        $scheduledtask = Get-ScheduledTask -TaskName "NURerun" -ErrorAction Ignore

        If ($ScheduledTask) {
            Delete-ScheduledTrigger
            $newtime = New-ScheduledTaskTrigger -Once -At 9PM
            Set-ScheduledTask -TaskName $scheduledtask.TaskName -Trigger $newtime
            Enable-ScheduledTask -TaskName $scheduledtask.TaskName
            }
        Else {
            $A = New-ScheduledTaskAction -Execute "powershell.exe" -Argument "-file $NUScriptPath"
            $T = New-ScheduledTaskTrigger -Once -At 9PM
            $P = New-ScheduledTaskPrincipal -GroupId "BUILTIN\Administrators" -RunLevel Highest
            $S = New-ScheduledTaskSettingsSet
            $D = New-ScheduledTask -Action $A -Principal $P -Trigger $T -Settings $S
            Register-ScheduledTask NURerun -InputObject $D

        }


        Clear-Host
        Write-Output ""
        Write-Output ""
        Write-Output ""
        Write-HostCenter "Ok I'm done working!"
        Write-HostCenter ""
        Write-HostCenter "This task will automatically disable itself, so you're all set."
        Write-HostCenter ""
        Write-HostCenter "Make sure all windows are closed when you disconnect."

        Pause

        }

        N {

        exit

        }

        Default {

        exit

        }

     }

exit
