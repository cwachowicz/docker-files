############################################################
# Dockerfile to build Nginx Installed Containers
############################################################
# Pull base image.
FROM dockerfile/ubuntu

# File Author / Maintainer
MAINTAINER Chris 'The Wizard' Wachowicz

# Install Nginx.
RUN \
  add-apt-repository -y ppa:nginx/stable && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Update the config files.
#RUN rm -v /etc/nginx/sites-enabled/default
#ADD nginx.conf /etc/nginx/
#ADD api.localz.co.conf /etc/nginx/sites-enabled/

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
