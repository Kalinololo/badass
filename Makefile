.PHONY: build up down restart logs ps clean console

# Default target
all: build up

# Build all Docker images
build:
	sudo docker compose build

# Start all containers in detached mode
up:
	sudo docker compose up -d

# Stop all containers
down:
	sudo docker compose down

# Restart all containers
restart:
	sudo docker compose restart

# View logs of all containers
logs:
	sudo docker compose logs

# Follow logs of all containers
logs-follow:
	sudo docker compose logs -f

# Show running containers
ps:
	sudo docker compose ps

# Clean up unused Docker resources
clean:
	sudo docker system prune -f
	sudo docker volume prune -f

# Stop and remove all containers, networks, and images
clean-all: down
	sudo docker system prune -a -f
	sudo docker volume prune -f

# Open a shell in a container
console:
	@if [ -z "$(SERVICE)" ]; then \
		echo "Please specify a service name: make console SERVICE=service_name"; \
	else \
		sudo docker compose exec $(SERVICE) sh || sudo docker compose exec $(SERVICE) bash; \
	fi

# Help command
help:
	@echo "Available commands:"
	@echo "  make build       - Build all Docker images"
	@echo "  make up          - Start all containers in detached mode"
	@echo "  make down        - Stop all containers"
	@echo "  make restart     - Restart all containers"
	@echo "  make logs        - View logs of all containers"
	@echo "  make logs-follow - Follow logs of all containers"
	@echo "  make ps          - Show running containers"
	@echo "  make clean       - Clean up unused Docker resources"
	@echo "  make clean-all   - Stop and remove all containers, networks, and images"
	@echo "  make console     - Open a shell in a container (usage: make console SERVICE=service_name)"
	@echo "  make help        - Show this help message"
