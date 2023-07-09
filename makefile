OUTDIR := $(CURDIR)/out
SUBDIRS := balcantare frchor bwchor 

$(OUTDIR) :
	mkdir $(OUTDIR)

.PHONY: all $(MAKECMDGOALS) $(SUBDIRS)
$(MAKECMDGOALS) all: $(OUTDIR) $(SUBDIRS) 

$(SUBDIRS):
	$(MAKE) -C $@ OUTDIR=$(OUTDIR) $(MAKECMDGOALS)
