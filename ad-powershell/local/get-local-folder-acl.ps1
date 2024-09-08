$FolderPath = "C:\windows\system32" # Replace with the actual path

# Get folder permissions
$FolderACL = Get-Acl -Path $FolderPath
$FolderACL.Access | Format-Table IdentityReference, FileSystemRights




