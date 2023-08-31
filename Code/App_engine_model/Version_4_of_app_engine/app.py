from flask import Flask, request, render_template
import joblib
import pandas as pd
from google.cloud import storage
from google.cloud import logging

# Créer un client de logging
client = logging.Client()

# Récupère un logger basé sur le nom du module Python actuel
logger = client.logger(__name__)

app = Flask(__name__)

# Chargement du modèle à partir de Google Cloud Storage
def load_model_from_gcs(bucket_name, blob_name):
    try:
        logger.log_text("Initialisation du client GCS...")
        storage_client = storage.Client()
        bucket = storage_client.bucket(bucket_name)
        blob = bucket.blob(blob_name)
        logger.log_text("Téléchargement du modèle à partir de GCS...")
        blob.download_to_filename('/tmp/my_model.pkl')#/tmp/
        logger.log_text("Chargement du modèle...")
        model = joblib.load('/tmp/my_model.pkl') #/tmp/
        logger.log_text("Modèle chargé avec succès.")
        return model
    except Exception as e:
        logger.log_text("Une erreur est survenue lors du chargement du modèle : %s" % e)
        raise

# Charger le modèle une fois au démarrage
model = load_model_from_gcs('kyr-sandbox-test-abo-gcs-ew1-gcs_apload_file_bucket', 'my_model.pkl')

@app.route('/', methods=['GET'])
def home():
    return render_template('input.html')

@app.route('/predict', methods=['POST'])
def predict():
    try:
        data = request.form.to_dict()  # Obtenir les données du formulaire
        data_df = pd.DataFrame([data])  # Convertir en dataframe

        # Convertir le champ 'month' en date
        data_df['month'] = pd.to_datetime(data_df['month'])

        # Extraire l'année et le mois
        data_df['year'] = data_df['month'].dt.year
        data_df['month_of_year'] = data_df['month'].dt.month

        # Supprimer le champ 'month' original
        data_df = data_df.drop(columns=['month'])

        logger.log_text("Prédiction en cours...")
        prediction = model.predict(data_df)  # Faire des prédictions
        logger.log_text("Prédiction terminée.")
        #return f'La prediction est: {prediction.tolist()[0]}'  # Renvoyer les prédictions
        return render_template('result.html', prediction=round(prediction.tolist()[0]*100, 2))
    except Exception as e:
        logger.log_text("Une erreur est survenue lors de la prédiction : %s" % e)
        return f'Une erreur est survenue: {e}'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)  # Port de Google App Engine
