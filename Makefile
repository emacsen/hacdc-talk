# Requirements (Debian package names)
# latex-beamer dia texlive-latex-base texlive-extra-utils
 
# Implicit rules  
%.eps : %.dia 
	dia --export=$@ $<

%.pdf : %.eps
	epstopdf $<

TARGET=hacdc.tex
epsfiles := $(patsubst %.dia,%.eps,$(wildcard *.dia))
pdffiles := $(patsubst %.dia,%.pdf,$(wildcard *.dia))

clean:
	rm -f *.dvi *.ps *.pdf *.snm *.toc *.aux *.out *.nav *.log \
	*~ *.autosave *.vrb *.eps

pdf: *.tex $(pdffiles)
	pdflatex $(TARGET)

