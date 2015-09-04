def check_phenotype(fid):
    if "case" in fid:
        return "2"
    else:
        return "1"

with open("header.txt", "r") as input:
    with open("output.fam", "w") as output:
        line = input.readline()
        
        mylist = line.split()[3:]
        
        for i in range(0, len(mylist), 2):
            fid = mylist[i]
            iid = mylist[i+1]
            phenotype = check_phenotype(fid)
            
            output.write(fid + " " + iid + " 0 0 0 " + phenotype + "\n")