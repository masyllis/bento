if ( $env:DEVELUP_ENABLED -ne "true" ) {
  exit 0

}

$dl_uri = "https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi"
$dl_path = "C:\Windows\Temp\wsl_update_x64.msi"
Invoke-WebRequest -Uri $dl_uri -OutFile $dl_path -UseBasicParsing
msiexec.exe /i $dl_path /passive /qb /norestart

wsl --set-default-version 2

$dl_uri = "https://aka.ms/wslubuntu2204"
$dl_path = "C:\Windows\Temp\Ubuntu2204.AppxBundle"
Invoke-WebRequest -Uri $dl_uri -OutFile $dl_path -UseBasicParsing
Add-AppxPackage $dl_path
ubuntu.exe install --root
