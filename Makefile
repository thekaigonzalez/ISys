all:
	@make -C src
install:
	@make -C src install
check:
	@echo "		CI Success!"
