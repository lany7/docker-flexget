FROM alpine:latest

RUN apk add --update \
    python \
    python-dev \
    py-pip 

RUN pip install -I flexget transmissionrpc

RUN mkdir -p /root/.flexget \
    && touch /root/.flexget/config.yml

VOLUME ["/root/.flexget"]

ENV LOGLEVEL info

CMD ["/usr/local/bin/flexget", "--loglevel", "${LOGLEVEL}", "daemon", "start"]
