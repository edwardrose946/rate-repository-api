FROM node:14

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build
RUN npm run seed:run

EXPOSE 5000
CMD ["node", "/src/index.js"]

