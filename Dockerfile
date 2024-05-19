FROM python:3.12.2-slim-bookworm
ENV POETRY_VERSION=1.8.2

WORKDIR /app
COPY poetry.lock pyproject.toml ./
RUN pip install --no-cache-dir "poetry==$POETRY_VERSION" \
    && poetry config virtualenvs.create false \
    && poetry install --only main --no-interaction --no-ansi \
    && rm -rf $(poetry config cache-dir)/{cache,artifacts}
COPY . .
CMD ["python3", "src/main/main.py"]