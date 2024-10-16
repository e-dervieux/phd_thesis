####################################################
# Script setup and documentation
####################################################

set -e

m_verbose="no"

function Help()
{
# Display Help
echo "Hoopefully compiles the thesis' manuscript."
echo
echo "Syntax: scriptTemplate [-h|v]"
echo "options:"
echo "h     Print this Help."
echo "v     Verbose mode."
echo
}

while getopts ":hv" option; do
	case $option in
		h) # display Help
			Help
			exit;;
		v) # verbose
			m_verbose="yes"
			;;
		\?) # Invalid 
			echo "Error: Invalid option"
			exit;;
		esac
done

####################################################
# Compile figures for each part separately
####################################################

source ./compilation_chain/0_front_matter.sh
source ./compilation_chain/1_main_matter.sh
source ./compilation_chain/2_appendices.sh
source ./compilation_chain/3_back_matter.sh

####################################################
# Main compilation
####################################################

# Creating main output dirs
mkdir -p out
mkdir -p out/0_front_matter
mkdir -p out/1_main_matter
mkdir -p out/2_appendices
mkdir -p out/3_back_matter

# Main compilation
#lualatex -synctex=1 -output-directory out -interaction=nonstopmode thesis.tex
#(cd out && makeglossaries thesis)
#biber --output-directory out thesis
#lualatex -synctex=1 -output-directory out -interaction=nonstopmode thesis.tex
