#!/bin/bash
mix ecto.setup
mix ecto.migrate
mix phx.server