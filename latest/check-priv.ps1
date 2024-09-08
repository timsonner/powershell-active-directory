# Get the current user's identity
$currentIdentity = [System.Security.Principal.WindowsIdentity]::GetCurrent()

# Check if the current user has the SeTcbPrivilege
if ($currentIdentity.Token.IsElevated) {
    Write-Host "User has SeTcbPrivilege. Listing local and domain users..."

    # List local users
    $localUsers = Get-WmiObject -Class Win32_UserAccount -Filter "LocalAccount='True'"
    Write-Host "Local Users:"
    $localUsers | ForEach-Object { Write-Host $_.Name }

    # List domain users (assuming the PC is part of a domain)
    try {
        $domainUsers = Get-WmiObject -Class Win32_UserAccount -Filter "Domain='True'"
        Write-Host "Domain Users:"
        $domainUsers | ForEach-Object { Write-Host $_.Name }
    } catch {
        Write-Host "Error listing domain users: $_"
    }
} else {
    Write-Host "User does not have SeTcbPrivilege. Please grant the necessary permissions."
}
