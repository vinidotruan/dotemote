# Stage 1: Build webpack
FROM node:alpine AS build-stage

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build the application with webpack
RUN npx webpack

# Stage 2: Serve the built files using Nginx
FROM nginx:alpine

# Copy the built files from the previous stage
COPY --from=build-stage /app/dist /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
