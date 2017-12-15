# build image from small debian
FROM debian:stable-slim
MAINTAINER joeknock

# update container and install dependencies
RUN apt update && apt install -y \
  git \
  python python-pip

ADD src/init.sh /init.sh

# download python source files
RUN git clone https://github.com/vertcoin/p2pool-vtc.git && \
    cd p2pool-vtc/ && \
    pip install -r requirements.txt && \
    cd lyra2re-hash-python && \
    python setup.py install

# create configuration volume
VOLUME /config /data

# default environment variables
ENV RPC_USER user
ENV RPC_PASSWORD changethisfuckingpassword
ENV VIRTCOIND_HOST 127.0.0.1
ENV VIRTCOIND_HOST_PORT 5889
ENV FEE 0
ENV MAX_CONNECTIONS 50
ENV FEE_ADDRESS VnfNKCy5Aq7vZq5W9UKgMwfDLT7NrPRWZK

# expose mining port
EXPOSE 9171 9346

ENTRYPOINT ["init.sh"]