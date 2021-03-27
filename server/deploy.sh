#!/bin/bash

export SECRET_KEY_BASE=insecure
export MIX_ENV=prod
export PORT=4794
export DATABASE_URL=ecto://event_app:Tah4shoongoo@localhost/event_app_prod

mix deps.get --only prod
mix compile

CFGD=$(readlink -f ~/.config/event_app)

export SECRET_KEY_BASE=INBrYcjXUPnex7H90jTUZUzjPAQ+m2CjdP6CmELP+zszhciv8G5Os3ey3MOFmfWL
export DATABASE_URL=ecto://event_app:Tah4shoongoo@localhost/event_app_prod

mix ecto.migrate

npm install --prefix ./assets
npm run deploy --prefix ./assets
mix phx.digest

mix release
