import os
import time
from google.cloud import storage

def upload_files_to_gcs(local_folder, bucket_name):
    # Créer une instance du client Google Cloud Storage
    client = storage.Client()

    # Obtenir une référence au bucket de destination
    bucket = client.get_bucket(bucket_name)

    # Boucle infinie pour surveiller le dossier local
    while True:
        # Parcourir tous les fichiers dans le dossier local
        for file_name in os.listdir(local_folder):
            file_path = os.path.join(local_folder, file_name)

            # Vérifier si le chemin est un fichier et n'est pas un dossier
            if os.path.isfile(file_path):
                # Vérifier si le fichier n'a pas déjà été transféré
                if not blob_exists(bucket, file_name):
                    # Transférer le fichier vers le bucket GCS
                    blob = bucket.blob(file_name)
                    blob.upload_from_filename(file_path)
                    print(f"Fichier transféré vers GCS : {file_name}")

                    # Supprimer le fichier local après le transfert
                    os.remove(file_path)
                    print(f"Fichier local supprimé : {file_name}")

        # Attendre 1 seconde avant de vérifier à nouveau le dossier
        time.sleep(1)

def blob_exists(bucket, blob_name):
    # Vérifier si un blob avec le même nom existe déjà dans le bucket
    blobs = bucket.list_blobs(prefix=blob_name)
    return any(blob.name == blob_name for blob in blobs)

# Définir le chemin du dossier local et le nom du bucket GCS
local_folder = 'D:/Keyrus_Stage/DataForm/Test'
bucket_name = 'kyr-sandbox-test-abo-gcs-ew1-gcs_apload_file_bucket'

# Appeler la fonction pour surveiller et transférer automatiquement les fichiers
upload_files_to_gcs(local_folder, bucket_name)
