# Import the Active Directory module (if not already imported)
Import-Module ActiveDirectory

# Get all users and filter based on account enabled
Get-ADUser -Filter {Enabled -eq $false}