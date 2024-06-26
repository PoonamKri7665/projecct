# project
This a simple login and registration page that will store the user's data in the MySQL database and script to store data on AWS s3
# install the prerequisite
```
sudo apt update
sudo apt install apache2  (# for the webserver)
sudo apt install php libapache2-mod-php php-mysql (#for the database connection to webserver here I am using php string for the connection )
sudo apt install mysql-server (#for the database)
```
# directory for the webserver
put the directory of your site in /var/www/html/
change the owner and permission of the file if the directory is not accessible directly.
# To enable the site link edit the Apache conf file
## directory for the configuration setting /etc/apache2/sites-available
make a copy of the default configuration first on the name of your site and edit the details 
```
<VirtualHost *:80>
        ServerAdmin webmaster@site1.com
        ServerName mysite.com
        ServerAlias www.mysite.com
        DocumentRoot /var/www/html/
        ErrorLog ${APACHE_LOG_DIR}/error.log
        CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```
## Restart the Apache service
```
sudo systemctl restart apache2
```
## disable the default configuration 
sudo a2dissite 000-default
## Enable your site configuration
sudo a2ensite mysite.com.conf
```
## Create the user and set the password and database as mentioned in the file login.php (change the server name to localhost if the database is on the same server)
## Create a table in the same database and take data as mentioned in the file reg.php
## Change the bind address to  0.0.0.0 in /etc/mysql/mysql.conf.d/mysqld.cnf
## If you face any error in css loading then check the location of the main.css file in the index.html file 
```


