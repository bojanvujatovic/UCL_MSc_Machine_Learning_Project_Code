import sys
import numpy as np
from sklearn.metrics import accuracy_score
from sklearn.metrics import roc_auc_score

def main(argv):
   n_folds = int(argv[0])
   n_lambda1 = int(argv[1])

   lambda1_maxs = []
   accuracy_0_maxs = []

   for i_fold in range(n_folds):
      accuracy_0_max = float("-inf")

      lambda1s_file_name = "lambda1path.csv.%02d" % (i_fold)
      with open(lambda1s_file_name, 'r') as lambda1s_file:
        lambda1s = map(float, lambda1s_file.readlines())

      real_file_name = "y.%02d" % (i_fold)
      with open(real_file_name, 'r') as real_file:
        real = map(float, real_file.readlines())

      for i_lambda1 in range(n_lambda1):
         try:
            pred_file_name = "beta.csv.%02d.%02d.pred" % (i_lambda1, i_fold)
            with open(pred_file_name, 'r') as pred_file:
               pred = map(float, pred_file.readlines())

            pred_0 = map(lambda x: 1.0 if x >= 0 else -1.0, pred)
            accuracy_0 = accuracy_score(real, pred_0)

            auc = roc_auc_score(real, pred)
         except:
            accuracy_0 = 0.0
            auc = 0

         

         if accuracy_0 > accuracy_0_max:
            accuracy_0_max = accuracy_0
            lambda1_max = lambda1s[i_lambda1]
            i_lambda1_max = i_lambda1
      
      accuracy_0_maxs.append(accuracy_0_max)
      lambda1_maxs.append(lambda1_max) 

   lambda1_optimal = sum(lambda1_maxs) / len(lambda1_maxs)
   accuracy_0_optimal = sum(accuracy_0_maxs) / len(accuracy_0_maxs)

   print accuracy_0_optimal

if __name__ == "__main__":
   main(sys.argv[1:])