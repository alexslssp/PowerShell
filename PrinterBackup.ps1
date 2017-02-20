$mailserver = x.x.x.x
$momento=get-date -uformat "%Y_%m_%d"
foreach ($server in get-content c:\printservers.ini) {
#Lista simples dentro do arquivo ini
C:\Windows\System32\spool\tools\PrintBrm.exe -B -S $server -F c:\BAckup_servers\BKP_"$server"_"$momento"
if ($error -ne $null){
    Send-MailMessage `
    -From ti.infra@cdb.com.br `
    -To ti.infra@cdb.com.br `
    -Subject "Erros no backup dos servidores de impressão" `
    -Body "$error" `
    -SmtpServer $mailserver
    }
}
