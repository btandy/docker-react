FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

CMD [ "npm", "run", "start" ]


# Now /app/build has all the stuff we need

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#Magic directory for nginx

# Default command of nginx image starts the server.