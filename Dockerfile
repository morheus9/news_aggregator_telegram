# rye build --wheel --clean

FROM python:3.12.3-slim-bookworm

WORKDIR /app
COPY requirements.lock ./
RUN PYTHONDONTWRITEBYTECODE=1 pip install --no-cache-dir -r requirements.lock
COPY src .
CMD ["python3", "src/main/main.py"]

# ENV POETRY_VERSION=1.8.3
# RUN pip install --no-cache-dir "poetry==$POETRY_VERSION" \
#     && poetry config virtualenvs.create false \
#     && poetry install --only main --no-interaction --no-ansi \
#     && rm -rf $(poetry config cache-dir)/{cache,artifacts}