#!/bin/bash

echo STEPPATH=$STEPPATH
echo CA_URL=$CA_URL
echo SERVER_HOSTNAME=$SERVER_HOSTNAME

HOST=$SERVER_HOSTNAME
FP=b81b99162ea70e6ad19b3fc787c59dd156e9bf546d0dfd481f3e9c072859bf03

cd $STEPPATH

if step ca bootstrap -f --ca-url $CA_URL --fingerprint $FP; then
  echo '[OK] BOOTSTRAP'
  TOKEN=`step ca token --ca-url $CA_URL --password-file /files/ca.password $HOST`
  step ca certificate -f --token "$TOKEN" $HOST $HOST.crt $HOST.key
else
  exit $?
fi

chown 1000:1000 . -R
