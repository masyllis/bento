# Install Chocolatey
(new-object net.webclient).DownloadFile('https://chocolatey.org/install.ps1', 'C:\Windows\Temp\install.ps1')

$env:chocolateyUseWindowsCompression = 'false'
for ($try = 0; $try -lt 5; $try++) {
  & C:/Windows/Temp/install.ps1
  if ($?) { break }
  if (Test-Path C:\ProgramData\chocolatey) { break }
  Write-Host "Failed to install chocolatey (Try #${try})"
  Start-Sleep 2
}

# Install with chocolatey
choco install -y `
  7zip.install `
  cmake.install `
  docker-desktop `
  firefox `
  git `
  googlechrome `
  neovim `
  ninja `
  notepadplusplus.install `
  python311 `
  python38 `
  ruby.install `
  vim `
  vscode.install

choco install -y visualstudio2022professional
choco install -y visualstudio2022-workload-nativedesktop `
  --package-parameters `
  "--productId Microsoft.VisualStudio.Product.Professional --channelId VisualStudio.17.Release --includeRecommended --includeOptional"
choco install -y visualstudio2022-remotetools visualstudio2022-workload-nativecrossplat

# Install WSL
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
wsl --set-default-version 2
wsl --install -d Ubuntu-18.04 --no-launch
wsl --install -d Ubuntu-20.04 --no-launch
wsl --install -d Ubuntu-22.04 --no-launch