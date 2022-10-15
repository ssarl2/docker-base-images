# ubuntu 18.04
FROM osrf/ros:melodic-desktop-full

ARG INSTALL_FOLDER=/home/ubuntu/installation

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

# copy
COPY scripts /home/ubuntu/scripts
COPY installation ${INSTALL_FOLDER}
RUN chmod -R 755 ${INSTALL_FOLDER}

# create an user
ARG UID=1000
ARG USER=melodic
RUN useradd ${USER} -u ${UID} -U -d /home/${USER} -m -s /bin/bash
RUN usermod -g root -G sudo -u 1000 "${USER}"
RUN apt-get update && apt-get install -y sudo && \
    echo "${USER} ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/${USER}" && \
    chmod 440 "/etc/sudoers.d/${USER}"
# RUN echo 'default:' | chpasswd
USER "${USER}"
ENV USER="${USER}" \
    HOME="/home/${USER}"
WORKDIR "${HOME}/workspace"

# install
RUN ${INSTALL_FOLDER}/install_base.sh
RUN ${INSTALL_FOLDER}/install_vscode.sh
RUN ${INSTALL_FOLDER}/install_needs.sh
