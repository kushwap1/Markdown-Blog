FROM node
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
RUN npm fund
COPY . .
EXPOSE 8095
CMD [ "node", "server.js" ]

