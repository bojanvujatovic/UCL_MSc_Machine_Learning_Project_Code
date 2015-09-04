import sys
import numpy as np

def main(argv):
   ind_dict = {}
   per = float(argv[0])/100.0
   argv=argv[1:]
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
   snps = []
   with open("helper_files/data-filtered.snplist", "r") as f:
      for line in f:
         snps.append(line.split(",")[0])
   i = 0
   for (key, count) in ind_dict.iteritems():
      keyy = int(key)-1
      if count >= per*n:
         if i == len(ind_dict)-1:
            print snps[keyy]
         else:
            print snps[keyy]+','
         i += 1

if __name__ == "__main__":
   main(sys.argv[1:])
