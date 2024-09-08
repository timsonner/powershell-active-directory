# Prompt the user for domain admin credentials
$credentials = Get-Credential -Message "Enter your domain admin credentials"

# Prompt the user for the domain controller name
$domainController = Read-Host -Prompt "Enter the domain controller name"

# Create a PSCredential object with the domain admin credentials
$domainAdminCredential = New-Object System.Management.Automation.PSCredential($credentials.UserName, $credentials.Password)

# Run commands with domain admin privileges
$session = New-PSSession -ComputerName $domainController -Credential $domainAdminCredential

# Example command to run as domain admin
Invoke-Command -Session $session -ScriptBlock {

# Display menu
function Show-Menu {
    Clear-Host
    Write-Host "===== Active Directory Admin Menu ====="
    Write-Host "1. Reset User Password"
    Write-Host "2. Add User to Group"
    Write-Host "3. Remove User from Group"
    Write-Host "4. Unlock User Account"
    Write-Host "5. Create New User"
    Write-Host "6. Disable User Account"
    Write-Host "7. Enable User Account"
    Write-Host "8. Move User to OU"
    Write-Host "9. Get User Information"
    Write-Host "10. List Group Members"
    Write-Host "11. Get Status of All Locked Accounts"
    Write-Host "12. View All Groups"
    Write-Host "13. Force Password Reset at Next Logon"
    Write-Host "14. Get All OUs"
    Write-Host "15. Exit"
}

# Function to reset user password
function Reset-UserPassword {
    $username = Read-Host "Enter the username"
    $newPassword = Read-Host "Enter the new password" -AsSecureString
    Set-ADAccountPassword -Identity $username -NewPassword $newPassword -Reset
}

# Function to add user to group
function Add-UserToGroup {
    $username = Read-Host "Enter the username"
    $groupName = Read-Host "Enter the group name"
    Add-ADGroupMember -Identity $groupName -Members $username
}

# Function to remove user from group
function Remove-UserFromGroup {
    $username = Read-Host "Enter the username"
    $groupName = Read-Host "Enter the group name"
    Remove-ADGroupMember -Identity $groupName -Members $username
}

# Function to unlock user account
function Unlock-UserAccount {
    $username = Read-Host "Enter the username"
    Unlock-ADAccount -Identity $username
}

# Function to create a new user
function New-ADUser {
    $username = Read-Host "Enter the new username"
    $password = Read-Host "Enter the password" -AsSecureString
    $firstname = Read-Host "Enter the first name"
    $lastname = Read-Host "Enter the last name"
    $ou = Read-Host "Enter the Organizational Unit (OU)"
    $email = Read-Host "Enter the email address"

    $otherAttributes = @{
        'EmailAddress' = $email
    }

    New-ADUser -SamAccountName $username -GivenName $firstname -Surname $lastname -Name "$firstname $lastname" -EmailAddress $email -Enabled $true -AccountPassword $password -Path $ou -OtherAttributes $otherAttributes
}

# Function to disable user account
function Disable-UserAccount {
    $username = Read-Host "Enter the username"
    Disable-ADAccount -Identity $username
    Write-Host "User account '$username' has been disabled."
}

# Function to enable user account
function Enable-UserAccount {
    $username = Read-Host "Enter the username"
    Enable-ADAccount -Identity $username
    Write-Host "User account '$username' has been enabled."
}

# Function to move user to a different OU
function Move-UserToOU {
    $username = Read-Host "Enter the username"
    $newOU = Read-Host "Enter the new Organizational Unit (OU)"
    Get-ADUser -Identity $username | Move-ADObject -TargetPath $newOU
}

# Function to get user information
function Get-UserInfo {
    $username = Read-Host "Enter the username"
    Get-ADUser -Identity $username | Select-Object SamAccountName, Name, GivenName, Surname, EmailAddress, Enabled
}

# Function to list group members
function Get-GroupMembers {
    $groupName = Read-Host "Enter the group name"
    Get-ADGroupMember -Identity $groupName
}

# Function to get status of all locked accounts
function Get-LockedAccountStatus {
    Search-ADAccount -LockedOut | Select-Object SamAccountName, LockedOut
}


# Function to view all groups
function Get-AllGroups {
    Get-ADGroup -Filter *
}

# Function to force password reset at next logon
function Set-PasswordReset {
    $username = Read-Host "Enter the username"
    Set-ADUser -Identity $username -ChangePasswordAtLogon $true
    Write-Host "Password reset will be required at the next logon for user: $username"
}

# Function to get all OUs
function Get-AllOUs {
    Get-ADOrganizationalUnit -Filter *
}

# Main loop
while ($true) {
    Show-Menu
    $choice = Read-Host "Enter your choice"

    switch ($choice) {
        1 { Reset-UserPassword }
        2 { Add-UserToGroup }
        3 { Remove-UserFromGroup }
        4 { Unlock-UserAccount }
        5 { New-ADUser }
        6 { Disable-UserAccount }
        7 { Enable-UserAccount }
        8 { Move-UserToOU }
        9 { Get-UserInfo }
        10 { Get-GroupMembers }
        11 { Get-LockedAccountStatus }
        12 { Get-AllGroups }
        13 { Set-PasswordReset }
        14 { Get-AllOUs }
        15 { return }
        default { Write-Host "Invalid choice. Please enter a valid option." }
    }

    # Pause to display results and wait for user input
    Read-Host "Press Enter to continue..."
}
    
}

# Close the session when done
Remove-PSSession $session
