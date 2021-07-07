[![](https://images.microbadger.com/badges/image/thanosme/frps.svg)](https://microbadger.com/images/thanosme/frps "Get your own image badge on microbadger.com")

# frp

What is frp?

frp is a fast reverse proxy to help you expose a local server behind a NAT or firewall to the internet. Now, it supports tcp, http and https protocol when requests can be forwarded by domains to backward web services.

Link to this project: https://github.com/fatedier/frp

# About this image

This images includes only the server binary "frps" and it is based on Alpine Linux for a small footprint (~8MB).

A data volume must be mounted which will include the frps configuration and possibly the log file.

Logging is printed to stdout by default so you can see it through the `docker logs` command. If you want to log to a file you can set this from the configuration file.

# How to use this image

Everything depends on your configuration. For example if you use the default ports for frp, you could run the image like this:

```
docker run -d --name frps -v $frp-data:/data -p 7000:7000 -p 7500:7500 -p 2000-3000:2000-3000 thanosme/frps
```

Ports 2000-3000 are an example for priveleged ports. Basically you can open the ports you want based on your configuration.

# How to build this image

```
git clone https://github.com/YahuiWong/docker-frps.git

cd docker-frps

docker build -t yahuiwong/frps:0.20.0 .
```
or

```sh
docker pull yahuiwong/frps:0.20.0
```
