FROM php:7.3-cli as php-7-3

RUN apt update && apt-get install -y \
        libzip-dev \
        zip \
  && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-install zip

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

FROM php:7.4.0-cli as php-7-4

RUN apt update && apt-get install -y \
        libzip-dev \
        zip \
  && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-install zip

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

FROM php:8.0-cli as php-8-0

RUN apt update && apt-get install -y \
        libzip-dev \
        zip \
  && rm -rf /var/lib/apt/lists/* \
  && docker-php-ext-install zip

COPY --from=composer:2 /usr/bin/composer /usr/bin/composer
