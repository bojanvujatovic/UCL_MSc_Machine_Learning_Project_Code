def check_phenotype(fid):
    if "case" in fid:
        return "2"
    else:
        return "1"

with open("/storage/iArray/ADAM/ADHD/DosageExtraction/FilteredDosage/card/singleChromosomeFiles/SNPs_chr3_card.dosage", "r") as input:
    with open("output333.map", "w") as output:
        line = input.readline()
        
        i = 0
        for line in input:
            i = i + 1
            if i%1000 == 0:
                print i
            snp = line[:100].split()[0]
            
            output.write("1" + " " + snp + " 0 " + str(i) + "\n")