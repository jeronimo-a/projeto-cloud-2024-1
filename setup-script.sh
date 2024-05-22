# este script não é para ser executado
# é somente uma explicação do script utilizado para a criação da imagem do webserver
# a parte de instalação do wordpress foi tirada do link https://ubuntu.com/tutorials/install-and-configure-wordpress

# instala as dependências do wordpress
sudo apt update
sudo apt install -y apache2 ghostscript libapache2-mod-php php php-bcmath php-curl php-imagick php-intl php-json php-mbstring php-mysql php-xml php-zip curl

# instala o wordpress
sudo mkdir -p /srv/www
"sudo chown www-data: /srv/www"
curl https://wordpress.org/latest.tar.gz | sudo -u www-data tar zx -C /srv/www

# instala a CLI do wordpress, que será usada para configuração automática da base de dados
sudo curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
sudo chmod +x wp-cli.phar
sudo mv wp-cli.phar /usr/local/bin/wp

# configura o apache para usar o wordpress
sudo su
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
a2ensite wordpress
a2enmod rewrite
a2dissite 000-default
service apache2 reload

# faz a instalação do wordpress na base de dados usando a CLI do wordpress
cd /srv/www/wordpress
wp config create --dbname=${DBName} --dbuser=${MasterUsername} --dbpass=${MasterUserPassword} --dbhost=${DBEndpoint} --allow-root
chown www-data: wp-config.php"
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"`
PUBLIC_DNS=`curl -H "X-aws-ec2-metadata-token: $TOKEN" -s http://169.254.169.254/latest/meta-data/public-hostname`
wp core install --url=http://$PUBLIC_DNS --title="${BlogTitle}" --admin_user="${AdminUsername}" --admin_password="${AdminUserPassword}" --admin_email="${AdminUserEMail}" --allow-root