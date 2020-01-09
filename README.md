# Rails in Docker with Webpacker

This is a barebones installation of Rails 5.2 running in a Ruby 2.4.9 Docker container.
Webpacker has been added so I can experiment with javascript handling using webpack rather than asset pipeline.


## How I added webpacker

- Add to gemfile `gem 'webpacker', '~> 4.x'`
- Run `docker-compose up` to trigger bundle install
- Run `docker-compose run web bundle exec rails webpacker:install` which applies the main webpacker app structure:

```md
  .browserslistrc
  app/javascript/
  babel.config.js
  bin/webpack
  bin/webpack-dev-server
  config/webpack/
  config/webpacker.yml
  postcss.config.js
  yarn.lock
```

- Javascript is then written in app/javascript/packs and should be imported (or required) into the application.js file. The webpacker instal places a handy console.log which can be used for testing
- You need to link the javascript/packs by adding `javascript_pack_tag` within your layout file:

```erb

  <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
```

## Initial Setup:

- `docker-compose build`
- `docker-compose up`
- In a separate terminal `docker-compose run web rake db:create`

## Working with Docker

### Gems

The bundle install action has been extracted away from the Dockerfile as this greatly enhances efficiency of the build process. The gemfile is now checked at `docker-compose up` stage. Therefore whenever you make a change to the gems you should take the containers down with `docker-compose down` and bring them back up with `docker-compose up`.

### Running Tests

- Run all tests with: `docker-compose run web bundle exec rake`
