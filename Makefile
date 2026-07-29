# Makefile
PDF = out/main.pdf
TEX = src/main.tex

# Track all .tex + .bib files
SRC_FILES = $(shell find src -name "*.tex" -o -name "*.bib")

all: $(PDF)

$(PDF): $(SRC_FILES)
	# -pdf: Generates a PDF using pdflatex
	# -outdir=out: Puts all aux, log, and PDF files into the out/ directory
	latexmk -pdf -outdir=out $(TEX)

clean:
	# -c clean up temporary files, but keep the PDF
	# -C clean up everything including the PDF
	latexmk -c -outdir=out
	rm -rf out/
