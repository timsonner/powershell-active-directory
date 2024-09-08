# Import the Active Directory module (if not already imported)
Import-Module ActiveDirectory

# Get a list of all enabled users in Active Directory
$enabledUsers = Get-ADUser -Filter {Enabled -eq $true}

# Display the list of enabled users
$enabledUsers | Select-Object SamAccountName, SID
