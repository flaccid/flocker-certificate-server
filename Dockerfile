FROM python:alpine

RUN mkdir /usr/local/flocker-certificate-server

COPY setup.py /usr/local/flocker-certificate-server/
COPY flocker_certificate_service /usr/local/flocker-certificate-server/flocker_certificate_service

WORKDIR /usr/local/flocker-certificate-server

RUN apk add --update --no-cache gcc linux-headers musl-dev libffi-dev openssl-dev && \
    pip install --upgrade pip && \
    pip install --no-cache-dir . && \
    rm -rf /var/cache/apk/*

EXPOSE 8123

CMD ["flocker-certificate-service"]
