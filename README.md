# Non-Invasive Transcutaneous Characterisation of Blood Carbon Dioxide Content - PhD Thesis' Manuscript

This repository contains all the resources and LaTeX files needed to compile my PhD thesis, which is about the non-invasive transcutaneous characterisation of blood carbon dioxide content.

## How to Compile

### Dependencies

To be able to compile this manuscript, you will need:

  - a working LuaLaTeX compilation toolchain, with commands `lualatex` and `biber` available. Compilation was tested on MacOS using TeX Live 2023. TeX Live can be downloaded [here](https://www.tug.org/texlive/).
  - Ghostscript, which can be installed on Linux via `apt-get install ghostscript` and on macOS via `brew install ghostscript`.
  - bash, but this hopefully comes with your OS.

### Compilation

Simply runs the `compile_thesis.sh` script located at this project's root. The resulting manuscript can then be found at `out/thesis.pdf`.