# Stop script execution when a non-terminating error occurs
$ErrorActionPreference = "Stop"

Write-Output "--- Checking OpenSSL"
If (C:\opt\harmony\embedded\bin\openssl version | Select-String -Quiet -Pattern "OpenSSL [0-9]\.[0-9]\.[0-9][a-z]") {
  Write-Output "openssl version found"
}
Else {
  Write-Output "ERROR: openssl version not found"
  exit 1
}
