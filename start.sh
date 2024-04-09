#!/bin/bash
# Start Nginx in the background
nginx -g 'daemon off;' &

# Start your Node.js application
node /usr/share/nginx/html/index.js
