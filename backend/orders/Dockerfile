FROM node:21

WORKDIR /app

COPY *.js /app/
COPY package.json /app/

RUN npm install

EXPOSE 5001

CMD ["npm", "start"]