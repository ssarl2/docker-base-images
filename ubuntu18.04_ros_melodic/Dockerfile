# ubuntu 18.04
FROM osrf/ros:melodic-desktop-full

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

# install
WORKDIR "/home/ubuntu/scripts"
COPY scripts .
WORKDIR "/home/ubuntu/installation"
COPY installation .
RUN chmod +x install_*.sh
RUN ./install_basic_tools.sh
RUN ./install_python_related.sh
RUN ./install_vscode.sh
RUN ./install_useful_tools.sh

# create an user
ARG UID=1000
ARG USER=melodic
RUN useradd ${USER} -u ${UID} -U -d /home/${USER} -m -s /bin/bash
RUN apt-get update && apt-get install -y sudo && \
    echo "${USER} ALL=(ALL) NOPASSWD: ALL" > "/etc/sudoers.d/${USER}" && \
    chmod 440 "/etc/sudoers.d/${USER}"
# RUN echo 'default:' | chpasswd
USER "${USER}"
ENV USER="${USER}" \
    HOME="/home/${USER}"

RUN echo 'source /opt/ros/melodic/setup.bash' >> /home/${USER}/.bashrc

WORKDIR "${HOME}"
