# Requirements (Debian package names)
# latex-beamer dia texlive-latex-base texlive-extra-utils
 
# Implicit rules  
%.eps : %.dia 
	dia --export=$@ $<

%.pdf : %.eps
	epstopdf $<

TARGET=hacdc-talk.tex
epsfiles := $(patsubst %.dia,%.eps,$(wildcard *.dia))
pdffiles := $(patsubst %.eps,%.pdf,$(wildcard *.eps))

clean:
	rm -f *.dvi *.ps *.pdf *.snm *.toc *.aux *.out *.nav *.log \
	*~ *.autosave *.vrb

pdf: *.tex $(pdffiles)
	pdflatex $(TARGET)

