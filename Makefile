
.PHONY: dump-keybindings load-keybindings

dump-keybindings:
	dconf dump /org/cinnamon/desktop/keybindings/ > keybindings

load-keybindings:
	dconf load /org/cinnamon/desktop/keybindings/ < keybindings
