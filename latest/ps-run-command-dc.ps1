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

    Get-PSSession | Format-Table ComputerName, InstanceID
   
}

# Close the session when done
Remove-PSSession $session
