$ErrorActionPreference = 'Stop'
$gra = Get-Content -LiteralPath "steam/gra.json" -Raw | ConvertFrom-Json

$mapa = @{
    appid        = $gra.appid
    languages    = @('all')
    num_per_page = 1
    purchase_type = 1
}
$parametry = $mapa | ConvertTo-Json -Compress

$body = @{
    input_json = $parametry
}

$url = "https://api.steampowered.com/IUserReviewsService/GetAppReviews/v1/"
$result = Invoke-RestMethod -Uri $url -Body $body -UseBasicParsing -TimeoutSec 20

Write-Host "Gra: $($gra.nazwa)"
Write-Host "Opis oceny: $($result.response.query_summary.review_score_desc)"
Write-Host "Liczba recenzji: $($result.response.query_summary.total_reviews)"
