#!/bin/bash

PARAM=/home/jthybo/connect_public/mcmc_plugin/mp_param_templates/Pantheon_likelihood_investigation.param
CONF=/home/jthybo/connect_public/mcmc_plugin/connect.conf
COV=/home/jthybo/connect_public/resources/montepython_public/covmat/base2018TTTEEE_lite.covmat

OUT_ORIG=chains/pantheon_orig
OUT_MOD=chains/pantheon_mod

HSTART=0.62
HEND=0.72
STEP=0.002

echo "h chi2_orig chi2_mod" > chi2_scan.txt

for h in $(seq $HSTART $STEP $HEND); do

    echo "Running h = $h"

    # --- ORIGINAL PANTHEON ---
    python MontePython.py run \
        -p $PARAM \
        --conf $CONF \
        --covmat $COV \
        -o $OUT_ORIG \
        -f 0 -N 1 --display-each-chi2 \
        --override h=$h > tmp_orig.log

    chi2_orig=$(grep "Pantheon" tmp_orig.log | awk '{print $6}')

    # --- MODIFIED PANTHEON ---
    python MontePython.py run \
        -p $PARAM \
        --conf $CONF \
        --covmat $COV \
        -o $OUT_MOD \
        -f 0 -N 1 --display-each-chi2 \
        --override h=$h > tmp_mod.log

    chi2_mod=$(grep "Pantheon" tmp_mod.log | awk '{print $6}')

    echo "$h $chi2_orig $chi2_mod" >> chi2_scan.txt

done