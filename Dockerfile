FROM node:16

WORKDIR /app

# Copy only the package files from the subfolder
COPY nodeapp/package*.json ./
RUN npm install

# Copy the rest of the subfolder contents
COPY nodeapp/ ./

EXPOSE 3000

CMD ["npm", "start"]


