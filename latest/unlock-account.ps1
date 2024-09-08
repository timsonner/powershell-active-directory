# Import the Active Directory module
Import-Module ActiveDirectory

# Get credentials
$credential = Get-Credential

# Unlock user account
Unlock-ADAccount -Identity "<username>" -Credential $credential
