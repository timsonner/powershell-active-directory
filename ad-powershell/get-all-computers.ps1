# Import the Active Directory module (if not already imported)
Import-Module ActiveDirectory

# Get a list of all computer objects (hosts) in Active Directory
$computerObjects = Get-ADComputer -Filter *

# Display the list of computer objects
$computerObjects | Select-Object Name
