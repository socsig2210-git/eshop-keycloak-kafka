FROM node:21

WORKDIR /app

COPY package.json ./

RUN npm install --production

COPY . .

EXPOSE 5000

CMD ["npm", "start"]