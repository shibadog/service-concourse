$pwd = $(Get-Location)
$scriptPath = $MyInvocation.MyCommand.Path
Set-Location $(Split-Path -Parent $scriptPath)

docker run --rm -v "$(Get-Location)/web:/keys" concourse/concourse `
  generate-key -t rsa -f /keys/session_signing_key

docker run --rm -v "$(Get-Location)/web:/keys" concourse/concourse `
  generate-key -t ssh -f /keys/tsa_host_key

docker run --rm -v "$(Get-Location)/worker:/keys" concourse/concourse `
  generate-key -t ssh -f /keys/worker_key

Copy-Item ./worker/worker_key.pub ./web/authorized_worker_keys
Copy-Item ./web/tsa_host_key.pub ./worker

Set-Location $pwd
