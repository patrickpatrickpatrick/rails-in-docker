#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# checks whether the current bundle satisfies the Gemfile and if it doesn’t, 
# install the missing gems but it also points to our binstubs directory where 
# we’re caching our executables in our attached volume.
bundle check || bundle install --binstubs="$BUNDLE_BIN"

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"