run:
	docker run --name ezhttpd -d -p 8081:8080 -v /Volumes/Movies:/videos tenox7/ezhttpd:latest

docker-local:
	docker buildx build --platform linux/amd64,linux/arm64 -t tenox7/ezhttpd:latest --load .

docker-push:
	docker buildx build --platform linux/amd64,linux/arm64 -t tenox7/ezhttpd:latest --push .