#!/bin/bash -e

cd $1

: "${OPENSSL_SUBJECT:="/C=ES/ST=Spain/L=Madrid/O=Org/OU=Dep/CN=kahzerx.com"}"
: "${EXPIRE_DAYS:=3650}"


openssl req -x509 -nodes -days "${EXPIRE_DAYS}" -subj "${OPENSSL_SUBJECT}" -newkey rsa:2048 -keyout private_key.key -out ssl_certificate.crt
