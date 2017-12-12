FROM ubuntu

ARG version

ENV VERSION ${version}

RUN apt-get update && \
    apt-get install -y gettext-base

ADD currencybot /currencybot-${version}

RUN chmod +x /currencybot-${version}/DEBIAN/postinst

RUN envsubst < currencybot-${version}/DEBIAN/control > currencybot-${version}/DEBIAN/control2 && \
    mv currencybot-${version}/DEBIAN/control2 currencybot-${version}/DEBIAN/control

RUN dpkg -b currencybot-${version}
