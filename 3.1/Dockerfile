FROM php:7.1-alpine

MAINTAINER Yannick Pereira-Reis <yannick.pereira.reis@gmail.com>

ARG PHP7CC_VERSION_ARG=1.2.1
ENV PHP7CC_VERSION=$PHP7CC_VERSION_ARG

ENV COMPOSER_HOME /composer
ENV PATH "/composer/vendor/bin:$PATH"

WORKDIR /app

RUN apk --no-cache add git curl \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && chmod +x /usr/local/bin/composer \
    && echo "date.timezone = Europe/Paris" >> /usr/local/etc/php/conf.d/symfony.ini \
    && composer global require sstalle/php7cc $PHP7CC_VERSION \
    && rm /usr/local/bin/composer \
    && apk del git curl -r


COPY ./docker-entrypoint.sh /
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["php7cc","-h"]
