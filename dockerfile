# Build Stage
FROM node:lts-alpine as Build-Stage
WORKDIR /app
COPY package.json ./
RUN yarn install
RUN yarn ad
COPY . /app
RUN yarn build 

# Production Stage
FROM nginx:1.13-12-alpine as Production-Stage
COPY --from=Build-Stage /app/dist /usr/share/nginx/html
RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d
EXPOSE 80
CMD [ "nginx", '-g', 'daemon off;' ]