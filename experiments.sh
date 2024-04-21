#!/bin/bash

# Get today's date in YYYY-MM-DD format
today=$(date +%F)

# Iterate over window sizes from 30 to 180 with a step size of 30
for window_size in {30..180..30}
do
    # Construct the experiment name with today's date as prefix
    exp_name="${today}_window_${window_size}"

    # Run the Python script with the specified configuration
    python main_nerf.py --config=configs/spiral2/spiral2_enerf.txt --datadir=../spiral2/ --iters=200 --expname="$exp_name" --eval_interval=1 --window_size=$window_size
done
