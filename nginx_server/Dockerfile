# Use the official NGINX image
FROM nginx:latest

# Adding a non-root user
RUN groupadd --gid 1001 nginxuser \
    && useradd --uid 1001 --gid 1001 -m nginxuser \
    && apt-get update \
    && apt-get install -y sudo \
    && echo nginxuser ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/nginxuser \
    && chmod 0440 /etc/sudoers.d/nginxuser \
    && touch var/run/nginx.pid \
    && chown -R nginxuser:nginxuser /etc/nginx /var/cache/nginx /var/run/nginx.pid \
    && cat /docker-entrypoint.sh

# Switch to the non-root user
USER nginxuser

# Copy the custom NGINX configuration file
COPY nginx.conf /etc/nginx/nginx.conf

# Expose port 80
EXPOSE 80
