DESTDIR     ?= $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR  = $(DESTDIR)/tex/latex/fefu
DOC_DIR      = $(DESTDIR)/doc/latex/fefu
CACHE_DIR   := $(shell pwd)/.latex-cache

.PHONY: install uninstall clean

install:
	@mkdir -p $(CACHE_DIR)
	@cp source/fefu.ins $(CACHE_DIR)
	@cp source/fefu.dtx $(CACHE_DIR)
	@cd $(CACHE_DIR) && latex fefu.ins
	@mkdir -p $(INSTALL_DIR)
	@cp source/fefu.png $(INSTALL_DIR)
	@cp $(CACHE_DIR)/fefu.cls $(INSTALL_DIR)
	@cd $(CACHE_DIR) && latexmk -pdf fefu.dtx
	@mkdir -p $(DOC_DIR)
	@cp $(CACHE_DIR)/fefu.pdf $(DOC_DIR)

uninstall: clean
	@rm -rf $(INSTALL_DIR)
	@rm -rf $(DOC_DIR)

clean:
	@rm -rf $(CACHE_DIR)	
