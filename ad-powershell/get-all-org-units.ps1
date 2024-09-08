# Import the Active Directory module if not already imported
Import-Module ActiveDirectory

# List all OUs in the domain
Get-ADOrganizationalUnit -Filter * | Select-Object Name, DistinguishedName
