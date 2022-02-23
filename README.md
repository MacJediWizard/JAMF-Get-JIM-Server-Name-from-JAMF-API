# JAMF-Get-JIM-Server-Name-from-JAMF-API

 This will return the JIM Server name from a lookup on JAMF API

## Jamf Variable Label Names

	$4 -eq JAMF Instance URL (e.g. https://<YourJamf>.jamfcloud.com)
	$5 -eq Your JAMF API Username
	$6 -eq Your JAMF API Password

### To test or use without using JAMF Policy.
Just send 3 empty arguments to the script. See example below.

	(e.g. Function-to-Check-LDAP-User-with-API.sh empty1 empty2 empty3 $4 $5 $6)
