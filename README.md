Depot
=====

* Shopping cart app from Agile web dev with Rails, 4th edition by Sam Ruby, Dave Thomas and the man himself, DHH.

### Security stuff

First thing, updated `config/initializers/secret_token.rb`
* using guide from [Hartl Tutorial chapter 3](http://ruby.railstutorial.org/chapters/static-pages#top).
* remember to add `.secret` file to `.gitignore` in the root folder.

### Testing

* After updating Gemfile, use `rails g rspec:install` to use RSpec.

