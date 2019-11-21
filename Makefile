DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST)))/component)
CANDIDATES := $(wildcard $(DOTPATH)/*/.??*)
EXCLUSIONS := %.DS_Store %.git %.gitignore %.gitmodules %~
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

deploy: ## Create symlink to home directory
	@echo 'Start to deploy dotfiles to home directory.'
	@echo ''
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(notdir $(val));)
