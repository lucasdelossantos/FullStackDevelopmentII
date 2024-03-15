help:	## Help Menu
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
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
ps:		## make ps - lists containers
	@docker-compose -p fullstack ps