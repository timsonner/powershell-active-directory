# Import the Active Directory module if not already imported
Import-Module ActiveDirectory

# Prompt for the username
$UserName = Read-Host -Prompt "Enter the username"

# Prompt for the new password securely
$newPassword = Read-Host -Prompt "Enter the new password" -AsSecureString

# Reset the user's password
Set-ADAccountPassword -Identity $UserName -NewPassword $newPassword -Reset
