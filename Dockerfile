
FROM node:14
ARG CLIENT_ID
ARG CLIENT_SECRET

WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install

COPY . .



CMD echo "PORT=5000 GITHUB_API_URL=https://api.github.com GITHUB_CLIENT_ID=$CLIENT_ID GITHUB_CLIENT_SECRET=$CLIENT_SECRET DATABASE_FILENAME=database.sqlite JWT_SECRET=KfqiMBKug98wpUwahcfb"> .env

RUN npm run build
RUN npm run seed:run

EXPOSE 5000
CMD ["node", "/src/index.js"]

