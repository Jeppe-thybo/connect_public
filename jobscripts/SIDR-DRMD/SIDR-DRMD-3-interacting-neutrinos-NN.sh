#!/bin/bash
#SBATCH --job-name=SIDR-DRMD-NN
#SBATCH --partition=q144,q128,q64,q48
#SBATCH --mem-per-cpu=4g
#SBATCH --ntasks=200
#SBATCH --nodes=10
#SBATCH --cpus-per-task=1
#SBATCH --time=40:00:00
#SBATCH --output=SIDR-DRMD-3-interacting-neutrinos-NN.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jeppethybo@live.dk

echo "========= Job started at `date` =========="

cd /home/jthybo/connect_public/

# activate proper environment if needed
module load gcc openmpi

# source planck data (load path from connect.conf)
source /home/jthybo/connect_public/resources/planck2018/code/plc_3.0/plc-3.01/build/bin/clik_profile.sh

python connect.py create input/SIDR_DRMD_3_interacting_neutrinos.param 

echo "========= Job finished at `date` =========="
