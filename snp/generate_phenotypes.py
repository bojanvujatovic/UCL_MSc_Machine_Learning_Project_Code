import sys
import numpy as np

def main(argv):
   phenotype_10_input = argv[0]
   phenotype_1000_input = argv[1]

   phenotype_sex_output = argv[2]
   phenotype_10_output = argv[3]
   phenotype_1000_output = argv[4]

   weights_10_output = argv[5]
   weights_1000_output = argv[6]

   output_file = open(phenotype_sex_output, 'w')
   with open(phenotype_10_input + ".raw", 'r') as input_file:
      next(input_file) # skip header
      for line in input_file:
         line_split = line.split()
         output_file.write(line_split[0] + ' ' + line_split[1] + ' ' + line_split[4] + '\n')
   output_file.close()

   output_file = open(phenotype_10_output, 'w')
   signals = []
   weights = 3 * np.random.randn(10)
   with open(phenotype_10_input + ".raw", 'r') as input_file:
      next(input_file) # skip header
      for line in input_file:
         line_split = line.split()
         features = map(lambda x: int(x) if x != 'NA' else -1, line_split[6:])
         signals.append(np.inner(weights, features))
   mean_signals = sum(signals) / len(signals)
   with open(phenotype_10_input + ".raw", 'r') as input_file:
      next(input_file) # skip header
      for line in input_file:
         line_split = line.split()
         features = map(lambda x: int(x) if x != 'NA' else -1, line_split[6:])
         if np.inner(weights, features) >= mean_signals:
            output_file.write(line_split[0] + ' ' + line_split[1] + ' ' + '2' + '\n')
         else:
            output_file.write(line_split[0] + ' ' + line_split[1] + ' ' + '1' + '\n')
   output_file.close()
   output_file = open(weights_10_output, 'w')
   for w in weights:
      output_file.write(str(w) + '\n')
   output_file.close()

   output_file = open(phenotype_1000_output, 'w')
   signals = []
   weights = 3 * np.random.randn(1000)
   with open(phenotype_1000_input + ".raw", 'r') as input_file:
      next(input_file) # skip header
      for line in input_file:
         line_split = line.split()
         features = map(lambda x: int(x) if x != 'NA' else -1, line_split[6:])
         signals.append(np.inner(weights, features))
   mean_signals = sum(signals) / len(signals)
   with open(phenotype_1000_input + ".raw", 'r') as input_file:
      next(input_file) # skip header
      for line in input_file:
         line_split = line.split()
         features = map(lambda x: int(x) if x != 'NA' else -1, line_split[6:])
         if np.inner(weights, features) >= mean_signals:
            output_file.write(line_split[0] + ' ' + line_split[1] + ' ' + '2' + '\n')
         else:
            output_file.write(line_split[0] + ' ' + line_split[1] + ' ' + '1' + '\n')
   output_file.close()
   output_file = open(weights_1000_output, 'w')
   for w in weights:
      output_file.write(str(w) + '\n')
   output_file.close()


if __name__ == "__main__":
   main(sys.argv[1:])