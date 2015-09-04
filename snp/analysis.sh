set -e

export PATH=/home/matteo/Desktop/SparSNP:$PATH
export PATH=/home/matteo/Desktop/PLINK:$PATH

N_DIRS=$(($(ls -lr | grep ^d | wc -l | xargs)-1-1)) # -1 for helper folder 
I=1

for dir in *; do
	         arr=(${dir//-/ })
         phenotype=${arr[1]} 
         percentage=${arr[2]} 
         model=${arr[3]} 
         lambda2=0.${arr[4]}
         gamma=0.${arr[5]}

    if [[ -d "$dir" && ! -L "$dir" && $dir = experiment* && "$model" = "sqrhinge" ]]; then

         ./crossval.sh $dir $model $lambda2 $gamma $phenotype

         printf "\r$I/$N_DIRS "
         I=$((I+1))
    fi
done

echo ""
