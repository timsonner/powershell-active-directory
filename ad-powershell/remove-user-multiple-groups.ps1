# Import the Active Directory module (if not already imported)
Import-Module ActiveDirectory

# Prompt for the username
$UserName = Read-Host -Prompt "Enter the username"

# Remove user from groups
$GroupNames = "1", "2", "etc"
foreach ($GroupName in $GroupNames) {
    Remove-ADGroupMember -Identity $GroupName -Members $UserName
}

