FROM node:22-alpine

RUN apk update && apk upgrade --no-cache

WORKDIR /app
 
 COPY package.json package-lock.json ./
 
 RUN npm install 
 
 COPY . .
 
 EXPOSE 3000
 
 CMD ["node", "dist/index.js"]