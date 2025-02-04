default:
	@echo "Cowardly refusing to run on $(shell uname). Use platform specific targets."

init: brew-install brew-bundle link-dotfiles macos
	osascript -e 'tell app "loginwindow" to «event aevtrrst»'

init-post-reboot: asdf link-sublime link-vscode restore-preferences disable-restore-apps-on-login

brew-install:
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh | bash

brew-bundle:
	brew update
	brew bundle

asdf:
	asdf plugin-add nodejs

macos:
	sh .macos

link-dotfiles:
	mkdir -p $$HOME/.local
	./link-dotfiles.sh

# link-sublime:
# 	git clone https://github.com/pavelloz/sublime3 $$HOME/.sublime3
# 	rm -rf $$HOME/Library/Application\ Support/Sublime\ Text\ 3
# 	ln -s $$HOME/.sublime3 $$HOME/Library/Application\ Support/Sublime\ Text\ 3

link-vscode:
	ln -sf $$PWD/etc/vscode.keybindings.json $$HOME/Library/Application\ Support/Code/User/keybindings.json
	ln -sf $$PWD/etc/vscode.settings.json $$HOME/Library/Application\ Support/Code/User/settings.json

backup-preferences:
	code --list-extensions > $$PWD/etc/vscode--list-extensions.txt

restore-preferences:
	cat $$PWD/etc/vscode--list-extensions.txt | xargs -n 1 code --install-extension

disable-restore-apps-on-login:
	# See https://apple.stackexchange.com/a/322787
	# clear the file if it isn't empty
	find ~/Library/Preferences/ByHost/ -name 'com.apple.loginwindow*' ! -size 0 -exec tee {} \; < /dev/null
	# set the user immutable flag
	find ~/Library/Preferences/ByHost/ -name 'com.apple.loginwindow*' -exec chflags uimmutable {} \;

.PHONY: init init-post-reboot brew-install brew-bundle asdf link-dotfiles macos sublime backup-preferences restore-preferences disable-restore-apps-on-login
