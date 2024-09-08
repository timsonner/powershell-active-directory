# Import the Active Directory module if not already imported
Import-Module ActiveDirectory

# Search for locked user accounts
$lockedAccounts = Search-ADAccount -LockedOut

# Display the locked user accounts
$lockedAccounts | Format-Table Name, SamAccountName, DistinguishedName
