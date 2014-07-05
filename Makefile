SRCS = $(filter-out Makefile,$(wildcard *))
DSTS = $(patsubst %,$(HOME)/.%,$(SRCS))
.PHONY: all

$(HOME)/.%: %
	ln -sf `pwd`/$< $@

all: $(DSTS)
