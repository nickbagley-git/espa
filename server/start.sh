#!/bin/bash


export MIX_ENV=prod
export PORT=4794

CFGD=$(readlink -f ~/.config/event_app)



export DATABASE_URL=ecto://event_app:Tah4shoongoo@localhost/event_app_prod

export SECRET_KEY_BASE=INBrYcjXUPnex7H90jTUZUzjPAQ+m2CjdP6CmELP+zszhciv8G5Os3ey3MOFmfWL

_build/prod/rel/event_app/bin/event_app start

