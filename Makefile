# test the grpc-docs download in multiple node versions
test-after-deploy:
	bash scripts/test-install.sh
deploy:
	yarn publish
	make deploy-docker
deploy-docker:
	docker build -t quantforce/grpc-docs -f docker/Dockerfile .
	docker push quantforce/grpc-docs
