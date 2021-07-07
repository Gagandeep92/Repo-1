version: '3.7'
volumes: 
    mysql_data:
    wordpress_data:

services: 
    database:
        image: mysql:5.7
        volumes: 
            - mysql_data:/var/lib/mysql

        restart: always
        environment: 
            MYSQL_ROOT_PASSWORD: mypassword
            MYSQL_DATABASE: wordpress
            MYSQL_USER: wordpressuser
            MYSQL_PASSWORD: wordpress

    wordpress:
        depends_on: 
            - database

        image: wordpress:latest
        volumes: 
            - wordpress_data:/var/www/html
        ports: 
            - "8081:80"
        restart: always
        environment: 
            WORDPRESS_DB_HOST: database:3306
            WORDPRESS_DB_USER: wordpressuser
            WORDPRESS_DB_PASSWORD: wordpress 
