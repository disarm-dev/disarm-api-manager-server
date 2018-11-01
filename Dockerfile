# build stage
FROM node:10
#FROM node:10#-alpine as build-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run postinstall
RUN npm run setup

# production stage
EXPOSE 1337
ENV NODE_ENV production
CMD ["npm", "start"]

