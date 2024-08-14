#!/usr/bin/env sh
docker run --rm -p 4000:4000 -p 35729:35729 -v /$PWD:/site -w /site registry.local.invbox.ru/invoicebox/infrastructure/infrastructure/jekyll ./run.sh
