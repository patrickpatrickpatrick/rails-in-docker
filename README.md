# Rails in Docker with Webpacker

## Polymorphic Validations Branch

I ran into problems with polymorphic-namespace branch when I attempted to validate the nested associations.

So in this branch I will remove `accepts_nested_attributes_for` and handle the creation of the associations myself. It will involve the addition of a controller helper.

Navigate to `http://localhost:3006/admin/articles/` to get going

## Initial Setup

- `docker-compose build`
- `docker-compose up`
- In a separate terminal `docker-compose run web rake db:create` and `docker-compose run web rake db:migrate`

## Working with Docker

### Gems

The bundle install action has been extracted away from the Dockerfile as this greatly enhances efficiency of the build process. The gemfile is now checked at `docker-compose up` stage. Therefore whenever you make a change to the gems you should take the containers down with `docker-compose down` and bring them back up with `docker-compose up`.
