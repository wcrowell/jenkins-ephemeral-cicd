build:
	@docker-compose build 
run:
	@docker-compose up -d jenkins-nginx.openlogic.local jenkins-master.openlogic.local
start:
	@docker-compose up -d jenkins-nginx.openlogic.local jenkins-master.openlogic.local
stop:
	@docker-compose stop
clean:	stop
	@docker-compose rm jenkins-master.openlogic.local jenkins-nginx.openlogic.local
clean-images:
	@docker rmi `docker images -q -f "dangling=true"`
