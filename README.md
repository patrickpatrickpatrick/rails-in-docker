# Rails in Docker with Webpacker

This is an installation of Rails 5.2 running in a Ruby 2.4.9 Docker container.
Webpacker has been added so I can experiment with javascript handling using webpack rather than asset pipeline.

## Namespaced Event Article

Basic implementation with an Event and Article Model all within an Admin namespace.
Built as a jumping off point for more interesting applications.

## Initial Setup:

- `docker-compose build`
- `docker-compose up`
- In a separate terminal `docker-compose run web rake db:create`

## Working with Docker

### Gems

The bundle install action has been extracted away from the Dockerfile as this greatly enhances efficiency of the build process. The gemfile is now checked at `docker-compose up` stage. Therefore whenever you make a change to the gems you should take the containers down with `docker-compose down` and bring them back up with `docker-compose up`.

### Running Tests

- Run all tests with: `docker-compose run web bundle exec rake`
