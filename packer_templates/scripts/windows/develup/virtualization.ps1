if ( $env:DEVELUP_ENABLED -ne "true" ) {
  exit 0
}

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# Hyper-V is required for using Windows containers with Docker
dism.exe /online /enable-feature /featurename:Microsoft-Hyper-V /all /norestart
dism.exe /online /enable-feature /featurename:Containers /all /norestart

if ($LASTEXITCODE -eq 3010) {
  exit 0
}