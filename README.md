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


**Etape4**

**Création de modèles de transformation de données avec SQLX**

**Introduction**

Dans le cadre de notre pipeline de données, une étape cruciale consiste à effectuer diverses transformations de données pour préparer nos données pour l'analyse et le reporting. Nous utilisons pour cela un ensemble de modèles SQLX dans Dataform, une plateforme qui permet de structurer et d'organiser efficacement nos transformations de données.

**Description**

Dans cette étape, nous avons créé une série de modèles SQLX qui effectuent une variété de transformations sur nos données. Ces modèles comprennent des opérations telles que l'exécution de fonctions d'agrégat, la manipulation de cubes de données, et d'autres transformations pertinentes. Un exemple de modèle est la détermination de la valeur de l'indice des prix des logements par État pour une période donnée, ce qui est précieux pour analyser les tendances du marché immobilier.

**Technologies utilisées**

Pour mener à bien cette étape, nous avons utilisé une combinaison de technologies :

**Git** : Nous utilisons Git pour la gestion des versions de notre code SQLX, ce qui nous permet de suivre l'évolution de nos transformations de données et de collaborer efficacement en équipe.

**Dataform** : Dataform est notre plateforme de choix pour l'organisation et l'exécution de nos transformations de données. Il nous permet de structurer nos transformations en modèles et de les organiser dans un environnement de travail (workspace) cohérent.

**SQLX** : SQLX, qui combine SQL et JavaScript, est le langage que nous utilisons pour définir nos modèles de transformation de données. Il nous offre la flexibilité d'écrire du code SQL robuste avec la capacité d'intégrer des éléments de logique de programmation grâce à JavaScript.

**Configuration**

Nos modèles SQLX sont configurés pour être exécutés dans Dataform. Chaque modèle est défini en utilisant SQLX et est configuré pour être une vue ou une table dans notre environnement de travail Dataform qui est ensuite chargee dans le dataset Dataform reporting pour la reporting et l’analyse.


**Etape5**

**Description de la Visualisation des Données avec Looker**

**Introduction**

La visualisation des données est un élément crucial pour interpréter, comprendre et transmettre les informations contenues dans les vastes ensembles de données. Dans ce projet, nous utilisons Looker, un outil moderne de visualisation des données, pour transformer nos données transformées et de haute qualité de BigQuery en représentations visuelles significatives.

**Description du Processus**

Après la phase de qualité des données et la modélisation dans BigQuery via Dataform, les données sont finalement prêtes pour la visualisation. Les tables contenues dans le dataset "reporting" ont été liées à Looker pour construire diverses vues.

Looker a la capacité de créer une gamme de visualisations, allant des simples graphiques à barres ou à courbes, aux diagrammes circulaires, en passant par les tableaux détaillés. Chaque visualisation est conçue pour répondre à des questions spécifiques et offrir des insights pertinents selon les besoins du projet.

**Structure du Projet Looker**

Le projet Looker est organisé autour d'une page d'accueil principale, qui sert de portail d'accès à toutes les visualisations. De là, les utilisateurs peuvent naviguer vers diverses pages, chacune se concentrant sur un aspect spécifique des données :

**Page d'accueil** : Une vue d'ensemble de tous les ensembles de données et un point d'entrée pour explorer les visualisations plus détaillées.

**Visualisations par Modèle** : Pour chaque modèle de données créé dans BigQuery, une page correspondante a été conçue dans Looker. Ces pages proposent différentes formes de visualisations pour chaque ensemble de données, permettant une exploration approfondie.

**Types de Visualisations**

Chaque page de modèle dans Looker propose une variété de visualisations :

Graphiques à barres : Idéal pour comparer la taille de plusieurs éléments.

Graphiques à courbes : Utilisé pour visualiser les tendances au fil du temps.

Diagrammes circulaires : Pour représenter des proportions.

Tableaux : Présentent des données détaillées en format tabulaire.

Chaque visualisation est interactive, permettant aux utilisateurs de filtrer, de zoomer ou de cliquer pour obtenir plus de détails.

**Conclusion**

La combinaison de BigQuery, Dataform et Looker offre une solution complète - de l'ingestion et la transformation des données à la visualisation. Grâce à Looker, les données transformées et modélisées sont désormais accessibles à une variété d'utilisateurs, des analystes aux décideurs, leur permettant d'obtenir des insights clairs et actionnables à partir des données.
