####################################################
# Script setup and documentation
####################################################

set -e

m_verbose="no"
m_fig_compile="no"
m_man_compile="no"

function Help()
{
# Display Help
echo "Hoopefully compiles the thesis' manuscript."
echo
echo "Syntax: scriptTemplate [-h|v]"
echo "options:"
echo "f     Compile TikZ figures"
echo "h     Print this Help."
echo "v     Verbose mode."
echo
}

while getopts ":fhmv" option; do
	case $option in
		f) # compile figures
			m_fig_compile="yes";;
		h) # display Help
			Help
			exit;;
		m) # compile full manuscript
			m_man_compile="yes";;
		v) # verbose
			m_verbose="yes";;
		\?) # Invalid 
			echo "Error: Invalid option"
			exit;;
		esac
done

####################################################
# Compile figures for each part separately
####################################################

if [ $m_fig_compile = "yes" ]; then
	source ./compilation_chain/0_front_matter.sh
	source ./compilation_chain/1_main_matter.sh
	source ./compilation_chain/2_appendices.sh
	source ./compilation_chain/3_back_matter.sh
fi

####################################################
# Main compilation
####################################################

if [ $m_man_compile = "yes" ]; then
	# Creating main output dirs
	mkdir -p out
	mkdir -p out/0_front_matter
	mkdir -p out/1_main_matter
	mkdir -p out/2_appendices
	mkdir -p out/3_back_matter

	# Main compilation
	lualatex -synctex=1 -output-directory out -interaction=errorstopmode thesis.tex
	(cd out && makeglossaries thesis)
	biber --output-directory out thesis
	lualatex -synctex=1 -output-directory out -interaction=errorstopmode thesis.tex
	lualatex -synctex=1 -output-directory out -interaction=errorstopmode thesis.tex
fi
