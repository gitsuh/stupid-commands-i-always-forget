#!/bin/bash
# This script is to avoid having to disable sslverify and trust the gitlab server or whatever server. 
# This is the command to disable sslverify in git: git config --global http.sslverify false
if [[ $1 -eq 0 ]] ; then
    echo 'Missing server url. (e.g.  ./addstupidgitlabservertocacrt.sh stupidgitlab.com)'
    exit 1
fi

if [[ $2 -eq 0 ]] ; then
    echo 'Missing server port. (e.g.  ./addstupidgitlabservertocacrt.sh stupidgitlab.com 443)'
    exit 1
fi

echo -n | openssl s_client -showcerts -connect $1:$2 2>/dev/null  | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' >>  /etc/ssl/certs/ca-certificates.crt

cat /etc/ssl/certs/ca-certificates.crt
