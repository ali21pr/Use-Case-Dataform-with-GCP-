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


**Etape3**

**Amélioration de la Qualité des Données avec Dataform sur BigQuery**

**Introduction**

Ce document décrit le processus mis en œuvre pour améliorer la qualité des données stockées dans Google BigQuery à l'aide de Dataform, un outil qui permet d'effectuer des opérations ELT (Extract, Load, Transform).

**Description du Processus**

Une fois les données chargées sur BigQuery, une ressource Dataform a été créée pour améliorer la qualité des données. Dataform offre un espace de travail, appelé "workspace", qui a été connecté à un dépôt Git pour gérer et suivre les modifications du code. Le langage utilisé est le SQLX, qui est une combinaison de SQL et JavaScript.

Le processus comprend plusieurs étapes, chacune étant réalisée par une requête SQLX distincte et stockant ses résultats dans une nouvelle table dans BigQuery.

**Structure de Workspace**

Le workspace de Dataform a été structuré en trois dossiers et datasets correspondants :

Sources : Ce dossier contient des références aux tables sources dans BigQuery.

Staging : Ce dossier contient toutes les transformations de données, y compris les opérations de qualité des données.

Reporting : Ce dossier contient les requêtes qui seront utilisées pour la visualisation des données et éventuellement pour le machine learning.

**Opérations de Qualité des Données**

Les opérations de qualité des données comprennent :

**Détection des valeurs manquantes** : Une requête a été créée pour détecter toutes les colonnes de chaque table qui contiennent plus de 25 % de valeurs manquantes. Les résultats de cette requête ont été stockés dans une nouvelle table.

**Élimination des colonnes avec de nombreuses valeurs manquantes** : Une autre requête a été créée pour prendre chaque table source et la soustraire de la table contenant les colonnes avec plus de 25 % de valeurs manquantes. Cela a donné une nouvelle table pour chaque table source, où chaque colonne a soit des valeurs complètes, soit moins de 25 % de valeurs manquantes.

**Imputation des valeurs manquantes** : Pour chaque colonne restante dans les tables, une requête a été créée pour trouver la valeur la plus fréquente. Les valeurs manquantes ont ensuite été remplacées par cette valeur la plus fréquente.

**Suppression des doublons** : Une dernière requête a été créée pour détecter et supprimer les doublons dans chaque table.

Tous les résultats des opérations de qualité des données ont été stockés dans de nouvelles tables dans le dataset "dataform_staging" de BigQuery.
