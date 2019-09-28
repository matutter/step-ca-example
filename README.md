# Step-CA Samples

> Sample usage of Step-CA

## Walk-through

### Configure the CA

1. Initialize a new CA. We'll do this in a `ubuntu:bionic` docker image. So
   first do `docker-compose up ca`. The image will be built and when run will
   execute `step ca init` with default arguments to which will generate a CA.
   It will be placed in the mounted `build/ca/` directory when its done.

   Then the ca service will start serving the CA as `https://ca:10433` within
   linked containers.

2. Then we need to grab the "fingerprint" from `build/ca/config/defaults.json`.
   Update `files/server.docker-entrypoint.sh` with the fingerprint. Then start
   the container with `docker-compose up server`.

   The container with run `step ca bootstrap` to setup the local environment
   to use the remote CA by default.

   Then `step ca token` will be used to create a JWS authorization token.

   Finally `step ca certificate` registers the hostname `localhost` and has
   the cert and key generated. These files will be placed under the mounted
   `build/server/` directory.

   > *NOTE* When the process is ansible-ized we can easily just gather the
   > fingerprint as a _fact_ and assign it so a secret in the swarm.

## References

- [Getting Started Guide from SmallStep (step-ca author)](https://smallstep.com/docs/getting-started/)
- [step ca init](https://smallstep.com/docs/cli/ca/init/)