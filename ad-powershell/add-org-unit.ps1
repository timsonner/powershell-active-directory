# Import the Active Directory module if not already imported
Import-Module ActiveDirectory

# Specify the name of the new OU and its parent OU (if any)
$ouName = "NewOU"
$rootOU = "DC=domain,DC=com"

# Create the new OU in the root of the domain
New-ADOrganizationalUnit -Name $ouName -Path $rootOU

# Create new OU in Parent OU
# New-ADOrganizationalUnit -Name $ouName -Path $parentOU
# $parentOU = "OU=ParentOU,DC=domain,DC=com"  # Replace with the DN of the parent OU or root domain if it's a top-level OU
