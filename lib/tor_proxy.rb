require "tor_proxy/version"
require 'net/http'
require 'socksify/http'
require 'tor'

module Tor
  class Proxy
    def initialize host = 'localhost', port = 9050
      unless Tor.available?
        raise <<-EOS
          Tor isn't installed. Install Tor to use this module.
          See http://torproject.org or `brew install tor`.
        EOS
      end

      @proxy = Net::HTTP.SOCKSProxy host, port
    end

    def get url
      @proxy.get URI.parse(url)
    end

    def self.get url
      @@proxy ||= self.new
      @@proxy.get url
    end
  end
end
