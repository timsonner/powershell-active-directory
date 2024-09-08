# Replace 'YourDumpbinOutput.txt' with the actual path to your dumpbin output file
$fileContent = Get-Content -Path '.\test.txt' -Raw

# Use regular expression to extract DLL names
$dllNames = [regex]::Matches($fileContent, '^\s{4}([\w\d\-_]+\.dll)', 'MultiLine') | ForEach-Object { $_.Groups[1].Value }

# Initialize lists for successful locations and errors
$successLocations = @()
$errors = @()

# Iterate through each DLL name and find its location
foreach ($dllName in $dllNames) {
    try {
        # Use Get-Command with -ErrorAction Stop to handle the error
        $dllLocation = Get-Command -Name $dllName -ErrorAction Stop | Where-Object { $_.CommandType -eq 'Application' } | Select-Object -ExpandProperty Source
        # $successLocations += "$dllName is located at: $dllLocation"
        $successLocations += "$dllLocation"

    }
    catch {
        # $errors += "Error for $($dllName): $_"
        $errors += "$($dllName)"
    }
}

# Display the lists
Write-Host "Successful Locations:"
$successLocations | ForEach-Object { Write-Host $_ }

Write-Host "`nErrors:"
$errors | ForEach-Object { Write-Host $_ }
