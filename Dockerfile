# Use the official PHP image with Apache
FROM php:8.2-apache

# Install PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable mod_rewrite (Apache)
RUN a2enmod rewrite

# Set ServerName to suppress the Apache warning
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Modify the DirectoryIndex to include index.php as the default file
RUN echo "DirectoryIndex index.php" >> /etc/apache2/apache2.conf

# Set the working directory inside the container
WORKDIR /var/www/html

# Copy your PHP code into the container
COPY ./agms /var/www/html/

# Set the correct file permissions
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

# Expose the port 80 for web traffic
EXPOSE 80

# Start the Apache server
CMD ["apache2-foreground"]
