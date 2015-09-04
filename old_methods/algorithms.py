import numpy as np
import sys
sys.path.insert(0, './liblinearmaster/python')
from liblinearutil import *

def logistic_regression_l1(data_f_train, data_f_test, lambda_reg, n, n_test, n_features):
    w = logistic_regression_l1_train(data_f_train, lambda_reg, n, n_features)
    
    (y_pred, y) = logistic_regression_predict(data_f_test, w, n_test, n_features)
    
    return (w, y_pred, y)

def logistic_regression_l1_train(data_f, l, n, n_features):
    w = np.zeros(n_features)
    
    # TODO: ispuniti
    #u svakoj iteraciji vratititi random see
    
    for i in range(3):  
        for x, y in data_f():
            pass
    
    return w

def logistic_regression_predict(data_f_test, w, n_test, n_features):
    y_pred = np.zeros(n_test)
    y_real = np.zeros(n_test)
    
    i = 0
    for x, y in data_f_test():
        y_real[i] = y
        y_pred[i] = sigmoid(x.dot(w))
        i = i + 1
    
    return (y_pred, y_real)

def logistic_regression_l2(data_f_train, data_f_test, lambda_reg, n, n_test, n_features):
    w = logistic_regression_l2_train(data_f_train, lambda_reg, n, n_features)
    
    (y_pred, y) = logistic_regression_predict(data_f_test, w, n_test, n_features)
    
    return (w, y_pred, y)

def logistic_regression_l2_train(data_f, l, n, n_features, tol = 0.001):
    w = np.zeros(n_features)
    grad = np.ones(n_features) * n_features * tol
    alpha = 0.1
    iteration = 0
    error1 = logistic_regression_error_function(data_f, n, w, l)
    error2 = logistic_regression_error_function(data_f, n, w, l)
    
    while (error1 - error2 > tol or iteration == 0) and iteration < 100:  
        error1 = error2
        iteration = iteration + 1
        for x, y in data_f():
            #print ""
            #print w
            #print logistic_regression_error_function(lambda: [(x, y)], 1, w, l)
            grad = -scale(y) * sigmoid(-scale(y) * x.dot(w)) * x + 2*l * w
            w -= alpha * grad
            #print logistic_regression_error_function(lambda: [(x, y)], 1, w, l)
            #print grad
            #print w
            #print ""
        
        error2 = logistic_regression_error_function(data_f, n, w, l)
        #print iteration, np.linalg.norm(grad)
        print w
        print "error:", logistic_regression_error_function(data_f, n, w, l)
      
    return w

def logistic_regression_error_function(data_f, n, w, l):
    error = 0.0
    
    for x, y in data_f():
        error += 1.0/n * -np.log(sigmoid(scale(y)*x.dot(w))) + l * np.linalg.norm(w)**2
    
    return error

def sigmoid(x):
    return 1.0 / (1.0 + np.exp(-x))

def scale(y):
    if y == 0:
        return -1
    elif y == 1:
        return +1
    else:
        return None