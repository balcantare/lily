# This makefile may be included by the
# the actual dirs which contain the books.
# define there:
# books := mybook.pdf 
# TOPDIR := ..
# include $(TOPDIR)/include/makefile
#
# the code was inspired by the work of Fr. Samuel
# https://github.com/rpspringuel/lilypond_make/blob/mad-scientist_dependencies/Makefile
#

OUTDIR = $(CURDIR)
targets = $(addprefix $(OUTDIR)/,$(books)) 

LILY_CMD := lilypond \
  -ddelete-intermediate-files \
  -dno-point-and-click \
  --init $(TOPDIR)/include/with-deps.ly \
  -I $(TOPDIR)/include

# The suffixes used in this Makefile.
.SUFFIXES: .ly .ily .dly .pdf 

# Input and output files are searched in the directories listed in
# the VPATH variable.  All of them are subdirectories of the current
# directory (given by the GNU make variable `CURDIR').
VPATH := $(CURDIR) $(OUTDIR) 

.PHONY: all
all: $(targets)

DEPFILES := $(addsuffix .dly,$(basename $(targets)))
$(DEPFILES):
include $(wildcard $(DEPFILES))

$(OUTDIR)/%.pdf: %.ly
	date > $(*F).log
	$(LILY_CMD) -o $(OUTDIR)/$(*F) $< 2>> $(OUTDIR)/$(*F).log
