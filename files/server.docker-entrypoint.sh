#!/bin/bash

# step ca certificate subject crt-file key-file [--token=token]
#       [--issuer=name] [--ca-url=uri] [--root=file] [--not-before=time|duration]
#       [--not-after=time|duration] [--san=SAN] [--acme=path] [--standalone]
#       [--webroot=path] [--contact=email] [--http-listen=address] [--bundle]
#       [--kty=type] [--curve=curve] [--size=size] [--console]

step ca certificate localhost srv.crt srv.key --ca-url=127.0.0.1:$CA_PORT
