# Use an official Node.js runtime as a parent image
FROM node:21

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY public/ /app/public
COPY src/ /app/src
COPY package.json /app/

# Install app dependencies
RUN npm install

# Run npm start when the container launches
CMD ["npm", "start"]