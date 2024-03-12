# Use a lightweight Nginx image
FROM nginx:alpine

# Copy static HTML and JavaScript files to Nginx's HTML directory
COPY ./ /usr/share/nginx/html

# Expose port 80
EXPOSE 80

CMD ["npx", "webpack"]
CMD ["ls"]

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
