FROM node:21

WORKDIR /app

COPY package.json ./

RUN npm install

COPY . .

# Run npm start when the container launches
CMD ["npm", "start"]