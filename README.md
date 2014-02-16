# Padma deployment

## Installation

Add this line to your application's Gemfile:

    gem 'padma-deployment', groups: [:development]

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install padma-deployment

## Usage

This gem will add 2 rake tasks:

    $ rake deploy:staging

    $ rake deploy:production

Currently behaviour is scripted for crm and contacts behaviour

## TODO

- configure deployment for each environment. to begin with options could simply be :heroku or :ec2

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
