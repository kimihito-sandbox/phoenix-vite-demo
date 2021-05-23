FROM elixir:1.12.0

ARG NODE_MAJOR

RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash -

RUN apt-get install -y nodejs inotify-tools && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    truncate -s 0 /var/log/*log

RUN npm install npm@latest -g

RUN mix local.hex --force && \
    mix archive.install hex phx_new && \
    mix local.rebar --force

WORKDIR /usr/local/sandbox