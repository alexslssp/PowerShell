param(
 [String]$server="10.20.0.43",
 [String]$port=4004
)
$socket = new-object Net.Sockets.TcpClient
$socket.Connect($server, $port)

if ($socket.Connected) {
$status = "Open"
$socket.Close()
}
else {
$status = "Not Open"
}

$status
