# create docker image
image:
	docker build -t diogocorrea .

# run container
run:
	docker run -v $(CURDIR)/html/:/usr/share/nginx/html/ --name diogocorrea -d -p 3000:80 diogocorrea

# stop container
stop:
	docker stop diogocorrea || true && docker rm diogocorrea || true

# remove image
rm:
	docker image rm diogocorrea
