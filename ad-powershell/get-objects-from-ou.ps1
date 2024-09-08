# Import the Active Directory module if not already imported
Import-Module ActiveDirectory

# Prompt for the OU name
$OUName = Read-Host -Prompt "Enter the OU"

# Prompt for the domain name
$DomainName = Read-Host -Prompt "Enter the Domain"

# Specify the DN of the OU you want to query
$ouDN = "OU=$OUName,DC=$DomainName,DC=com"  # Replace with the DN of the OU in your domain

# Retrieve all objects within the specified OU
Get-ADObject -Filter * -SearchBase $ouDN
