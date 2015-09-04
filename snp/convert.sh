set -e

export PATH=/home/vujatovicb/SparSNP:$PATH
export PATH=/home/vujatovicb/PLINK:$PATH

#python create_fam.py

#for chr in 1 2 3 4 5;
#do
#python create_map.py /storage/iArray/ADAM/ADHD/DosageExtraction/FilteredDosage/card/singleChromosomeFiles/SNPs_chr$(chr)_card.dosage
#./fcgene/fcgene_static --dosage /storage/iArray/ADAM/ADHD/DosageExtraction/FilteredDosage/card/singleChromosomeFiles/SNPs_chr$(chr)_card.dosage --fam output.fam --map output333.map --oformat plink-bed --out test3
#done

plink --noweb --bfile test --bmerge test2.bed test2.bim test2.fam --make-bed --out merge --merge-mode 3
