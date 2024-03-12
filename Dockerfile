# Use Node.js LTS image as base
FROM node:lts-alpine AS build

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Build TypeScript code using Webpack (replace `build` with your actual build script if different)
RUN npx webpack
# Use nginx image as production stage
FROM nginx:alpine

# Copy the built files from the build stage to nginx html directory
COPY --from=build-stage /app/dist /usr/share/nginx/html
COPY --from=build-stage /app /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
