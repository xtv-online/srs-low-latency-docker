# Pull base image.
FROM ubuntu

# Install Git
RUN apt-get update && apt-get install -y git sudo

# Download SRS
RUN git clone https://github.com/ossrs/srs
WORKDIR srs/trunk
RUN git pull

# Build SRS
RUN ./configure --disable-all --with-ssl && make

# Run SRS Node
RUN ./objs/srs -c conf/realtime.conf

# Expose ports.
#   - 1935 - SRS RTMP Port
EXPOSE 1935
