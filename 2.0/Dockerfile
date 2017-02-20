FROM php:7.1.1-cli

MAINTAINER Yannick Pereira-Reis <yannick.pereira.reis@gmail.com>

ENV HOME /root

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
  nano \
  git \
  curl \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
   && chmod +x /usr/local/bin/composer \
   && echo "date.timezone = Europe/Paris" >> /usr/local/etc/php/conf.d/symfony.ini \
   && composer global require sstalle/php7cc


COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["php7cc","-h"]
