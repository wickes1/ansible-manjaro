run:
	# make run TAGS=dotfiles-home
	ansible-playbook playbook.yml \
		-l localhost \
		--ask-become-pass \
		--extra-vars="username=$(USER)" \
		--tags $(TAGS)

list-tags:
	ansible-playbook playbook.yml --list-tags
