FROM ubuntu:18.04

# ignore timezone?
ARG DEBIAN_FRONTEND=noninteractive

# set TimeZone
ENV TZ=Europe/Helsinki
RUN apt-get update && apt-get install -y tzdata

ENV DOCKER /home/docker

WORKDIR $DOCKER/installation
COPY installation .
RUN chmod +x install_*.sh

RUN ./install_basic_tools.sh
RUN ./install_python_related.sh
RUN ./install_ros_melodic.sh
RUN ./install_x11vnc.sh

WORKDIR $DOCKER/scripts
COPY scripts .
RUN chmod +x *.sh
