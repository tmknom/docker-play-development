FROM tmknom/openjdk8-mysql-client

ENV SBT_VERSION 0.13.13

# Install sbt
RUN set -x && \
    export DEBIAN_FRONTEND=noninteractive && \
    curl -L -o sbt-${SBT_VERSION}.deb http://dl.bintray.com/sbt/debian/sbt-${SBT_VERSION}.deb && \
    dpkg -i sbt-${SBT_VERSION}.deb && \
    rm sbt-${SBT_VERSION}.deb && \
    apt-get install -y --no-install-recommends sbt && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*

# Install tools
RUN set -x && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    nodejs \
    graphviz && \
    apt-get clean && \
    rm -rf /var/cache/apt/archives/* /var/lib/apt/lists/*
