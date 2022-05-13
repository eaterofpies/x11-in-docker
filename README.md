# X11 in docker
Use the docker host's X server from inside docker.

## Usage
Run `./run.sh`. This starts xterm running inside a container.

## How it works
As far as I can work out the only things you need to use the X server from inside docker are
- Access to the unix domain sockets in /tmp/.unix
- The matching UID, GID
- The DISPLAY environment variable

The scripts make sure everything inside the container matches the user starting the container and mounts /tmp/.unix.

## Things that don't work (yet?)
- Using your real home directory in the container

  The `DISPLAY` environment variable is currently set in the users environment by appending it to the `.bashrc` so if that turns out to be a file that persists it'll be appended each time the container is started.

- OpenGL / Other hardware acceleration

  This might depend on matching the container graphics libraries to the host kernel modules which seems like it'd be flakey. It might be possible to add volumes for all of the libraries but that seems like a lot of a faff.

- Using the `user:` setting in `docker-compose.yml`

  A lot of the user's environment can't exist before starting the container as we don't yet know the uid/gid so it needs to start as root and switch to the user. Docker also seems to switch to the user before volumes are mounted so it doesn't work even if you add /etc/passwd to the volumes.
