# Import the Active Directory module (if not already imported)
Import-Module ActiveDirectory

# Prompt for the username
$UserName = Read-Host -Prompt "Enter the username"

# Get the user's groups
$UserGroups = Get-ADPrincipalGroupMembership -Identity $UserName

# Remove user from groups
foreach ($Group in $UserGroups) {
    Remove-ADGroupMember -Identity $Group -Members $UserName -Confirm:$false
}
