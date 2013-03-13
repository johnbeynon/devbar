# Devbar

Displays a fixed position bar across application showing current Rails
environment

## Installation

Add this line to your application's Gemfile:

    gem 'devbar'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install devbar

Then add it to your environment files where you want it used:

    config.middleware.use Rack::DevBar

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
