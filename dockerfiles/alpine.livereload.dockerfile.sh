FROM researchranks/alpine.node
MAINTAINER researchranks  <research@researchranks.com>

# latest as of 01/12/2018
# 9.4.0 – 66.8 MB (npm 5.6.0, yarn 1.3.2)
# ARG ALPINE_VERSION=3.6
# FROM alpine:${ALPINE_VERSION}


# create app directories
RUN mkdir -p /var/www/app

RUN apk update && apk upgrade
RUN apk add --update nodejs \
  make \
  python \
  bash \
  git

WORKDIR /usr/src/app
RUN git clone https://github.com/jsonfry/node-livereload.git .
RUN npm install

#ENTRYPOINT node bin/livereload.js /usr/src/livereload-watch -u true -d
