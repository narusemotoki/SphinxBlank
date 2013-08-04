# Makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = sphinx-build
PAPER         =
BUILDDIR      = build

# User-friendly check for sphinx-build
ifeq ($(shell which $(SPHINXBUILD) >/dev/null 2>&1; echo $$?), 1)
$(error The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed, then set the SPHINXBUILD environment variable to point to the full path of the '$(SPHINXBUILD)' executable. Alternatively you can add the directory with the executable to your PATH. If you don't have Sphinx installed, grab it from http://sphinx-doc.org/)
endif

# Internal variables.
ENSPHINXOPTS   = -d $(BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) -D language=en source
JASPHINXOPTS   = -d $(BUILDDIR)/doctrees $(PAPEROPT_$(PAPER)) -D language=ja source
# the i18n builder cannot share the environment and doctrees with the others
I18NSPHINXOPTS  = $(PAPEROPT_$(PAPER)) $(SPHINXOPTS) source

.PHONY: help multilingual-html gh-pages

help:
	@echo "Please use \`make <target>' where <target> is one of"
	@echo "  multilingual-html to make standalone HTML files and translation files"
	@echo "  gh-pages          to make standalone gh-pages directory structure"

multilingual-html:
	rm -rf $(BUILDDIR)/*
	$(SPHINXBUILD) -b gettext $(I18NSPHINXOPTS) $(BUILDDIR)/locale
	cd source; sphinx-gettext-helper -p ../$(BUILDDIR)/locale --update --build --statistics -l ja
	$(SPHINXBUILD) -b html $(ENSPHINXOPTS) $(BUILDDIR)/html/en
	$(SPHINXBUILD) -b html $(JASPHINXOPTS) $(BUILDDIR)/html/ja

gh-pages:
	git branch -D gh-pages
	git checkout -b gh-pages
	make multilingual-html
	cp -r build/html/ja .
	cp -r build/html/en .
	rm -rf locale source build README.rst Makefile
	echo "gh-pages" > README.rst
	touch .nojekyll
	git add .
	git add -u
	git commit -m "generate gh-pages"
