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

## Deploy the web build

Cf. https://github.com/TannerRogalsky/love.js#usage

```
user@host:~/$ docker build -t nidup/lovejs ./docker/lovejs/
```

Package the debug release,

```
user@host:~/$ docker run -ti -v "$PWD":/home/developer -p 8080:8080 nidup/lovejs bash
developer@image:~/$ cd /usr/src/love.js/debug
developer@image:/usr/src/love.js/debug$ python ../emscripten/tools/file_packager.py game.data --preload /home/developer/src/@/ --js-output=game.js
developer@image:/usr/src/love.js/debug$ python -m SimpleHTTPServer 8080
```

Test the game at http://localhost:8080/

If everything is ok, package the compatibility release,

```
developer@image:/usr/src/love.js/debug$ cd ../release-compatibility
developer@image:/usr/src/love.js/release-compatibility python ../emscripten/tools/file_packager.py game.data --preload /home/developer/src/@/ --js-output=game.js
developer@image:/usr/src/love.js/release-compatibility$ python -m SimpleHTTPServer 8080
```

Deploy on ghpages branch,

```
developer@image:/usr/src/love.js/release-compatibility$ cp -r ./* /home/developer/build/web/
```

Then commit, rebase and push.

```
user@host:~/$ git checkout gh-pages
user@host:~/$ git rebase master -i
user@host:~/$ git push origin gh-pages -f
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
