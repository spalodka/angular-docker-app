FROM node:18.19.0 as build

WORKDIR /app

COPY package*.json ./

RUN npm install

RUN npm install -g @angular/cli

COPY . .

RUN ng build --configuration=production

FROM nginx:latest

COPY --from=build app/dist/angular-docker-app /usr/share/nginx/html

EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]