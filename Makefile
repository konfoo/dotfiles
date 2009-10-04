default:
	@for i in `find $(PWD) -name '_*' -depth 1`; do \
		DOTFILE=`echo $$i | sed -e 's/^.*_/./'`; \
		echo ln -sf $$i $(HOME)/$$DOTFILE; \
		ln -sf $$i $(HOME)/$$DOTFILE; \
	done
