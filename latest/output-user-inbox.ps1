# Create an Outlook application object
$outlook = New-Object -ComObject Outlook.Application

# Get the Inbox folder
$inbox = $outlook.Session.GetDefaultFolder(6) # 6 corresponds to olFolderInbox

Write-Host "Inbox:", $inbox

# Copy items from the Inbox to the PST file
foreach ($item in $inbox.Items) {
    Write-Host "Subject: $($item.Subject)"
    write-host "Body: $($item.Body)"
}

# Release COM objects
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($inbox) | Out-Null
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($outlook) | Out-Null
[System.GC]::Collect()
[System.GC]::WaitForPendingFinalizers()

# Options for GetDefaultFolder() method:

# olFolderDeletedItems (Deleted Items): GetDefaultFolder(3)
# olFolderOutbox (Outbox): GetDefaultFolder(4)
# olFolderSentMail (Sent Items): GetDefaultFolder(5)
# olFolderInbox (Inbox): GetDefaultFolder(6)
# olFolderCalendar (Calendar): GetDefaultFolder(9)
# olFolderContacts (Contacts): GetDefaultFolder(10)
# olFolderJournal (Journal): GetDefaultFolder(11)
# olFolderNotes (Notes): GetDefaultFolder(12)
# olFolderTasks (Tasks): GetDefaultFolder(13)
# olFolderDrafts (Drafts): GetDefaultFolder(16)
# olFolderJunk (Junk Email): GetDefaultFolder(23)
# olFolderConflicts (Conflicts): GetDefaultFolder(19)
# olFolderSyncIssues (Sync Issues): GetDefaultFolder(17)
# olFolderLocalFailures (Local Failures): GetDefaultFolder(18)
# olFolderServerFailures (Server Failures): GetDefaultFolder(20)
# olFolderRSSFeeds (RSS Feeds): GetDefaultFolder(25)
# olPublicFoldersAllPublicFolders (All Public Folders): GetDefaultFolder(18)
# olFolderManagedEmail (Managed Email): GetDefaultFolder(28)
# olFolderRssSubscriptions (RSS Subscriptions): GetDefaultFolder(27)