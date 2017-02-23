FROM ubuntu:yakkety

MAINTAINER "Vitor Carreira" <vitor.carreira@gmail.com>

WORKDIR /tmp

RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    software-properties-common

RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 4F4EA0AAE5267A6C

RUN echo "deb http://ppa.launchpad.net/ondrej/php/ubuntu yakkety main" >> /etc/apt/sources.list

# Common PHP pages across containers
RUN apt-get update -y && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y \
    zip \
    unzip \
    php7.1-cli \
    php7.1-mcrypt \
    php7.1-mysqlnd \
    php7.1-apcu \
    php7.1-memcached \
    php7.1-imap \
    php7.1-pgsql \
    php7.1-intl \
    php7.1-mbstring \
    php7.1-redis \
    php7.1-mongo \
    php7.1-sqlite \
    php7.1-curl \
    php7.1-json \
    php7.1-ssh2 \
    php7.1-gd \
    php7.1-gmp \
    php7.1-zip \
    php-pear \
    php7.1-dev make  \
    wget \
    git \
    curl && apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["php", "-a"]
