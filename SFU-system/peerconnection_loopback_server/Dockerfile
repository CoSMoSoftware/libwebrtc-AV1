FROM node:8.17.0-alpine3.11

RUN apk update && apk add git openssh-client python make gcc g++ linux-headers openssl npm
RUN mkdir ~/.ssh
RUN ssh-keyscan -t rsa github.com > ~/.ssh/known_hosts
RUN git clone https://github.com/CoSMoSoftware/Medooze_Public_Demos

WORKDIR /Medooze_Public_Demos/

RUN npm i
RUN openssl genrsa 2048 > server.key
RUN chmod 400 server.key
RUN echo -e "\n\n\n\n\n\n\n\n" | openssl req -new -x509 -nodes -sha256 -days 365 -key server.key -out server.cert

ENTRYPOINT [ "node", "index.js" ]