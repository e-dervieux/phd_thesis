#!/bin/bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source $DIR/complib.sh

echo ---- Generating front matter figures ----
comptikz 0_front_matter/front_figures/tikz