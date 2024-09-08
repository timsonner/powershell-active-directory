# Get the current Windows identity
$currentIdentity = [System.Security.Principal.WindowsIdentity]::GetCurrent()

# Display the current user's privileges
$currentIdentity.Groups | ForEach-Object {
    $_.Translate([System.Security.Principal.NTAccount]).Value
}
