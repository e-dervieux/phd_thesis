#!/bin/bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source $DIR/complib.sh

echo ---- Generating appendices figures ----
for location in 2_appendices/figures/tikz 2_appendices/optical_figures/tikz; do
	comptikz $location
done