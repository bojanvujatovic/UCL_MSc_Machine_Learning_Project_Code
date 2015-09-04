#!/bin/bash

#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 3 of the License, or
# (at your option) any later version.
# 
# Copyright (C) 2011-2012 Gad Abraham and National ICT Australia (NICTA).
# All rights reserved.
#

set -e

export PATH=/home/matteo/Desktop/SparSNP:$PATH
export PATH=/home/matteo/Desktop/PLINK:$PATH

DIR=$1
MODEL=$2
LAMBDA2=$3
GAMMA=$4
PHENOTYPE=$5

pushd $DIR > /dev/null

NUMPROCS=1 # Number of processes
NFOLDS=5 # Number of cross-validation folds
NREPS=1 # Number of cross-validation experiments
NLAMBDA1=7 # Number of penalties to look at
L1MIN=0.001 #The smallest L1 penalty, as a proportion of the 
            #maximal L1 penalty (determined within SparSNP from the data)
NZMAX=1500 # maximum number of non-zero SNPs to consider in model
LAMBDA1s_FILE="lambdas.txt"

N_TRAIN=$(cat train.fam | wc -l | awk '{print $1, $2}')
N_TEST=$(cat test.fam | wc -l | awk '{print $1, $2}')
P=$(cat train.bim | wc -l | awk '{print $1, $2}')

printf "" > train-errors
printf "" > train-F1
printf "" > test-errors
printf "" > validation-errors

for i in $(seq 1 $NREPS)
do
   EXPERIMENT_DIR=experiment$i
   mkdir -p $EXPERIMENT_DIR

   pushd $EXPERIMENT_DIR > /dev/null

   LAMBDA1S_FILE=$PWD/$EXPERIMENT_DIR/lambdas.txt
   FOLD_IND_FILE=$EXPERIMENT_DIR/folds.ind
   FOLD_FILE=$EXPERIMENT_DIR/folds.txt
   SCALE_FILE=$EXPERIMENT_DIR/scale.bin

   BED_TRAIN=../train.bed
   FAM_TRAIN=../train.fam
   BED_TEST=../test.bed
   FAM_TEST=../test.fam
   FOLD_IND_FILE=folds.ind
   FOLD_FILE=folds.txt
   SCALE_FILE=scale.bin

#	 makefolds -folds $FOLD_FILE \
#              -ind $FOLD_IND_FILE \
#              -nfolds $NFOLDS \
#              -n $N_TRAIN > /dev/null

#    scale -bed $BED_TRAIN \
#          -n $N_TRAIN -p $P \
#          -foldind $FOLD_IND_FILE \
#          -scale $SCALE_FILE > /dev/null

   # Run the model
   case $MODEL in
      sqrhinge )

 #            printf "cross validation... "
#
 #            # Cross validate on train data
 #            sparsnp -train \
 #                    -bed $BED_TRAIN -fam $FAM_TRAIN \
 #                    -model $MODEL \
 #                    -scale $SCALE_FILE \
 #                    -n $N_TRAIN -p $P \
 #                    -nzmax $NZMAX \
 #                    -nl1 $NLAMBDA1 -l1min $L1MIN \
 #                    -l2 $LAMBDA2 \
 #                    -gamma $GAMMA \
 #                    -foldind $FOLD_IND_FILE \
 #                    -unscale \
 #                    -v > /dev/null
 #         
 #            # Predict for validation folds
 #            B=$(for((i=0;i<NLAMBDA1;i++)); do printf 'beta.csv.%02d ' $i; done)
 #            sparsnp -predict \
 #                    -bed $BED_TRAIN -fam $FAM_TRAIN \
 #                    -model $MODEL \
 #                    -scale $SCALE_FILE \
 #                    -n $N_TRAIN -p $P \
 #                    -betafiles $B \
 #                    -foldind $FOLD_IND_FILE  \
 #                    -v > /dev/null
 #            printf "lambda looking... "
 #            python ../../find_optimal_lambda_accuracy_0.py $NFOLDS $NLAMBDA1 > lambda1-optimal
 #            LAMBDA1_OPTIMAL=`cat lambda1-optimal`

  #          python ../../find_optimal_accuracy_0.py $NFOLDS $NLAMBDA1 > ../validation-errors

   #          printf "training train with $LAMBDA1_OPTIMAL... "
   #          mkdir -p train
             pushd train > /dev/null
   #          scale -bed ../$BED_TRAIN \
   #                -n $N_TRAIN -p $P \
   #                -scale $SCALE_FILE > /dev/null

    #         sparsnp -train \
    #                 -bed ../$BED_TRAIN -fam ../$FAM_TRAIN \
    #                -model $MODEL \
    #                 -scale $SCALE_FILE \
    #                 -n $N_TRAIN -p $P \
    #                 -nzmax $NZMAX \
    #                 -l1 $LAMBDA1_OPTIMAL \
    #                 -l2 $LAMBDA2 \
    #                 -gamma $GAMMA \
    #                 -unscale \
    #                 -v > /dev/null

     #        sparsnp -predict \
     #                -bed ../$BED_TRAIN -fam ../$FAM_TRAIN \
     #                -model $MODEL \
     #                -scale $SCALE_FILE \
     #                -n $N_TRAIN -p $P \
     #                -betafiles beta.csv.01.00 \
     #                -v > /dev/null
     #        python ../../../calculate_accuracy_0.py y.txt beta.csv.01.00.pred >> ../../train-errors


			 if [[ "$PHENOTYPE" = "phenotype10" ]]; then
python ../../../calculate_F1.py beta.csv.01.00 ../../../helper_files/10snps ../../../helper_files/data-filtered.snplist >> ../../train-F1
cat ../../train-F1
			 fi
			 if [[ "$PHENOTYPE" = "phenotype1000" ]]; then         
python ../../../calculate_F1.py beta.csv.01.00 ../../../helper_files/1000snps ../../../helper_files/data-filtered.snplist >> ../../train-F1
cat ../../train-F1
			 fi
			 if [[ "$PHENOTYPE" = "phenotypeSex" ]]; then
             echo "0" >> ../../train-F1
			 fi

             popd > /dev/null

      #       printf "training test... "
      #       mkdir -p test
      #       pushd test > /dev/null
      #       scale -bed ../$BED_TEST \
      #             -n $N_TEST -p $P \
      #             -scale $SCALE_FILE > /dev/null
      #       sparsnp -predict \
      #              -bed ../$BED_TEST -fam ../$FAM_TEST \
      #              -model $MODEL \
      #               -scale $SCALE_FILE \
      #               -n $N_TEST -p $P \
      #               -betafiles ../train/beta.csv.01.00 \
       #              -v > /dev/null

       #      awk '{print $6}' ../../test.fam > y.txt
       #      sed -i -e 's/1/-1/g' y.txt
       #      sed -i -e 's/2/1/g' y.txt 

      #       python ../../../calculate_accuracy_0.py y.txt beta.csv.01.00.pred >> ../../test-errors

      #       popd > /dev/null
      ;;

      #TODO: Extend for other methods  
   esac

   popd > /dev/null
done

#awk '{s+=$1}END{print s/NR}' RS="\n" train-errors > train-error
#awk '{s+=$1}END{print s/NR}' RS="\n" test-errors > test-error
#awk '{s+=$1}END{print s/NR}' RS="\n" validation-errors > validation-error

popd > /dev/null
