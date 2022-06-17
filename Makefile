DESTDIR     ?= $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR  = $(DESTDIR)/tex/latex/fefu
DOC_DIR      = $(DESTDIR)/doc/latex/fefu
CACHE_DIR   := $(shell pwd)/.latex-cache

.PHONY: install uninstall clean

install:
	@mkdir -p $(CACHE_DIR)
	@cp source/fefu.ins $(CACHE_DIR)
	@cp source/fefu.dtx $(CACHE_DIR)
	@cp source/fefu_base.dtx $(CACHE_DIR)
	@cp source/fefu_style_imct.dtx $(CACHE_DIR)
	@cp source/fefu_presentation.dtx $(CACHE_DIR)
	@cp source/fefu_style_default.dtx $(CACHE_DIR)
	@cd $(CACHE_DIR) && latex fefu.ins && pdflatex fefu.dtx && pdflatex fefu_base.dtx && pdflatex fefu_presentation.dtx && pdflatex fefu_style_default.dtx && pdflatex fefu_style_imct.dtx
	@mkdir -p $(INSTALL_DIR)
	@cp $(CACHE_DIR)/fefu_base.sty $(INSTALL_DIR)
	@cp $(CACHE_DIR)/fefu_style_default.sty $(INSTALL_DIR)
	@cp $(CACHE_DIR)/fefu_style_imct.sty $(INSTALL_DIR)
	@cp $(CACHE_DIR)/fefu.cls $(INSTALL_DIR)
	@cp $(CACHE_DIR)/fefu_presentation.cls $(INSTALL_DIR)
	@mkdir -p cls
	@cp $(CACHE_DIR)/fefu_base.sty cls
	@cp $(CACHE_DIR)/fefu_style_default.sty cls
	@cp $(CACHE_DIR)/fefu_style_imct.sty cls
	@cp $(CACHE_DIR)/fefu.cls cls
	@cp $(CACHE_DIR)/fefu_presentation.cls cls
	@mkdir -p $(DOC_DIR)
	@cp $(CACHE_DIR)/fefu_base.pdf $(DOC_DIR)
	@cp $(CACHE_DIR)/fefu_style_default.pdf $(DOC_DIR)
	@cp $(CACHE_DIR)/fefu_style_imct.pdf $(DOC_DIR)
	@cp $(CACHE_DIR)/fefu.pdf $(DOC_DIR)
	@cp $(CACHE_DIR)/fefu_presentation.pdf $(DOC_DIR)
	@mkdir -p doc
	@cp $(CACHE_DIR)/fefu_base.pdf doc
	@cp $(CACHE_DIR)/fefu_style_default.pdf doc
	@cp $(CACHE_DIR)/fefu_style_imct.pdf doc
	@cp $(CACHE_DIR)/fefu.pdf doc
	@cp $(CACHE_DIR)/fefu_presentation.pdf doc

uninstall: clean
	@rm -rf $(INSTALL_DIR)
	@rm -rf $(DOC_DIR)

clean:
	@rm -rf $(CACHE_DIR)
	