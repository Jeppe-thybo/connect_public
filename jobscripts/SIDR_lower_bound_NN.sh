#!/bin/bash
#SBATCH --job-name=SIDR_lower
#SBATCH --partition=q144,q128,q64,q48
#SBATCH --mem-per-cpu=4g
#SBATCH --ntasks=100
#SBATCH --nodes=6
#SBATCH --cpus-per-task=1
#SBATCH --time=48:00:00
#SBATCH --output=SIDR_lower_bound_NN.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jeppethybo@live.dk

echo "========= Job started at $(date) =========="

cd /home/jthybo/connect_public/

# 1. Load system modules
module load gcc openmpi

source /home/jthybo/connect_public/resources/planck2018/code/plc_3.0/plc-3.01/build/bin/clik_profile.sh

# 4. Run the code
python connect.py create input/SIDR_lower.param

echo "========= Job finished at $(date) =========="
