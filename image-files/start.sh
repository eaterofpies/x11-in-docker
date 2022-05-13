#!/bin/bash
set -x
USERNAME=${REAL_USERNAME}
USER_UID=${REAL_UID}
USER_GID=${REAL_GID}

# Add a group and user
groupadd --gid $USER_GID $USERNAME
useradd --uid $USER_UID --gid $USER_GID --create-home $USERNAME --shell /bin/bash
echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME
chmod 0440 /etc/sudoers.d/$USERNAME

#TODO this isn't safe if you add your home dir to the mounts.
echo "export DISPLAY=${DISPLAY}" >> /home/${USERNAME}/.bashrc

su -c xterm $USERNAME
