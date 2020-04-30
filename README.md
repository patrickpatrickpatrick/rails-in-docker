# Rails in Docker with Webpacker

This is an installation of Rails 5.2 running in a Ruby 2.4.9 Docker container.
Webpacker has been added so I can experiment with javascript handling using webpack rather than asset pipeline.

## Polymorphic Associations Experimentation

NB. I have changed the config/database.yml to have a unique db name so that I don't end up with conflicts between branch experiments.

### The Challenge

- I have multiple models such as article, event and so on.
- Each may reference an item which may be an object a theme or a person.
- I want to keep track of item references so I can say 'this item is referenced in this article and this event'

I want to test whether polymorphic relationships are the way to go.

### Polymorphic Resources

- [4 ways](https://medium.com/@adamlangsner/4-ways-to-model-polymorphic-relationships-in-rails-5-4c98101ed900)
- [Polymorphic join tables](https://aaronvb.com/articles/a-polymorphic-join-table.html)
- [Polymorphic Rails Cast](http://railscasts.com/episodes/154-polymorphic-association-revised?view=comments)

## Initial Setup

- `docker-compose build`
- `docker-compose up`
- In a separate terminal `docker-compose run web rake db:create`

## Working with Docker

### Gems

The bundle install action has been extracted away from the Dockerfile as this greatly enhances efficiency of the build process. The gemfile is now checked at `docker-compose up` stage. Therefore whenever you make a change to the gems you should take the containers down with `docker-compose down` and bring them back up with `docker-compose up`.

### Running Tests

- Run all tests with: `docker-compose run web bundle exec rake`