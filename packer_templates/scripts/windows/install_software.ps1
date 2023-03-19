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

# Install WSL
wsl --install --no-launch

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

choco install -y `
  visualstudio2022professional
choco install -y `
  visualstudio2022buildtools `
  visualstudio2022-remotetools `
  visualstudio2022-workload-nativecrossplat `
  visualstudio2022-workload-nativedesktop
choco install -y visualstudio2022-workload-nativedesktop `
  --package-parameters `
  "--productId Microsoft.VisualStudio.Product.Professional --channelId VisualStudio.17.Release --includeRecommended --includeOptional"