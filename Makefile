all:
	@make -C src
install:
	@make -C src install
check:
	@echo "		CI Success!"
no_lua:
	@make -C src no_lua