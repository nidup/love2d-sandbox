FROM python:2.7.13

RUN apt-get update && apt-get install -y unzip

# Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
mkdir -p /home/developer && \
mkdir -p /etc/sudoers.d && \
echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
echo "developer:x:${uid}:" >> /etc/group && \
echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
chmod 0440 /etc/sudoers.d/developer && \
chown ${uid}:${gid} -R /home/developer && \
chown ${uid}:${gid} -R /usr/src

USER developer
ENV HOME /home/developer
WORKDIR /usr/src

RUN cd /usr/src/
RUN git clone https://github.com/TannerRogalsky/love.js.git
RUN cd love.js && git submodule update --init --recursive

WORKDIR /home/developer

# Expose SimpleHTTPServer on 8080
EXPOSE 8080

