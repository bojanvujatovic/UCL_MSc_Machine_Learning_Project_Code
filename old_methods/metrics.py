import numpy as np


def precision(real, retreived):
    if retreived.shape[0] == 0:
        return 0
    return float(np.intersect1d(real, retreived).shape[0]) / retreived.shape[0]


def recall(real, retreived):
    if real.shape[0] == 0:
        return 0
    return float(np.intersect1d(real, retreived).shape[0]) / real.shape[0]

def f1(real, retreived):
    p = precision(real, retreived)
    r = recall(real, retreived)
    
    if p * r == 0:
        return 0
    return 2*p*r/(p+r)

def calculate_f1_from_w(w, relevant_features_ind, threshold = 0.001):
    features_discovered_ind = np.empty(0, dtype=int)
    
    for i in range(w.size):
        if np.abs(w[i]) > threshold:
            np.append(features_discovered_ind, i)
    
    return f1(relevant_features_ind, features_discovered_ind)

def accuracy_at(y_pred, y, tr):
    n = y.size
    accuracy = 0.0
    for i in range(n):
        if (y_pred[i] > tr and y[i] == 1) or (y_pred[i] <= tr and y[i] == 0):
            accuracy += 1.0 / n
    
    return accuracy