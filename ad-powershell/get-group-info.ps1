# Import the Active Directory module (if not already imported)
Import-Module ActiveDirectory

# Check if the group name was provided as a command-line argument
if ($args.Count -eq 0) {
    Write-Host "Usage: .\Get-GroupMembers.ps1 <GroupName>"
    exit
}

# Retrieve the group name from the command-line arguments
$groupName = $args[0]


# Get the group based on the provided group name
$group = Get-ADGroup -Filter {Name -eq $groupName}

# Check if the group was found
# if ($group -eq $null) {
#     Write-Host "Group '$groupName' not found."
#     exit
# }

# Display information about the group
# $group | Select-Object Name, SamAccountName, Description, GroupCategory, GroupScope, Members

# Get and display the members of the group
$groupMembers = Get-ADGroupMember -Identity $group

# Display information about the group members
$groupMembers | Select-Object Name, SamAccountName, ObjectClass
