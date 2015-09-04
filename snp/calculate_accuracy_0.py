import sys
import numpy as np
from sklearn.metrics import accuracy_score
from sklearn.metrics import roc_auc_score

def main(argv):
   real_file_name = argv[0]
   pred_file_name = argv[1]

   with open(real_file_name, 'r') as real_file:
      real = map(float, real_file.readlines())
   with open(pred_file_name, 'r') as pred_file:
      pred = map(float, pred_file.readlines())

   pred_0 = map(lambda x: 1.0 if x >= 0 else -1.0, pred)

   accuracy_0 = accuracy_score(real, pred_0)

   print accuracy_0

if __name__ == "__main__":
   main(sys.argv[1:])