# Projet docker 👋
  
Bienvenu sur cette page Github. Ici vous allez pouvoir découvrir le résultat de notre intense travail.
Avec mes camarades, nous avons mis en place deux sites web qui vont révolutionner le monde d'Internet. 

## 🧐 Features    
- Le site web 1 affiche "Serveur 1 et une petite suprise" 
- Le site web 2 affiche "Serveur 2 et une autre petite surprise"

Vous remarquerez l'imagination :-)  

Le site web est est accessible en localhost sur le port 2424 et le second est accessible sur le port 4242

- [Site Web 1](http://localhost:4242)
- [Site Web 2](http://localhost:2424)

## 👾 Architecture logiciel   

- docker-compose qui va permettre de lancer deux services nginx, deux services PHP et une base de donnée mysql. 
- DockerFile : 
-  .env : pour lier laravel et la base de donnée
- Les fichiers de configurations de nginx 

## 🏍️ Démarrage 

Pour démarrer les deux sites web : 

```
docker compose up --build
```

A l'intérieur de chaque containers php : 

```
composer install
npm install && npm run dev
```

A l'exterieur des containers:
```
docker exec -it nom_docker chown -R www-data:www-data /var/www/html/storage/logs
