#!/bin/sh

which bundle || gem install bundler
bundle install
bundle exec puma -C config/puma.rb
