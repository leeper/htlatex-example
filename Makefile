all: manuscript-htlatex.docx manuscript-pandoc.docx

manuscript-htlatex.docx: manuscript.html
	pandoc manuscript.html -o manuscript-htlatex.docx

manuscript.html: manuscript.tex references.bib figures/figure.png
	htlatex manuscript
	bibtex manuscript
	htlatex manuscript
	htlatex manuscript

figures/figure.png: analysis/analysis.R
	Rscript analysis/analysis.R

manuscript-pandoc.docx: manuscript.html
	pandoc manuscript.tex -o manuscript-pandoc.docx

manuscript.pdf: manuscript.tex references.bib figures/figure.png
	pdflatex manuscript
	bibtex manuscript
	pdflatex manuscript
	pdflatex manuscript

