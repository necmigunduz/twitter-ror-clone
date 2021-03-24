# Dwidder [![Repo]](https://github.com/necmigunduz/twitter-ror-clone)

[![License](https://img.shields.io/badge/License-MIT-green.svg)]()
![GitHub followers](https://img.shields.io/github/followers/necmigunduz?label=necmigunduz&style=social)
![Twitter URL](https://img.shields.io/twitter/follow/necm_gun?label=Follow&style=social)

> This is the capstone project of Microverse Ruby on Rails course

> Dwidder!

## Description

In this project, a social media website which is similar to twitter is built. 

Project name is determined as a local pronunciation of twitter in the Agean region in Turkey. 'T' is pronounced as 'D'.

## Features

In this project, following and posting opinions like posting a tweet features are implemented.

## Built with

- Ruby v2.7.2
- Ruby on Rails v6.1.3
- Git
- Shields.io

## Live demo

Please [check](https://dwidder-ng.herokuapp.com/users/new). You may use 'anonymous' as username and 'Anonymous' as full name to sign in.

## Setup

- Clone this repository (`git@github.com:necmigunduz/twitter-ror-clone.git`)
- Open terminal
- Change directory by using `cd twitter-ror-clone-git/`
- Run `bundle install`
- Run `rails db:migrate`
- Open rails server by using `rails s`
- Open browser and go to http://localhost:3000

## Test app

- Follow steps given in Setup part
- Install Chrome from [main page of Chrome](https://www.google.com/chrome/) or [terminal](https://linuxize.com/post/how-to-install-google-chrome-web-browser-on-ubuntu-20-04/)
- Run ` bundle exec rspec`

## Deploy to Heroku

- Sign in [Heroku](https://www.heroku.com/).
- Open your terminal.
- Run `heroku login`. If you get any error, run `sudo snap install --classic heroku` and [check](https://devcenter.heroku.com/articles/heroku-cli).
- Create an app by running `heroku create name-of-app`. You may use any name for name of your Heroku app.
- If you are using sqlite3 for database, update 'database.yml' file by [following steps](https://devcenter.heroku.com/articles/sqlite3).
- If you are using master branch,run `git push heroku master`. If you are using another branch, run `git push heroku +HEAD:master`.
- Run `heroku run rake db:migrate` your terminal.
- Open your app from your [dashboard of heroku](https://dashboard.heroku.com/).
- Push 'Open app' button to access your app from your dashboard of Heroku..

## Using Cloudinary for active record used for images

- Follow [the article](https://medium.com/@tresor.moise2001/how-to-upload-an-image-in-rails-6-using-cloudinary-and-carrierwave-34c065856a63) showing how to configure Cloudinary.
## Authors

Reach out to us at one of the following places!

👤 **Necmi Gunduz**

- LinkedIn: [Necmi Gunduz](https://www.linkedin.com/in/necmigunduz/)
- Github: [@necmigunduz](https://github.com/necmigunduz/)
- Twitter: [@necmigunduz](https://twitter.com/necm_gun)
- Mail: [necmigunduz@gmail.com](necmigunduz@gmail.com)

## Contributing 🤝

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/necmigunduz/twitter-ror-clone/issues).

## Acknowledgments

Thanks to

- [Microverse](http://microverse.org/) for its support.
## Show your support

Give a ⭐️ if you like this project!

## License

[![License](http://img.shields.io/:license-mit-blue.svg?style=flat-square)](http://badges.mit-license.org)

- **[MIT license](http://opensource.org/licenses/mit-license.php)**