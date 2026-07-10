FROM postgres:12

ENV TZ="America/Moncton"
COPY build/conf/postgresql.conf /etc/postgresql/postgresql.conf
COPY build/scripts /scripts

ENTRYPOINT ["/scripts/run.sh"]

# Metadata
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL ca.unb.lib.generator="postgres" \
  org.opencontainers.image.title="unbscholar.postgres.lib.unb.ca" \
  org.opencontainers.image.description="unbscholar.postgres.lib.unb.ca provides database storage for The UNBScholar instance at UNB Libraries." \
  org.opencontainers.image.vendor="University of New Brunswick Libraries" \
  org.opencontainers.image.source="https://github.com/unb-libraries/unbscholar.postgres.lib.unb.ca" \
  org.opencontainers.image.version="$VERSION" \
  org.opencontainers.image.revision="$VCS_REF" \
  org.opencontainers.image.created="$BUILD_DATE"
