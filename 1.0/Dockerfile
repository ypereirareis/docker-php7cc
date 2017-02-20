FROM php:7

MAINTAINER Yannick Pereira-Reis <yannick.pereira.reis@gmail.com>

ENV HOME /root
WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
	nano \
	git \
	curl \
	wget \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pwd && echo "==================================="

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer && \
   chmod +x /usr/local/bin/composer && \
   echo "date.timezone = Europe/Paris" >> /usr/local/etc/php/conf.d/symfony.ini


RUN composer global require sstalle/php7cc

ENTRYPOINT ["php","-d","memory_limit=2G", "/root/.composer/vendor/bin/php7cc"]

CMD ["-h"]
