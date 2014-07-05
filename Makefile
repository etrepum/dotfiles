SRCS = $(filter-out Makefile README.md,$(wildcard *))
DSTS = $(patsubst %,$(HOME)/.%,$(SRCS))
.PHONY: all

$(HOME)/.%: %
	ln -sf `pwd`/$< $@

all: $(DSTS)
