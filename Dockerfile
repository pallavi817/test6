FROM node:16

WORKDIR /app

# Copy all app files
COPY . .

EXPOSE 3000

CMD ["node", "index.js"]



