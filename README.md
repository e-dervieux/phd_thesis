# Non-Invasive Transcutaneous Characterisation of Blood Carbon Dioxide Content - PhD Thesis Manuscript

This repository contains all the resources and LaTeX files needed to compile my PhD thesis, which is about the non-invasive transcutaneous characterisation of blood carbon dioxide content.

## How to Compile

### Dependencies

To be able to compile this manuscript, you will need:

  - a working LuaLaTeX compilation toolchain, with `lualatex` and `biber` available from the command line. Compilation was tested on MacOS using TeX Live 2023 (TeX Live may be downloaded [here](https://www.tug.org/texlive/)). It is **strongly recommended** to use a complete TeX Live or MiK TeX distribution. In case of partial LaTeX installation, you must satisfy the dependencies listed in the `dependencies.dep` file. Of note, the versions indicated in this file are indicative only (they correspond to my installation and do not constitute strict requirements). The only mandatory version dependency is that of having **PGFPlot 1.18 or higher**.
  - Ghostscript, which can be installed on Linux via `apt-get install ghostscript` and on macOS via `brew install ghostscript`.
  - bash, which should already be included with your OS.

### Compilation

Simply run the `compile_thesis.sh` script located at this project's root, you may use the options `-f` to compile the manuscript's figures, and `-m` to compile the manuscript itself (figures *must* be compiled first!). The resulting manuscript can then be found at `out/thesis.pdf`.