# creates the docker image
env:
	docker build -t diogocorrea .

# run the dev env
run:
	$(MAKE) stop
	docker run -v $(CURDIR)/html/:/usr/share/nginx/html/ --name diogocorrea -d -p 3000:80 diogocorrea

# run the production env
prod:
	$(MAKE) stop
	docker run -v $(CURDIR)/html/:/usr/share/nginx/html/ --name diogocorrea -d -p 80:80 diogocorrea

# stop any runnign containers
stop:
	docker stop diogocorrea || true && docker rm diogocorrea || true
