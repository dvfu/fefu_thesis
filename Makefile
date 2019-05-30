DESTDIR     ?= $(shell kpsewhich -var-value=TEXMFHOME)
INSTALL_DIR  = $(DESTDIR)/tex/latex/fefu

.PHONY: install uninstall

install:
	@mkdir -p $(INSTALL_DIR)
	@cp source/fefu.cls $(INSTALL_DIR)
	@cp source/fefu.png $(INSTALL_DIR)

uninstall:
	@rm -rf $(INSTALL_DIR)
