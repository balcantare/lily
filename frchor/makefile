books := frchor.pdf 

TOPDIR := ..

LILY_CMD := lilypond \
  -ddelete-intermediate-files \
  -dno-point-and-click \
  --init $(TOPDIR)/include/with-deps.ly \
  -I $(TOPDIR)/include

.PHONY: all
all: $(books)

DEPFILES := $(addsuffix .dly,$(basename $(books)))
$(DEPFILES):
include $(wildcard $(DEPFILES))

%.pdf: %.ly
	date > $(*F).log
	$(LILY_CMD) $< 2>> $(*F).log

