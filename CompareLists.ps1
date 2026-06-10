# Define temporary file paths
$tempFile1 = "$env:TEMP\firstList.txt"
$tempFile2 = "$env:TEMP\secondList.txt"
$resultFile = "$env:TEMP\comparisonResult.txt"

# Function to open Notepad for user input
function Get-ListFromUser {
    param([string]$filePath, [string]$listName)

    # Ensure the file exists
    if (-not (Test-Path $filePath)) {
        New-Item -Path $filePath -ItemType File -Force | Out-Null
    } else {
        Clear-Content -Path $filePath
    }

    Write-Host "Input two lists which you want to compare to"
    Start-Process notepad.exe $filePath


    # Wait until the user closes the file
    while (Get-Process notepad -ErrorAction SilentlyContinue |Where-Object { $_.MainWindowTitle -like "*$listName*" -or $_.Path -like "*notepad.exe*" }) {
        Start-Sleep -Seconds 1
    }
    
    # Read content from file into array, trimming whitespace
    $list = Get-Content -Path $filePath | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" }
    return $list
}

# Get both lists
$list1 = Get-ListFromUser -filePath $tempFile1 -listName "first list"
$list2 = Get-ListFromUser -filePath $tempFile2 -listName "second list"

# Compare lists and get unique items in list2
$uniqueItems = $list2 | Where-Object { $_ -notin $list1 }

# Save result to result file
$uniqueItems | Set-Content -Path $resultFile

# Open result in Notepad
Start-Process notepad.exe $resultFile  
