#!/bin/bash

echo STEPPATH=$STEPPATH
echo CA_URL=$CA_URL
echo SERVER_HOSTNAME=$SERVER_HOSTNAME

HOST=$SERVER_HOSTNAME
FP=f50ad884929eb29dfb351720ceda184bf9a42cb319ac9cce37c3bdb795bb54b5

cd $STEPPATH

if step ca bootstrap -f --ca-url $CA_URL --fingerprint $FP; then
  echo '[OK] BOOTSTRAP'
  TOKEN=`step ca token --ca-url $CA_URL --password-file /files/ca.password $HOST`
  step ca certificate -f --token "$TOKEN" $HOST $HOST.crt $HOST.key
fi

chown 1000:1000 . -R
