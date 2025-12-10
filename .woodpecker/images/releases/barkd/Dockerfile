FROM --platform=linux/amd64 debian:bookworm-slim

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
        curl \
        ca-certificates \
        dos2unix \
        && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /root/barkd/
COPY ./barkd-linux-x86_64                          /usr/local/bin/barkd
COPY ./bark-linux-x86_64                           /usr/local/bin/bark
COPY ./.woodpecker/images/releases/barkd/start.sh  /root/barkd/start.sh

RUN chmod a+x /usr/local/bin/barkd && \
    chmod a+x /usr/local/bin/bark && \
    chmod a+x /root/barkd/start.sh && \
    dos2unix /root/barkd/start.sh

EXPOSE 3000

CMD ["/root/barkd/start.sh"]
