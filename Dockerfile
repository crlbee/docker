FROM debian:buster

RUN    apt-get -y update \
	&& apt-get -y install \
					nginx \
					openssl \
					mariadb-server \
					php7.3 \
					php7.3-cli \
					php7.3-curl \
					php7.3-fpm \
					php7.3-cgi \
					php7.3-mysql \
					php7.3-mbstring

COPY ./srcs ./

EXPOSE 80 443

CMD bash init.sh