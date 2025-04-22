ARG BASE_IMAGE=nginx:stable

FROM ${BASE_IMAGE}

RUN apt-get update && apt-get upgrade --yes && \
    apt-get install --yes --no-install-recommends \
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