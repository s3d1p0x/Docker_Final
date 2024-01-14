FROM php:8.1-fpm


RUN apt-get update && apt-get install -y \
    git \
    zip \
    unzip

# Nginx
RUN apt-get update && apt-get install -y nginx

# Répertoire de travail
WORKDIR /var/www/html

# Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Node.js
RUN apt-get update && apt-get install -y nodejs

# Npm
RUN apt-get update && apt-get install -y npm

# Effacer le cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Copier les fichiers Nginx dans le conteneur
COPY nginx1.conf /etc/nginx/nginx1.conf
COPY nginx2.conf /etc/nginx/nginx2.conf

# Copier les fichiers PHP dans le conteneur
COPY . .

RUN docker-php-ext-install pdo pdo_mysql

# Pour rendre le script exécutable
RUN chmod +x init.sh

# Commande par défaut pour démarrer Nginx et PHP-FPM
CMD service nginx start && php-fpm && ./init.sh

# Exposer le port 80 pour Nginx
EXPOSE 8000