#!/usr/bin/env ruby


#assigns the input value to curl_uri
curl_uri = ARGV[0]


#outputs the uri to the shell 
#print "curl #{curl_uri}"
exec  "curl -Lv #{curl_uri}"
