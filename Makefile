LATEX ?= lualatex

PAPER ?= a4paper

CLASS ?= bxjsarticle

OPTIONPANDOC ?= pandoc

OPTIONJAFONT ?= sourcehan

PANDOC ?= pandoc

MONOFONT ?= SourceHanCodeJP

HEADER ?= header

BEFOREBODY ?= maketitle

SRC_DIR = ./src

BUILD_DIR = ./build

SRC = $(wildcard *.md)

RM = rm

.PHONY: clean

%.pdf: %.md
		$(PANDOC) $(SRC_DIR)/$< -o $(BUILD_DIR)/$@ \
		--latex-engine=$(LATEX) -V papersize=$(PAPER) -V documentclass=$(CLASS) \
		-V classoption=$(OPTIONPANDOC) -V classoption=jafont=$(OPTIONJAFONT) \
		-V monofont=$(MONOFONT) \
		--listings \
		--include-in-header=$(HEADER) --include-before-body=$(BEFOREBODY) 
		
%.tex: %.md
		$(PANDOC) $(SRC_DIR/)$< -o $(BUILD_DIR)/$@ \
		--latex-engine=$(LATEX) -V papersize=$(PAPER) -V documentclass=$(CLASS) \
		-V classoption=$(OPTIONPANDOC) -V classoption=jafont=$(OPTIONJAFONT) \
		-V monofont=$(MONOFONT) \
		--listings \
		--include-in-header=$(HEADER) --include-before-body=$(BEFOREBODY) 

clean:
	$(RM) $(BUILD_DIR)/*.pdf $(BUILD_DIR)/*.tex