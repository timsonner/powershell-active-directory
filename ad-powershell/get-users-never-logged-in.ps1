# Import the Active Directory module (if not already imported)
Import-Module ActiveDirectory

# Retrieve last login information for all users
$users = Get-ADUser -Filter * -Properties LastLogonTimestamp,Enabled,Description |
         Select-Object Name, SamAccountName, LastLogonTimestamp, Enabled, Description

# Filter out users who have never logged in (LastLogonTimestamp is null) and who are enabled
$neverLoggedInUsers = $users | Where-Object { $_.LastLogonTimestamp -eq $null -and $_.Enabled -eq $true }

# Display the list of users who have never logged in along with their descriptions
$neverLoggedInUsers | Format-Table -AutoSize
