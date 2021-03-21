SUBDIRS := lib lib/csu bin
all debug dynamic clean: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -r -C $@ $(MAKECMDGOALS)

.PHONY: all debug dynamic clean $(SUBDIRS)
