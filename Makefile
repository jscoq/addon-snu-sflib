REPO = https://github.com/snu-sf/sflib.git
TAG = master
COMMIT = f30414136c1a99f2edbdcbe50ffcee18b7dc06fb
WORKDIR = workdir

# Git boilerplate
define GIT_CLONE_COMMIT
mkdir -p $(WORKDIR) && cd $(WORKDIR) && git init && \
git remote add origin $(REPO) && \
git fetch --depth=1 origin $(COMMIT) && git reset --hard FETCH_HEAD
endef

.PHONY: all get

all: $(WORKDIR)
	dune build

get: $(WORKDIR)

$(WORKDIR):
	${if $(COMMIT), $(GIT_CLONE_COMMIT), git clone --recursive --depth=1 -b $(TAG) $(REPO) $(WORKDIR)}
	cp -r dune-files/* $(WORKDIR)/

install:
	dune install coq-snu-sflib
