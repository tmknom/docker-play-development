FROM tmknom/openjdk8-mysql-client

ENV ACTIVATOR_VER 1.3.12

# Install typesafe activator
WORKDIR /opt
RUN set -x && \
    wget http://downloads.typesafe.com/typesafe-activator/${ACTIVATOR_VER}/typesafe-activator-${ACTIVATOR_VER}-minimal.zip && \
    unzip typesafe-activator-${ACTIVATOR_VER}-minimal.zip  && \
    ln -s /opt/activator-${ACTIVATOR_VER}-minimal /opt/activator && \
    rm -f /var/opt/activator/typesafe-activator-${ACTIVATOR_VER}-minimal.zip && \
    chmod -R 775 /opt/activator/bin/

ENV PATH=$PATH:/opt/activator/bin

# Install tools
RUN set -x && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    nodejs \
    graphviz && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
