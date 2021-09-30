all:
	@make -C src
install:
	@make -C src install
check:
	@echo "		CI Success!"
no_lua:
	@make -C src no_lua
helpers:
	@make -C src helpers
std:
	@make -C src std
extdev:
	@make -C src extdev