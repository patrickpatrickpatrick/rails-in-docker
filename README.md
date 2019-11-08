# Rails in Docker

This is a barebones installation of Rails 5.2 running in a Ruby 2.4 Docker container.
The idea is that I can use this to rapidly spin up some Rails mini-projects for deliberate practice.

Initial Setup:

- `docker-compose build`
- `docker-compose up`
- In a separate terminal `docker-compose run web rake db:create`
