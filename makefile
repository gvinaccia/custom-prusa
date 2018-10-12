# https://www.gnu.org/software/make/manual/html_node/Quick-Reference.html
# https://www.trueelena.org/computers/howto/makefile_for_openscad_projects.html

SRCDIR = scad/parts
OUTDIR = stl

PARTS = $(patsubst $(SRCDIR)/%.scad, $(OUTDIR)/%.stl, $(wildcard $(SRCDIR)/*.scad))

$(OUTDIR)/%.stl: $(SRCDIR)/%.scad scad/includes/*
	openscad -m make -o $@ $<

all: $(PARTS)

#preview:
#	openscad $(SRCDIR)/mks_support.scad

clean:
	@rm -rf $(OUTDIR)/*.stl

.PHONY: all