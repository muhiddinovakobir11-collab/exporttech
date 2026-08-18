$clientId = "178c6fc778ccc68e1d6a"
$deviceCode = "f33f72a52f456326de6d9b4cc8d370e3ad3a896b"
$repoName = "exporttech"

$tokenUrl = "https://github.com/login/oauth/access_token"
$tokenBody = @{
    client_id = $clientId
    device_code = $deviceCode
    grant_type = "urn:ietf:params:oauth:grant-type:device_code"
}

Write-Host "Kutish boshlandi... Iltimos brauzerda kodni kiriting."
$token = $null

for ($i = 0; $i -lt 180; $i++) {
    Start-Sleep -Seconds 5
    $response = Invoke-RestMethod -Uri $tokenUrl -Method Post -Body $tokenBody -Headers @{ "Accept" = "application/json" }
    
    if ($response.access_token) {
        $token = $response.access_token
        Write-Host "Ajoyib! Avtorizatsiya muvaffaqiyatli yakunlandi."
        break
    } elseif ($response.error -eq "authorization_pending") {
        Write-Host "Hali ham tasdiqlanmadi, kutilmoqda..."
    } else {
        Write-Host "Xatolik yoki vaqt tugadi: $($response.error)"
        exit
    }
}

if (-not $token) {
    Write-Host "Avtorizatsiya amalga oshmadi."
    exit
}

# 1. Create Repository
$headers = @{
    "Authorization" = "token $token"
    "Accept" = "application/vnd.github.v3+json"
}
$createRepoBody = @{
    name = $repoName
    description = "ExportTech Dashboard"
    private = $false
} | ConvertTo-Json

Write-Host "Yangi loyiha GitHubda yaratilmoqda..."
try {
    $repoResponse = Invoke-RestMethod -Uri "https://api.github.com/user/repos" -Method Post -Body $createRepoBody -Headers $headers -ContentType "application/json"
    $username = $repoResponse.owner.login
    Write-Host "Loyiha yaratildi: $($repoResponse.html_url)"
} catch {
    Write-Host "Loyiha allaqachon mavjud bo'lishi mumkin yoki xatolik: $_"
    # To get the username if repo creation fails (assuming it already exists)
    $userResponse = Invoke-RestMethod -Uri "https://api.github.com/user" -Method Get -Headers $headers
    $username = $userResponse.login
}

# 2. Push Code
$gitPath = "C:\Users\Akobir\AppData\Local\GitHubDesktop\app-3.6.3\resources\app\git\cmd\git.exe"
$env:PATH += ";C:\Users\Akobir\AppData\Local\GitHubDesktop\app-3.6.3\resources\app\git\cmd"

Write-Host "Kodlar yuklanmoqda..."
& $gitPath remote remove origin 2>$null
& $gitPath remote add origin "https://x-access-token:$token@github.com/$username/$repoName.git"
& $gitPath push -u origin master --force

# 3. Enable GitHub Pages
Write-Host "GitHub Pages (Sayt) yoqilmoqda..."
$pagesBody = @{
    source = @{
        branch = "master"
        path = "/"
    }
} | ConvertTo-Json

try {
    Invoke-RestMethod -Uri "https://api.github.com/repos/$username/$repoName/pages" -Method Post -Body $pagesBody -Headers $headers -ContentType "application/json"
} catch {
    Write-Host "Pages yoqishda kichik xatolik (allaqachon yoqilgan bo'lishi mumkin): $_"
}

Write-Host "====== TAYYOR ======"
Write-Host "Sizning saytingiz tayyorlanmoqda. U quyidagi manzilda ishlaydi:"
Write-Host "https://$username.github.io/$repoName/"
