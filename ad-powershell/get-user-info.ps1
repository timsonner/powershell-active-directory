# Import the Active Directory module if not already imported
Import-Module ActiveDirectory

# Prompt for the username
$UserName = Read-Host -Prompt "Enter the username"

# Get information about the user
$user = Get-ADUser -Identity $UserName -Properties *

# Display all user properties
$user | Format-List *
