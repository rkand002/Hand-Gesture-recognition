import pandas as pd
import scipy.io as sc
from sklearn import *
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import confusion_matrix, cohen_kappa_score, accuracy_score
from sklearn.metrics import precision_recall_curve
import matplotlib.pyplot as plt
from sklearn.metrics import average_precision_score
from sklearn.metrics import roc_curve, auc
import numpy as np
from sklearn.externals import joblib

raw= sc.loadmat('Train_number.mat')
X1 = raw['Data']
np.random.shuffle(X1)
print(X1.shape)
X=X1[:,0:13]
Y=X1[:,13]

X_train, X_test, Y_train, Y_test = train_test_split(X,Y,test_size = 0.2)
rf = RandomForestClassifier(n_estimators =100 , n_jobs =40)
rf.fit(X_train, Y_train)
Y_rf_pred = rf.predict(X_test)
cnf_matrix = confusion_matrix(Y_rf_pred, Y_test)
print (cnf_matrix)
acc = accuracy_score(Y_test, Y_rf_pred)
print(acc)

# save the model to disk
filename = 'model.h5'
joblib.dump(rf, filename)

