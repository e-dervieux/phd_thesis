#!/bin/bash
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source $DIR/complib.sh

echo ---- Generating main matter figures ----
cd 1_main_matter
for location in choos_figures/review choos_figures/schemes co2hb_figures conclusion_figures intro_figures tcco2_figures thin_film_figures/encasp_pbl thin_film_figures/experimentals thin_film_figures/luminophores thin_film_figures/optoelectronics; do
	comptikz $location/tikz
done
cd ..

FILE="1_main_matter/tcco2_figures/tikz/out/photo_pos.pdf"
FILE_NAME=${FILE%.*}
gs -sDEVICE=pdfwrite -dMaxSubsetPct=100 -dPDFSETTINGS=/printer -sOutputFile="${FILE_NAME}_comp.pdf" -sColorConversionStrategy='LeaveColorUnchanged' -dNOPAUSE -dBATCH $FILE