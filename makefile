OUTDIR := out
SUBDIRS := balcantare frchor bwchor freylax

$(OUTDIR) :
	mkdir $(OUTDIR)

.PHONY: all install $(SUBDIRS)
all: $(OUTDIR) $(SUBDIRS) 

$(SUBDIRS):
	$(MAKE) -C $@ all install
