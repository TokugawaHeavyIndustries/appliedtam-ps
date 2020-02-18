$checkpath = "F:\Close Day Night Utiltiies Com Log\closeday_donotrun.txt"
$title = "Close Day Automation"


if ((Get-Content $checkpath) -eq $null){
    $willrun = "$false" }
    else {
    $willrun = "$true" }

Function Show-Menu
{
    param (
        [string]$Title = 'Close Day Automation' )
        Clear-Host
        
        if ($willrun -eq "false"){
            Write-Host "Close Day Automation is currently ENABLED.  Close Day WILL run automatically."
            }
        else {
            Write-Host "Close Day Automation is currently DISABLED.  Close Day WILL NOT run automatically."
            }

        Write-Host ""
        Write-Host "========== $title =========="
        
        Write-Host "1: ENABLE Close Day"
        Write-Host "2: DISABLE Close Day"
        Write-Host "Q: Quit"
}

Show-Menu
switch (Read-Host "Please make a selection") {
    '1' {
        Clear-Content $checkpath
         }
    '2' {
        "*" | Out-File $checkpath
         }
    'q' {
        }
    }
