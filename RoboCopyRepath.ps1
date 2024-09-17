# Define source and destination paths
$source1 = "\\fileserva\Kommon\AMANDA7_PROD"
$destination1 = "\\abbotsford.loc\AppData\Amanda\AMANDA7_PROD"

$source = "\\fileserva\AppData\Amanda\A7PRD"
$destination = "\\abbotsford.loc\AppData\Amanda\A7PRD"

# Use Robocopy with /MIR and /COPY:DAT to mirror the contents without changing permissions
# /MIR: Mirrors the directory (equivalent to /E + /PURGE)
# /COPY:DAT: Copies data, attributes, and timestamps, but leaves permissions (and other security settings) untouched
# /R:3 and /W:5 retry 3 times and wait 5 seconds between retries (customizable)
# /LOG:C:\robocopy_log.txt logs the operation to a file (optional)


Write-Host "Robocopy starts for $source and $destination on $(Get-Date)" 
#robocopy $source $destination /MIR /COPY:DAT /MT:16 /XO /R:3 /W:5 /LOG:C:\Temp\robocopy_A7PRD_log.txt
robocopy $source $destination /MIR /COPY:DAT /MT:16 /R:3 /W:5 /LOG:C:\Temp\robocopy_A7PRD_log.txt
Write-Host "Robocopy completed for $source and $destination on $(Get-Date)" 


Write-Host "Robocopy starts for $source and $destination on $(Get-Date)" 
#robocopy $source1 $destination1 /MIR /COPY:DAT /MT:16 /XO /R:3 /W:5 /LOG:C:\Temp\robocopy_Amanda7_log.txt
robocopy $source1 $destination1 /MIR /COPY:DAT /MT:16 /R:3 /W:5 /LOG:C:\Temp\robocopy_Amanda7_log.txt
Write-Host "Robocopy completed for $source1 and $destination1 on $(Get-Date)" 