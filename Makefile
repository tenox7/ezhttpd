docker:
	docker buildx build --platform linux/amd64,linux/arm64 -t tenox7/ezhttpd:latest --load .

docker-push:
	docker buildx build --platform linux/amd64,linux/arm64 -t tenox7/ezhttpd:latest --push .