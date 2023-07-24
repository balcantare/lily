books := frcamp.pdf frsingen.pdf frchor.pdf frchor16.pdf
TOPDIR := ..

include $(TOPDIR)/include/makefile

frcamp.pdf: frsingen.pdf frchor.pdf frchor16.pdf
	pdftk A=frchor.pdf B=frchor16.pdf C=frsingen.pdf \
              cat C1 A6 A16 A12 A15 B6 B2 A3 A9 A7 A11 A5 B4 A10 A14 A13 \
              output frcamp.pdf verbose > $(*F).log
