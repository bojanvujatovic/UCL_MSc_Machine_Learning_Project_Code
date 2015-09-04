import numpy as np

from generate_dataset import *
from algorithms import *
from metrics import *

from itertools import product

def generate_n_relevant_features(generating_f):
    if generating_f == generate_dataset_exp1:
        return [10]
    else:
        return None

if __name__== "__main__":
    
    
    ns      = [1000]
    n_tests = [1000]
    n_featuress          = [1000000]
    #lambda_regs = np.logspace(-3, 3, 13)
    lambda_regs = [0.1]
    generating_fs = [generate_dataset_exp1]
    algorithms = [logistic_regression_l2]
    
    parameter_space = product(ns, n_tests, n_featuress, lambda_regs, generating_fs, algorithms)
    i = 0
    
    for n, n_test, n_features, lambda_reg, generating_f, algorithm in parameter_space:
        n_relevant_featuress = generate_n_relevant_features(generating_f)
        
        for n_relevant_features in n_relevant_featuress:
            i = i + 1
            
            print "n", n
            print "n_test", n_test
            print "n_features", n_features
            print "lambda_reg", lambda_reg
            print "n_relevant_features", n_relevant_features
            print "generating_f", generating_f.__name__
            print "algorithm", algorithm.__name__
            
            data_f_train, data_f_test, relevant_features_ind, opt_accuracy_test = generating_f(n, n_test, n_features, n_relevant_features, i)    
            
            w, y_pred, y = algorithm(data_f_train, data_f_test, lambda_reg, n, n_test, n_features)            
            
            print "Accuracy at 0.5:", accuracy_at(y_pred, y, 0.5)
            print "F1:", calculate_f1_from_w(w, relevant_features_ind)
            print ""
            print ""