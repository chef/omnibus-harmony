# Stop script execution when a non-terminating error occurs
$ErrorActionPreference = "Stop"

Write-Output "--- Checking Ruby"
C:\opt\harmony\embedded\bin\ruby --version
If (C:\opt\harmony\embedded\bin\ruby --version | Select-String -Quiet -Pattern "ruby [0-9]\.[0-9]\.[0-9]") {
  Write-Output "ruby version found"
}
Else {
  Write-Output "ERROR: ruby version not found"
  exit 1
}
