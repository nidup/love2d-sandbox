# Löve 2d sandbox

Playing with Löve 2d & Lua

## Run the docker image (using host server x & sound support)

```
user@host:~/$ docker run -ti -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v /dev/snd:/dev/snd \
    -v "$PWD":/home/developer \
    --security-opt seccomp=unconfined \
     --privileged \
    nidup/love2d:0.10.2 bash
```

## Run the project in the image

```
developer@image:~$:~/$ love src/
```

## Credits

Thanks a bunch to @DawsonG for this great tutorial:
 - http://osmstudios.com/tutorials/your-first-love2d-game-in-200-lines-part-1-of-3
 - https://github.com/DawsonG/Love2d-Tutorial-Scrolling-Shooter

# Update Docker images

## Löve v0.9.1

### Build the docker image

```
user@host:~/$ docker build -t nidup/love2d:0.9.1 ./docker/0.9.1/
```

### Push the docker image

```
user@host:~/$ docker push nidup/love2d:0.9.1
```

## Löve v0.10.2

## Build the docker image

```
user@host:~/$ docker build -t nidup/love2d:0.10.2 ./docker/0.10.2/
```

### Push the docker image

```
user@host:~/$ docker push nidup/love2d:0.10.2
```
