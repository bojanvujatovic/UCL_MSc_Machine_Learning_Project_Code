set -e

#for phenotype in phenotype1000 phenotypeSex phenotype10 
#do
#for per in 10 20 30 40 50 60 70 80 90 100
#do
#    python intersect.py $per $(ls -d experiment-$phenotype-100-bolasso*) > helper_files/$phenotype-intersection$per

#listsnps=$(grep -v '^A' helper_files/$phenotype-intersection$per | tr -d '\n')

#mkdir -p experiment-$phenotype-100-BOLASSOOOO-0-0-$per
#plink --noweb \
#          --bfile data-filtered \
#          --pheno helper_files/$phenotype \
#          --recode \
#          --keep helper_files/keep-test \
#          --snps $listsnps \
#          --make-bed --out experiment-$phenotype-100-BOLASSOOOO-0-0-$per/test

#plink --noweb \
#          --bfile data-filtered \
#          --pheno helper_files/$phenotype \
#          --recode \
#          --keep helper_files/keep-train \
#          --snps $listsnps \
#          --make-bed --out experiment-$phenotype-100-BOLASSOOOO-0-0-$per/train

#done
#done

N_DIRS=$(($(ls -lr | grep ^d | wc -l | xargs)-1-1)) # -1 for helper folder 
I=1

for dir in *; do
	         arr=(${dir//-/ })
         phenotype=${arr[1]} 
         percentage=${arr[2]} 
         model=${arr[3]} 
         lambda2=0.${arr[4]}
         gamma=0.${arr[5]}

    if [[ -d "$dir" && ! -L "$dir" && $dir = experiment* && "$model" = "BOLASSOOOO" ]]; then

         ./crossval.sh $dir sqrhinge $lambda2 $gamma $phenotype 

         printf "\r$I/$N_DIRS "
         I=$((I+1))
    fi
done
echo ""

