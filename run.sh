#!/usr/bin/env sh
#docker run --rm -p 4000:4000 -v /$PWD:/site bretfisher/jekyll-serve
#gem install eventmachine --platform ruby
bundle install
bundle exec jekyll serve --host localhost --livereload
