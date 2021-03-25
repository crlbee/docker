openssl req \
	-x509 \
	-out /etc/nginx/localhost.crt \
	-keyout /etc/nginx/localhost.key \
	-newkey rsa:2048 \
	-nodes \
	-sha256 \
	-subj '/CN=localhost'

mkdir -p /var/www/localhost
tar xf wordpress.tar  -C ./var/www/localhost/
tar xf phpMyAdmin.tar -C ./var/www/localhost/

/etc/init.d/php7.3-fpm start

service mysql start
mysql < init.sql

mv localhost /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-enabled/default

chown -R www-data:www-data /var/www/localhost

service nginx start
bash