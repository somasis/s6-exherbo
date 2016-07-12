exec_prefix ?=  /usr
bindir      ?=  $(exec_prefix)/bin
libdir      ?=  $(exec_prefix)/lib
libexecdir  ?=  $(exec_prefix)/libexec

export TOPDIR= $(dir $(realpath $(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))))

all:
	@true

install:
	mkdir -p $(DESTDIR)$(exec_prefix)
	cp -r $(TOPDIR)/bin $(DESTDIR)$(bindir)
	cp -r $(TOPDIR)/lib $(DESTDIR)$(libdir)
	cp -r $(TOPDIR)/libexec $(DESTDIR)$(libexecdir)

