FROM crystallang/crystal:0.27.2 AS build

RUN apt-get update -qq && apt-get install -y wget

RUN git clone https://github.com/luckyframework/lucky_cli && \
    cd lucky_cli && \
    git checkout v0.13.2 && \
    shards install && \
    crystal build src/lucky.cr

WORKDIR /tmp
RUN wget -q https://github.com/DarthSim/overmind/releases/download/v2.0.1/overmind-v2.0.1-linux-amd64.gz && \
    gzip -d overmind-v2.0.1-linux-amd64.gz && \
    chmod +x overmind-v2.0.1-linux-amd64

FROM crystallang/crystal:0.27.2
RUN apt-get update -qq && \
    apt-get install -y \
      curl \
      postgresql-client \
      tmux \
      tzdata && cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime && \
    curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
    apt-get install -y nodejs && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && apt-get install -y yarn
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY --from="build" /lucky_cli/lucky /usr/local/bin
COPY --from="build" /tmp/overmind-v2.0.1-linux-amd64 /usr/local/bin/overmind

WORKDIR /lucky/web
ADD . .
CMD rm -f .overmind.sock && lucky dev
