FROM php:7.4-fpm

ARG UID
ARG GID

RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        zip unzip \
     && docker-php-ext-install -j$(nproc) mysqli pdo_mysql bcmath


RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis

# Install composer
RUN curl -sSL https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN chmod +x /usr/local/bin/composer

# Add a "docker" user
RUN groupadd -g ${GID} docker

RUN useradd docker --shell /bin/bash --create-home --no-user-group -u ${UID} -g ${GID}
RUN usermod --append --groups sudo docker \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo 'docker:secret' | chpasswd

# Configure PHP FPM
RUN sed -i "s/user = www-data/user = docker/" /usr/local/etc/php-fpm.d/www.conf && \
    sed -i "s/group = www-data/group = docker/" /usr/local/etc/php-fpm.d/www.conf

WORKDIR /src