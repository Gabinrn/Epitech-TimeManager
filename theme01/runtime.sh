#!/bin/bash
mix ecto.create
mix ecto.setup
mix ecto.migrate
mix phx.server