set -e

export PATH=/home/vujatovicb/SparSNP:$PATH
export PATH=/home/vujatovicb/PLINK:$PATH

	makefolds -folds folds \
              -ind ind \
             -nfolds 5 \
             -n 2528 > /dev/null

    scale -bed test.bed \
          -n 2528 -p 611716 \
          -foldind ind \
          -scale scale > /dev/null
                    
               sparsnp -train \
                     -bed test.bed -fam test.fam \
                     -model sqrhinge \
                     -scale scale \
                     -n 2528 -p 611716 \
                     -nzmax 2528 \
                     -l1 0.001 \
                     -l2 0.001 \
                     -gamma 0.001 \
                     -foldind ind \
                     -unscale \
                     -v
                     
                         sparsnp -predict \
                     -bed test.bed -fam test.fam \
                     -model sqrhinge \
                     -scale scale \
                     -n 2528 -p 611716 \
                     -betafiles beta.csv.01 \
                     -foldind ind  \
                     -v 
                     