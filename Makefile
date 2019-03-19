# create docker image
image:
	docker build -t diogocorrea_i .

# run container
run:
	docker run -v $(CURDIR)/html/:/usr/share/nginx/html/ -v $(CURDIR)/cert/:/usr/share/nginx/cert/ -v $(CURDIR)/conf/:/etc/nginx/conf.d/ --name diogocorrea -d -p 80:80 -p 443:443 diogocorrea_i

# stop container
stop:
	docker stop diogocorrea || true && docker rm diogocorrea || true

# remove image
rm:
	docker image rm diogocorrea_i
