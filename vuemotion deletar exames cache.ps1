$disk=Get-WmiObject Win32_LogicalDisk -Filter "DeviceID='E:'" | Foreach-Object {$_.FreeSpace}
if ($disk -lt 40000000000){
dir E:\PortalCachedFiles\SavedStudies | where { ((get-date)-$_.lastwriteTime).days -gt 20 } | remove-item -force
dir E:\PortalCachedFiles\SavedStudies\zip | where { ((get-date)-$_.lastwriteTime).days -gt 20 } | remove-item -force
Send-MailMessage -to email@email.com.br -From "Alerta VUEMOTION <ti@email.com.br>" -Subject "Alerta de espaço em disco" -Body "Exames em cache por mais de 20 dias foram deletados" -SmtpServer 172.21.20.21
}
else
{
Send-MailMessage -to email@email.com.br -From "Alerta VUEMOTION <ti@email.com.br>" -Subject "VUEMOTION De buenas!!" -SmtpServer 172.21.20.21
}

