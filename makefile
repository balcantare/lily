OUTDIR := out
SUBDIRS := balcantare frchor bwchor 

$(OUTDIR) :
	mkdir $(OUTDIR)

.PHONY: all install $(SUBDIRS)
all: $(OUTDIR) $(SUBDIRS) 

$(SUBDIRS):
	$(MAKE) -C $@ all install
