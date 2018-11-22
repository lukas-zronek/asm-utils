SUBDIRS := lib lib/csu bin
all clean: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -r -C $@ $(MAKECMDGOALS)

.PHONY: all clean $(SUBDIRS)
