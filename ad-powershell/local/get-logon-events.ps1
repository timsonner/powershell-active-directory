# Get recent logon events
$LogonEvents = Get-WinEvent -FilterHashtable @{
    LogName = 'Security'
    ID = 4624  # Logon events
} -MaxEvents 10  # You can adjust the number of events to retrieve

# Display relevant logon information
foreach ($event in $LogonEvents) {
    $event.Message
    Write-Host "----------------------------------------"
}
