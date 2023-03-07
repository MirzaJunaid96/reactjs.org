FROM node:16-alpine As build
COPY . /app
WORKDIR /app
RUN yarn install
RUN npm install -g @angular/cli
RUN yarn build

FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
