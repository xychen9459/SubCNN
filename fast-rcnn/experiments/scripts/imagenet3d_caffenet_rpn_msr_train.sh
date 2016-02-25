#!/bin/bash

set -x
set -e

export PYTHONUNBUFFERED="True"

LOG="experiments/logs/imagenet3d_caffenet_rpn_msr_train.txt.`date +'%Y-%m-%d_%H-%M-%S'`"
exec &> >(tee -a "$LOG")
echo Logging output to "$LOG"

time ./tools/train_net.py --gpu $1 \
  --solver models/CaffeNet/imagenet3d/solver_rpn_msr.prototxt \
  --weights data/imagenet_models/CaffeNet.v2.caffemodel \
  --imdb imagenet3d_trainval \
  --cfg experiments/cfgs/imagenet3d_rpn_msr.yml \
  --iters 160000
