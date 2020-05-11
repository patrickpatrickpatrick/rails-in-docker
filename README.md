# Rails in Docker with Webpacker

This is an installation of Rails 5.2 running in a Ruby 2.4.9 Docker container.
Webpacker has been added so I can experiment with javascript handling using webpack rather than asset pipeline.

## Polymorphic Namespaced Branch

This is a branch for experimenting with polymorphic associations. I've added in an admin namespace just to see the impact on nested resources and routing.

I'm modelling Articles and Events both of which can reference an object or item which I am modelling as ItemReference. I have only implemented for Articles at the moment but could expand to cover Events etc.

I have come across some validation issues with handling nested_attributes which I have outlined in this [SO question](https://stackoverflow.com/questions/61634666/validates-uniqueness-of-polymorphic-association-not-working-for-create-action-d).

Navigate to `http://localhost:3006/admin/articles/` to get going

## Initial Setup:

- `docker-compose build`
- `docker-compose up`
- In a separate terminal `docker-compose run web rake db:create`

## Working with Docker

### Gems

The bundle install action has been extracted away from the Dockerfile as this greatly enhances efficiency of the build process. The gemfile is now checked at `docker-compose up` stage. Therefore whenever you make a change to the gems you should take the containers down with `docker-compose down` and bring them back up with `docker-compose up`.

### Running Tests

- Run all tests with: `docker-compose run web bundle exec rake`
