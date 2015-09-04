import sys
import numpy as np

def main(argv):
   valf = argv[0]
   trainf = argv[1]
   testf = argv[2]
   f1f = argv[3]

   validation_data = {}
   train_data = {}
   test_data = {}
   f1_data = {}

   with open(valf, "r") as f:
      for line in f:
         print line
         percentage = int(line.split()[0])
         error = float(line.split()[1])
         if percentage not in validation_data:
            validation_data[percentage] = [error]
         else:
            validation_data[percentage].append(error)

   for (p, e) in validation_data.iteritems():
      validation_data[p]=np.argmin(e)

   with open(trainf, "r") as f:
      for line in f:
         percentage = int(line.split()[0])
         error = float(line.split()[1])
         if percentage not in train_data:
            train_data[percentage] = [error]
         else:
            train_data[percentage].append(error)

   with open(testf, "r") as f:
      for line in f:
         percentage = int(line.split()[0])
         error = float(line.split()[1])
         if percentage not in test_data:
            test_data[percentage] = [error]
         else:
            test_data[percentage].append(error)

   with open(f1f, "r") as f:
      for line in f:
         percentage = int(line.split()[0])
         error = float(line.split()[1])
         if percentage not in f1_data:
            f1_data[percentage] = [error]
         else:
            f1_data[percentage].append(error)

   for (p, e) in train_data.iteritems():
      train_data[p] = train_data[p][validation_data[p]]

   for (p, e) in train_data.iteritems():
      test_data[p] = test_data[p][validation_data[p]]

   for (p, e) in train_data.iteritems():
      f1_data[p] = f1_data[p][validation_data[p]]

   ps = sorted(validation_data.keys())
   

   with open(testf, "w") as f:
      for p in ps:
         f.write(str(p) + " " + str(test_data[p]) + "\n")

   with open(trainf, "w") as f:
      for p in ps:
         f.write(str(p) + " " + str(train_data[p]) + "\n")

   with open(f1f, "w") as f:
      for p in ps:
         f.write(str(p) + " " + str(f1_data[p]) + "\n")

if __name__ == "__main__":
   main(sys.argv[1:])
