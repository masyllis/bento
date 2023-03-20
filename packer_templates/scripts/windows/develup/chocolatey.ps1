if ( $env:DEVELUP_ENABLED -ne "true" ) {
  exit 0
}

# Install Chocolatey package manager
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
  docker-desktop `
  googlechrome `
  ninja `
  notepadplusplus.install `
  python311 `
  python38 `
  ruby.install

choco install -y cmake.install --installArgs "ADD_CMAKE_TO_PATH=System DESKTOP_SHORTCUT_REQUESTED=0 ALLUSERS=1"
choco install -y firefox --params "/NoDesktopShortcuts /NoTaskbarShortcut /NoMaintenanceService /RemoveDistributionDir /NoAutoUpdate"
choco install -y git.install --params "/NoAutoCrlf /SChannel"
choco install -y neovim --params "/NeovimOnPathForAll"
choco install -y vim --params "/NoDesktopShortcuts"
choco install -y vscode.install --params "/NoDesktopIcon"

# Visual Studio must be installed before tools or workloads
choco install -y visualstudio2022professional
# Workloads installed with args also need to be installed first
choco install -y visualstudio2022-workload-nativedesktop `
  --package-parameters `
  "--productId Microsoft.VisualStudio.Product.Professional --channelId VisualStudio.17.Release --includeRecommended --includeOptional"
choco install -y visualstudio2022-remotetools visualstudio2022-workload-nativecrossplat
