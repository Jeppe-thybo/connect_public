#!/bin/bash
#SBATCH --job-name=DRMD_NN
#SBATCH --partition=q48,q64
#SBATCH --mem-per-cpu=4g
#SBATCH --ntasks=200
#SBATCH --nodes=6
#SBATCH --cpus-per-task=1
#SBATCH --time=48:00:00
#SBATCH --output=DRMD_final_NN.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jeppethybo@live.dk

echo "========= Job started at $(date) =========="

cd /home/jthybo/connect_public/

# 1. Load system modules
module load gcc openmpi

source /home/jthybo/connect_public/resources/planck2018/code/plc_3.0/plc-3.01/build/bin/clik_profile.sh

# 4. Run the code
python connect.py create input/DRMD_final.param

echo "========= Job finished at $(date) =========="
