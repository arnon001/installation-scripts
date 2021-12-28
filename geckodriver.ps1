$ProgressPreference='SilentlyContinue'

Write-Host "Finding OS Architecture: " -ForegroundColor DarkCyan -NoNewline
# Find Os Architecture
if((Get-ComputerInfo).OsArchitecture -eq "64-bit"){
    $arch = "*win64*"
    Write-Host "64-bit" -ForegroundColor Green
}else{
    $arch = "*win32*"
    Write-Host "32-bit" -ForegroundColor Green
}

Write-Host "Making Temp Directory: " -ForegroundColor DarkCyan -NoNewline
# Generate random 10 char string
$tmp = -join (((48..57) + (65..90) + (97..122)) * 120 | Get-Random -Count 10 | ForEach-Object {[char]$_})
# Make temp directory
$tmpDir = "$env:TEMP\tmp.$tmp"
mkdir $tmpDir *>$null
Write-Host "$tmpDir" -ForegroundColor Green

Write-Host "Downloading zip: " -ForegroundColor DarkCyan -NoNewline
# Download zip
$tmpLocation = "$tmpDir\geckodriver.zip"
$downloadUrl = (((Invoke-WebRequest -Uri "https://api.github.com/repos/mozilla/geckodriver/releases/latest" -UseBasicParsing).content | ConvertFrom-Json).assets | Where-Object name -Like $arch).browser_download_url
Invoke-WebRequest -Uri $downloadUrl -OutFile $tmpLocation -UseBasicParsing
Write-Host "Done!" -ForegroundColor Green

Write-Host "Extracting exe: " -ForegroundColor DarkCyan -NoNewline
# Unzip
Expand-Archive -LiteralPath $tmpLocation -DestinationPath $tmpDir
Write-Host "Done!" -ForegroundColor Green

Write-Host "Checking if gecodriver already exists: " -ForegroundColor DarkCyan -NoNewline
$installDir = "$env:APPDATA\geckodriver"
$shouldCopy = $true
if(Test-Path "$installDir\geckodriver.exe"){
    Write-Host "gecodriver already exists" -ForegroundColor DarkYellow
    Write-Host "Checking file hashes: " -ForegroundColor DarkCyan -NoNewline
    if((Get-FileHash "$installDir\geckodriver.exe").hash -eq (Get-FileHash "$tmpDir\geckodriver.exe").hash){
        Write-Host "Hashes match!" -ForegroundColor DarkYellow
        $shouldCopy = $false
    }else{
        Write-Host "Hashes doesn't match" -ForegroundColor Green
        Write-Host "Removing old exe: " -ForegroundColor DarkCyan -NoNewline
        Remove-Item -LiteralPath "$installDir\geckodriver.exe" -Force
        Write-Host "Done!" -ForegroundColor Green
    }
}else{
    Write-Host "gecodriver doesn't exist" -ForegroundColor Green
    Write-Host "Creating install directory in AppData: " -ForegroundColor DarkCyan -NoNewline
    if(!(Test-Path $installDir)){
        mkdir $installDir *>$null
    }
    Write-Host "Done!" -ForegroundColor Green
}

if($shouldCopy){
    # Copy exe from temp directory to install directory
    Write-Host "Copying exe: " -ForegroundColor DarkCyan -NoNewline
    Copy-Item -LiteralPath "$tmpDir\geckodriver.exe" -Destination "$installDir\geckodriver.exe"
    Write-Host "Done!" -ForegroundColor Green
}

Write-Host "Cleaning Up: " -ForegroundColor DarkCyan -NoNewline
# Clean Up
Remove-Item -LiteralPath $tmpDir -Force -Recurse
Write-Host "Done!" -ForegroundColor Green

Write-Host "Adding gecodriver to Path: " -ForegroundColor DarkCyan -NoNewline
# Adding gecodriver to Path
$userPath = [System.Environment]::GetEnvironmentVariable("Path", "User")
if($userPath -like "*;$installDir*"){
    Write-Host "gecodriver already in Path" -ForegroundColor DarkYellow
}else{
    [System.Environment]::SetEnvironmentVariable("Path", "$userPath;$installDir", "User")
    Write-Host "Done!" -ForegroundColor Green

    Write-Host "Updating session Path: " -ForegroundColor DarkCyan -NoNewline
    # Update session Path
    $env:Path = "$env:Path;$installDir"
    Write-Host "Done!" -ForegroundColor Green
}
