#!/bin/sh

set -e

export PATH=/home/matteo/Desktop/SparSNP:$PATH
export PATH=/home/matteo/Desktop/PLINK:$PATH

# Downloading original files
#curl -o data.map.bz2 ftp://ftp.ncbi.nlm.nih.gov/hapmap/genotypes/2009-01_phaseIII/plink_format/hapmap3_r2_b36_fwd.consensus.qc.poly.map.bz2
#curl -o data.ped.bz2 ftp://ftp.ncbi.nlm.nih.gov/hapmap/genotypes/2009-01_phaseIII/plink_format/hapmap3_r2_b36_fwd.consensus.qc.poly.ped.bz2

# Uncompress them
#bzip2 -d data.map.bz2
#bzip2 -d data.ped.bz2

# Convert data to binary format, filter it and remove sex chromosome
#plink --file data \
#      --noweb \
#      --geno 0.01 \
#      --mind 0.01 \
#      --maf 0.01 \
#      --hwe 0.0001 \
#      --chr 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,28,19,20,21,22 \
#      --make-bed --out data-filtered

# Create directory for all helper files      
mkdir -p helper_files

# Create phenotype files
plink --bfile data-filtered \
      --noweb \
      --out helper_files/data-filtered \
      --write-snplist

grep -v '^A' helper_files/data-filtered.snplist | shuf | head -n 1000  > helper_files/1000snps # remove the one with A - making trouble
head -n 10 helper_files/1000snps > helper_files/10snps

snps_list_10=$(cat helper_files/10snps | tr '\n' ',' | rev | cut -c 2- | rev)
snps_list_1000=$(cat helper_files/1000snps | tr '\n' ',' | rev | cut -c 2- | rev)

plink --noweb --bfile data-filtered --snps $snps_list_10 --out helper_files/phenotype-10-raw --recodeA
plink --noweb --bfile data-filtered --snps $snps_list_1000 --out helper_files/phenotype-1000-raw --recodeA

python generate_phenotypes.py helper_files/phenotype-10-raw \
                              helper_files/phenotype-1000-raw \
                              helper_files/phenotypeSex \
                              helper_files/phenotype10 \
                              helper_files/phenotype1000 \
                              helper_files/10snps-weights \
                              helper_files/1000snps-weights 

# Create train and test keep files
shuf data-filtered.fam > helper_files/data-filtered-shuffled.fam

head -n 984 helper_files/data-filtered-shuffled.fam > helper_files/keep-train
tail -n 236 helper_files/data-filtered-shuffled.fam > helper_files/keep-test
head -n 98 helper_files/keep-train > helper_files/keep-10
head -n 237 helper_files/keep-train > helper_files/keep-25
head -n 393 helper_files/keep-train > helper_files/keep-40
head -n 541 helper_files/keep-train > helper_files/keep-55
head -n 688 helper_files/keep-train > helper_files/keep-70
head -n 836 helper_files/keep-train > helper_files/keep-85
head -n 984 helper_files/keep-train > helper_files/keep-100

# Create each dataset in separate directory
for phenotype in phenotypeSex phenotype10 phenotype1000 
do
    # Create test files once for each phenotype - faster
    plink --noweb \
          --bfile data-filtered \
          --pheno helper_files/$phenotype \
          --recode \
          --keep helper_files/keep-test \
          --make-bed --out helper_files/test-$phenotype
    
    for percentage in 10 25 40 55 70 85 100 
    do
        for model in sqrhinge
        do
          #jos jedna loop za bolasso - ako je presporo izbaciti learning curve i ici samo \
          #na 100% - samo za nula lambda2 i gamma

          # vidjetii sto je u papiru sparsnp optimizacija je li samo sqrhinge

            for lambda2 in 0 1 001 00001 
            do
                for gamma in 0 1 001 00001
                do
                    # Create directory
                    dir_name=$(printf "experiment-%s-%s-%s-%s-%s" $phenotype $percentage $model $lambda2 $gamma)
                    mkdir $dir_name
                    
                    # Copy test files
                    cp $(printf "helper_files/test-%s.bed" $phenotype) $(printf "%s/test.bed" $dir_name)
                    cp $(printf "helper_files/test-%s.bim" $phenotype) $(printf "%s/test.bim" $dir_name)
                    cp $(printf "helper_files/test-%s.fam" $phenotype) $(printf "%s/test.fam" $dir_name)
                    
                    # Create train files
                    plink --noweb \
                          --bfile data-filtered \
                          --pheno helper_files/$phenotype \
                          --recode \
                          --keep helper_files/keep-$percentage \
                          --make-bed --out $dir_name/train
                done
            done
        done
    done
done
