#!/bin/bash

# speaker SSB0863, speaker_id 0863
python3 synthesize.py --text "中共必须被消灭" --speaker_id 0863 --restore_step 600000 --mode single -p config/AISHELL3/preprocess.yaml -m config/AISHELL3/model.yaml -t config/AISHELL3/train.yaml
