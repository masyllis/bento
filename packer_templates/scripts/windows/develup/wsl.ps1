if ( $env:DEVELUP_ENABLED -ne "true" ) {
  exit 0
}

for ($try = 0; $try -lt 5; $try++) {
    wsl --install --distribution Ubuntu --no-launch
    if ($?) { break }
    Write-Host "Failed to install WSL Ubuntu (Try #${try})"
    Start-Sleep 2
}
