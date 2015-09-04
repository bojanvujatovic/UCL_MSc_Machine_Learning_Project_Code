

set -e

export PATH=/home/matteo/Desktop/SparSNP:$PATH
export PATH=/home/matteo/Desktop/PLINK:$PATH
   
mkdir -p results
for phenotype in phenotypeSex phenotype10 phenotype1000 
do
    mkdir -p results/$phenotype 

    printf "" > results/$phenotype/lasso-learning-train
    printf "" > results/$phenotype/lasso-learning-test
    printf "" > results/$phenotype/lasso-learning-validation
    printf "" > results/$phenotype/lasso-learning-F1
    
for dir in *; do
    if [[ -d "$dir" && ! -L "$dir" && $dir = experiment* ]]; then
	         arr=(${dir//-/ })
        phenotype_dir=${arr[1]}
        percentage_dir=${arr[2]}
        model=${arr[3]}
        lambda2_dir=${arr[4]}
        gamma_dir=${arr[5]}




        if [[ "$phenotype_dir" = "$phenotype" && "$gamma_dir" = "0" && "$lambda2_dir" = "0" && "$model" = "sqrhinge" ]]; then
        train_error=`cat $dir/train-error`
        test_error=`cat $dir/test-error`
        validation_error=`cat $dir/validation-error`
f1=`cat $dir/train-F1`
            echo "$percentage_dir $train_error" >> results/$phenotype/lasso-learning-train
            echo "$percentage_dir $test_error" >> results/$phenotype/lasso-learning-test
            echo "$percentage_dir $validation_error" >> results/$phenotype/lasso-learning-validation
echo "$percentage_dir $f1" >> results/$phenotype/lasso-learning-F1
        fi
    fi
    done
    python finalise_learning_results.py results/$phenotype/lasso-learning-validation results/$phenotype/lasso-learning-train results/$phenotype/lasso-learning-test results/$phenotype/lasso-learning-F1

    printf "" > results/$phenotype/elasticnet-learning-train
    printf "" > results/$phenotype/elasticnet-learning-test
    printf "" > results/$phenotype/elasticnet-learning-validation
 printf "" > results/$phenotype/elasticnet-learning-F1

    for dir in *; do
    if [[ -d "$dir" && ! -L "$dir" && $dir = experiment* ]]; then

        arr=(${dir//-/ })
        phenotype_dir=${arr[1]}
        percentage_dir=${arr[2]}
model=${arr[3]}
        lambda2_dir=${arr[4]}
        gamma_dir=${arr[5]}




        if [[ "$phenotype_dir" = "$phenotype" && "$gamma_dir" = "0" && ! "$lambda2_dir" = "0" && "$model" = "sqrhinge" ]]; then
        train_error=`cat $dir/train-error`
        test_error=`cat $dir/test-error`
        validation_error=`cat $dir/validation-error`
f1=`cat $dir/train-F1`
            echo "$percentage_dir $train_error" >> results/$phenotype/elasticnet-learning-train
            echo "$percentage_dir $test_error" >> results/$phenotype/elasticnet-learning-test
            echo "$percentage_dir $validation_error" >> results/$phenotype/elasticnet-learning-validation
echo "$percentage_dir $f1" >> results/$phenotype/elasticnet-learning-F1
        fi
    fi
    done
    python finalise_learning_results.py results/$phenotype/elasticnet-learning-validation results/$phenotype/elasticnet-learning-train results/$phenotype/elasticnet-learning-test results/$phenotype/elasticnet-learning-F1

    printf "" > results/$phenotype/fusion-learning-train
    printf "" > results/$phenotype/fusion-learning-test
    printf "" > results/$phenotype/fusion-learning-validation
printf "" > results/$phenotype/fusion-learning-F1
    for dir in *; do
    if [[ -d "$dir" && ! -L "$dir" && $dir = experiment* ]]; then
        arr=(${dir//-/ })
        phenotype_dir=${arr[1]}
        percentage_dir=${arr[2]}
model=${arr[3]}
        lambda2_dir=${arr[4]}
        gamma_dir=${arr[5]}




        if [[ "$phenotype_dir" = "$phenotype" && ! "$gamma_dir" = "0" && "$lambda2_dir" = "0" && "$model" = "sqrhinge" ]]; then
        train_error=`cat $dir/train-error`
        test_error=`cat $dir/test-error`
        validation_error=`cat $dir/validation-error`
f1=`cat $dir/train-F1`
            echo "$percentage_dir $train_error" >> results/$phenotype/fusion-learning-train
            echo "$percentage_dir $test_error" >> results/$phenotype/fusion-learning-test
            echo "$percentage_dir $validation_error" >> results/$phenotype/fusion-learning-validation
echo "$percentage_dir $f1" >> results/$phenotype/fusion-learning-F1
        fi
    fi
    done
    python finalise_learning_results.py results/$phenotype/fusion-learning-validation results/$phenotype/fusion-learning-train results/$phenotype/fusion-learning-test results/$phenotype/fusion-learning-F1

    printf "" > results/$phenotype/elasticnetfusion-learning-train
    printf "" > results/$phenotype/elasticnetfusion-learning-test
    printf "" > results/$phenotype/elasticnetfusion-learning-validation
printf "" > results/$phenotype/elasticnetfusion-learning-F1
    for dir in *; do
    if [[ -d "$dir" && ! -L "$dir" && $dir = experiment* ]]; then
        arr=(${dir//-/ })
        phenotype_dir=${arr[1]}
        percentage_dir=${arr[2]}
model=${arr[3]}
        lambda2_dir=${arr[4]}
        gamma_dir=${arr[5]}




        if [[ "$phenotype_dir" = "$phenotype" && ! "$gamma_dir" = "0" && ! "$lambda2_dir" = "0" && "$model" = "sqrhinge" ]]; then
        train_error=`cat $dir/train-error`
        test_error=`cat $dir/test-error`
        validation_error=`cat $dir/validation-error`
f1=`cat $dir/train-F1`
            echo "$percentage_dir $train_error" >> results/$phenotype/elasticnetfusion-learning-train
            echo "$percentage_dir $test_error" >> results/$phenotype/elasticnetfusion-learning-test
            echo "$percentage_dir $validation_error" >> results/$phenotype/elasticnetfusion-learning-validation
echo "$percentage_dir $f1" >> results/$phenotype/elasticnetfusion-learning-F1
        fi
    fi
    done
    python finalise_learning_results.py results/$phenotype/elasticnetfusion-learning-validation results/$phenotype/elasticnetfusion-learning-train results/$phenotype/elasticnetfusion-learning-test results/$phenotype/elasticnetfusion-learning-F1
done

