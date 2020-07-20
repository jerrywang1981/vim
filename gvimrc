" Size of GVim window
set lines=999 columns=999

" Don't display the menu or toolbar. Just the screen.
set guioptions-=m
set guioptions-=T

if has('gui_running')
	if has("gui_macvim")
		macmenu &File.Print key=<nop>
		" set guifont=Monaco:h14
		" set guifont=InconsolataForPowerline-g:h14
		" set guifont=InconsolataForPowerline:h18
		set guifont=Consolas:h18
	else
		set guifont=Consolas\ 12
	endif
endif

" set macligatures
" set guifont=Fira\ Code:h12

