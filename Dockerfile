FROM node:alpine

# Create app directory
RUN mkdir -p usr/src/phattv-ecommerce-backend
WORKDIR usr/src/phattv-ecommerce-backend

# Install app dependencies
COPY package.json /usr/src/phattv-ecommerce-backend
COPY yarn.lock /usr/src/phattv-ecommerce-backend
RUN yarn install --production

# Bundle app source
COPY . /usr/src/phattv-ecommerce-backend

CMD [ "yarn", "start:prod" ]