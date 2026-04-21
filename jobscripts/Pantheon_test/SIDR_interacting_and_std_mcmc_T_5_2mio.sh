#!/bin/bash
#SBATCH --job-name=pantheon_test
#SBATCH --partition=q128,q64,q48
#SBATCH --mem-per-cpu=3g
#SBATCH --ntasks=6
#SBATCH --nodes=1
#SBATCH --cpus-per-task=1
#SBATCH --time=100:00:00
#SBATCH --output=pantheon_test.out
#SBATCH --mail-type=ALL
#SBATCH --mail-user=jeppethybo@live.dk

echo "========= Job started at `date` =========="

cd /home/jthybo/connect_public/

# activate proper environment if needed
module load gcc openmpi

# source planck data (load path from connect.conf)
source /home/jthybo/connect_public/resources/planck2018/code/plc_3.0/plc-3.01/build/bin/clik_profile.sh

cd resources/montepython_public/

srun --mpi=none --ntasks=6 --cpus-per-task=1 \
  python montepython/MontePython.py run \
  -p /home/jthybo/connect_public/mcmc_plugin/mp_param_templates/Pantheon_likelihood_investigation.param \
  --conf /home/jthybo/connect_public/mcmc_plugin/connect.conf \
  --covmat /home/jthybo/connect_public/resources/montepython_public/covmat/base2018TTTEEE_lite.covmat \
  -o chains/pantheon_likelihood_test \
  -f 0 \
  -N 1 \
  --display-each-chi2

echo "========= Job finished at `date` =========="
