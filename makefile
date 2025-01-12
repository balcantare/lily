INSTDIR := out
SUBDIRS := balcantare frchor bwchor freylax guitar piano

$(INSTDIR) :
	mkdir $(INSTDIR)

.PHONY: all install $(SUBDIRS)
all: $(INSTDIR) $(SUBDIRS) 

$(SUBDIRS):
	$(MAKE) -C $@ INSTDIR=../$(INSTDIR) all install
