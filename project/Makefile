ECOMMERCE_BINARY=ecommerceApp

down:
	@echo "Stopping docker compose..."
	docker-compose down
	@echo "Done!"

up_build: build_ecommerce
	@echo "Stopping docker images (if running...)"
	docker-compose down
	@echo "Building (when required) and starting docker images..."
	docker-compose up --build -d
	@echo "Docker images built and started!"

build_ecommerce:
	@echo "Building ecommerce binary..."
	cd ../ecommerce-service && env GOOS=linux CGO_ENABLED=0 go build -o ${ECOMMERCE_BINARY} ./cmd/api
	@echo "Done!"