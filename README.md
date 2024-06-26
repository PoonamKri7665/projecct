# virtual hosting project /in web directory folder data used 
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
```
## Create the user and set the password and database as mentioned in the file login.php (change the server name to localhost if the database is on the same server)
## Create a table in the same database and take data as mentioned in the file reg.php
## Change the bind address to  0.0.0.0 in /etc/mysql/mysql.conf.d/mysqld.cnf
## If you face any error in css loading then check the location of the main.css file in the index.html file 
```
```
# Script to backup the data to aws s3
```
#!/bin/bash
# Define variables
BACKUP_DIR="backup"
TIMESTAMP=$(date +"%F")
MYSQL_USER="jaya"
MYSQL_PASSWORD="123"
S3_BUCKET="backups3storage"
# Create backup directory if not exists
#mkdir -p $BACKUP_DIR
# Backup mysite database
mysqldump -u $MYSQL_USER -p$MYSQL_PASSWORD --no-create-info --skip-comments  --no-tablespaces --skip-add-locks --compact --complete-insert --extended-insert=FALSE student > $BACKUP_DIR/mysite_db$TIMESTAMP.sql
# Upload to S3
aws s3 cp $BACKUP_DIR/mysite_db$TIMESTAMP.sql s3://$S3_BUCKET/
echo "Backup completed and uploaded to S3."
# Clean up old backups
find $BACKUP_DIR -type f -mtime +7 -name "*.sql" -exec rm {} \;
# if this script is give any errror check the path directory location aws credentials or use it as a variable in this script

```
# Detail descriptions of tag used in MySQL dump command
```
--no-create-info:  It will dump only the data, not the table structure.
--skip-comments: This option omits comments from the dump file.
--no-tablespaces: This option disables the creation of CREATE TABLESPACE and ALTER TABLE ... IMPORT TABLESPACE statements. 
--skip-add-locks: This option omits LOCK TABLES and UNLOCK TABLES statements from the dump. 
--compact: This option reduces the output, eliminating unnecessary whitespace and comments, making the dump file smaller.
--complete-insert: This option uses complete INSERT statements with column names. This makes the dump file more robust in case the table structure changes.
--extended-insert=FALSE: This option disables extended inserts. Without this, multiple rows are inserted using a single INSERT statement, which makes the dump file more compact but harder to read. Setting it to FALSE means each row will have its own INSERT statement.
```
# to automate the backup 
sudo crontab -e 
```
set the time according to your use case example:
*/5 * * * * /path/to/your/backup_script.sh (database is backed up every 5 minutes and stored in AWS S3)
```
