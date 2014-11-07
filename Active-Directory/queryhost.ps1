param([string]$computer)
if ($computer -eq ""){$computer = read-host "Enter hostname or IP"}

Clear

Write-Host "System Info:"
Write-Host "------------------------" 
Gwmi Win32_ComputerSystem -Comp $computer | fl Domain, Manufacturer, Model, Name, UserName, Status
$colItems = GWMI -cl "Win32_NetworkAdapterConfiguration" -name "root\CimV2" `
-comp $computer -filter "IpEnabled = TRUE"
 
ForEach ($objItem in $colItems){
Write-Host "MAC Address: " $objItem.MacAddress
Write-Host "IP Address: " $objItem.IpAddress}
Write-Host ""
