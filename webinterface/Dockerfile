FROM node:lts-alpine

WORKDIR /app

# COntent
COPY . .

# Deps
RUN npm install && \
    npm install @vue/cli@3.7.0 -g



EXPOSE 8080

CMD [ "npm", "run", "serve"]