FROM python:3.12-slim-bookworm
COPY --from=ghcr.io/astral-sh/uv:latest /uv /usr/local/bin/uv

WORKDIR /app

ENV PYTHONPATH="/APP:${PYTHONPATH}" \
    PYTHONBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Clears previous environemnt cache
RUN rm -rf /root/.cache/uv

COPY pyproject.toml* .
RUN if [ -f pyproject.toml ]; then \
      uv pip install --system --no-cache -e '.[dev]'; \
    else \
      echo "No pyproject.toml file found. Skipping installation..."; \
    fi

COPY . .

RUN useradd -m appuser
USER appuser
