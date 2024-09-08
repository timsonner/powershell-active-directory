# Import the Active Directory module (if not already imported)
Import-Module ActiveDirectory

# Get a list of all groups in Active Directory
$groups = Get-ADGroup -Filter *

# Display the list of groups
$groups | Select-Object Name, SamAccountName
