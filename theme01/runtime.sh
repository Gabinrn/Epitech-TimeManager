#!/bin/bash
mix ecto.reset
mix ecto.migrate
mix phx.server