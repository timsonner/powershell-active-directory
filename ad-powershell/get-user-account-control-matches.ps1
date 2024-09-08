# Import the Active Directory module (if not already imported)
Import-Module ActiveDirectory

# Define descriptions for each userAccountControl value
$descriptions = @{
    512     = "Normal Account (typical user account without any special settings)."
    514     = "Disabled Account (indicates that the user account is disabled)."
    66048   = "Password Never Expires (the user's password does not expire)."
    66050   = "Password Change Required (the user must change their password at the next logon)."
    66082   = "Account Disabled, Password Change Required."
    262656  = "Account Disabled, Password Never Expires."
    262658  = "Account Disabled, Password Change Required, Password Never Expires."
    16      = "Locked Out Account (user account is locked due to too many failed login attempts)."
    65536   = "Dont Expire Password (user's password does not expire)."
    524288  = "Trusted for Delegation (user account is trusted for Kerberos delegation)."
}

# Check if there is a valid argument
if ($args.Count -eq 1) {
    $AccountControlValue = [int]$args[0]
    if ($descriptions.ContainsKey($AccountControlValue)) {
        Write-Host ("Description for userAccountControl value $($AccountControlValue):")
        Write-Host $descriptions[$AccountControlValue]
        Write-Host ""

        # Get a list of user accounts based on the specified userAccountControl value
        $Results = Get-ADUser -LDAPFilter "(userAccountControl:1.2.840.113556.1.4.803:=$AccountControlValue)"

        if ($Results.Count -eq 0) {
            Write-Host "No user accounts found with userAccountControl value $AccountControlValue."
        } else {
            $Results | Select-Object Name, SamAccountName
        }
    } else {
        Write-Host "Invalid userAccountControl value specified. Please use a valid value from the set."
    }
} else {
    Write-Host "Usage: .\Get-UserByAccountControl.ps1 <userAccountControlValue>"
    Write-Host "Example: .\Get-UserByAccountControl.ps1 512"
    Write-Host ""
    Write-Host "Available userAccountControl values and descriptions:"
    $descriptions.GetEnumerator() | ForEach-Object { Write-Host "$($_.Key): $($_.Value)" }
}
