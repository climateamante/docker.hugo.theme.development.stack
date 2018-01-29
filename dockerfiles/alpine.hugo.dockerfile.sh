FROM alpine:3.6
MAINTAINER researchranks  <research@researchranks.com>

# create app directories
RUN mkdir -p /var/www/app
WORKDIR /var/www/app

# argument variables 
# ADD VERSION 0.31.2
# ARG BUILD_DATE
# ARG VCS_REF
# ARG VCS_URL

# labels
# LABEL org.label-schema.build-date=$BUILD_DATE \
#       org.label-schema.vcs-url=$VCS_URL \
#       org.label-schema.vcs-ref=$VCS_REF \
#       org.label-schema.schema-version="1.0.0-rc1"

# enviroment variables
ENV HUGO_VERSION 0.32.4
ENV HUGO_BINARY hugo_${HUGO_VERSION}_linux-64bit


# Install pygments (for syntax highlighting)
RUN apk update && apk add py-pygments && apk add git && apk add bash && rm -rf /var/cache/apk/*

# Download and Install hugo
ADD https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY}.tar.gz /usr/local/
RUN tar xzf /usr/local/${HUGO_BINARY}.tar.gz -C /usr/local/bin/ \
	&& rm /usr/local/${HUGO_BINARY}.tar.gz

ENV HUGO=/usr/local/bin/hugo
RUN echo "Hugo path: ${HUGO}"

#CMD hugo server --watch=true \
# --cleanDestinationDir \
# --renderToDisk \
# --port=1313 \
# --liveReloadPort=1313 \
# --disableFastRender \
# --bind="0.0.0.0" \
# --buildDrafts \
# --ignoreCache \
# --navigateToChanged \
# --noHTTPCache \
# --verbose


# installing http-server'
# RUN echo 'installing node modules' \
# 	&& npm install --save --global lite-server@2.3.0
#	&& npm install --save -g lite-server@2.3.0 \
#	&& npm cache clean

#EXPOSE 8080

#CMD ["npm", "start"]

# CMD ["/usr/local/bin/hugo", "server", '--bind="0.0.0.0"', "--watch", "--cleanDestinationDir", "--renderToDisk", "--port=1313", "--liveReloadPort=1313", "--buildDrafts", "--ignoreCache", "--navigateToChanged", "--noHTTPCache", "--verbose"]