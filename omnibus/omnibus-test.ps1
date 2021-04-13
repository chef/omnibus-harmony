# Stop script execution when a non-terminating error occurs
$ErrorActionPreference = "Stop"

$channel = "$Env:CHANNEL"
If ([string]::IsNullOrEmpty($channel)) { $channel = "unstable" }

$product = "$Env:PRODUCT"
If ([string]::IsNullOrEmpty($product)) { $product = "harmony" }

$version = "$Env:VERSION"
If ([string]::IsNullOrEmpty($version)) { $version = "latest" }

$package_file = "$Env:PACKAGE_FILE"
If ([string]::IsNullOrEmpty($package_file)) { $package_file = "" }

Write-Output "--- Installing $channel $product $version"
If ($package_file = "") {
  $package_file = $(.omnibus-buildkite-plugin\install-omnibus-product.ps1 -Product "$product" -Channel "$channel" -Version "$version" | Select-Object -Last 1)
} 
Else {
  $package_file = $(.omnibus-buildkite-plugin\install-omnibus-product.ps1 -Package_file "$package_file" -Product "$product" -Version "$version" | Select-Object -Last 1)
}

Write-Output "--- Verifying omnibus package is signed"
C:\opscode\omnibus-toolchain\bin\check-omnibus-package-signed.ps1 "$package_file"

Write-Output "--- Testing $channel $product $version"
If (C:\harmony\embedded\bin\openssl version | Select-String -Quiet -Pattern "OpenSSL [0-9]\.[0-9]\.[0-9][a-z]") {
  Write-Output "openssl version found"
}
Else {
  Write-Output "ERROR: openssl version not found"
  exit 1
}
