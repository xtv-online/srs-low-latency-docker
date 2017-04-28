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

# Usage
The container exposes port 1935 (the RMTP port). Streams can be created using an RTMP streaming encoder such as [OBS](https://obsproject.com/), [FMLE](https://offers.adobe.com/en/na/leap/landings/fmle3.html) or [Teradek Live:Air Solo](https://itunes.apple.com/us/app/live-air-solo-stream-live/id1051147032?mt=8). The stream should have the following settings:

```
rtmp://<address>/live/<stream_key>
```

Where ```<address>``` is the server IP or domain name and ```<stream_key>``` is the stream key for the encoder. For example:

```
rtmp://live.xtv.co.uk/live/corn_exchange
```

This stream can then be accessed using [VLC](http://www.videolan.org/vlc/) media player by opening a network stream with the following settings:

```
rtmp://<address>/live/<stream_key> :network-caching=0
```

Here the the final part of the address disables VLC caching the incoming stream, minimising latency. Using the previous example:

```
rtmp://live.xtv.co.uk/live/corn_exchange :network-caching=0
```