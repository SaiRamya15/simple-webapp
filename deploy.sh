#!/bin/bash

# Define deployment directory based on server type
TOMCAT_WEBAPPS="/opt/tomcat/webapps/ROOT"
NGINX_HTML="/var/www/html"

# Check if Tomcat is installed and deploy
if [ -d "$TOMCAT_WEBAPPS" ]; then
    echo "Deploying to Apache Tomcat..."
    rm -rf $TOMCAT_WEBAPPS/*
    cp -r html/* $TOMCAT_WEBAPPS/
    systemctl restart tomcat
    echo "Deployment to Tomcat completed."
elif [ -d "$NGINX_HTML" ]; then
    echo "Deploying to Nginx..."
    rm -rf $NGINX_HTML/*
    cp -r html/* $NGINX_HTML/
    systemctl restart nginx
    echo "Deployment to Nginx completed."
else
    echo "No web server found. Install either Apache Tomcat or Nginx."
    exit 1
fi
