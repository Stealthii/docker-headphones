FROM alpine:edge

MAINTAINER Dan Porter <dpreid@gmail.com>

RUN echo "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories && \
    addgroup -g 1000 -S app && \
    adduser -u 1000 -S -g app app
RUN apk --no-cache add shntool@testing python2

ADD src /src
WORKDIR /src

VOLUME ["/srv"]

USER app
EXPOSE 8181
VOLUME /config /downloads /music
CMD ["python2", "./Headphones.py", "-p", "8181", "--datadir=/config"]
