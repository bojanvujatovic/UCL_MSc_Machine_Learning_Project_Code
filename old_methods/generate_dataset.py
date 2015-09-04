import numpy as np
from math import asin, pi

def asin_importance_generation():
    return asin(np.random.random() * 2 - 1) / pi + 0.5

def generate_dataset_exp1(n, n_test, n_features, n_relevant_features, n_random_seed=42):
    np.random.seed(n_random_seed)
    relevant_features_ind = np.random.permutation(range(n_features))[0:n_relevant_features]
    
    def data_f(n, n_features, relevant_features_ind, n_random_seed):
        np.random.seed(n_random_seed)
        
        for i in range(n):
            x = np.random.randint(2, size=n_features)
            y = np.random.randint(2)
            
            for i in relevant_features_ind:
                x[i] = y
        
            yield (x, y)
    
    n_random_seed_test = n_random_seed + 1
    return (lambda: data_f(n, n_features, relevant_features_ind, n_random_seed), lambda: data_f(n_test, n_features, relevant_features_ind, n_random_seed_test), relevant_features_ind, 1)