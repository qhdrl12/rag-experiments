# RAG Experiment - Development Commands

.PHONY: help install test lint format type-check pre-commit clean dev

help: ## Show this help message
	@echo "Available commands:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

install: ## Install project dependencies
	uv sync --dev

dev: install ## Setup development environment
	uv run pre-commit install
	@echo "Development environment ready!"

test: ## Run tests with coverage
	uv run pytest -v --cov=. --cov-report=term-missing

test-watch: ## Run tests in watch mode
	uv run pytest-watch -- -v --cov=. --cov-report=term-missing

lint: ## Run linting (Ruff)
	uv run ruff check .

format: ## Format code (Black + Ruff)
	uv run black .
	uv run ruff format .

type-check: ## Run type checking (MyPy)
	uv run mypy .

pre-commit: ## Run all pre-commit hooks
	uv run pre-commit run --all-files

quality: lint type-check test ## Run all quality checks

clean: ## Clean up temporary files
	find . -type d -name "__pycache__" -delete
	find . -type f -name "*.pyc" -delete
	find . -type f -name "*.pyo" -delete
	find . -type d -name "*.egg-info" -exec rm -rf {} +
	rm -rf .coverage
	rm -rf .pytest_cache

docs: ## Generate documentation
	@echo "Documentation generation not yet implemented"

run: ## Run the main application
	uv run python main.py

# Development workflow shortcuts
check: pre-commit ## Full pre-commit check
quick-test: ## Run tests without coverage
	uv run pytest -v

# Project info
info: ## Show project information
	@echo "Project: RAG Experiment"
	@echo "Python: $(shell python --version)"
	@echo "Dependencies:"
	@uv show

# Docker commands (if needed later)
docker-build: ## Build Docker image
	@echo "Docker support not yet implemented"

docker-run: ## Run in Docker
	@echo "Docker support not yet implemented"
