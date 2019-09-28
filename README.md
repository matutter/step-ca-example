# Step-CA Samples

> Sample usage of Step-CA

## Walk-through

### Configure the CA

1. Initialize a new CA. We'll do this in a `ubuntu:bionic` docker image. So
   first do `docker-compose build ca`. The build will run `step ca init` with
   default arguments to which will generate a CA. It will be placed in the
   mounted `./build/ca` directory when its done.

## References

- [Getting Started Guide from SmallStep (step-ca author)](https://smallstep.com/docs/getting-started/)
- [step ca init](https://smallstep.com/docs/cli/ca/init/)