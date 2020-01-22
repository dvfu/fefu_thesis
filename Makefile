DESTDIR     ?= $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR  = $(DESTDIR)/tex/latex/fefu
DOC_DIR      = $(DESTDIR)/doc/latex/fefu
CACHE_DIR   := $(shell pwd)/.latex-cache

.PHONY: install uninstall clean

install:
	@mkdir -p $(CACHE_DIR)
	@cp source/fefu.ins $(CACHE_DIR)
	@cp source/fefu.dtx $(CACHE_DIR)
	@cd $(CACHE_DIR) && latex fefu.ins && pdflatex fefu.dtx
	@mkdir -p $(INSTALL_DIR)
	@cp source/fefu.png $(INSTALL_DIR)
	@cp $(CACHE_DIR)/fefu.cls $(INSTALL_DIR)
	@mkdir -p cls
	@cp $(CACHE_DIR)/fefu.cls cls
	@cp source/fefu.png cls
	@mkdir -p $(DOC_DIR)
	@cp $(CACHE_DIR)/fefu.pdf $(DOC_DIR)
	@mkdir -p doc
	@cp $(CACHE_DIR)/fefu.pdf doc

uninstall: clean
	@rm -rf $(INSTALL_DIR)
	@rm -rf $(DOC_DIR)

clean:
	@rm -rf $(CACHE_DIR)
	