FROM node:12.13.1-stretch-slim

WORKDIR /app

COPY app/ .

RUN npm install 

CMD ["npm", "start"]