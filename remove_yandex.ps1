$file = "dashboard.html"
$content = [System.IO.File]::ReadAllText($file)
$content = $content.Replace('<script src="https://api-maps.yandex.ru/2.1/?lang=uz_UZ" type="text/javascript"></script>', '')
[System.IO.File]::WriteAllText($file, $content)
