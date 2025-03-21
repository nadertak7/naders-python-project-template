A simple project template for python projects. Uses uv / ruff / docker / pytest.

Follow [this](https://docs.github.com/en/repositories/creating-and-managing-repositories/creating-a-repository-from-a-template) guide to use the template.

### Prerequisites

Only docker desktop needs to be installed.

Python, uv, pip, and dependencies are handled when spinning up the container.

### Features

#### 1. pyproject.toml

Contains project metadata and requirements. Deprecates the use for files like `requirements.txt` and `setup.py`.

#### 2. Dockerfile

Creates a development container which:
- Handles uv build.
- Adds environment variables. Some for optimisation, some for finding modules (`PYTHONPATH`).
- Installs mandatory and optional requirements in development environment.
- Switches to non-root user for security.

#### 3. Pipelines

Pipelines that run after each commit. Handles:
- Linting with `ruff`.
- Testing with `pytest`.

### To be implemented:

Automated package releases with CI and GitHub.
