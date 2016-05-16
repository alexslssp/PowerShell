$disk=Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='E:'" | Foreach-Object {$_.FreeSpace}
if ($disk -lt 40000000000){
dir E:\PortalCachedFiles\SavedStudies | where { ((get-date)-$_.lastwriteTime).days -gt 20 } | remove-item -force
dir E:\PortalCachedFiles\SavedStudies\zip | where { ((get-date)-$_.lastwriteTime).days -gt 20 } | remove-item -force
Send-MailMessage -to ti.infra@cdb.com.br -From "Alerta VUEMOTION <ti@cdb.com.br>" -Subject "Alerta de espaço em disco" -Body "Exames em cache por mais de 20 dias foram deletados" -SmtpServer 172.21.20.21
}
else
{
Send-MailMessage -to alex.silva@cdb.com.br -From "Alerta VUEMOTION <ti@cdb.com.br>" -Subject "VUEMOTION De buenas!!" -SmtpServer 172.21.20.21
}

