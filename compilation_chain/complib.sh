RED=$(tput setaf 1 || printf '\x1B[31m')
GREEN=$(tput setaf 2 || printf '\x1B[32m')
NC=$(tput sgr0 || printf '\x1B[0m')

if [ -z "$m_verbose" ]; then m_verbose="no"; fi

function comptikz () {
# compiles tikz latex file taking location and texfile as argument
pushd "$1" > /dev/null
	printf "Generating figures in $1\n"
	mkdir -p out
	for texfile in *.tex; do
		printf "Compiling $texfile..."
		if [ $m_verbose = "yes" ]; then my_out="stdout"; else my_out="null"; fi
		if lualatex -synctex=1 -output-directory out -interaction=nonstopmode $texfile > /dev/$my_out; then
			printf "\rCompiling $texfile... ${GREEN}Done!${NC}\n"
			else
			popd  > /dev/null
			printf "\r${RED}Compiling file $texfile failed! Exiting...${NC}\n" >&2
			echo "Try running in verbose mode for more information using -v"
			exit 1
		fi
	done
	popd  > /dev/null
}