module BlizzardApiClient
  # Used to set up and modify settings for the notifier.
  class Configuration
    OPTIONS = [:region, :locale, :api_key, :protocol, :host, :port, :http_open_timeout, :http_read_timeout].freeze

    # The region to access e.g. +us+, +eu+, +kr+ etc.
    attr_accessor :region

    # The locale for response, depended on region. e.g. for +eu+: +en_GB+, +de_DE+, +ru_RU+ etc.
    attr_accessor :locale

    # The api_key for accessing the service +https://dev.battle.net/apps/mykeys+
    attr_accessor :api_key

    # The protocol (defaults to https)
    attr_accessor :protocol

    # The host (defaults to api.battle.net)
    attr_accessor :host

    # The server port
    attr_accessor :port

    # The HTTP open timeout in seconds (defaults to 2).
    attr_accessor :http_open_timeout

    # The HTTP read timeout in seconds (defaults to 5).
    attr_accessor :http_read_timeout

    # The logger used by BlizzardApiClient
    attr_accessor :logger

    DEFAULT_HOSTNAME = 'api.battle.net'.freeze

    def initialize
      @protocol                 = 'https'
      @host                     = DEFAULT_HOSTNAME
      @port                     = 443
      @http_open_timeout        = 2
      @http_read_timeout        = 5
    end

    # Allows config options to be read like a hash
    #
    # @param [Symbol] option Key for a given attribute
    def [](option)
      send(option)
    end

    # Returns a hash of all configurable options
    def to_hash
      OPTIONS.inject({}) do |hash, option|
        hash[option.to_sym] = self.send(option)
        hash
      end
    end

    # Returns a hash of all configurable options merged with +hash+
    #
    # @param [Hash] hash A set of configuration options that will take precedence over the defaults
    def merge(hash)
      to_hash.merge(hash)
    end

    # Determines if the notifier will send notices.
    # @return [Boolean] Returns +true+ if configuration exists, +false+ otherwise.
    def configured?
      !region.nil? && !locale.empty? && !api_key.empty?
    end
  end
end