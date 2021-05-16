FROM postgres:12

ENV TZ America/Moncton
COPY build/conf/postgresql.conf /etc/postgresql/postgresql.conf
COPY build/scripts /scripts

ENTRYPOINT ["/scripts/run.sh"]

# Metadata
ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL ca.unb.lib.generator="postgres" \
  com.microscaling.docker.dockerfile="/Dockerfile" \
  com.microscaling.license="MIT" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.description="unbscholar.postgres.lib.unb.ca provides database storage for The UNBScholar instance at UNB Libraries." \
  org.label-schema.name="unbscholar.postgres.lib.unb.ca" \
  org.label-schema.schema-version="1.0" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.vcs-url="https://github.com/unb-libraries/unbscholar.postgres.lib.unb.ca" \
  org.label-schema.vendor="University of New Brunswick Libraries" \
  org.label-schema.version=$VERSION \
  org.opencontainers.image.source="https://github.com/unb-libraries/unbscholar.postgres.lib.unb.ca"
