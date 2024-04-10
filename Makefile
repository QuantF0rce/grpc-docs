# test the grpc-docs download in multiple node versions
test-after-deploy:
	bash scripts/test-install.sh
deploy:
	yarn publish
	make deploy-docker
deploy-docker:
	docker build -t quantforce/grpc-docs -f docker/Dockerfile .
	docker tag quantforce/grpc-docs:latest quantforce/grpc-docs:v1.3.6
	docker push quantforce/grpc-docs:v1.3.6
