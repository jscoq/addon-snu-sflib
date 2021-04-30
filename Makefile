REPO = https://github.com/snu-sf/sflib.git
TAG = master
COMMIT = f30414136c1a99f2edbdcbe50ffcee18b7dc06fb
WORKDIR = workdir

.PHONY: all get

all: $(WORKDIR)
	dune build

get: $(WORKDIR)

$(WORKDIR):
	git clone --recursive --depth=1 ${if $(COMMIT), --no-checkout} -b $(TAG) $(REPO) $(WORKDIR)
	${if $(COMMIT), ( cd $(WORKDIR) && git checkout --detach $(COMMIT) )}
	cp -r dune-files/* $(WORKDIR)/

install:
	dune install coq-snu-sflib
