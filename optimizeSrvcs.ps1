$chkSrvcs = get-service wuauserv, vaultsvc, upnphost, ssdpsrv, policyagent, ikeext, fontcache, fdrespub, fdphost
if ($chkSrvcs.Status -eq "Running"){
echo "stopping services:"; stop-service fdphost, fdrespub, fontcache, ikeext, policyagent, ssdpsrv, upnphost, vaultsvc;
get-service fdphost, fdrespub, fontcache, ikeext, policyagent, ssdpsrv, upnphost, vaultsvc
}
else {
echo "services are not running"
}
