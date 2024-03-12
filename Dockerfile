# Use a lightweight Node image as build stage
FROM node:alpine AS build-stage

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application with webpack
RUN npx webpack

# Use nginx image as production stage
FROM nginx:alpine

# Copy the built files from the build stage to nginx html directory
COPY --from=build-stage /app /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
