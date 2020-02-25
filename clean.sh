#!/bin/bash


for d in certs config db secrets; do
  rm -rf build/ca/$d
done

for d in certs config localhost.crt localhost.key; do
  rm -rf build/server/$d
done
