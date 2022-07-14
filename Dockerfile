FROM node:slim 
 
WORKDIR /app 
 
COPY . . 
 
RUN npm install --production 
 
COPY . . 
 
EXPOSE 8081
 
CMD [ "node", "index.js" ]
