$NightLogPath = "G:\TAM\SAV\NIGHTLOG.ERR"
$SMTPServer = "192.168.0.240"
$From = "Email@example.com"
$To = "Email2@example.net"
$Agency = "Agency"
$DBSCANPath = "G:\LOG\DBSCAN.CUR"
$commlogpath = "F:\Close Day Night Utiltiies Com Log\" + $year + $shortmonth + $day + "*"


#Variables above this line are user configurable.  Please do not change settings below this line.


$day = (get-date).day
$month = Get-Date -Format MMMM
$year = (Get-Date).year
$shortdate = Get-Date -format MM/dd/yyyy
$shortmonth = Get-Date -Format MM

$Subject = "CommLog Status"
if (Get-ChildItem $commlogpath){$commlogexists = $true} else {$commlogexists = $false}
If ($commlogexists -eq $true){$Message = 'CommLogs ran OK at', $Agency | out-string}
Else {$Message = 'CommLogs FAILED at', $Agency | out-string}
If ($commlogexists -eq $true){$Priority = 'Normal'}
Else {$Priority = 'High'}

Send-MailMessage -From $From -To $To -Subject $Subject -Body $Message -SmtpServer $SMTPServer -priority $priority


# Next block is for nightlog

$BlockText = select-string -path $nightlogpath -pattern $shortdate -allmatches | Out-String
$Lasttenlines = (Get-Content $NightLogPath)[-10 .. -1]

If ($BlockText -like '*Error 32*') {
    $nody = "Error 32 at", $Agency, "Night Utilities", "", "Nightlog output:", "", $BlockText | Out-String
    $priorityy = "High"
    }
Elseif ($BlockText -like '*Error 0*') {
    $nody = "Error 0 at", $Agency, "Night Utilities", "", "Nightlog output:", "", $BlockText | Out-String
    }
Elseif ($BlockText -like '*Error 64*') {
    $nody = "Error 64 at", $Agency, "Night Utilities", "", "Nightlog output:", "", $BlockText | Out-String
    }
Elseif ($BlockText -eq "$null") {
    $nody = "Night Utilities DID NOT RUN at", $Agency, "", "Last ten lines of Nightlog:", "", $Lasttenlines | Out-String
    $priorityy = "High"
    }
Else {
    $nody = "Night utilities went ok at", $Agency, "", "", "Nightlog output:", $BlockText | Out-String
    $priorityy = "Normal"
    }

$Subjectn = "NightUtilities Status"

Send-MailMessage -From $From -To $To -Subject $Subjectn -Body $nody -SmtpServer $SMTPServer -Priority $priorityy


# Next block is for DBScan detection

$DBBlockText = select-string -path $DBSCANPath -pattern "One or more data files require attention" -allmatches | Out-String

if ($DBBlockText -eq "$null") { 

$Subjectnn = "Shifted Records OK"
$nnody = "No Shifted Records detected at " + $Agency + ".  All good."
$priorityyy = "Normal"

 }
 
else { 

$Subjectnn = "Shifted Records Detected"
$nnody = "Shifted Records Detected.  Please contact the Policy Department at Applied to assist."
$priorityyy = "High"

 }
 
Send-MailMessage -From $From -To $To -Subject $Subjectnn -Body $nnody -SmtpServer $SMTPServer -Priority $priorityyy
