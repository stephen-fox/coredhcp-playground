# coredhcp-playground
A Docker compose environment for playing around with DHCP, primarily for
testing [coredhcp](https://github.com/coredhcp/coredhcp) plugins.

## External dependencies
This project depends on:

- [docker engine](https://docs.docker.com/install/)
- docker-compose (sometimes ships with engine, but it might be separate
depending on the operating system)
- [golang](https://golang.org)
- [coredhcp](https://github.com/coredhcp/coredhcp) DHCP server
- [go-dhclient](https://github.com/digineo/go-dhclient) DHCP client]

## Usage
1. `git clone` this repository to the Docker host (e.g., your computer)
2. `git clone` the 'coredhcp' and 'go-dhclient' repositories linked above.
You may need to initialize a go module for coredhcp if you are cloning it
outside of the GOPATH
3. From this repository's directory, build the server, and place it in the
`build/` directory by running:

    `GOOS=linux go build -o build/server /path/to/coredhcp/cmds/coredhcp/main.go`

4. From this repository's directory, build the client, and place it in the
`build/` directory by running:

    `GOOS=linux go build -o build/client /path/to/go-dhclient/cmd/dhclient/*`

5. From this repository's directory, run:

    `docker-compose up`

If you would like to shutdown the environment, you may need to run
`docker-compose down` after pressing Control+C. Please note that you will
need to manually specify a rebuild if you recompile the server, the client,
or if you change the Dockerfile(s). This is done by running
`docker-compose up --build`.
