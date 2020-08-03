SHELL := /bin/bash
LATEXMK_FLAGS = --pdf --cd
RM := rm -f

maindoc := spell-guidelines

all: $(maindoc).pdf

$(maindoc).pdf: $(maindoc).tex
	latexmk $(LATEXMK_FLAGS) --jobname="$(basename $@)" $<
clean:
	@(\
		shopt -s globstar;\
		$(RM) **/*.aux **/*.fdb_latexmk **/*.fls **/*.log;\
	)
	@$(RM) $(maindoc).pdf

.PHONY: all clean
