FROM nginx:alpine
# Overide original config.
COPY nginx.conf /etc/nginx/nginx.conf
# Additional entrypoint scripts.
COPY scripts/20-envsubst-on-templates.sh /docker-entrypoint.d
# Make configuration dicrectories.
RUN mkdir -p /etc/nginx/sites
# Set entrypoint.
ENTRYPOINT ["/docker-entrypoint.sh"]
# Expose ports.
EXPOSE 80 443
# Stop signal.
STOPSIGNAL SIGQUIT
# Initial command.
CMD ["nginx", "-g", "daemon off;"]