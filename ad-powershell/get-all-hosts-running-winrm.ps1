# Import the Active Directory module (if not already imported)
Import-Module ActiveDirectory

# Define the base IP address and the range of host numbers (e.g., 1 to 254)
$baseIP = "x.x.x."
$startHostNumber = 1
$endHostNumber = 254

# Loop through the range of host numbers and check WinRM availability
for ($i = $startHostNumber; $i -le $endHostNumber; $i++) {
    $computer = "$baseIP$i"
    if (Test-WSMan -ComputerName $computer -ErrorAction SilentlyContinue) {
        Write-Host "WinRM is running on $computer"
    } else {
        # Write-Host "WinRM is not running on $computer"
    }
}
