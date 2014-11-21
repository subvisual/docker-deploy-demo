#!/bin/sh

which bundle || gem install bundler
bundle install
bundle exec rake db:migrate
bundle exec rake assets:precompile
bundle exec puma -C config/puma.rb
