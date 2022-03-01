FROM bash

LABEL maintainer "Claudio Masia"

# Install envsubst command for replacing config files
# - it needs libintl package
# Install coreutils for tr command
ENV BUILD_DEPS="gettext"  \
    RUNTIME_DEPS="libintl"

RUN set -x && \
    apk add --update $RUNTIME_DEPS && \
    apk add --virtual build_deps $BUILD_DEPS && \
    apk add coreutils && \
    cp /usr/bin/envsubst /usr/local/bin/envsubst && \
    apk del build_deps && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["bash"]
