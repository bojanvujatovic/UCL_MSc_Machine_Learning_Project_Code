import sys
import numpy as np

def main(argv):
   ind_dict = {}
   n=len(argv)
   for folder in argv:
      with open(folder + "/experiment1/train/beta.csv.01.00", "r") as ind_file:
         for line in ind_file:
			ind = line.split(",")[0]
			if ind in ind_dict:				
				ind_dict[ind]+=1
			else:
				ind_dict[ind]=1
   with open("AAAAA.txt", "w") as aaa:
      for i in ind_dict.values():
         aaa.write(str(i)+"\n")
   with open("helper_files/data-filtered.snplist", "r") as f:
      lines = f.readlines()
   snps = map(lambda x: x.split(",")[0], lines)
   i = 0
   for (key, count) in ind_dict.iteritems():
      if count > 0.2*n:
         if i == 0:
            sys.stdout.write(key)
         else:
            sys.stdout.write(","+key)
         i = 1

if __name__ == "__main__":
   main(sys.argv[1:])
