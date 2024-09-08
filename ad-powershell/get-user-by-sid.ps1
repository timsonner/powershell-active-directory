# Import the Active Directory module if not already imported
Import-Module ActiveDirectory

# Prompt for the username
$sid = Read-Host -Prompt "Enter the user's SID:"

# Get the user by SID
$user = Get-ADUser -Filter {ObjectSID -eq $sid}

# Display user information
$user
