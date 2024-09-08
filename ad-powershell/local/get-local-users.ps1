# Get local user accounts using Get-CimInstance
$localUsers = Get-CimInstance Win32_UserAccount -Filter "LocalAccount='True'"

# Display properties of each local user
foreach ($user in $localUsers) {
    # Write-Host "$($user)"
    # Write-Host "$($user.Domain)"
    Write-Host "Username: $($user.Caption)"
    Write-Host "Full Name: $($user.FullName)"
    Write-Host "Description: $($user.Description)"
    Write-Host "SID: $($user.SID)"
    Write-Host "Disabled: $($user.Disabled)"
    Write-Host "Password Expires: $($user.PasswordExpires)"
    Write-Host "Last Logon: $($user.LastLogin)"
    Write-Host "----------------------------------------"
}
