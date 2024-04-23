#!/bin/bash

export PROJ_PATH=$(realpath .)

alias sim='$PROJ_PATH/proc/vsim $PROJ_PATH/proc/sim.f'

# Check if venv directory exists
if [ ! -d "$PROJ_PATH/venv" ]; then
    echo "Creating virtual environment..."
    python3 -m venv $PROJ_PATH/venv
    source $PROJ_PATH/venv/bin/activate
    pip install -r $PROJ_PATH/proc/requirements.txt
else
    source $PROJ_PATH/venv/bin/activate
    pip install -r $PROJ_PATH/proc/requirements.txt
fi