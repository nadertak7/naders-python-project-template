FROM python:3.12-slim-bookworm
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

ENV PYTHONPATH="/APP:${PYTHONPATH}"

COPY . .

RUN if [ -f pyproject.toml]; then \
      uv pip install --no-cache -e . \
    else \
      echo "No pyproject.toml file found. Skipping package installation." ; \
    fi
