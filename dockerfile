ARG BASE_IMAGE=nginx:stable

FROM ${BASE_IMAGE}

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get upgrade --yes && \
    apt-get install --yes --no-install-recommends \
    # Security.
      fail2ban \
    # Install PHP-FPM.
      php \
      php-mysql \
      php-mbstring \
      php-bcmath \
      php-zip \
      php-gd \
      php-curl \
      php-xml \
      php-fpm \
      php-opcache && \
    # Clean cache.
    apt-get clean && rm -rf /var/lib/apt/lists/*

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./http.conf /etc/nginx/conf.d/http.conf