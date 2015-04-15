############################################################
# Dockerfile to build Nginx Installed Containers
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER Chris 'The Wizard' Wachowicz

# Install Nginx
# Add application repository URL to the default sources
RUN echo "deb http://archive.ubuntu.com/ubuntu/ trusty main universe" >> /etc/apt/sources.list

# Update the repository
RUN apt-get upgrade
RUN apt-get update

# Install necessary tools
RUN apt-get install -y nano wget dialog net-tools

# Download and Install Nginx
RUN apt-get install -y nginx    

# Remove the default Nginx configuration files
RUN rm -v /etc/nginx/nginx.conf
RUN rm -v /etc/nginx/sites-enabled/default

# Copy a configuration file from the current directory
ADD nginx.conf /etc/nginx/
ADD api.localz.co.conf /etc/nginx/sites-enabled/

# Expose ports
EXPOSE 80

# Set the default command to execute
# when creating a new container
CMD service nginx start
