# Use-Case-Dataform-with-GCP
**Dataform-driven ELT : Modern Transformations on BigQuery GCP **

**Etape 1 :**

**Transfert Automatique de Fichiers Locaux vers Google Cloud Storage**

**Introduction**

Ce document décrit la procédure pour mettre en place un système automatisé qui transfère les fichiers d'un répertoire local vers Google Cloud Storage (GCS) en utilisant un script Python.

** Description du Processus **

Un script Python a été créé pour surveiller en continu un répertoire local spécifié. À chaque fois qu'un fichier est ajouté à ce répertoire, le script le détecte, le charge sur un bucket GCS et le supprime du répertoire local.

**Technologies Utilisées**

**Python** : Le langage de programmation utilisé pour développer le script.

**Google Cloud Storage Client** : Une bibliothèque Python utilisée pour interagir avec Google Cloud Storage.

**Configuration**

Spécifier le répertoire à surveiller : mention du chemin d'accès au répertoire local a surveiller dans le script Python. Ce répertoire est surveillé en continu par le script.

Paramétrage du bucket GCS : mention du nom du bucket GCS dans le script Python.

Autorisations et clés API Google Cloud : configuration des autorisations appropriées et les clés API Google Cloud.

**Fonctionnement**

Le script fonctionne en continu et surveille le répertoire local spécifié. Pour chaque fichier ajouté au répertoire, le script vérifie d'abord si un blob du même nom existe déjà dans le bucket. Si ce n'est pas le cas, il charge le fichier sur le bucket GCS et le supprime du répertoire local. Le script vérifie le répertoire toutes les secondes pour détecter de nouveaux fichiers.




**Etape2**

**Automatisation du Transfert de Fichiers de Google Cloud Storage à BigQuery**

**Introduction**

Ce document décrit la procédure pour mettre en place une Google Cloud Function qui automatise le transfert de fichiers CSV de Google Cloud Storage (GCS) vers BigQuery.

**Description du Processus**

Une Google Cloud Function a été mise en place pour surveiller un bucket spécifié sur GCS. À chaque fois qu'un fichier est ajouté au bucket, la Cloud Function est déclenchée. Elle détecte le fichier nouvellement ajouté, le charge dans une table correspondante sur BigQuery et le supprime ensuite du bucket GCS. Si une table du même nom existe déjà dans BigQuery, la fonction ajoute les données du nouveau fichier à la table existante. En outre, la Cloud Function crée un log avec une sévérité de type "warning" dans Google Cloud Logging indiquant le nom du fichier qui a été transféré à BigQuery.

**Technologies Utilisées**

**Python** : Le langage de programmation utilisé pour développer la Cloud Function.

**Pandas** : Une bibliothèque Python utilisée pour la manipulation des données.

**Google Cloud Storage Client, BigQuery Client, Logging Client** : Des bibliothèques Python utilisées pour interagir avec Google Cloud Storage, BigQuery, et Google Cloud Logging, respectivement.

**Google Cloud Function** : Un service serverless permettant d'exécuter du code en réponse à des événements spécifiques.

**Configuration**

Spécifier le bucket GCS à surveiller : Définir le bucket GCS à surveiller dans la Cloud Function.

Paramétrage de la table BigQuery : Les noms des tables BigQuery sont déterminés par le nom du fichier téléchargé sur le bucket GCS. La Cloud Function se charge de créer une nouvelle table ou d'ajouter les données à une table existante.

Autorisations et clés API Google Cloud : configuration des autorisations appropriées et les clés API Google Cloud.

**Fonctionnement**

La Cloud Function est déclenchée chaque fois qu'un fichier est ajouté au bucket GCS surveillé. Elle lit les données du fichier CSV, les charge dans une table BigQuery correspondante, et supprime ensuite le fichier du bucket GCS. Si une table du même nom existe déjà dans BigQuery, la fonction ajoute les données du nouveau fichier à cette table. Un log avec une sévérité de type "warning" est également créé dans Google Cloud Logging, notant le nom du fichier qui a été transféré à BigQuery.
