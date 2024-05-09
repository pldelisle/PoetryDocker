FROM python:3.12.3

ENV POETRY_NO_INTERACTION=1 \
    POETRY_VIRTUALENVS_IN_PROJECT=1 \
    POETRY_VIRTUALENVS_CREATE=1 \
    POETRY_CACHE_DIR="/tmp/poetry_cache" \
    POETRY_HOME="/opt/poetry"

RUN python3 -m venv $POETRY_HOME && \
    $POETRY_HOME/bin/pip install pip setuptools && \
    $POETRY_HOME/bin/pip install poetry==1.8.3

WORKDIR /

ENV PATH="/$POETRY_HOME/bin/:$POETRY_HOME/bin:$PATH"

RUN git clone https://github.com/pldelisle/PoetryDocker.git

RUN poetry install && rm -rf $POETRY_CACHE_DIR

CMD "pytest"