DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard $(DOTPATH)/component/*/.??*)
EXCLUSIONS := %.DS_Store %.git %.gitignore %.gitmodules %~
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

deploy: ## Create symlink to home directory
	@echo 'Start to deploy dotfiles to home directory.'
	@echo ''
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(notdir $(val));)

init:   ## Initialize environment.
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/etc/init.sh
