# Build Stage
FROM node:lts-alpine as Build-Stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build 

# Production Stage
FROM nginx:latest as Production-Stage
COPY nginx/new.conf /etc/nginx/conf.d
COPY --from=Build-Stage /app/dist /dist/
VOLUME /dist/public
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]