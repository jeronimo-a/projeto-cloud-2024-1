# atualiza os respositórios dos pacotes e instala as dependências
apt update
apt install -y	apache2 \
               	ghostscript \
               	libapache2-mod-php \
		        mysql-server \
        	    php \
              	php-bcmath \
       		    php-curl \
        	    php-imagick \
              	php-intl \
	            php-json \
       	        php-mbstring \
               	php-mysql \
	 	        php-xml \
                php-zip

# cria o diretório do wordpress e o baixa nele
mkdir -p /srv/www
chown www-data: /srv/www
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www

# cria o arquivo de configuração do wordpress
touch /etc/apache2/sites-available/wordpress.conf
echo "<VirtualHost *:80>
    DocumentRoot /srv/www/wordpress
    <Directory /srv/www/wordpress>
        Options FollowSymLinks
        AllowOverride Limit Options FileInfo
        DirectoryIndex index.php
        Require all granted
    </Directory>
    <Directory /srv/www/wordpress/wp-content>
        Options FollowSymLinks
        Require all granted
    </Directory>
</VirtualHost>" > /etc/apache2/sites-available/wordpress.conf

# configurações do apache
a2ensite wordpress
a2enmod rewrite
a2dissite 000-default

# reinicia o serviço do apache
service apache2 reload
