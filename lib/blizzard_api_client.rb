require 'blizzard_api_client/version'
require 'blizzard_api_client/configuration'
require 'blizzard_api_client/ws_client'

require 'blizzard_api_client/wow/wow_client'

module BlizzardApiClient

  class << self
    # The web clients
    attr_accessor :wow_client

    # A BlizzardApi configuration object
    attr_writer :configuration

    # Look for the Rails logger currently defined
    #def logger
    #  self.configuration.logger ||
    #      Logger.new(nil)
    #end

    # Call this method to modify defaults in your initializers.
    #
    # @example
    #   BlizzardApiClient.configure do |config|
    #     config.region  = 'eu'
    #     config.locale  = 'en_GB'
    #     config.api_key = 'secret'
    #     config.logger    = Rails.logger if defined? Rails
    #   end
    def configure
      yield(configuration)
      self.wow_client = Wow::WowClient.new(configuration)
    end

    # The configuration object.
    def configuration
      @configuration ||= Configuration.new
    end
  end
end
