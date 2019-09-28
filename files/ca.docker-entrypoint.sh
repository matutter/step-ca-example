#!/bin/bash

echo CA_PORT=$CA_PORT

step ca init \
  -name="The Step CA Tutorial" \
  -dns=localhost \
  -address=127.0.0.1:$CA_PORT \
  -provisioner=mcutter.svc@gmail.com \
  -password-file=/files/ca.password && \
step-ca --password-file=/files/ca.password /.step/config/ca.json
