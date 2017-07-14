# Löve 2d sandbox

Playing with Löve 2d & Lua

## Build the docker image

```
user@host:~/$ docker build -t nidup/love2d .
```

## Run the docker image

```
user@host:~/$ docker run -ti -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix -v "$PWD":/home/developer --security-opt seccomp=unconfined nidup/love2d bash
```

## Run the project in the image

```
developer@image:~$:~/$ love src/
```
