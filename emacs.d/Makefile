help:
	echo "make [pull|push]"

pull: home-pull manifest channels

push: home-push install

manifest:
	guix package --export-manifest > manifest.scm

channels:
	guix describe -f channels > channels.scm

home-pull:
	cp ~/.emacs.d/init.el ./
	cp ~/.emacs.d/early-init.el ./

home-push:
	cp ./init.el ~/.emacs.d/
	cp ./early-init.el ~/.emacs.d/

install: manifest.scm
	guix package -m manifest.scm

install-exact: manifest.scm channels.scm
	guix pull -C channels.scm
	guix package -m manifest.scm 

install-dry-run: manifest.scm
	guix package -n -m manifest.scm

