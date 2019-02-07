
# https://hub.docker.com/_/node/
FROM node:10.15.1

ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app
COPY ./package.json /usr/src/app/
RUN npm install && npm cache clean --force

COPY . /usr/src/app

ENV NODE_ENV production
ENV IP 0.0.0.0
ENV PORT 80
EXPOSE 80

ENTRYPOINT ["/tini", "--"]

CMD [ "npm", "start" ]
