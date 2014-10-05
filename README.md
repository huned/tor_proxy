# Tor::Proxy

The simple way to HTTP GET over Tor with ruby. See [http://github.com/huned/tor_proxy](http://github.com/huned/tor_proxy)

## Installation

Add this line to your application's Gemfile:

    gem 'tor_proxy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install tor_proxy

## Usage

By default, assumes a Tor proxy server is running at localhost:9050. Tor::Proxy
instances delegates to Net::HTTP::SOCKSProxy instances, so use it exactly the
same way.

    # returns the body of the http request
    Tor::Proxy.new.get(URI.parse('https://www.torproject.org'))

Optionally, set your Tor proxy server's host and port.

    host, port = 'localhost', 9050
    Tor::Proxy.new(host, port).get(URI.parse('https://www.torproject.org'))

## Development

Running tests

    bundle install

then

    bundle exec rspec spec

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
