# ruby-rails-sample 2

This is a simple Active Admin Rails app with file upload, moderation, and custom download capability. Supported file formats include csv and all image formats
Live Link - https://blooming-inlet-04692.herokuapp.com

## Running Locally

Make sure you have [Ruby](https://www.ruby-lang.org), [Bundler](http://bundler.io) and the [Heroku Toolbelt](https://toolbelt.heroku.com/) installed.

```sh
git clone https://github.com/AChuks/sonar-active-admin.git # or clone your own fork
cd sonar-active-admin
bundle install
rails s
```

Your app should now be running on [localhost:3000/](http://localhost:3000/).

## Demo/Use Cases

```sh
visit localhost:3000 or https://blooming-inlet-04692.herokuapp.com
click on Admin in the top-right section of the header
login using test users: email: demo@sonar.com password: demo
click on Documents and create a new document
```

Your app should now be running on [localhost:3000/](http://localhost:5000/).

## Deploying to Heroku

```
heroku create
git push heroku master
heroku run rake db:migrate
heroku open
```

Alternatively, you can deploy your own copy of the app using the web-based flow:

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

## Documentation

For more information about using Ruby on Heroku, see these Dev Center articles:

- [Ruby on Heroku](https://devcenter.heroku.com/categories/ruby)
- [Getting Started with Ruby on Heroku](https://devcenter.heroku.com/articles/getting-started-with-ruby)
- [Heroku Ruby Support](https://devcenter.heroku.com/articles/ruby-support)