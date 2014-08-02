.PHONY: docs build test

ifndef VTENV_OPTS
VTENV_OPTS = "--no-site-packages"
endif

build:	
	virtualenv-2.7 $(VTENV_OPTS) .
	bin/python setup.py develop
	bin/pip install flake8

test:	bin/nosetests
	bin/nosetests -x toxmail
	bin/flake8 toxmail

bin/nosetests: bin/python
	bin/pip install nose

