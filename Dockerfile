FROM node:6.14.2
EXPOSE 8080
COPY Server.js .
CMD node Server.js