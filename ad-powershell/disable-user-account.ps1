# Import the Active Directory module if not already imported
Import-Module ActiveDirectory

# Prompt for the username
$UserName = Read-Host -Prompt "Enter the username"

# Disable the user account
Disable-ADAccount -Identity $username
