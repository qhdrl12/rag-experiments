# RAG Experiments

A Python toolkit for experimenting with Retrieval-Augmented Generation (RAG) systems and research.

## Development Setup

This project uses pre-commit hooks to ensure code quality and run tests automatically before commits.

### Installation

1. Install dependencies:
   ```bash
   uv sync --dev
   ```

2. Install pre-commit hooks:
   ```bash
   uv run pre-commit install
   ```

### Pre-commit Hooks

The following checks run automatically on every commit:

- **Black**: Code formatting
- **Ruff**: Linting and additional formatting
- **MyPy**: Type checking
- **pytest**: Test execution with coverage
- **Standard hooks**: Trailing whitespace, end-of-file fixes, YAML validation

### Manual Testing

Run tests manually:
```bash
uv run pytest -v --cov=. --cov-report=term-missing
```

Run pre-commit hooks manually:
```bash
uv run pre-commit run --all-files
```

## Usage

```bash
python main.py
```

## About

This project provides a structured environment for RAG experiments with:
- 🧪 Test-driven development approach
- 🔧 Pre-commit hooks for code quality
- 📋 Systematic planning and execution guidelines
- 🎯 Focus on simple, maintainable code without over-abstraction
