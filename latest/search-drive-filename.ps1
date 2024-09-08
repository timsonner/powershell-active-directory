# Provide credentials for the mapped drive
$credentials = Get-Credential

# Read the directory path from the user
$directoryPath = Read-Host -Prompt "Enter the directory path (e.g., \\foo-server\bar folder)"

# Read the search string from the user
$searchString = Read-Host -Prompt "Enter the search string"

# Search for filenames containing the specified string
Get-ChildItem -Path "$directoryPath" -Recurse | Where-Object { $_.Name -match $searchString } | ForEach-Object { $_.FullName }
