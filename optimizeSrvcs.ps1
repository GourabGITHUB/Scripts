#creating variable to store names of the services 

 $Srvcs = "vaultsvc", "upnphost", "ssdpsrv","policyagent","ikeext","fontcache", "fdrespub", "fdphost","vss","wuauserv"

#looping through each service

foreach ($Srvc in $Srvcs){

#creating second variable to call the get-service command

$SrvcStatus = get-service $Srvc

#If else statement to check and stop running services 

	if($SrvcStatus.Status -eq "Running"){
 echo stoping $Srvc
 Stop-Service -f $Srvc
}
	else {
 echo $Srvc is not running
}
}