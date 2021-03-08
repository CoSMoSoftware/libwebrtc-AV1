FROM node:8.17.0-alpine3.11

RUN apk update && apk add git openssh-client python make gcc g++ linux-headers openssl
RUN mkdir ~/.ssh
ADD id_rsa /root/.ssh
ADD id_rsa.pub /root/.ssh
ADD known_hosts /root/.ssh
RUN chmod 600 /root/.ssh/id_rsa
RUN git clone git@github.com:CoSMoSoftware/POC-medooze-multiopus-loopback-web-app.git

WORKDIR /POC-medooze-multiopus-loopback-web-app/

RUN npm i
RUN openssl genrsa 2048 > server.key
RUN chmod 400 server.key
RUN echo -e "\n\n\n\n\n\n\n\n" | openssl req -new -x509 -nodes -sha256 -days 365 -key server.key -out server.cert

ENTRYPOINT [ "node", "index.js" ]