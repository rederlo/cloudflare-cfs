docker/login:
	@eval $$(docker-machine env wortime-back); \

docker/build:
	docker build -t rederlo/firewall .

docker/kill:
	docker ps -a | grep "firewall" | awk '{print $$1}' | xargs docker stop
	docker ps -a | grep "firewall" | awk '{print $$1}' | xargs docker rm -f
	docker images -a | grep "firewall" | awk '{print $$3}' | xargs docker rmi -f
	docker volume prune -f

docker/rebuild: docker/kill docker/build docker/start

docker/start:
	docker run -it \
	-v /var/run/docker.sock:/var/run/docker.sock \
	--name firewall \
	-e PROXY_NAME=nginx-proxy \
	-d rederlo/firewall