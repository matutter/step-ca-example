#!/bin/bash

echo STEPPATH=$STEPPATH
echo CA_PORT=$CA_PORT
echo SERVER_HOSTNAME=$SERVER_HOSTNAME

rm -f $STEPPATH/*/*

step ca init \
  -name="The Step CA Tutorial" \
  -dns=ca \
  -address="ca:$CA_PORT" \
  -with-ca-url="$CA_URL" \
  -provisioner=mcutter.svc@gmail.com \
  --password-file=/files/ca.password

step-ca --password-file=/files/ca.password /.step/config/ca.json
