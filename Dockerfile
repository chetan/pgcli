FROM python:3.8-alpine

COPY . /app
COPY entrypoint.sh /entrypoint.sh

RUN apk add --no-cache --virtual .build-deps \
        alpine-sdk \
    && cd /app \
    && pip install --no-cache-dir . \
    && pip install --no-cache-dir "psycopg[binary,pool]" \
    && apk del .build-deps \
    && apk add --no-cache bash most libpq \
    && rm -rf /var/cache/apk/* /root/.cache \
    && rm -rf /app

ENV PAGER=most

ENTRYPOINT ["/entrypoint.sh"]
