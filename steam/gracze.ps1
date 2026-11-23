$ErrorActionPreference = 'Stop'
$gra = Get-Content -LiteralPath "steam/gra.json" -Raw | ConvertFrom-Json
$url = "https://api.steampowered.com/ISteamUserStats/GetNumberOfCurrentPlayers/v1/?appid=$($gra.appid)"

$result = Invoke-RestMethod -Uri $url -UseBasicParsing -TimeoutSec 20

Write-Host "Gra: $($gra.nazwa)"
Write-Host "Identyfikator gry (AppID): $($gra.appid)"
Write-Host "Liczba graczy online (player_count): $($result.response.player_count)"
