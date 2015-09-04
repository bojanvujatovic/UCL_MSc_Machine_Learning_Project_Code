import sys
import numpy as np
from sklearn.metrics import accuracy_score
from sklearn.metrics import roc_auc_score

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

def main(argv):
   beta_file_name = argv[0]
   real_file_name = argv[1]
   snps_file_name = argv[2]

   snps = []
   with open(snps_file_name, 'r') as f:
      for line in f:
         snpss = line.strip("\n")
         snps.append(snpss)

   real=[]
   with open(real_file_name, 'r') as f:
      for line in f:
         reall = line.strip("\n")
         real.append(snps.index(reall))
   
   pred=[]
   with open(beta_file_name, 'r') as f:
      for line in f:
         predd = line.split(",")[0]
         pred.append(predd)

   #print real
   #print pred
   print f1(np.array(real), np.array(pred))

if __name__ == "__main__":
   main(sys.argv[1:])
