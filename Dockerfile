FROM alpine:3.6

RUN apk add --no-cache caddy php7 php7-fpm php7-gd \
    php7-session php7-xml php7-openssl php7-zlib

RUN echo "clear_env = no" >> /etc/php7/php7-fpm.conf

RUN chown -R caddy:caddy /var/www /var/log

WORKDIR /var/www

COPY files/Caddyfile /etc/Caddyfile
COPY files/index.html /var/www
COPY files/info.php /var/www

EXPOSE 2015
USER caddy
ENTRYPOINT ["/usr/sbin/caddy"]
CMD ["--conf", "/etc/Caddyfile"]
