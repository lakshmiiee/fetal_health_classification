import pymysql, warnings, os
import numpy as np 
import pandas as pd 
import matplotlib.pyplot as plt
import seaborn as sns
from xgboost import XGBClassifier
from sklearn.preprocessing import StandardScaler
from django.conf import settings

connection = pymysql.connect(host="localhost",
                             user="root",
                             password="",
                             database="little_pulse")
cursor = connection.cursor()

def iud(query):
    try:
        cursor.execute(query)
        connection.commit()
        return True
    except pymysql.err.IntegrityError:
        connection.rollback()
        return False
    
def selectone(query):
    cursor.execute(query)
    data = cursor.fetchone()
    return data

def selectall(query):
    cursor.execute(query)
    data = cursor.fetchall()
    return data

warnings.filterwarnings('ignore')
data_df = pd.read_csv(os.path.join(settings.BASE_DIR, 
                                   "Static", 
                                   "ml", 
                                   "fetal_health.csv"))
x = data_df.drop(["fetal_health"], axis=1)
y = data_df["fetal_health"]
col_names = x.columns.tolist()
s_scaler = StandardScaler()
X_scaled = s_scaler.fit_transform(x)
model = XGBClassifier()
model.load_model(os.path.join(settings.BASE_DIR,
                              "Static",
                              "ml",
                              "fetal_health_xgb.h5"))

def predict_fetal_health(new_data, model=model, scaler=s_scaler):
    """
    Function to predict fetal health for new input data.
    :param new_data: A list or NumPy array of input features (same order as training data)
    :param model: Trained XGBoost model
    :param scaler: StandardScaler object used for training
    :return: Predicted fetal health class (1, 2, or 3)
    """
    new_data = pd.DataFrame([new_data], columns=col_names)
    new_data_scaled = scaler.transform(new_data)
    prediction = model.predict(new_data_scaled)
    return prediction[0]