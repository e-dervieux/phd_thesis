#!/bin/bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source $DIR/complib.sh

echo ---- Generating main matter figures ----
cd 1_main_matter
for location in choos_figures/review/tikz choos_figures/schemes/tikz co2hb_figures/tikz; do
	comptikz $location
done
cd ..