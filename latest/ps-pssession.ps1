# Prompt the user for domain admin credentials
$credentials = Get-Credential -Message "Enter your domain admin credentials"

# Prompt the user for the domain controller name
$domainController = Read-Host -Prompt "Enter the domain controller name"

# Create a PSCredential object with the domain admin credentials
$domainAdminCredential = New-Object System.Management.Automation.PSCredential($credentials.UserName, $credentials.Password)

# Enter an interactive PowerShell session on the remote machine
Enter-PSSession -ComputerName $domainController -Credential $domainAdminCredential

# Use Exit-PSSession to exit.