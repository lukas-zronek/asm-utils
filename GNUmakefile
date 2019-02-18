SUBDIRS := lib lib/csu bin
all debug clean: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -r -C $@ $(MAKECMDGOALS)

.PHONY: all debug clean $(SUBDIRS)
