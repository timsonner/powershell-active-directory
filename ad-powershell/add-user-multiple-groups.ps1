# Import the Active Directory module (if not already imported)
Import-Module ActiveDirectory

# Prompt for the username
$UserName = Read-Host -Prompt "Enter the username"

$GroupNames = "1", "2", "etc"
foreach ($GroupName in $GroupNames) {
    Add-ADGroupMember -Identity $GroupName -Members $UserName
}