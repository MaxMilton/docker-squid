# Run squid proxy in a container
#
# Build or update image:
#   docker build --no-cache -t local/squid .
#

FROM alpine:edge

RUN set -xe \
  && addgroup squid tty \
  && apk add --no-cache \
    squid

# custom squid config
COPY squid.conf /etc/squid/squid.conf

# run as non privileged user
# USER squid

# COPY docker-entrypoint.sh /usr/local/bin/
# ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 3128/tcp
CMD ["squid", "-NYC"]

# https://github.com/jpetazzo/squid-in-a-can
