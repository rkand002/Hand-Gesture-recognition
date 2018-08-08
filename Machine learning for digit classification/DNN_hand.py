import pandas as pd
import scipy.io as sc
import keras
from sklearn.model_selection import train_test_split
from keras.callbacks import Callback
import warnings
from sklearn.linear_model import LogisticRegression
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import confusion_matrix, cohen_kappa_score, accuracy_score
from sklearn.metrics import precision_recall_curve
import matplotlib.pyplot as plt
from sklearn.metrics import average_precision_score
from sklearn.metrics import roc_curve, auc
import numpy as np
from sklearn.externals import joblib
import seaborn as sn
raw= sc.loadmat('Train_number_norm.mat')
X1 = raw['Data1']
np.random.shuffle(X1)
print(X1.shape)
X=X1[:,0:13]
Y=X1[:,13]
np.random.seed(7)
X_train, X_test, Y_train, Y_test = train_test_split(X,Y,test_size = 0.3)
y_train = keras.utils.to_categorical(np.transpose(Y_train))
from keras.models import Sequential
from keras.layers.core import Dense , Dropout
from keras.optimizers import SGD
class EarlyStoppingByLossVal(Callback):
    def __init__(self, monitor='loss', value=0.001, verbose=0):
        super(Callback, self).__init__()
        self.monitor = monitor
        self.value = value
        self.verbose = verbose

    def on_epoch_end(self, epoch, logs={}):
        current = logs.get(self.monitor)
        if current is None:
            warnings.warn("Early stopping requires %s available!" % self.monitor, RuntimeWarning)

        if current < self.value:
            if self.verbose > 0:
                print("Epoch %05d: early stopping THR" % epoch)
            self.model.stop_training = True

callbacks = [
    EarlyStoppingByLossVal(monitor='val_loss', value=0.001, verbose=1),
    # EarlyStopping(monitor='val_loss', patience=2, verbose=0),
    #ModelCheckpoint(kfold_weights_path, monitor='val_loss', save_best_only=True, verbose=0),
]
model = Sequential()

model.add(Dense(80, activation='relu', input_dim=X_train.shape[1]))
#model.add(Dropout(0.5))
model.add(Dense(50, activation='relu'))
model.add(Dense(30, activation='relu'))
model.add(Dense(15, activation='relu'))
model.add(Dense(y_train.shape[1], activation='softmax'))

sgd = SGD(lr=0.01, decay=1e-6, momentum=0.9, nesterov=True)
model.compile(loss='categorical_crossentropy',
              optimizer=sgd,
              metrics=['accuracy'])

model.fit(X_train, y_train,
          epochs=100,
          batch_size=200,verbose=1, validation_split=0.2)
keras.callbacks.EarlyStopping(monitor='val_loss', min_delta=0, patience=0, verbose=0, mode='min')
y_test=keras.utils.to_categorical(np.transpose(Y_test))
score = model.evaluate(X_test, y_test, batch_size=100)
(loss, accuracy)=score

print('\n Testing Accuracy')
print("[INFO] loss={:.4f}, accuracy: {:.4f}%".format(loss, accuracy * 100))
predictions = model.predict_classes(X_test)
z=confusion_matrix(Y_test, predictions)
print("\n" ,z)



df_cm = pd.DataFrame(z, range(6),
                  range(6))
plt.figure(figsize = (10,7))
sn.heatmap(df_cm, annot=True)
plt.title('Confusion matrix of the classifier')
plt.xlabel('Predicted')
plt.ylabel('True')
plt.show()

model.save('C:\\Users\\moin\\Desktop\\deep\\CS895\\digit_model.h5')
sc.savemat('X_test',{"test_f":X_test})
sc.savemat('Y_test',{"test_c":Y_test})