FROM python:3.12.3-slim-bookworm
ENV POETRY_VERSION=1.8.3

WORKDIR /app
COPY poetry.lock pyproject.toml ./
RUN pip install --no-cache-dir "poetry==$POETRY_VERSION" \
     && poetry config virtualenvs.create false \
     && poetry install --only main --no-interaction --no-ansi \
     && rm -rf $(poetry config cache-dir)/{cache,artifacts}
COPY . .
CMD ["python3", "src/main/main.py"]


# pixi
# FROM python:3.10-slim
# WORKDIR /app
# RUN apt-get update && apt-get install -y \
#     curl \
#     gnupg \
#     && rm -rf /var/lib/apt/lists/*
# RUN curl -sSL https://install.astral.sh | sh
# COPY . .
# RUN pixi sync
# CMD ["python", "main.py"]