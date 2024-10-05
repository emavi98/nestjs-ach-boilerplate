# Base image
FROM node:18-alpine

# Create app directory
WORKDIR /usr/src/app

# A wildcard is used to ensure both package.json AND package-lock.json are copied
COPY package*.json ./

# Install app dependencies
RUN npm install

# Bundle app source
COPY . .

# Creates a "dist" folder with the production build
RUN npm run build

# Definir una variable de entorno
ENV MONGO_URI mongodb://tienda:Guancho12**@82.223.165.28:32768/mobledec_db?retryWrites=true&w=majority&authSource=admin
ENV DATABASE_URL postgresql://postgres:wipidipi@213.165.65.237:32770/mydb?schema=public
ENV JWT_SECRET super_secret_key

# Exponer en el puerto 80
EXPOSE 3001
# Start the server using the production build
CMD [ "node", "dist/main.js" ]