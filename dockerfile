# You should always specify a full version here to ensure all of your developers
# are running the same version of Node.
FROM node:latest
# Override the base log level (info).
ENV NPM_CONFIG_LOGLEVEL warn

ADD yarn.lock /yarn.lock
ADD package.json /package.json

ENV NODE_PATH=/node_modules
ENV PATH=$PATH:/node_modules/.bin
RUN yarn

WORKDIR /app
ADD . /app

EXPOSE 3000
EXPOSE 35729

ENTRYPOINT ["/bin/bash", "/app/run.sh"]
CMD ["start"]

# # Install and configure `serve`.
# RUN npm install -g serve
# CMD serve -s build
# EXPOSE 5000

# # Install all dependencies of the current project.
# COPY package.json package.json
# COPY npm-shrinkwrap.json npm-shrinkwrap.json
# RUN npm install

# # Copy all local files into the image.
# COPY . .

# # Build for production.
# RUN npm run build --production
