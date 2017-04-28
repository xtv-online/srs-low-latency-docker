# Docker Container for SRS Low Latency Build

Docker container for a low latency build of [SRS](https://github.com/ossrs/srs/wiki/v2_EN_SampleRealtime). Intended for deployment for XTV for outside broadcast on the UK General Election 2017.

## Building

The docker container can be built with docker-compose and the following command:

```
docker-compose build
```

# Running

The container can be run in detached mode using the following command:

```
docker-compose up -d
```

The logs can be viewed using:

```
docker-compose logs
```