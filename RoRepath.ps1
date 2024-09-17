# Define the common base paths for the source and destination
$sourceBase = "\\fileserva\appdata\Amanda\"
$destinationBase = "\\abbotsford.loc\AppData\Amanda\"

# Define an array of folder suffixes
$folderSuffixes = @("A7TST", "A7PRD", "A7DEV")  # Add or modify folder names as needed

# Loop through each folder suffix and mirror the source to the destination
foreach ($suffix in $folderSuffixes) {
    # Construct the full source and destination paths
    $source = Join-Path $sourceBase $suffix
    $destination = Join-Path $destinationBase $suffix
    
    # Output the current operation to the console for tracking
    Write-Host "Mirroring $source to $destination on $(Get-Date)" 

    # Execute the Robocopy command
    #robocopy $source $destination /MIR /COPY:DAT /R:3 /W:5 /LOG:C:\Temp\robocopy_$suffix.txt
    robocopy $source $destination /MIR /COPY:DAT /MT:16 /XO /R:3 /W:5 /LOG:C:\robocopy_$suffix.txt


    Write-Host "Robocopy completed for $suffix on $(Get-Date)"    

    # Check the exit code of Robocopy (0 means success)
    if ($LASTEXITCODE -gt 8) {
        Write-Host "Robocopy encountered a serious error with $suffix." -ForegroundColor Red
    }
    elseif ($LASTEXITCODE -gt 0) {
        Write-Host "Robocopy completed with warnings or retryable errors for $suffix." -ForegroundColor Yellow
    }
    else {
        Write-Host "Robocopy completed successfully for $suffix." -ForegroundColor Green
    }
}

Write-Host "Done"