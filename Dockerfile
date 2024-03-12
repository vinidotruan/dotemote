# Use a lightweight Nginx image
FROM nginx:alpine

# Copy static HTML and JavaScript files to Nginx's HTML directory

# Expose port 80
EXPOSE 80

CMD ["npx", "webpack"]
COPY . /usr/share/nginx/html

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
