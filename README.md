# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

[![Ruby](https://github.com/Stashchenko/flight_service/actions/workflows/ruby.yml/badge.svg)](https://github.com/Stashchenko/flight_service/actions/workflows/ruby.yml)

* Ruby version
3.0
* System dependencies
  https://jsonapi.org/format/
  
* Configuration

* Database creation
  `rake db:setup`
* Database initialization

* How to run the test suite

`bundle exec rspec`

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

  
  `heroku container:push web`
  
  `heroku container:release web`

  `heroku run rake db:migrate`

* ...

`rake rswag:specs:swaggerize`
  
`heroku run rails flight_routes:sync` ti sync manually in prod


