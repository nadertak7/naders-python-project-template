FROM python:3.12-slim-bookworm
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

WORKDIR /app

ENV PYTHONPATH="/APP:${PYTHONPATH}"

# Clears previous environemnt cache
RUN rm -rf /root/.cache/uv

COPY . .

RUN if [ -f pyproject.toml ]; then \
      uv pip install --system --no-cache -e '.[dev]'; \
    else \
     "No pyproject.toml file found. Skipping installation..."
    fi
