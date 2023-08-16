$checkservice = get-service wuauserv
if ($checkservice.Status -eq "Running"){
stop-service wuauserv; set-service -StartupType Disabled wuauserv; get-service wuauserv}
else {
echo "service is not running"}

