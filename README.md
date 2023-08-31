# Use-Case-Dataform-with-GCP-
Dataform-driven ELT : Modern Transformations on BigQuery GCP 


Transfert Automatique de Fichiers Locaux vers Google Cloud Storage



Introduction

Ce document décrit la procédure pour mettre en place un système automatisé qui transfère les fichiers d'un répertoire local vers Google Cloud Storage (GCS) en utilisant un script Python.

Description du Processus

Un script Python a été créé pour surveiller en continu un répertoire local spécifié. À chaque fois qu'un fichier est ajouté à ce répertoire, le script le détecte, le charge sur un bucket GCS et le supprime du répertoire local.

Technologies Utilisées

Python : Le langage de programmation utilisé pour développer le script.

Google Cloud Storage Client : Une bibliothèque Python utilisée pour interagir avec Google Cloud Storage.

Configuration

Spécifier le répertoire à surveiller : mention du chemin d'accès au répertoire local a surveiller dans le script Python. Ce répertoire est surveillé en continu par le script.

Paramétrage du bucket GCS : mention du nom du bucket GCS dans le script Python.

Autorisations et clés API Google Cloud : configuration des autorisations appropriées et les clés API Google Cloud.

Fonctionnement

Le script fonctionne en continu et surveille le répertoire local spécifié. Pour chaque fichier ajouté au répertoire, le script vérifie d'abord si un blob du même nom existe déjà dans le bucket. Si ce n'est pas le cas, il charge le fichier sur le bucket GCS et le supprime du répertoire local. Le script vérifie le répertoire toutes les secondes pour détecter de nouveaux fichiers.
