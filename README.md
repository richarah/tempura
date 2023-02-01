# Tempura

#### Please note

This is a work in progress - consequently, the code and documentation is still being improved upon; major changes may occur at any time.

#### Build

```
docker build --build-arg user=$USER --build-arg uid=$(id -u) --build-arg gid=$(id -g) -t tempura . && xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f /tmp/.docker.xauth nmerge -
```

#### Start container

```
docker run -e DISPLAY=unix$DISPLAY -it -v /tmp/.X11-unix:/tmp/.X11-unix -v /tmp/.docker.xauth:/tmp/.docker.xauth:rw --device /dev/dri -e XAUTHORITY=/tmp/.docker.xauth tempura
```

#### Run Glowbox

From within the container, run the following command:

`make run`
