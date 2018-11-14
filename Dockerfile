FROM node:8-wheezy as builder

COPY package.json /usr/src/app/
COPY package-lock.json /usr/src/app/

WORKDIR /usr/src/app/

RUN npm install

COPY . /usr/src/app/

RUN npm run prepack

FROM kyma/docker-nginx

EXPOSE 3000

COPY --from=builder /usr/src/app/dist/release/ /var/www

CMD 'nginx'
