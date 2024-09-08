# Possible events: 4625, 4740

# Specify the name or IP address of the remote computer
$remoteComputer = "x.x.x.x"

# Construct an XPath query to filter account lockout events
$filterXPath = @"
<QueryList>
  <Query Id="0" Path="Security">
    <Select Path="Security">
      *[System[(EventID=4740)]]
    </Select>
  </Query>
</QueryList>
"@

# Retrieve account lockout events from the remote computer's Security log
$lockoutEvents = Get-WinEvent -LogName "Security" -ComputerName $remoteComputer -FilterXPath $filterXPath

# Loop through and display detailed information for each lockout event
foreach ($event in $lockoutEvents) {
    Write-Output "Event ID: $($event.Id)"
    Write-Output "Time Created: $($event.TimeCreated)"
    Write-Output "Message:"
    $event.Message
    Write-Output "-------------------------------------------------------"
}
