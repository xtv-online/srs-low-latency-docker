# Pull base image.
FROM ubuntu:xenial

# Install Git
RUN apt-get update && apt-get install --allow git sudo python

# Download SRS
RUN git clone https://github.com/ossrs/srs
WORKDIR srs/trunk
RUN git pull

# Build SRS
RUN ./configure && make

# Expose ports.
#   - 1935 - SRS RTMP Port
EXPOSE 1935

# Run SRS Node
CMD ["/srs/trunk/objs/srs", "-c", "/srs/trunk/conf/realtime.conf"]
