FROM node:22-alpine

WORKDIR /app

COPY package*.json .
COPY packages ./packages
COPY public ./public
COPY media ./media
COPY config ./config
COPY translations ./translations

RUN mkdir -p themes extensions

RUN npm install
RUN npm run build

EXPOSE 80

CMD ["npm","run","start:debug"]