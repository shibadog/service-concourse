# $ipaddress = [system.net.dns]::GetHostAddresses((hostname)) | `
#     Where-Object { $_.AddressFamily -eq "InterNetwork" } | `
#     Select-Object -ExpandProperty IPAddressToString -First 1

$ipaddress = hostname

$env:CONCOURSE_EXTERNAL_URL = "http://${ipaddress}:8080"
Write-Output $env:CONCOURSE_EXTERNAL_URL
docker-compose up -d
