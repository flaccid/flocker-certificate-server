FROM python:alpine

RUN mkdir -p /usr/local/src/flocker-certificate-server

COPY setup.py /usr/local/src/flocker-certificate-server/
COPY flocker_certificate_service /usr/local/src/flocker-certificate-server/flocker_certificate_service

RUN apk add --update --no-cache gcc linux-headers musl-dev libffi-dev openssl-dev && \
    cd /usr/local/src/flocker-certificate-server && \
    pip install --upgrade pip && \
    pip install --no-cache-dir . && \
    rm -rf /var/cache/apk/* && \
    rm -rf /usr/local/src

EXPOSE 8123

CMD ["flocker-certificate-service"]
