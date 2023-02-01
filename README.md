# Tempura



A fork of [Dorothy](https://github.com/richarah/dorothy) reworked to handle the assignment framework for NTNUs *TDT4230 Graphics and Visualisation* course, primarily for compatibility with non-Windows machines.

#### Please note

This is a work in progress - consequently, the code and documentation is suboptimal and being improved upon; major changes may occur at any time.

#### Behind the name

The name refers to a Japanese dish in which various dainties are drenched in batter and deep-fried. Similarly, this program takes something delicate and encapsulates it in a crude wrapper, making it easier to handle and deploy while preserving its intricate insides.

Thus, it is the software equivalent of a deep-fried sushi.



## Setup

#### Dependencies

Please ensure that an up-to-date version of Docker is installed on your machine before proceeding.

#### Build Tempura

```
docker build --build-arg user=$USER --build-arg uid=$(id -u) --build-arg gid=$(id -g) -t tempura . && xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f /tmp/.docker.xauth nmerge -
```

#### Start Docker container

```
docker run -e DISPLAY=unix$DISPLAY -it -v /tmp/.X11-unix:/tmp/.X11-unix -v /tmp/.docker.xauth:/tmp/.docker.xauth:rw --device /dev/dri -e XAUTHORITY=/tmp/.docker.xauth tempura
```

#### Run Glowbox

From within the container, run the following command:

`make run`
