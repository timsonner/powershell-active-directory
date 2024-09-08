# Import the Active Directory module if not already imported
Import-Module ActiveDirectory

# Determine the full path to the script directory
$scriptDirectory = [System.IO.Path]::GetDirectoryName($MyInvocation.MyCommand.Path)

# Specify the path to the file containing usernames (relative to the script directory)
$usernamesFile = Join-Path -Path $scriptDirectory -ChildPath "users.txt"

# Uncomment to loop every x seconds
# while ($true) {

    # Check if the usernames file exists
    if (Test-Path $usernamesFile) {
        # Read the usernames from the file, one username per line
        $usernames = Get-Content $usernamesFile

        foreach ($username in $usernames) {
            # Trim any leading or trailing whitespace from each username
            $username = $username.Trim()

            # Unlock the user account
            Unlock-ADAccount -Identity $username
            Write-Host "Unlocked account: $username"
        }
    }
    else {
        Write-Host "Usernames file not found: $usernamesFile"
    }
    # Uncomment to loop every x seconds
    # Wait 30 seconds before the next iteration
#     Start-Sleep -Seconds 30
# }
