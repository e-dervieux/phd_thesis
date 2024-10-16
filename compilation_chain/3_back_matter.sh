#!/bin/bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source $DIR/complib.sh

echo ---- Generating backmatter figures ----
comptikz 3_back_matter/figures/tikz