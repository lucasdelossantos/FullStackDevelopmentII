# Description: Makefile for Docker
help:	## Help Menu
	@echo "make build - Build Docker"
	@echo "make run - Run Docker"
	@echo "make deploy - triggers make run and build together"
	@echo "make stop - stop Docker"
	@echo "make clean-data - stops and removes containers,networks,volumes, and images"
	@echo "make clean-images - cleans images"
	@echo "make clean-image-windows - cleans images for windows"
	@echo "make ps - lists containers"
	@echo "make help-windows - Help Menu for Windows"
	@echo "make help - Help Menu"
build:	## make Build - Build Docker
	@docker-compose -p fullstack build
run:	## make run - Run Docker
	@docker-compose -p fullstack up -d
deploy: ## make deploy - triggers make run and build together
	@docker-compose -p fullstack build
	@docker-compose -p fullstack up -d
stop:	## make stop - stop Docker 
	@docker-compose -p fullstack down
clean-data:	## make clean-data - stops and removes containers,networks,volumes, and images
	@docker-compose -p fullstack down -v
clean-images:	## make clean-images - cleans images
	@docker rmi `docker images -q -f "dangling=true"`
clean-image-windows:	## make clean-image-windows - cleans images for windows
	@docker rmi $(docker images -f "dangling=true" -q)
ps:		## make ps - lists containers
	@docker-compose -p fullstack ps
