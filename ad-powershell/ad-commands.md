# Active Directory Commands  

## Invoke command on server  
```  
Invoke-Command -ComputerName <Hostname> -Credential <Domain\user>  
```  

## Create PowerShell session on server  
```  
Enter-PSSession -ComputerName <Hostname> -Credential <Domain\user>

```  

## Add user to group  
```
Add-ADGroupMember -Identity "GroupName" -Members "UserName"
```

## Remove user from group  
```
Remove-ADGroupMember -Identity "GroupName" -Members "UserName"
```  

## Get group members  
```
Get-ADGroupMember -Identity "GroupName"
```  

## Remove user from DC  
```
Remove-ADUser -Identity "UserName" -Confirm:$false
```  
## Unlock account  
```
Unlock-ADAccount -Identity "UserName"
```  

## User has to reset password  
```  
Set-ADUser -Identity "UserName" -ChangePasswordAtLogon $false
```  

## User must change password on next login
```
Set-ADUser -Identity "UserName" -ChangePasswordAtLogon $true
```

## Set the password to never expire  
```
Set-ADUser -Identity "UserName" -PasswordNeverExpires $true
```  




