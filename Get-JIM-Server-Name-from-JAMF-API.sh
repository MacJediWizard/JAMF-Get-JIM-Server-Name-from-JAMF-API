#!/bin/bash

##########################################################################################
# General Information
##########################################################################################
#
#	Script created By William Grzybowski February 22, 2022
#
#	Version 1.0	- Initial Creation of Script.
#
#	This Script will get the JIM Server name from jamf API request. 
#
#	Jamf Variable Label Names
#
#	$4 -eq JAMF Instance URL (e.g. https://<YourJamf>.jamfcloud.com)
#	$5 -eq Your JAMF API Username
#	$6 -eq Your JAMF API Password
#
#	To test or use without using JAMF Policy you can just send 3 empty arguments 
#	to the script. See example below.
#	(e.g. Get-JIM-Server-Name-from-JAMF-API.sh empty1 empty2 empty3 $4 $5 $6)
#
##########################################################################################


##########################################################################################
# License information
##########################################################################################
#
#	Copyright (c) 2022 William Grzybowski
#
#	Permission is hereby granted, free of charge, to any person obtaining a copy
#	of this software and associated documentation files (the "Software"), to deal
#	in the Software without restriction, including without limitation the rights
#	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#	copies of the Software, and to permit persons to whom the Software is
#	furnished to do so, subject to the following conditions:
#
#	The above copyright notice and this permission notice shall be included in all
#	copies or substantial portions of the Software.
#
#	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#	SOFTWARE.
#
##########################################################################################


##########################################################################################
# JAMF API information
##########################################################################################
URL="${4}"
username="${5}"
password="${6}"


##########################################################################################
# Core Script
##########################################################################################
JIMServerName=(`/usr/bin/curl "$URL/JSSResource/ldapservers" \
								--silent \
								--request GET \
								--user "$username:$password" \
								| /usr/bin/xpath -e "//ldap_servers/ldap_server/name/text()" 2> /dev/null`)

echo "The name returned from JAMF for the JIM Server is: ${JIMServerName}"
