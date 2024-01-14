#!/bin/bash

# Installer les dépendances Laravel
composer install
npm install

# Générer la clé d'application
php artisan key:generate

# Effectuer les migrations avec des données de base
php artisan migrate:fresh --seed
