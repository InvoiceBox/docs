#!/usr/bin/env sh
bundle install
bundle exec jekyll serve --host 0.0.0.0 --livereload
open http://localhost:4000
