#!/bin/bash
#
#SBATCH --job-name="GLDS-120_infer_exp_multiqc"
#SBATCH --output=GLDS-120_infer_exp_multiqc.out
#SBATCH --mem=10000
#
#SBATCH --mail-user=user@nasa.gov
#SBATCH --mail-type=END

. ~/.profile

echo "infer_experiment_multiqc_report"
echo ""

start=$(date +%s)
echo "start time: $start"
echo $HOSTNAME
echo ""

source activate /conda/envs/rnaseq_v1.0

in_dir=/GLDS-120/RSeQC_analyses/03_infer_experiment

mkdir $in_dir/infer_exp_multiqc_report

out_dir=/GLDS-120/RSeQC_analyses/03_infer_experiment/infer_exp_multiqc_report

echo "multiqc version: "
multiqc --version
echo ""

call="multiqc -n infer_exp_multiqc -o $out_dir $in_dir/"

echo $call
echo ""
eval $call

echo ""
end=$(date +%s)
echo "end time: $end"
runtime_s=$(echo $(( end - start )))
echo "total run time(s): $runtime_s"
sec_per_min=60
sec_per_hr=3600
runtime_m=$(echo "scale=2; $runtime_s / $sec_per_min;" | bc)
echo "total run time(m): $runtime_m"
runtime_h=$(echo "scale=2; $runtime_s / $sec_per_hr;" | bc)
echo "total run time(h): $runtime_h"

