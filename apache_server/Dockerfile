# Use the official Apache HTTP server image
FROM httpd:latest

#Adding user
RUN groupadd --gid 1000 apacheuser \
    && useradd --uid 1000 --gid 1000 -m apacheuser \
    && apt-get update \
    && apt-get install -y sudo \
    && echo apacheuser ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/apacheuser \
    && chmod 0440 /etc/sudoers.d/apacheuser \
    && chown -R apacheuser:apacheuser /usr/local/apache2/logs \
    && chown -R apacheuser:apacheuser /home/apacheuser

USER apacheuser


# Expose port 80 for HTTP traffic
EXPOSE 80

# Copy files from the 'sample' directory on the host to the Apache document root
COPY sample /usr/local/apache2/htdocs/
