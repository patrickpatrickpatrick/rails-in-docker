# Rails in Docker

This is a barebones installation of Rails 5.2 running in a Ruby 2.4 Docker container.
The idea is that I can use this to rapidly spin up some Rails mini-projects for deliberate practice.

There are two branches:

1. Master - A simple rails 5.2 install
2. cucumber-bdd - The rails 5.2 install with the addition of rspec, cucumber, factory-bot and database-cleaner for BDD testing. The setup follows the following [instruction from Semaphore](https://semaphoreci.com/community/tutorials/setting-up-a-bdd-stack-on-a-rails-5-application).

## Initial Setup:

- `docker-compose build`
- `docker-compose up`
- In a separate terminal `docker-compose run web rake db:create`

## Working with Docker

### Gems

The bundle install action has been extracted away from the Dockerfile as this greatly enhances efficiency of the build process. The gemfile is now checked at `docker-compose up` stage. Therefore whenever you make a change to the gems you should take the containers down with `docker-compose down` and bring them back up with `docker-compose up`.

### Running Tests

- Run all tests with: `docker-compose run web bundle exec rake`
