# Import the Active Directory module (if not already imported)
Import-Module ActiveDirectory

$UserName = Read-Host -Prompt "Enter the username"

# Prompt for the new password securely
$newPassword = Read-Host -Prompt "Enter the new password" -AsSecureString

# New-ADUser -Name "John Smith" -SamAccountName "UserName" -UserPrincipalName "UserName@domain.com" -GivenName "John" -Surname "Smith" -Enabled $true -AccountPassword (ConvertTo-SecureString "Password123" -AsPlainText -Force) -Path "OU=OUName,DC=domain,DC=com" -EmailAddress "user@domain.com"

New-ADUser -Name "John Smith" -SamAccountName $UserName -UserPrincipalName "UserName@domain.com" -GivenName "John" -Surname "Smith" -Enabled $true -AccountPassword $newPassword -Path "OU=OUName,DC=domain,DC=com" -EmailAddress "user@domain.com"