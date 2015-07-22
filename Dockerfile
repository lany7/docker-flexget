FROM vizzbuzz/base-alpine:0.9

RUN apk add --update \
    python \
    python-dev \
    py-pip 

RUN pip install -I flexget transmissionrpc

RUN mkdir -p /root/.flexget \
    && touch /root/.flexget/config.yml

VOLUME ["/root/.flexget"]

CMD ["/usr/bin/flexget", "--loglevel", "info", "daemon", "start"]
