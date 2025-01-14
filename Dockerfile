FROM node:alpine as builder

RUN mkdir -p /home/node/app

WORKDIR /home/node/app

COPY package.json ./

RUN npm install

COPY ./ ./ 

CMD ["npm" , "run", "build"]


FROM nginx
EXPOSE 80
COPY --from=builder /home/node/app/build /usr/share/nginx/html