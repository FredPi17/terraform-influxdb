### Terraform Influxdb

Projet de test permettant de créer une instance influxdb avec une configuration initiale. 

## Containers crées

    - Container docker influxdb (`docker.tf`)
  
## Ressources générées

    - influxdbv2_onboarding-setup 
    - influxdbv2_setup
    - influxdbv2_bucket

## Utilisation 

S'assurer d'avoir terraform dans la version requise dans `versions.tf`, ici la 0.13. 
Lien vers la documentation pour télécharger [terraform](https://www.terraform.io/downloads.html)

## Déploiement 

Initialiser le projet : 

    terraform init

Déployer l'instance Influxdb : 

    terraform apply -target=docker_container.influx -auto-approve

Puis : 

    terraform apply -auto-approve

Si tout se passe bien, le résultat de la commande doit retourner succès. Et vous pouvez vous retrouver dans votre navigateur et aller sur : `http://localhost:8086`. Les identifiants sont ceux présents dans le fichier `influx.tf` dans la ressource onbording-setup, donc :

- username : joe
- password : changeme