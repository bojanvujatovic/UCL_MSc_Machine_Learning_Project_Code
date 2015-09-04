import sys
import numpy as np
from sklearn.metrics import accuracy_score
from sklearn.metrics import roc_auc_score

def main(argv):
   input_file_name = argv[0]
   output_file_name = argv[1]

   with open(input_file_name, 'r') as input_file:
      input_lines = input_file.readlines()

   n = len(input_lines)
   output_line_indices = np.random.choice(n, n)
   with open(output_file_name, 'w') as output_file:
      for i in output_line_indices:
         output_file.write(input_lines[i])


if __name__ == "__main__":
   main(sys.argv[1:])
