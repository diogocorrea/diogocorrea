# creates the docker image
env:
	$(MAKE) stop
	docker rmi diogocorrea_img
	docker build -t diogocorrea_img .

# run the dev env
dev:
	$(MAKE) stop
	docker run -v $(CURDIR)/html/:/usr/share/nginx/html/ --name diogocorrea -d -p 3000:80 diogocorrea_img

# run the production env
prod:
	$(MAKE) stop
	docker run -v $(CURDIR)/html/:/usr/share/nginx/html/ --name diogocorrea -d -p 80:80 diogocorrea_img

# stop any runnign containers
stop:
	docker stop diogocorrea || true && docker rm diogocorrea || true
