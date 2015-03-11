install:
	go get github.com/mattn/gom
	GOM_VENDOR_NAME=$GOPATH gom install

default:
	@for i in `find $(PWD) -name '_*' -depth 1`; do \
		DOTFILE=$(HOME)/`echo $$i | sed -e 's/^.*_/./'`; \
		[[ -L $$DOTFILE ]] || unlink $$DOTFILE; \
		echo ln -sf $$i $$DOTFILE; \
		ln -sf $$i $$DOTFILE; \
	done
	
