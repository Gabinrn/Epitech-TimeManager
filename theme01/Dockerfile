FROM elixir:1.12.2


# Install Debian and Elixir Deps
RUN apt-get update && \
    apt-get install -y inotify-tools build-essential && \
    mix local.hex --force && \
    mix archive.install hex phx_new 1.6.2 --force && \
    mix local.rebar --force

# Create Workdire
ADD . /api
WORKDIR /api

# Elixir
RUN mix deps.get
COPY ./runtime.sh /
RUN chmod 777 /runtime.sh
CMD ["./runtime.sh"]