#!/bin/bash

if [[ $1 -eq 0 ]] ; then
    echo 'Missing gitlab url. (e.g.  ./addstupidgitlabservertocacrt.sh stupidgitlab.com'
    exit 1
fi

if [[ $2 -eq 0 ]] ; then
    echo 'Missing gitlab url port. (e.g.  ./addstupidgitlabservertocacrt.sh stupidgitlab.com 443'
    exit 1
fi

echo -n | openssl s_client -showcerts -connect $1:$2 2>/dev/null  | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' >>  /etc/ssl/certs/ca-certificates.crt
