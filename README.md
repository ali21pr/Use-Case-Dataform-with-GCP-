# Use-Case-Dataform-with-GCP
**Dataform-driven ELT : Modern Transformations on BigQuery GCP**

![dataform drawio (1)](https://github.com/ali21pr/Use-Case-Dataform-with-GCP-/assets/116568003/c034eedb-6eaa-4e03-aafc-4ef3762bf989)


**Etape 1**


**Transfert Automatique de Fichiers Locaux vers Google Cloud Storage**


![integration_data](https://github.com/ali21pr/Use-Case-Dataform-with-GCP-/assets/116568003/81cddfaf-cf4d-4487-806b-55e4d9e6fb21)


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




**Etape 2**

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


**Etape 3**

**Amélioration de la Qualité des Données avec Dataform sur BigQuery**

![Data-Quality drawio](https://github.com/ali21pr/Use-Case-Dataform-with-GCP-/assets/116568003/948e4b12-15a2-4d5b-8709-23fe2ac050b7)

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


**Etape 4**

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


**Etape 5**

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


**Etape 6**


**La Prédiction du Risque dans le Marché Immobilier à l'aide de BigQuery ML et Jupyter Notebook**

**Introduction**

Comprendre et prédire les mouvements du marché immobilier est essentiel pour les investisseurs, les agences immobilières et les décideurs. Le "risk" que nous cherchons à prédire n'est pas simplement un chiffre arbitraire, mais une estimation de la probabilité que l'indice des prix des maisons (HPI - House Price Index) à un moment donné soit inférieur à cet indice 12 mois plus tard. Afin d'obtenir des prévisions précises de ce risque, nous avons employé deux méthodes de machine learning : une utilisant BigQuery ML avec le modèle BOOSTED_TREE_REGRESSOR et une autre s'appuyant sur Jupyter Notebook avec le GradientBoostingRegressor.

**Description du Processus**

L'HPI, ou House Price Index, est un indicateur clé de la santé d'un marché immobilier, reflétant les changements de valeur des propriétés résidentielles. Prédire la direction dans laquelle cet indice pourrait se déplacer peut avoir des implications significatives pour une multitude de parties prenantes.

**BigQuery ML :**

Grâce à la capacité de BigQuery à traiter et analyser de grands ensembles de données, un modèle BOOSTED_TREE_REGRESSOR a été entraîné pour prédire ce "risk" associé aux mouvements de l'HPI.

Après l'entraînement, le modèle a été évalué pour déterminer sa précision et sa robustesse.

**Jupyter Notebook :**

En utilisant un environnement Jupyter, les données sur l'HPI ont été approfondies et le modèle GradientBoostingRegressor a été sélectionné pour sa capacité à traiter des problèmes de régression complexes.

Une fois les données préparées, le modèle a été entraîné, validé et testé pour s'assurer de sa performance.

**Résultats et Comparaison**

Chaque méthode a apporté des insights uniques sur le risque de mouvements de l'HPI :

BigQuery ML : Sa capacité à modéliser directement dans le cloud offre rapidité et efficacité, tout en s'intégrant parfaitement à l'écosystème GCP pour une visualisation et une interprétation aisées des résultats.

Jupyter Notebook : Son environnement interactif permet une exploration approfondie des données, une personnalisation avancée du modèle et une explication claire de chaque étape.

**Impact pour les Décideurs**

Avec une prédiction précise du risque que l'HPI actuel soit inférieur à l'HPI dans 12 mois, les décideurs peuvent élaborer des stratégies d'investissement, évaluer la viabilité des projets immobiliers et anticiper les fluctuations du marché. Ces insights permettent une planification plus stratégique, une allocation de ressources optimisée et une meilleure prise de décision.

**Conclusion**

En utilisant à la fois BigQuery ML et Jupyter Notebook pour analyser et prédire le risque associé aux mouvements de l'HPI, ce projet fournit des outils précieux pour anticiper les tendances du marché immobilier. Ces prédictions enrichissent la compréhension du marché et facilitent des décisions d'investissement plus éclairées.


**Etape 7**

**Automatisation des Requêtes SQLX dans Dataform à l'aide de Workflows et de Cloud Scheduler**

**Introduction**

Dans le contexte de l'analyse des données et de la modélisation, il est essentiel d'actualiser régulièrement les données et les résultats pour refléter les changements et les mises à jour. Pour ce faire, nous avons mis en place un processus automatisé pour exécuter les requêtes SQLX de Dataform, permettant ainsi une mise à jour constante des informations sans intervention manuelle.

**Description du Processus**

**Création d'un Workflow dans Dataform :**

Un workflow a été conçu pour orchestrer l'exécution des requêtes SQLX dans Dataform.

Les requêtes ont été définies comme des étapes séquentielles dans un fichier YAML, en tenant compte des dépendances entre elles. Cela garantit que les requêtes sont exécutées dans le bon ordre, en s'assurant que chaque étape reçoit les données nécessaires de l'étape précédente.

**Intégration avec Cloud Scheduler :**

Afin de déclencher le workflow de manière régulière et automatique, Google Cloud Scheduler a été utilisé.

Cloud Scheduler a été configuré pour déclencher le workflow tous les jours à 10 heures du matin. Lorsque cette heure arrive, Cloud Scheduler envoie un signal pour démarrer le workflow, qui à son tour commence à exécuter les requêtes SQLX en suivant la séquence définie dans le fichier YAML.

**Avantages de l'Automatisation**

Actualité : Les données et les modèles sont constamment mis à jour, garantissant ainsi que les visualisations, les rapports et les analyses sont basés sur les informations les plus récentes.

Efficacité : L'automatisation élimine le besoin d'exécuter manuellement les requêtes, économisant ainsi du temps et réduisant les erreurs humaines.

Cohérence : En exécutant les requêtes à un moment spécifié chaque jour, on garantit une cohérence dans la collecte et l'analyse des données.

**Conclusion**

L'automatisation du processus de requête à l'aide de workflows Dataform et de Cloud Scheduler permet non seulement une gestion plus efficace des ressources, mais aussi une confiance accrue dans la précision et l'actualité des données. Ce système garantit que les parties prenantes ont toujours accès aux informations les plus pertinentes pour prendre des décisions éclairées.

**Etape 8**

**Automatisation du Modèle BigQuery ML**

**Introduction**
Cette documentation présente le processus d'automatisation du modèle conçu à l'aide de BigQuery ML. L'automatisation est essentielle pour s'assurer que le modèle est régulièrement mis à jour avec les dernières données, offrant ainsi des prédictions toujours actuelles.

**Description du Processus**
Afin de garantir une mise à jour automatique du modèle, une suite d'outils et de services Google Cloud a été mise en place pour orchestrer et exécuter cette tâche.

Cloud Function:La première étape de ce processus consiste à héberger la requête SQL qui crée ou met à jour le modèle dans une Cloud Function. Cette fonction est spécifiquement conçue pour déclencher le processus de "building" du modèle dans BigQuery ML.

Pub/Sub:La Cloud Function est déclenchée par la publication d'un message via Google Cloud Pub/Sub. Pub/Sub agit comme un intermédiaire qui transmet des messages permettant de coupler de manière décentralisée les applications qui produisent des événements à celles qui les traitent.

Cloud Scheduler:Pour assurer que le processus s'exécute de manière régulière et cohérente, un Cloud Scheduler a été mis en place. Son rôle est d'envoyer un message Pub/Sub tous les jours à 10h10 du matin. Cette heure a été spécifiquement choisie pour s'assurer que toutes les requêtes Dataform ont terminé leur traitement, étant donné que leur scheduler s'exécute à 10h du matin. Cela garantit que le modèle dans BigQuery ML fonctionne toujours sur les données les plus récentes.

**Conclusion**
Grâce à cette automatisation, le modèle BigQuery ML est constamment à jour, permettant d'obtenir des prédictions basées sur les informations les plus récentes. Cette approche garantit non seulement la pertinence des prédictions, mais aussi l'efficacité du processus, en minimisant l'intervention manuelle et en maximisant la précision des prédictions.

**Etape 9**

**Intégration et Déploiement du Modèle de Machine Learning via Flask et App Engine**

**Introduction**
Cette section détaille l'approche utilisée pour intégrer le modèle de machine learning élaboré dans Jupyter, déployer une API Flask sur Google Cloud App Engine et enfin fournir une interface utilisateur pour la saisie des paramètres et l'affichage des prédictions.

**Description du Processus**

Chargement du Modèle sur Google Cloud Storage (GCS):Le modèle entraîné dans Jupyter a été exporté et chargé sur un bucket GCS. Stocker le modèle dans GCS permet un accès rapide et sécurisé, facilitant son intégration dans diverses applications et services.

**API Flask:**

Création: Une API a été développée avec Flask, un framework léger de développement web en Python. Cette API sert d'intermédiaire entre le modèle de machine learning et l'interface utilisateur, en recevant les données d'entrée, en effectuant la prédiction et en renvoyant le résultat.

Intégration du Modèle: L'API charge le modèle depuis le bucket GCS, ce qui permet de faire des prédictions en temps réel.

Déploiement sur Google Cloud App Engine: L'API Flask a été déployée sur Google Cloud App Engine, une plateforme entièrement gérée qui permet de construire et d'héberger des applications dans l'environnement cloud de Google. L'utilisation d'App Engine garantit la scalabilité, la sécurité et la haute disponibilité de l'API.

**Interface Utilisateur:**

Formulaire de Saisie: Une interface a été créée avec HTML, CSS et Bootstrap pour permettre à l'utilisateur de saisir les paramètres nécessaires à la prédiction. Cette interface est intuitive et adaptée aux non-techniciens.

Affichage des Résultats: Une fois que l'utilisateur soumet les informations via le formulaire, l'API Flask traite les données, utilise le modèle pour faire une prédiction, et le résultat est ensuite affiché sur une page web dédiée, également conçue avec HTML, CSS et Bootstrap.

**Conclusion**
Ce processus complet assure une intégration transparente du modèle de machine learning dans une application web. Il fournit un moyen facile et convivial pour les utilisateurs d'obtenir des prédictions en temps réel sans se soucier de la complexité sous-jacente du modèle ou de l'infrastructure.
