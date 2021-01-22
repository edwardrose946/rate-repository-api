
FROM node:14
ARG CLIENT_ID
ARG CLIENT_SECRET

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .

CMD STR=$'PORT=5000\nGITHUB_API_URL=https://api.github.com\nGITHUB_CLIENT_ID=$CLIENT_ID\nGITHUB_CLIENT_SECRET=$CLIENT_SECRET\nDATABASE_FILENAME=database.sqlite\JWT_SECRET=KfqiMBKug98wpUwahcfb '

CMD echo "$STR"> .env

RUN npm run build
RUN npm run seed:run

EXPOSE 5000
CMD ["node", "/src/index.js"]

