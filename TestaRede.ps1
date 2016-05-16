$i=1
$cpt=0
$pong=$true
while ($i -eq 1){
while ($pong -eq $true){
cls
date
Write-Output "Status da interface de rede: ok"
Write-Output "Total de falhas no interface: $cpt"
$pong=Test-Connection 172.21.0.1 -Quiet
}
while ($pong -eq $false){
Write-Output "Iniciando Tarefa"
Get-Date >> Eventos.txt
netsh interface set interface "Local Area Connection 4" DISABLED
Start-Sleep -Seconds 3
netsh interface set interface "Local Area Connection 4" ENABLED
Start-Sleep -Seconds 3
& "C:\Program Files\Kodak\System5\Portal\scripts\portal_stop.bat"
Start-Sleep 5
& "C:\Program Files\Kodak\System5\Portal\scripts\portal_start.bat"
Send-MailMessage -to ti.infra@cdb.com.br -From "Alerta CDB <ti@cdb.com.br>" -Subject "Parada e reinicio automatico do VUE Motion" -SmtpServer mail.cdb.com.br -BodyAsHtml (Get-Content ".\subject.html" | Out-String)
$cpt=$cpt+1
#Send-MailMessage -to ti.infra@cdb.com.br 1 -BodyAsHtml (Get-Content ".\subject.html" | Out-String)
$pong=Test-Connection 172.21.0.1 -Quiet}
}
