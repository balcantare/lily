OUTDIR := out
SUBDIRS := balcantare frchor bwchor 

$(OUTDIR) :
	mkdir $(OUTDIR)

.PHONY: all install $(MAKECMDGOALS) $(SUBDIRS)
$(MAKECMDGOALS) all install: $(OUTDIR) $(SUBDIRS) 

$(SUBDIRS):
	$(MAKE) -C $@ $(MAKECMDGOALS)
