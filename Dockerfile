FROM alpine:3.13.5

RUN apk add --no-cache --update \
            php7 \
            php7-bcmath \
            php7-ctype \
            php7-curl \
            php7-dom \
            php7-fileinfo \
            php7-fpm \
            php7-gd \
            php7-iconv \
            php7-intl \
            php7-json \
            php7-mbstring \
            php7-mysqli \
            php7-sqlite3 \
            php7-opcache \
            php7-openssl \
            php7-pdo \
            php7-pdo_mysql \
            php7-pdo_sqlite \
            php7-phar \
            php7-session \
            php7-simplexml \
            php7-soap \
            php7-sodium \
            php7-tokenizer \
            php7-xml \
            php7-xmlreader \
            php7-xmlwriter \
            php7-xsl \
            php7-zip \
            php7-pecl-redis \
            php7-pecl-xdebug \
            git \
            rsync && \
            rm -rf /etc/php7/php-fpm.d

COPY php.ini /etc/php7/conf.d/99_php.ini
COPY php-fpm.conf /etc/php7/php-fpm.conf

COPY --from=composer:2.3.5 /usr/bin/composer /usr/bin/composer

STOPSIGNAL SIGQUIT

EXPOSE 9000

CMD ["php-fpm7"]
